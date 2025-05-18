package com.jd.tecachieve.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

import cn.hutool.core.io.FileUtil;
import com.jd.tecachieve.Utils.DocUtil;
import com.jd.tecachieve.Utils.PatentTrendAnalyzer;
import com.jd.tecachieve.domain.TecVerticaltopic;
import com.jd.tecachieve.domain.Tecteam;
import com.jd.tecachieve.service.ITecVerticaltopicService;
import com.jd.tecachieve.service.ITecpiService;
import com.jd.tecachieve.service.ITecteamService;
import com.jd.tecachieve.stateMachine.StateMachine;
import com.jd.tecachieve.stateMachine.TecAchieveAuditAction;
import com.jd.tecachieve.stateMachine.TecAchieveAuditState;
import com.jd.tecachieve.vo.TecachievementVO;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.exception.file.InvalidExtensionException;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.MimeTypeUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.jd.tecachieve.domain.Tecachievement;
import com.jd.tecachieve.service.ITecachievementService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletResponse;


@RestController
@RequestMapping("/tec/tecachievement")
public class TecachievementController extends BaseController {

    @Autowired
    private ITecachievementService tecachievementService;

    @Autowired
    private ITecteamService tecTeamService;

    @Autowired
    private ITecpiService tecpiService;

    @Autowired
    private ITecVerticaltopicService tecVerticaltopicService;

    @Autowired
    DocUtil docUtil;

    @Autowired
    private PatentTrendAnalyzer patentTrendAnalyzer; // 注入分析工具类

    /**
     * 获取所有技术成果中 field 字段内各数字出现的次数统计。
     * 该接口返回一个包含 "num" 和 "count" 键的 Map 列表，
     * 分别表示字段中的数字和它在整个表中出现的次数。
     *
     * 示例返回格式：
     * [
     *   {"num": "1", "count": 4},
     *   {"num": "2", "count": 1},
     *   {"num": "11", "count": 2}
     * ]
     */
    @GetMapping("/field-counts")
    public List<Map<String, Object>> countAllFields() {
        return tecachievementService.countFieldNumbers();
    }


    // 新增接口：计算各领域的占比并生成自然语言描述
    @GetMapping("/field-percentages")
    public Map<String, Object> getFieldPercentages() {
        List<Map<String, Object>> fieldCounts = tecachievementService.countFieldNumbers();
        return patentTrendAnalyzer.analyzeFieldPercentages(fieldCounts);
    }

    @GetMapping("/college-statistics/analysis")
    public Map<String, Object> getCollegeStatistics() {
        List<Map<String, Object>> rawData = tecachievementService.countCollegeOccurrences();
        return PatentTrendAnalyzer.analyzeCollegeApplications(rawData);
    }



    /**
     * 获取 technologyLevel 的统计信息
     * @return 统计结果
     */
    @GetMapping("/TechnologyLevelCounts")
    public List<Map<String, Object>> getTechnologyLevelCounts() {

        return tecachievementService.getTechnologyLevelCounts();
    }
    /**
     * 获取技术成熟度分析报告（包含占比和自然语言描述）
     */
    @GetMapping("/TechnologyLevelAnalysis")
    public Map<String, Object> getTechnologyLevelAnalysis() {
        List<Map<String, Object>> levelCounts = tecachievementService.getTechnologyLevelCounts();
        return patentTrendAnalyzer.analyzeTechnologyLevel(levelCounts); // 用实例调用
    }

    /**
     * 获取 college 字段的统计信息
     * @return 统计结果
     */
    @GetMapping("/college-counts")
    public List<Map<String, Object>> getCollegeCounts() {

        // 返回结果
        return tecachievementService.countCollegeOccurrences();
    }

        @GetMapping("/advancement-level-counts")
        public List<Map<String, Object>> getAdvancementLevelCounts() {
            return tecachievementService.getAdvancementLevelCounts();
        }

    @GetMapping("/advancement-level-analysis")
    public Map<String, Object> getAdvancementLevelAnalysis() {
        List<Map<String, Object>> rawData = tecachievementService.getAdvancementLevelCounts();
        return patentTrendAnalyzer.analyzeAdvancementLevels(rawData);
    }


    @GetMapping("/way-distribution")
    public List<Map<String, Object>> getWayCounts() {
        return tecachievementService.getWayValueCounts();
    }

    // 合作方式中文映射
    private static final Map<String, String> WAY_NAME_MAP = new HashMap<>();

    static {
        WAY_NAME_MAP.put("1", "技术转让");
        WAY_NAME_MAP.put("2", "专利许可");
        WAY_NAME_MAP.put("3", "委托开发");
        WAY_NAME_MAP.put("4", "合作开发");
        WAY_NAME_MAP.put("5", "技术咨询");
        WAY_NAME_MAP.put("6", "技术服务");
        WAY_NAME_MAP.put("7", "技术入股");
        WAY_NAME_MAP.put("8", "股权投资");
        WAY_NAME_MAP.put("9", "其他");
    }

    @GetMapping("/way-distribution/analysis")
    public Map<String, Object> getWayDistributionAnalysis() {
        List<Map<String, Object>> rawData = tecachievementService.getWayValueCounts();

        // 第一步：构建返回数据结构并统计总数
        List<Map<String, Object>> resultData = new ArrayList<>();
        long total = 0;

        // 先提取基础信息并统计总数
        for (Map<String, Object> item : rawData) {
            String wayValue = (String) item.get("way_value");
            Long count = ((Number) item.get("count")).longValue(); // 推荐用 Long

            Map<String, Object> newItem = new HashMap<>();
            newItem.put("value", wayValue);
            newItem.put("name", WAY_NAME_MAP.getOrDefault(wayValue, "未知"));
            newItem.put("count", count);

            resultData.add(newItem);
            total += count; // 累加总数
        }

        // 第二步：再次遍历，安全计算百分比
        for (Map<String, Object> item : resultData) {
            Long count = (Long) item.get("count");
            double percentage = 0.0;

            if (total > 0) {
                percentage = Math.round(((double) count / (double) total) * 10000) / 100.0;
            }

            item.put("percentage", percentage);
        }

        // 按照数量从高到低排序
        resultData.sort((a, b) -> Long.compare((Long) b.get("count"), (Long) a.get("count")));

        // 生成描述文字
        String description = PatentTrendAnalyzer.generateCooperationDescription(resultData, total);

        // 构造返回值
        Map<String, Object> response = new HashMap<>();
        response.put("data", resultData);
        response.put("total", total);
        response.put("description", description);

        return response;
    }



    /**
     * 查询科技成果增删改查列表
     */
//    @PreAuthorize("@ss.hasPermi('tec:tecachievement:list')")
    @GetMapping("/list")
    public TableDataInfo list(Tecachievement tecachievement) {
        startPage();
        List<Tecachievement> list = tecachievementService.selectTecachievementList(tecachievement);
        //处理所属领域
        list.stream().forEach(li -> {
            List<String> field = new ArrayList<>();
            if (li.getField()!=null){
                String[] split = li.getField().split(",");
                for (String sp:split){
                    field.add(sp);
                }
            }

            List<String> fieldName = new ArrayList<>();
            if (!field.isEmpty()){
                field.stream().forEach(fi->{
                    if (fi.equals("1")){
                        fieldName.add("电子信息");
                    }else if (fi.equals("2")){
                        fieldName.add("先进制造");
                    }else if (fi.equals("3")){
                        fieldName.add("生物、医药和医疗器械");
                    }else if (fi.equals("4")){
                        fieldName.add("化工");
                    }else if (fi.equals("5")){
                        fieldName.add("纺织");
                    }else if (fi.equals("6")){
                        fieldName.add("新材料");
                    }else if (fi.equals("7")){
                        fieldName.add("新能源与高效节能");
                    }else if (fi.equals("8")){
                        fieldName.add("环境保护与资源综合利用");
                    }else if (fi.equals("9")){
                        fieldName.add("海洋");
                    }else if (fi.equals("10")){
                        fieldName.add("农业");
                    }else if (fi.equals("11")){
                        fieldName.add("现代交通");
                    }else if (fi.equals("12")){
                        fieldName.add("城市建设与社会发展");
                    }else if (fi.equals("13")){
                        fieldName.add("其它");
                    }
                });
                li.setFieldDeatil(fieldName.toString().replace("[","").replace("]",""));
            }
        });
        //处理合作方式
        list.stream().forEach(li -> {
            List<String> way = new ArrayList<>();
            if (li.getWay()!=null){
                String[] split1 = li.getWay().split(",");
                for (String sp1:split1){
                    way.add(sp1);
                };
            }

            List<String> wayName = new ArrayList<>();
            if (!way.isEmpty()){
                way.stream().forEach(fi->{
                    if (fi.equals("1")){
                        wayName.add("技术转让");
                    }else if (fi.equals("2")){
                        wayName.add("专利许可");
                    }else if (fi.equals("3")){
                        wayName.add("委托开发");
                    }else if (fi.equals("4")){
                        wayName.add("合作开发");
                    }else if (fi.equals("5")){
                        wayName.add("技术咨询");
                    }else if (fi.equals("6")){
                        wayName.add("技术服务");
                    }else if (fi.equals("7")){
                        wayName.add("技术入股");
                    }else if (fi.equals("8")){
                        wayName.add("股权投资");
                    }else if (fi.equals("9")){
                        wayName.add("其他");
                    }
                });
                li.setWayDeatil(wayName.toString().replace("[","").replace("]",""));
            }
        });
        //处理成果类型
        list.stream().forEach(li -> {
            List<String> typesresults = new ArrayList<>();
            if (li.getTypesresults()!=null){
                String[] split1 = li.getTypesresults().split(",");
                for (String sp2:split1){
                    typesresults.add(sp2);
                };
            }

            List<String> typesresultsName = new ArrayList<>();
            if (!typesresults.isEmpty()){
                typesresults.stream().forEach(fi->{
                    if (fi.equals("1")){
                        typesresultsName.add("基础研究类成果");
                    }else if (fi.equals("2")){
                        typesresultsName.add("应用研究类成果");
                    }else if (fi.equals("3")){
                        typesresultsName.add("决策咨询报告类成果");
                    }else if (fi.equals("4")){
                        typesresultsName.add("是否服务国家战略发展的重大科技成果");
                    }
                });
                li.setTypesresultsDeatil(typesresultsName.toString().replace("[","").replace("]",""));
            }
        });
        //处理科技成果项状态
        list.stream().forEach(li -> {
            if (li.getStatus() == 1) {
                li.setStatusDeatil("草稿状态");
            } else if (li.getStatus() == 2) {
                li.setStatusDeatil("待提交状态");
            } else if (li.getStatus() == 3) {
                li.setStatusDeatil("驳回状态");
            } else if (li.getStatus() == 4) {
                li.setStatusDeatil("审核通过状态");
            }
        });
        //处理依托课题
        for (Tecachievement tecachievement1 : list) {
            TecVerticaltopic tecVerticaltopic = new TecVerticaltopic();
            tecVerticaltopic.setAchievementid(tecachievement1.getAchievementid());
            List<TecVerticaltopic> tecVerticaltopicList = tecVerticaltopicService.selectTecVerticaltopicList(tecVerticaltopic);

            tecachievement1.setTecVerticaltopicList(tecVerticaltopicList);
        }

        return getDataTable(list);
    }

    /**
     * 查询科技成果增删改查列表
     */
    @PostMapping("/getListByTecachievementVO")
    public TableDataInfo getListByTecachievementVO(@RequestBody TecachievementVO tecachievementVO) {
        startPage();
        List<Tecachievement> list = tecachievementService.selectTecachievementListByTecachievementVO(tecachievementVO);
        //处理所属领域
        list.stream().forEach(li -> {
            List<String> field = new ArrayList<>();
            if (li.getField()!=null){
                String[] split = li.getField().split(",");
                for (String sp:split){
                    field.add(sp);
                }
            }

            List<String> fieldName = new ArrayList<>();
            if (!field.isEmpty()){
                field.stream().forEach(fi->{
                    if (fi.equals("1")){
                        fieldName.add("电子信息");
                    }else if (fi.equals("2")){
                        fieldName.add("先进制造");
                    }else if (fi.equals("3")){
                        fieldName.add("生物、医药和医疗器械");
                    }else if (fi.equals("4")){
                        fieldName.add("化工");
                    }else if (fi.equals("5")){
                        fieldName.add("纺织");
                    }else if (fi.equals("6")){
                        fieldName.add("新材料");
                    }else if (fi.equals("7")){
                        fieldName.add("新能源与高效节能");
                    }else if (fi.equals("8")){
                        fieldName.add("环境保护与资源综合利用");
                    }else if (fi.equals("9")){
                        fieldName.add("海洋");
                    }else if (fi.equals("10")){
                        fieldName.add("农业");
                    }else if (fi.equals("11")){
                        fieldName.add("现代交通");
                    }else if (fi.equals("12")){
                        fieldName.add("城市建设与社会发展");
                    }else if (fi.equals("13")){
                        fieldName.add("其它");
                    }
                });
                li.setFieldDeatil(fieldName.toString().replace("[","").replace("]",""));
            }
        });
        //处理合作方式
        list.stream().forEach(li -> {
            List<String> way = new ArrayList<>();
            if (li.getWay()!=null){
                String[] split1 = li.getWay().split(",");
                for (String sp1:split1){
                    way.add(sp1);
                };
            }

            List<String> wayName = new ArrayList<>();
            if (!way.isEmpty()){
                way.stream().forEach(fi->{
                    if (fi.equals("1")){
                        wayName.add("技术转让");
                    }else if (fi.equals("2")){
                        wayName.add("专利许可");
                    }else if (fi.equals("3")){
                        wayName.add("委托开发");
                    }else if (fi.equals("4")){
                        wayName.add("合作开发");
                    }else if (fi.equals("5")){
                        wayName.add("技术咨询");
                    }else if (fi.equals("6")){
                        wayName.add("技术服务");
                    }else if (fi.equals("7")){
                        wayName.add("技术入股");
                    }else if (fi.equals("8")){
                        wayName.add("股权投资");
                    }else if (fi.equals("9")){
                        wayName.add("其他");
                    }
                });
                li.setWayDeatil(wayName.toString().replace("[","").replace("]",""));
            }
        });
        //处理成果类型
        list.stream().forEach(li -> {
            List<String> typesresults = new ArrayList<>();
            if (li.getTypesresults()!=null){
                String[] split1 = li.getTypesresults().split(",");
                for (String sp2:split1){
                    typesresults.add(sp2);
                };
            }

            List<String> typesresultsName = new ArrayList<>();
            if (!typesresults.isEmpty()){
                typesresults.stream().forEach(fi->{
                    if (fi.equals("1")){
                        typesresultsName.add("基础研究类成果");
                    }else if (fi.equals("2")){
                        typesresultsName.add("应用研究类成果");
                    }else if (fi.equals("3")){
                        typesresultsName.add("决策咨询报告类成果");
                    }else if (fi.equals("4")){
                        typesresultsName.add("是否服务国家战略发展的重大科技成果");
                    }
                });
                li.setTypesresultsDeatil(typesresultsName.toString().replace("[","").replace("]",""));
            }
        });
        //处理科技成果项状态
        list.stream().forEach(li -> {
            if (li.getStatus() == 1) {
                li.setStatusDeatil("草稿状态");
            } else if (li.getStatus() == 2) {
                li.setStatusDeatil("待提交状态");
            } else if (li.getStatus() == 3) {
                li.setStatusDeatil("驳回状态");
            } else if (li.getStatus() == 4) {
                li.setStatusDeatil("审核通过状态");
            }
        });
        //处理依托课题
        for (Tecachievement tecachievement1 : list) {
            TecVerticaltopic tecVerticaltopic = new TecVerticaltopic();
            tecVerticaltopic.setAchievementid(tecachievement1.getAchievementid());
            List<TecVerticaltopic> tecVerticaltopicList = tecVerticaltopicService.selectTecVerticaltopicList(tecVerticaltopic);

            tecachievement1.setTecVerticaltopicList(tecVerticaltopicList);
        }

        return getDataTable(list);
    }

    /**
     * 查询所有科技成果增删改查列表
     */
//    @PreAuthorize("@ss.hasPermi('tec:tecachievement:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(Tecachievement tecachievement) {
        List<Tecachievement> list = tecachievementService.selectTecachievementList(tecachievement);
        return AjaxResult.success(list);
    }


    /**
     * 导出科技成果增删改查列表
     */
//    @PreAuthorize("@ss.hasPermi('tec:tecachievement:export')")
    @Log(title = "科技成果增删改查", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Tecachievement tecachievement) {
        List<Tecachievement> list = tecachievementService.selectTecachievementList(tecachievement);
        ExcelUtil<Tecachievement> util = new ExcelUtil<Tecachievement>(Tecachievement.class);
        return util.exportExcel(list, "科技成果增删改查数据");
    }

    /**
     * 获取科技成果增删改查详细信息
     */
    @GetMapping("/getTecachievement")
    public AjaxResult getInfo(Long achievementid) {
        TecachievementVO tecachievementVO = new TecachievementVO();
        // 获取科技成果
        Tecachievement tecachievement = tecachievementService.selectTecachievementByAchievementid(achievementid);

        List<String> field = new ArrayList<>();
        if (tecachievement.getField() != null) {
            String[] split = tecachievement.getField().split(",");
            for (String sp : split) {
                field.add(sp);
            }
        }

        List<String> fieldName = new ArrayList<>();
        if (!field.isEmpty()) {
            field.stream().forEach(fi -> {
                if (fi.equals("1")) {
                    fieldName.add("电子信息");
                } else if (fi.equals("2")) {
                    fieldName.add("先进制造");
                } else if (fi.equals("3")) {
                    fieldName.add("生物、医药和医疗器械");
                } else if (fi.equals("4")) {
                    fieldName.add("化工");
                } else if (fi.equals("5")) {
                    fieldName.add("纺织");
                } else if (fi.equals("6")) {
                    fieldName.add("新材料");
                } else if (fi.equals("7")) {
                    fieldName.add("新能源与高效节能");
                } else if (fi.equals("8")) {
                    fieldName.add("环境保护与资源综合利用");
                } else if (fi.equals("9")) {
                    fieldName.add("海洋");
                } else if (fi.equals("10")) {
                    fieldName.add("农业");
                } else if (fi.equals("11")) {
                    fieldName.add("现代交通");
                } else if (fi.equals("12")) {
                    fieldName.add("城市建设与社会发展");
                } else if (fi.equals("13")) {
                    fieldName.add("其它");
                }
            });
            tecachievement.setFieldDeatil(fieldName.toString().replace("[", "").replace("]", ""));
        }


        List<String> way = new ArrayList<>();
        if (tecachievement.getWay() != null) {
            String[] split1 = tecachievement.getWay().split(",");
            for (String sp1 : split1) {
                way.add(sp1);
            }
            ;
        }

        List<String> wayName = new ArrayList<>();
        if (!way.isEmpty()) {
            way.stream().forEach(fi -> {
                if (fi.equals("1")) {
                    wayName.add("技术转让");
                } else if (fi.equals("2")) {
                    wayName.add("专利许可");
                } else if (fi.equals("3")) {
                    wayName.add("委托开发");
                } else if (fi.equals("4")) {
                    wayName.add("合作开发");
                } else if (fi.equals("5")) {
                    wayName.add("技术咨询");
                } else if (fi.equals("6")) {
                    wayName.add("技术服务");
                } else if (fi.equals("7")) {
                    wayName.add("技术入股");
                } else if (fi.equals("8")) {
                    wayName.add("股权投资");
                } else if (fi.equals("9")) {
                    wayName.add("其他");
                }
            });
            tecachievement.setWayDeatil(wayName.toString().replace("[", "").replace("]", ""));
        }


        List<String> typesresults = new ArrayList<>();
        if (tecachievement.getTypesresults() != null) {
            String[] split1 = tecachievement.getTypesresults().split(",");
            for (String sp2 : split1) {
                typesresults.add(sp2);
            }
            ;
        }

        List<String> typesresultsName = new ArrayList<>();
        if (!typesresults.isEmpty()) {
            typesresults.stream().forEach(fi -> {
                if (fi.equals("1")) {
                    typesresultsName.add("基础研究类成果");
                } else if (fi.equals("2")) {
                    typesresultsName.add("关键技术类成果");
                } else if (fi.equals("3")) {
                    typesresultsName.add("软件系统类成果");
                } else if (fi.equals("4")) {
                    typesresultsName.add("小试成果");
                } else if (fi.equals("5")) {
                    typesresultsName.add("中试成果");
                } else if (fi.equals("6")) {
                    typesresultsName.add("产业化成果");
                } else if (fi.equals("7")) {
                    typesresultsName.add("是否服务国家战略发展的重大科技成果");
                }
            });
            tecachievement.setTypesresultsDeatil(typesresultsName.toString().replace("[", "").replace("]", ""));
        }


        if (tecachievement.getStatus() == 1) {
            tecachievement.setStatusDeatil("草稿状态");
        } else if (tecachievement.getStatus() == 2) {
            tecachievement.setStatusDeatil("待提交状态");
        } else if (tecachievement.getStatus() == 3) {
            tecachievement.setStatusDeatil("驳回状态");
        } else if (tecachievement.getStatus() == 4) {
            tecachievement.setStatusDeatil("审核通过状态");
        }

        //将图片增加前缀
//        tecachievement.setIntroductionImg(RuoYiConfig.getProfile() + tecachievement.getIntroductionImg());


        BeanUtils.copyProperties(tecachievement, tecachievementVO, TecachievementVO.class);
        Long teamId = tecachievement.getTeamId();
        Tecteam tecTeam = new Tecteam();
        tecTeam.setTeamId(teamId);
        List<Tecteam> tecTeamList = tecTeamService.selectTecteamList(tecTeam);
        tecachievementVO.setTecTeamList(tecTeamList);

        //处理纵向课题
        TecVerticaltopic tecVerticaltopic = new TecVerticaltopic();
        tecVerticaltopic.setAchievementid(achievementid);
        List<TecVerticaltopic> tecVerticaltopicList = tecVerticaltopicService.selectTecVerticaltopicList(tecVerticaltopic);
        tecachievementVO.setTecVerticaltopicList(tecVerticaltopicList);

        return AjaxResult.success(tecachievementVO);
    }

    /**
     * 新增科技成果增删改查
     */
    @PostMapping("addTecachievement")
    public AjaxResult add(@RequestBody TecachievementVO achievementVO) throws IOException, InvalidExtensionException {
        //处理TecAchievement
        Tecachievement tecachievement = new Tecachievement();
        BeanUtils.copyProperties(achievementVO, tecachievement, Tecachievement.class);
        tecachievement.setDept_id(SecurityUtils.getLoginUser().getDeptId());
        //插入
        tecachievementService.insertTecachievement(tecachievement);

        Long achievemenId = tecachievement.getAchievementid();
        tecachievement.setTeamId(achievemenId);
        tecachievementService.updateTecachievement(tecachievement);

        //处理 TecTeam
        List<Tecteam> tecTeamList = achievementVO.getTecTeamList();
        if (!CollectionUtils.isEmpty(tecTeamList)) {
            for (Tecteam tecteam : tecTeamList) {
                tecteam.setTeamId(achievemenId);
                tecTeamService.insertTecteam(tecteam);
            }
        }

        //处理TecVerticaltopic
        List<TecVerticaltopic> tecVerticaltopicList = achievementVO.getTecVerticaltopicList();
        if (!CollectionUtils.isEmpty(tecVerticaltopicList)) {
            for (TecVerticaltopic tecVerticaltopic : tecVerticaltopicList) {
                tecVerticaltopic.setTopicCode(tecVerticaltopic.getTopicCode());
                tecVerticaltopic.setTopicName(tecVerticaltopic.getTopicName());
                tecVerticaltopic.setAchievementid(achievemenId);
                tecVerticaltopicService.insertTecVerticaltopic(tecVerticaltopic);
            }
        }

        return toAjax(1);
    }

    @PostMapping("/uploadImg/{achievementid}")
    public AjaxResult uploadImg(@RequestParam("avatarfile") MultipartFile file, @PathVariable(value = "achievementid") Long id) throws Exception {

        Tecachievement tecachievement = tecachievementService.selectTecachievementByAchievementid(id);
        if (!file.isEmpty()) {


            String avatar = FileUploadUtils.upload(RuoYiConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
            // 上传成功后，将图片保存到指定路径
            FileOutputStream outputStream = null;
            try {
                File fileDir = new File(avatar);
                fileDir.getParentFile().mkdirs(); // 创建目录
                outputStream = new FileOutputStream(fileDir);
                outputStream.write(file.getBytes());
            } catch (IOException e) {
                e.printStackTrace();
            }
            System.out.println(avatar);
            tecachievement.setIntroductionImg(avatar);
            tecachievementService.updateTecachievement(tecachievement);
            AjaxResult ajax = AjaxResult.success();
            ajax.put("imgUrl", avatar);
            return ajax;
        }

        return error("上传图片异常，请联系管理员");
    }

//    @PostMapping("/adduploadImg")
//    public AjaxResult adduploadImg(@RequestParam("avatarfile") MultipartFile file) throws Exception {
//
//        Tecachievement tecachievement = new Tecachievement();
//        if (!file.isEmpty()) {
//            String avatar = FileUploadUtils.upload(RuoYiConfig.getAvatarPath(), file, MimeTypeUtils.IMAGE_EXTENSION);
//
//            // 上传成功后，将图片保存到指定路径
//            FileOutputStream outputStream = null;
//            try {
//                File fileDir = new File(avatar);
//                fileDir.getParentFile().mkdirs(); // 创建目录
//                outputStream = new FileOutputStream(fileDir);
//                outputStream.write(file.getBytes());
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//            System.out.println(avatar);
//            tecachievement.setIntroductionImg(avatar);
////            tecachievementService.insertTecachievement(tecachievement);
//
//            AjaxResult ajax = AjaxResult.success();
//            ajax.put("imgUrl", avatar);
//            return ajax;
//        }
//
//        return error("上传图片异常，请联系管理员");
//    }


    @PostMapping("/upload")
    public AjaxResult uploadFile(@RequestParam("avatarfile") MultipartFile file) throws Exception {
        // 项目本地路径
        String localPath = System.getProperty("user.dir");
        System.out.println("localPath    " + localPath);

        //资源上传路径
        String uploadPath = RuoYiConfig.getProfile();
        System.out.println("uploadPath    " + uploadPath);

        //文件绝对路径：项目本地路径 + 资源上传路径 + 数据库资源地址
        String finalPath = localPath + uploadPath;
        System.out.println("finalPath    " + finalPath);

        //获取上传的文件名字
        String originalFileName = file.getOriginalFilename();
        System.out.println("----------上传文件名称为：" + originalFileName);

        assert originalFileName != null;
        File newFile = new File(finalPath, originalFileName);

        //获得文件目录，判断是否存在
        if(!newFile.getParentFile().exists()) {
            //如果path路径不存在，创建一个文件夹，存在则使用当前文件夹
            newFile.getParentFile().mkdirs();
        }

        //保存文件到指定路径之中
        file.transferTo(newFile);
        return AjaxResult.success("/" + originalFileName);
    }

    /**
     * 上传多个文件
     * @param fileList 文件列表
     * @return 每个文件最终的存储名称，以","分隔
     * @throws Exception e
     */
    @PostMapping("/uploadFiles")
    public AjaxResult uploadFiles(@RequestParam("avatarfile") List<MultipartFile> fileList) throws Exception {
        StringBuilder finalFileName = new StringBuilder();
        // 项目存放路径
//        String projectLocalPath = System.getProperty("user.dir");
        String projectLocalPath = "";
        System.out.println("projectLocalPath" + projectLocalPath);

        // 资源上传路径
        String resourceUploadPath = RuoYiConfig.getProfile();
        System.out.println("resourceUploadPath    " + resourceUploadPath);

        // 文件存放路径（绝对路径）：项目存放路径 + 资源上传路径
        String fileFinalPath = projectLocalPath + resourceUploadPath;
        System.out.println("fileFinalPath    " + fileFinalPath);

        for (MultipartFile file : fileList) {
            //上传的文件原名
            String originalFileName = file.getOriginalFilename();
            System.out.println("----------上传文件名称为：" + originalFileName);

            assert originalFileName != null;
            // 获取文件扩展名
            String fileExtensionName = originalFileName.substring(originalFileName.lastIndexOf("."));

            // 生成新的文件名
            String newFileName = originalFileName.substring(0, originalFileName.indexOf(".")) + "-" + System.currentTimeMillis() + fileExtensionName; // 以时间戳命名
            newFileName = newFileName.replaceAll("%", "_"); // 将 % 替换为 _

            File newFile = new File(fileFinalPath, newFileName);

            // 获得文件目录，判断是否存在
            if (!newFile.getParentFile().exists()) {
                //如果path路径不存在，创建一个文件夹，存在则使用当前文件夹
                newFile.getParentFile().mkdirs();
            }
            // 保存文件到指定路径中
            file.transferTo(newFile);
            finalFileName.append("/").append(newFileName).append(",");
        }
        //删除filename多余的逗号
        finalFileName.deleteCharAt(finalFileName.length() - 1);

        return AjaxResult.success(finalFileName);
    }

    /**
     * 修改科技成果增删改查
     */
    @PostMapping("updateTecachievement")
    public AjaxResult edit(@RequestBody TecachievementVO tecachievementVO) {
        tecachievementService.updateTecachievement(tecachievementVO);
        Long teamId = tecachievementVO.getTeamId();
        // 先删除后插入
        tecTeamService.deleteTecteamByTeamid(teamId);
        List<Tecteam> tecTeamList = tecachievementVO.getTecTeamList();
        if (!CollectionUtils.isEmpty(tecTeamList)) {
            for (Tecteam tecteam : tecTeamList) {
                tecteam.setTeamId(teamId);
                tecTeamService.insertTecteam(tecteam);
            }
        }


        tecVerticaltopicService.deleteTecVerticaltopicByachievementid(tecachievementVO.getAchievementid());

        //处理TecVerticaltopic
        List<TecVerticaltopic> tecVerticaltopicList = tecachievementVO.getTecVerticaltopicList();
        if (!CollectionUtils.isEmpty(tecVerticaltopicList)) {
            for (TecVerticaltopic tecVerticaltopic : tecVerticaltopicList) {

                tecVerticaltopic.setTopicCode(tecVerticaltopic.getTopicCode());
                tecVerticaltopic.setTopicName(tecVerticaltopic.getTopicName());
                tecVerticaltopicService.insertTecVerticaltopic(tecVerticaltopic);
            }
        }

        return toAjax(1);
    }

    /**
     * 科技成果导出为word
     * @param tecachieveIdArray 科技成果主键集合
     * @throws Exception e
     */
    @PostMapping("/exportTaskWord/{tecachieveIdArray}")
    public AjaxResult exportTaskWord(@PathVariable(value = "tecachieveIdArray") Long[] tecachieveIdArray) throws Exception {
        List<Tecachievement> tecachievementList = tecachievementService.selectTecachievementByAchievementidArray(tecachieveIdArray);
        String imageAbsolutelyPath;
        String[] imageBasePathArray;
//        String imageBasePath = System.getProperty("user.dir") + RuoYiConfig.getProfile();
        String imageBasePath = RuoYiConfig.getProfile();
        String[] filedArray;
        String[] wayArray;
        String[] typeResultArray;
        String[] collegeArray;
        String technologyLevelArray;
        String advancementLeveArray;

        for (Tecachievement tecachievement : tecachievementList) {
            // 获取 所属领域
            filedArray = tecachievement.getField().split(",");
            for (String s : filedArray) {
                switch (s) {
                    case "1":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "电子信息；" : tecachievement.getFieldDeatil() + "电子信息；");
                        break;
                    case "2":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "先进制造；" : tecachievement.getFieldDeatil() + "先进制造；");
                        break;
                    case "3":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "生物、医药和医疗器械；" : tecachievement.getFieldDeatil() + "生物、医药和医疗器械；");
                        break;
                    case "4":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "化工；" : tecachievement.getFieldDeatil() + "化工；");
                        break;
                    case "5":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "纺织；" : tecachievement.getFieldDeatil() + "纺织；");
                        break;
                    case "6":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "新材料；" : tecachievement.getFieldDeatil() + "新材料；");
                        break;
                    case "7":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "新能源与高效节能；" : tecachievement.getFieldDeatil() + "新能源与高效节能；");
                        break;
                    case "8":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "环境保护与资源综合利用；" : tecachievement.getFieldDeatil() + "环境保护与资源综合利用；");
                        break;
                    case "9":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "海洋；" : tecachievement.getFieldDeatil() + "海洋；");
                        break;
                    case "10":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "农业；" : tecachievement.getFieldDeatil() + "农业；");
                        break;
                    case "11":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "现代交通；" : tecachievement.getFieldDeatil() + "现代交通；");
                        break;
                    case "12":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "城市建设与社会发展；" : tecachievement.getFieldDeatil() + "城市建设与社会发展；");
                        break;
                    case "13":
                        tecachievement.setFieldDeatil(tecachievement.getFieldDeatil() == null ? "其它；" : tecachievement.getFieldDeatil() + "其它；");
                        break;
                }
            }
// 获取所属学院
            collegeArray = tecachievement.getCollege().split(",");
            for (String s : collegeArray) {
                switch (s) {
                    case "1":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "计算机学院");
                        break;
                    case "2":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "法学院");
                        break;
                    case "3":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "土木学院");
                        break;
                    case "4":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "管理学院");
                        break;
                    case "5":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "热能学院");
                        break;
                    case "6":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "市政学院");
                        break;
                    case "7":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "建筑学院");
                        break;
                    case "8":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "材料学院");
                        break;
                    case "9":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "交通学院");
                        break;
                    case "10":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "商学院");
                        break;
                    case "11":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "理学院");
                        break;
                    case "13":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "外国语学院");
                        break;
                    case "14":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "马克思学院");
                        break;
                    case "15":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "测绘学院");
                        break;
                    case "16":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "信电学院");
                        break;
                    case "17":
                        tecachievement.setCollege(tecachievement.getCollege() == null ? " " : "机电学院");
                        break;

                }
            }
            // 获取 合作需求方式
            wayArray = tecachievement.getWay().split(",");
            for (String s : wayArray) {
                switch (s) {
                    case "1":
                        tecachievement.setWayDeatil(tecachievement.getWayDeatil() == null ? "技术转让；" : tecachievement.getWayDeatil() + "技术转让；");
                        break;
                    case "2":
                        tecachievement.setWayDeatil(tecachievement.getWayDeatil() == null ? "专利许可；" : tecachievement.getWayDeatil() + "专利许可；");
                        break;
                    case "3":
                        tecachievement.setWayDeatil(tecachievement.getWayDeatil() == null ? "委托开发；" : tecachievement.getWayDeatil() + "委托开发；");
                        break;
                    case "4":
                        tecachievement.setWayDeatil(tecachievement.getWayDeatil() == null ? "合作开发；" : tecachievement.getWayDeatil() + "合作开发；");
                        break;
                    case "5":
                        tecachievement.setWayDeatil(tecachievement.getWayDeatil() == null ? "技术咨询；" : tecachievement.getWayDeatil() + "技术咨询；");
                        break;
                    case "6":
                        tecachievement.setWayDeatil(tecachievement.getWayDeatil() == null ? "技术服务；" : tecachievement.getWayDeatil() + "技术服务；");
                        break;
                    case "7":
                        tecachievement.setWayDeatil(tecachievement.getWayDeatil() == null ? "技术入股；" : tecachievement.getWayDeatil() + "技术入股；");
                        break;
                    case "8":
                        tecachievement.setWayDeatil(tecachievement.getWayDeatil() == null ? "股权投资；" : tecachievement.getWayDeatil() + "股权投资；");
                        break;
                    case "9":
                        tecachievement.setWayDeatil(tecachievement.getWayDeatil() == null ? "其他；" : tecachievement.getWayDeatil() + "其他；");
                        break;
                }
            }

            // 获取成果类型
            typeResultArray = tecachievement.getTypesresults().split(",");
            for (String s : typeResultArray) {
                switch (s) {
                    case "1":
                        tecachievement.setTypesresultsDeatil(tecachievement.getTypesresultsDeatil() == null ? "基础研究类成果；" : tecachievement.getTypesresultsDeatil() + "基础研究类成果；");
                        break;
                    case "2":
                        tecachievement.setTypesresultsDeatil(tecachievement.getTypesresultsDeatil() == null ? "应用研究类成果；" : tecachievement.getTypesresultsDeatil() + "应用研究类成果；");
                        break;
                    case "3":
                        tecachievement.setTypesresultsDeatil(tecachievement.getTypesresultsDeatil() == null ? "软件系统类成果；" : tecachievement.getTypesresultsDeatil() + "软件系统类成果；");
                        break;
                    case "4":
                        tecachievement.setTypesresultsDeatil(tecachievement.getTypesresultsDeatil() == null ? "小试成果；" : tecachievement.getTypesresultsDeatil() + "小试成果；");
                        break;
                    case "5":
                        tecachievement.setTypesresultsDeatil(tecachievement.getTypesresultsDeatil() == null ? "中试成果；" : tecachievement.getTypesresultsDeatil() + "中试成果；");
                        break;
                    case "6":
                        tecachievement.setTypesresultsDeatil(tecachievement.getTypesresultsDeatil() == null ? "产业化成果；" : tecachievement.getTypesresultsDeatil() + "产业化成果；");
                        break;
                    case "7":
                        tecachievement.setTypesresultsDeatil(tecachievement.getTypesresultsDeatil() == null ? "是否服务国家战略发展的重大科技成果；" : tecachievement.getTypesresultsDeatil() + "是否服务国家战略发展的重大科技成果；");
                        break;
                }
            }
//            // 获取技术成熟度
            Long technologylevel = tecachievement.getTechnologylevel();
            String technologylevelText = null;

            if (technologylevel != null) {
                 technologyLevelArray = String.valueOf(technologylevel);

                switch (technologyLevelArray) {
                    case "1":
                        technologylevelText = "正在研发";
                        break;
                    case "2":
                        technologylevelText = "已有样品";
                        break;
                    case "3":
                        technologylevelText = "通过小试";
                        break;
                    case "4":
                        technologylevelText = "通过中试";
                        break;
                    case "5":
                        technologylevelText = "可以量产";
                        break;
                    case "6":
                        technologylevelText = "其他";
                        break;
                    default:
                        // 处理未知或无效的技术水平
                }
            } else {
                 // 处理 technologylevel 为 null 的情况
                technologylevelText = " "; // 设置默认描述
                technologylevel = 0L; // 设置默认值gylevel 为 null 的情况
            }
// 将技术水平的文字描述赋值给对象的属性
            tecachievement.setTechnologylevelText(technologylevelText); // 设置描述
// 更新技术水平的数值属性
            tecachievement.setTechnologylevel(technologylevel != null ? technologylevel : 0L); // 设置默认值或者报错处理
// 获取先进度
            Long advancementleve = tecachievement.getAdvancementleve();
            String advancementleveText = null;

            if (advancementleve != null) {
                advancementLeveArray = String.valueOf(advancementleve);

                switch (advancementLeveArray) {
                    case "1":
                        advancementleveText = "国内领先";
                        break;
                    case "2":
                        advancementleveText = "国内先进";
                        break;
                    case "3":
                        advancementleveText = "国际领先";
                        break;
                    case "4":
                        advancementleveText = "国际先进";
                        break;
                    case "5":
                        advancementleveText = "其他";
                        break;

                    default:
                        // 处理未知或无效的技术水平
                }
            } else {
                // 处理 technologylevel 为 null 的情况
                advancementleveText = " "; // 设置默认描述
                advancementleve = 0L; // 设置默认值gylevel 为 null 的情况
            }
// 将技术水平的文字描述赋值给对象的属性
            tecachievement.setAdvancementleveText(advancementleveText); // 设置描述
// 更新技术水平的数值属性
            tecachievement.setAdvancementleve(advancementleve != null ? advancementleve  : 0L); // 设置默认值或者报错处理

            if (tecachievement.getIntroductionImg() != null && !tecachievement.getIntroductionImg().equals("")){
                // 获取图片 Base64码 列表，用于遍历导出图片和图片下标
                imageBasePathArray = tecachievement.getIntroductionImg().split(",");
                if (imageBasePathArray.length > 0){ // 有成果介绍图片
                    for (String s : imageBasePathArray) {
                        System.out.println(imageAbsolutelyPath = imageBasePath + s);
                        tecachievement.getIntroductionImgBase64List().add(DocUtil.getImageBase64Code(imageAbsolutelyPath));
                    }
                }
            }

            //获取 成果负责人
            tecachievement.setTecpi(tecpiService.selectTecpiByPiid(tecachievement.getPiId()));
        }

        Map<String, Object> map = new HashMap<>();  //存储word中要展示数据的键值对
        map.put("tecachievementList", tecachievementList);

        String fileName = "科技成果" + System.currentTimeMillis() + ".doc"; //导出word文件名
        String filePath = System.getProperty("user.dir") + File.separator + "template" + File.separator + "tmp";//文件保存路径，在当前项目的根目录下的 template/tmp目录中
        FileUtil.mkParentDirs(filePath + "\\" + fileName); //创建文件保存位置的父目录

        File outFile = new File(filePath + "\\" + fileName);//创建一个新的文件用于保存生成的Word文档。
        if (DocUtil.judeFileExists(outFile)) {
            //docUtil.createWord(map, "tecTemplate.ftl", outFile);//根据模板生成word文档
            //docUtil.createWord(map, "tecAchieveTem.ftl", outFile);//根据模板生成word文档----采集表单
//            docUtil.createWord(map, "imageTem.ftl", outFile);//根据模板生成word文档----导出图片测试
//            docUtil.createWord(map, "jiandaexport.ftl", outFile);//根据模板生成word文档----最终测试-1
//            docUtil.createWord(map, "jiandaexport-2.ftl", outFile);//根据模板生成word文档----最终测试-1
            docUtil.createWord(map, "jiandaexport-zsc.ftl", outFile);//根据模板生成word文档----zsc模版
//            DocUtil.download(response, filePath + "\\", fileName);    //由于freemarker创建的文件在服务器端，所以要下载文件到本地
            return AjaxResult.success(filePath + "_" + fileName);
        }else {
            logger.error("要导出的word文件已经存在！");
            return AjaxResult.error();
        }
    }

    /**
     * 删除科技成果增删改查
     */
    @GetMapping("/delTecachievement")
    public AjaxResult remove(Long achievementid) {
        return toAjax(tecachievementService.deleteTecachievementByAchievementid(achievementid));
    }

    /**
     * 修改单个科技成果状态
     */
    @GetMapping("/updateTecachievementStatus/{achievementid}/{action}")
    public AjaxResult update(@PathVariable(value = "achievementid") Long achievementid, @PathVariable(value = "action")int action) {
        Tecachievement tecachievement = tecachievementService.selectTecachievementByAchievementid(achievementid);
        int status = tecachievement.getStatus(); //获取tec对象的状态

        StateMachine stateMachine = new StateMachine(); //状态机，用于根据当前状态和操作来确定下一个状态。

        int nextState = stateMachine.getNextState(status, action); //根据获取的状态和操作来获取下一个状态

        tecachievement.setAchievementid(achievementid); //获取id设置到tecachievement对象中。
        tecachievement.setStatus(nextState); //获取状态设置到tecachievement对象中。
        return toAjax(tecachievementService.updateTecachievement(tecachievement)); //调用Service的update方法，传递tecment对象作为参数进行更新
        // 并通过 toAjax 方法将更新结果返回。
    }

    /**
     * 修改多个科技成果状态
     */
    @PostMapping("/updateBatchTecachievementStatus/{achievementids}/{action}")
    public AjaxResult updateBatch(@PathVariable(value = "achievementids") Long[] achievementids, @PathVariable(value = "action")int action) {
        //Service的select方法来获取传过来的ids对应的科技成果列表list
        List<Tecachievement> tecachievementList = tecachievementService.selectTecachievementByAchievementidArray(achievementids);

        StateMachine stateMachine = new StateMachine(); //状态机
        //遍历获取到列表list
        for (Tecachievement tecachievement : tecachievementList) {
            int status = tecachievement.getStatus();
            int nextState = stateMachine.getNextState(status, action);
            tecachievement.setStatus(nextState);

            tecachievementService.updateTecachievement(tecachievement);
        }

        return AjaxResult.success();
    }

    /**
     * 通过成果负责人ID获取科技成果列表
     * @param piId 成果负责人ID
     * @return 科技成果列表
     */
    @GetMapping("/getTecAchiListByPiId")
    public TableDataInfo getTecAchiListByPiId(Integer piId){
        List<Tecachievement> tecachievementList = tecachievementService.selectTecAchiListByPiId(Long.valueOf(piId));
        tecachievementList.stream().forEach(li -> {
            List<String> field = new ArrayList<>();
            if (li.getField()!=null){
                String[] split = li.getField().split(",");
                for (String sp:split){
                    field.add(sp);
                }
            }

            List<String> fieldName = new ArrayList<>();
            if (!field.isEmpty()){
                field.stream().forEach(fi->{
                    if (fi.equals("1")){
                        fieldName.add("电子信息");
                    }else if (fi.equals("2")){
                        fieldName.add("先进制造");
                    }else if (fi.equals("3")){
                        fieldName.add("生物、医药和医疗器械");
                    }else if (fi.equals("4")){
                        fieldName.add("化工");
                    }else if (fi.equals("5")){
                        fieldName.add("纺织");
                    }else if (fi.equals("6")){
                        fieldName.add("新材料");
                    }else if (fi.equals("7")){
                        fieldName.add("新能源与高效节能");
                    }else if (fi.equals("8")){
                        fieldName.add("环境保护与资源综合利用");
                    }else if (fi.equals("9")){
                        fieldName.add("海洋");
                    }else if (fi.equals("10")){
                        fieldName.add("农业");
                    }else if (fi.equals("11")){
                        fieldName.add("现代交通");
                    }else if (fi.equals("12")){
                        fieldName.add("城市建设与社会发展");
                    }else if (fi.equals("13")){
                        fieldName.add("其它");
                    }
                });
                li.setFieldDeatil(fieldName.toString().replace("[","").replace("]",""));
            }

        });

        tecachievementList.stream().forEach(li -> {
            List<String> way = new ArrayList<>();
            if (li.getWay()!=null){
                String[] split1 = li.getWay().split(",");
                for (String sp1:split1){
                    way.add(sp1);
                };
            }

            List<String> wayName = new ArrayList<>();
            if (!way.isEmpty()){
                way.stream().forEach(fi->{
                    if (fi.equals("1")){
                        wayName.add("技术转让");
                    }else if (fi.equals("2")){
                        wayName.add("专利许可");
                    }else if (fi.equals("3")){
                        wayName.add("委托开发");
                    }else if (fi.equals("4")){
                        wayName.add("合作开发");
                    }else if (fi.equals("5")){
                        wayName.add("技术咨询");
                    }else if (fi.equals("6")){
                        wayName.add("技术服务");
                    }else if (fi.equals("7")){
                        wayName.add("技术入股");
                    }else if (fi.equals("8")){
                        wayName.add("股权投资");
                    }else if (fi.equals("9")){
                        wayName.add("其他");
                    }
                });
                li.setWayDeatil(wayName.toString().replace("[","").replace("]",""));
            }

        });

        tecachievementList.stream().forEach(li -> {
            List<String> typesresults = new ArrayList<>();
            if (li.getTypesresults() != null) {
                String[] split1 = li.getTypesresults().split(",");
                for (String sp2 : split1) {
                    typesresults.add(sp2);
                }
                ;
            }

            List<String> typesresultsName = new ArrayList<>();
            if (!typesresults.isEmpty()) {
                typesresults.stream().forEach(fi -> {
                    if (fi.equals("1")) {
                        typesresultsName.add("基础研究类成果");
                    } else if (fi.equals("2")) {
                        typesresultsName.add("关键技术类成果");
                    } else if (fi.equals("3")) {
                        typesresultsName.add("软件系统类成果");
                    } else if (fi.equals("4")) {
                        typesresultsName.add("小试成果");
                    } else if (fi.equals("5")) {
                        typesresultsName.add("中试成果");
                    } else if (fi.equals("6")) {
                        typesresultsName.add("产业化成果");
                    } else if (fi.equals("7")) {
                        typesresultsName.add("是否服务国家战略发展的重大科技成果");
                    }
                });
                li.setTypesresultsDeatil(typesresultsName.toString().replace("[", "").replace("]", ""));
            }
        });

        for (Tecachievement tecachievement1 : tecachievementList) {
            TecVerticaltopic tecVerticaltopic = new TecVerticaltopic();
            tecVerticaltopic.setAchievementid(tecachievement1.getAchievementid());
            List<TecVerticaltopic> tecVerticaltopicList = tecVerticaltopicService.selectTecVerticaltopicList(tecVerticaltopic);

            tecachievement1.setTecVerticaltopicList(tecVerticaltopicList);
        }
        return getDataTable(tecachievementList);
    }

//    public static void main(String[] args) {
//
//        //初始化状态机
//        StateMachine stateMachine = new StateMachine();
//
//        int startState = TecAchieveAuditState.CaoGao.getState(); //开始状态---草稿状态
//        int action = TecAchieveAuditAction.TiJiao.getAction();  //执行的动作---提交动作
//
//
//        int nextState = stateMachine.getNextState(startState, action);  //开始状态 执行完动作后的下一状态
//
//        System.out.println("nextState---" + nextState);
//
//    }
}

package com.jd.tecachieve.controller;


import com.jd.tecachieve.Utils.PatentTrendAnalyzer;
import com.jd.tecachieve.domain.Patent;
import com.jd.tecachieve.domain.PatentCountByMonth;
import com.jd.tecachieve.domain.Tecachievement;
import com.jd.tecachieve.service.PatentService;
import com.jd.tecachieve.vo.PatentQueryVo;
import com.jd.tecachieve.vo.TecachievementVO;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@RestController
@RequestMapping("/api/patents")
public class PatentController extends BaseController {


    @Autowired
    private PatentService patentService;

    @GetMapping("/PatentTrendSummary")
    public String getPatentTrendSummary() {
        List<Map<String, Object>> data = patentService.getPatentCountByYearMonth();
        return PatentTrendAnalyzer.generateQuarterlyTrendSummary(data);
    }

    /**
     * 根据专利名称查询专利详情信息
     *
     * 示例请求：
     * GET /api/patents?patentName=一种新型节能技术
     *
     * @param patentName 从前端传来的专利名称参数
     * @return 返回封装后的结果对象，包含成功或失败的状态和数据
     */
    @GetMapping("/get-by-name")
    public Map<String, Object> getPatentByName(@RequestParam String patentName) {
        // 调用服务层方法获取专利信息
        return patentService.getPatentInfoByName(patentName);
    }

    @GetMapping("/inventorPatentName")
    public List<Patent> getPatentsByInventor(@RequestParam String inventorName) {
        return patentService.getPatentsByInventor(inventorName);
    }

    /**
     * 根据发明人名称，统计其所有专利中 IPC 分类号的首字母分布。
     *
     * @param inventorName 发明人名称，作为请求参数传入
     * @return 返回首字母及对应数量的 Map 列表，如：
     *         [
     *             {"first_letter": "G", "count": 10},
     *             {"first_letter": "H", "count": 5}
     *         ]
     */
    @GetMapping("/ipc-distribution")
    public List<Map<String, Object>> getIpcDistributionByInventor(@RequestParam String inventorName) {
        return patentService.countIpcFirstLettersByInventor(inventorName);
    }

    /**
     * 获取各IPC分类的占比分析结果（包含自然语言描述）
     */
    @GetMapping("/ipcCategoryProportions")
    public Map<String, Object> getIpcCategoryProportions() {
        Map<String, Integer> ipcCounts = patentService.countIpcCategories();
        PatentTrendAnalyzer.AnalysisResult result = PatentTrendAnalyzer.analyzeIpcProportions(ipcCounts);

        Map<String, Object> response = new LinkedHashMap<>();
        response.put("total", result.getTotal());
        response.put("proportions", result.getProportions());
        response.put("description", result.getDescription());

        return response;
    }

    @PostMapping("/countByYear")
    public List<Map<String, Object>> countByYear(@RequestParam String inventorName) {
        return patentService.countPatentsByInventorGroupByYear(inventorName);
    }


    @GetMapping("/PatentCountByYearMonth")
    public List<Map<String, Object>> getPatentCountByYearMonth() {
        return patentService.getPatentCountByYearMonth();
    }


    @PostMapping("/addPatentInfo")
    public ResponseEntity<Void> addPatent(@RequestBody Map<String, Object> params) {
        patentService.insertPatent(params); // 调用服务层插入数据
        return ResponseEntity.noContent().build(); // 返回 204 No Content
    }


    /**
     * 添加专利统计数据的接口
     *
     * @param params 请求参数
     */
    @PostMapping("/addPatentData")
    public String addPatentData(@RequestBody Map<String, Object> params) {
        try {
            patentService.addPatentData(params);
            return "数据插入成功！";
        } catch (Exception e) {
            e.printStackTrace();
            return "数据插入失败：" + e.getMessage();
        }
    }

    /**
     * 插入一条专利分类记录。
     *
     * @param params 请求参数，包含专利信息
     * @return 插入结果
     */
    @PostMapping("/insertPatentClass")
    public String insertPatentClass(@RequestBody Map<String, Object> params) {
        try {
            int rows = patentService.insertPatentClass(params);
            if (rows > 0) {
                return "插入成功，影响行数：" + rows;
            } else {
                return "插入失败";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "插入失败，原因：" + e.getMessage();
        }
    }

    /**
     * 根据 id 删除专利信息
     *
     * @param id 主键 id
     */
    @DeleteMapping("/{id}")
    public String deletePatent(@PathVariable Long id) {
        try {
            patentService.deletePatentById(id);
            return "删除成功！";
        } catch (Exception e) {
            return "删除失败：" + e.getMessage();
        }
    }

    /**
     * 更新指定 id 的专利信息。
     *
     * @param id             专利记录的主键 ID（路径参数）。
     * @param patentName     专利名称（可选，传入 null 表示不更新）。
     * @param collaborator   合作方名称（可选，传入 null 表示不更新）。
     * @param operationType  运营类型（可选，传入 null 表示不更新）。
     * @return 返回更新结果的消息。
     */
    @PutMapping("/{id}") // 使用 PUT 方法更新资源
    public String updatePatentInfo(
            @PathVariable Long id, // 路径变量，绑定到 URL 中的 {id}
            @RequestParam(required = false) String patentName, // 可选的查询参数
            @RequestParam(required = false) String collaborator, // 可选的查询参数
            @RequestParam(required = false) String operationType // 可选的查询参数
    ) {
        // 调用 Service 层方法更新专利信息
        patentService.updatePatentInfo(id, patentName, collaborator, operationType);

        // 返回成功消息
        return "专利信息更新成功！";
    }

    /**
     * 查询所有专利分类信息。
     *
     * @return 包含所有专利分类信息的列表，每条记录为一个 Map。
     */
    @GetMapping("/PatentClass")
    public List<Map<String, Object>> listAllPatentClass() {
        return patentService.getAllPatentClass();
    }

    @PostMapping("/updatePatentFields")
    public ResponseEntity<String> updatePatentFields(
            @RequestParam Long id,
            @RequestParam(required = false) String field,
            @RequestParam(required = false) String fieldValue,
            @RequestParam(required = false) String countField,
            @RequestParam(required = false) Integer countValue) {

        boolean isSuccess = patentService.updatePatentFields(id, field, fieldValue, countField, countValue);

        if (isSuccess) {
            return ResponseEntity.ok("更新成功！");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("更新失败！");
        }
    }


    /**
     * 更新指定年份的专利数据。
     *
     * @param year 指定要更新的年份（URL 路径参数）。
     * @param updates 包含需要更新的字段及其值的 JSON 数据（请求体）。
     * @return 返回更新结果信息。
     */
    @PutMapping("/updates/{year}") // 使用 PUT 方法更新资源
    public String updatePatent(@PathVariable String year, @RequestBody Map<String, Object> updates) {
        // 调用服务层方法进行更新
        int affectedRows = patentService.updatePatentTotalByYear(year, updates);

        // 返回更新结果
        return "更新完成，受影响行数：" + affectedRows;
    }



    @PostMapping("/update")
    public String updatePatentField(@RequestParam Long id,
                                    @RequestParam String field,
                                    @RequestParam String value) {
        patentService.updateField(id, field, value);
        return "Update request processed!";
    }

    /**
     * 查询所有专利统计数据。
     *
     * @return 返回 JSON 格式的专利统计数据。
     */
    @GetMapping("/patent-list")
    public List<Map<String, Object>> getAllPatentList() {
        return patentService.selectAllPatentList();
    }

    /**
     * 查询所有专利统计数据。
     *
     * @return 返回 JSON 格式的专利统计数据。
     */
    @GetMapping("/patent-statistics")
    public List<Map<String, Object>> getAllPatentStatistics() {
        return patentService.selectAllPatentStatistics();
    }


    /**
     * 处理GET请求，用于获取2024年与2023年的专利统计数据对比。
     *
     * @return 返回包含统计结果的Map集合
     */
    @GetMapping("/patentStatsComparison")
    public Map<String, Object> getPatentStatsComparison() {
        return patentService.getPatentStatsComparison();
    }



// 新增一个获取当前时间的GET请求映射
    @GetMapping("/current-time")
    public Map<String, String> getCurrentTime() {
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        Map<String, String> timeInfo = new HashMap<>();
        timeInfo.put("currentDate", now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
        timeInfo.put("currentTime", now.format(formatter));
        timeInfo.put("currentDayOfWeek", now.getDayOfWeek().name());

        return Collections.unmodifiableMap(timeInfo); // 如果需要不可变Map
    }


    /**
     * 获取专利授权总量和发明授权总量。
     *
     * @return 包含两个键值对的Map:
     *         - "totalpatentgranted" -> 所有类型的专利授权总量,
     *         - "totalinventiongranted" -> 发明专利授权总量.
     */
    @GetMapping("/counts/authorized")
    public Map<String, Object> getTotalAndInventionPatentGrantedCount() {
        return patentService.getTotalAndInventionPatentGrantedCount();
    }

    /**
     * 返回有效和无效的专利记录总数。
     *
     * @return 包含有效和无效专利记录总数的 JSON 响应
     */
    @GetMapping("/status-counts")
    public Map<String, Integer> getPatentStatusCounts() {
        return patentService.getPatentStatusCounts();
    }


    @GetMapping("/stats")
    public Map<String, Long> getPatentStats() {
        Map<String, Long> stats = new HashMap<>();
        stats.put("inventionTotal", patentService.countByType("A"));            //发明专利
        stats.put("utilityModelTotal", patentService.countByType("U"));          //实用新型
        stats.put("designTotal", patentService.countByType("S"));                //外观专利
        return stats;
    }


    /**
     * 获取每月的open_count和authorize_count。
     * @return List<Map<String, Object>> 每个Map代表一行结果，包含month, open_count, authorize_count字段。
     */
    @GetMapping("/monthlyCounts")
    public List<Map<String, Object>> getMonthlyCounts() {
        return patentService.getMonthlyCounts();
    }


    /**
     * 统计 ipc_class 类别出现次数。
     *
     * @return 各类别出现次数的映射
     */
    @GetMapping("/ipcCategoryCount")
    public Map<String, Integer> countIpcCategories() {
        return patentService.countIpcCategories();
    }


    /**
     * 获取与“山东建筑大学”无关的前5位申请人。
     *
     * @return 一个包含申请人及其计数的列表
     */
    @GetMapping("/applicants/top5")
    public List<Map<String, Object>> getTop5ApplicantsNotFromShanDongJianZhu() {
        return patentService.findDistinctApplicantsWithShanDongJianZhu();
    }

    /**
     * 查询发明人发明专利排名前六的专利数和专利人。
     */
    @GetMapping("/topInventors")
    public ResponseEntity<?> getTopSixInventors() {
        try {
            // 调用service层方法获取数据
            List<Map<String, Object>> topInventors = patentService.findTopSixInventors();

            // 返回结果
            return new ResponseEntity<>(topInventors, HttpStatus.OK);
        } catch (Exception e) {
            // 异常处理
            logger.error("查询发明人发明专利排名时发生错误", e);
            return new ResponseEntity<>("查询失败，请稍后再试或联系管理员！", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


    /**
     * 删除专利库单一记录
     */
    @GetMapping("/delTecachievement")
    public AjaxResult remove(Long patentid) {
        return toAjax(patentService.deletePatentByPatentid(patentid));
    }

    // 根据查询条件获取专利信息
    @PostMapping("/getListByPatentQueryVo")
    public TableDataInfo getListByPatentQueryVo(@RequestBody PatentQueryVo patentQueryVo) {
        startPage();
        List<Patent> list = patentService.selectPatentListByPatentQueryVo(patentQueryVo);
        return getDataTable(list);
    }

    // 获取所有专利信息
    @GetMapping("/")
    public List<Patent> getAllPatents() {
        List<Patent> list= patentService.getAllPatents();
        return list;
    }
    //查询数据库总数
    @GetMapping("/count")
    public int getCount(){
        return patentService.getCount();
    }





}

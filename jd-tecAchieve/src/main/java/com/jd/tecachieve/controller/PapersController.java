package com.jd.tecachieve.controller;


import com.github.pagehelper.PageHelper;
import com.jd.tecachieve.domain.Papers;
import com.jd.tecachieve.domain.Patent;
import com.jd.tecachieve.service.PapersService;
import com.jd.tecachieve.service.PatentService;
import com.jd.tecachieve.vo.PapersQueryVo;
import com.jd.tecachieve.vo.PatentQueryVo;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.page.TableSupport;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.sql.SqlUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/Papers")
public class PapersController extends BaseController {
    @Autowired
    private PapersService papersService;


    @PostMapping("/addPaper")
    public ResponseEntity<String> createPaper(@RequestBody Map<String, Object> paperData) {
        papersService.addPaper(paperData);
        return ResponseEntity.ok("论文插入成功");
    }


    /**
     * 根据论文ID删除论文记录。
     *
     * @param id 要删除的论文记录的ID。
     * @return 返回操作结果信息或状态码。
     */
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deletePaperById(@PathVariable int id) {
        try {
            int result = papersService.deletePaperById(id);
            if (result > 0) {
                // 成功删除
                return ResponseEntity.ok("论文删除成功");
            } else {
                // 没有找到对应的论文记录
                return ResponseEntity.status(404).body("未找到对应论文记录");
            }
        } catch (Exception e) {
            // 处理异常情况
            return ResponseEntity.status(500).body("服务器错误：" + e.getMessage());
        }
    }

    /**
     * 获取所有论文信息
     *
     * @return 返回论文对象列表
     */
    @GetMapping("/list")
    public List<Papers> getAllPapers() {

        return papersService.getAllPapers();
    }


    // 根据查询条件获取专利信息
    @PostMapping("/getListByPapersQueryVo")
    public TableDataInfo getListByPatentQueryVo(@RequestBody PapersQueryVo papersQueryVo) {
        startPage();
        List<Papers> list = papersService.selectPapersListByPapersQueryVo(papersQueryVo);
        return getDataTable(list);
    }


    /**
     * 设置请求分页数据
     */
    protected void startPage()
    {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        if (StringUtils.isNotNull(pageNum) && StringUtils.isNotNull(pageSize))
        {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            Boolean reasonable = pageDomain.getReasonable();
            PageHelper.startPage(pageNum, pageSize, orderBy).setReasonable(reasonable);
        }
    }





}

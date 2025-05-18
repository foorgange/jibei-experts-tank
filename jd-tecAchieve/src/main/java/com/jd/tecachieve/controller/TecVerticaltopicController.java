package com.jd.tecachieve.controller;

import java.util.List;

import com.jd.tecachieve.domain.TecVerticaltopic;
import com.jd.tecachieve.service.ITecVerticaltopicService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 纵向课题Controller
 *
 * @author ruoyi
 * @date 2023-11-10
 */
@RestController
@RequestMapping("/system/verticaltopic")
public class TecVerticaltopicController extends BaseController
{
    @Autowired
    private ITecVerticaltopicService tecVerticaltopicService;

    /**
     * 查询纵向课题列表
     */
    @GetMapping("/list")
    public TableDataInfo list(TecVerticaltopic tecVerticaltopic)
    {
        startPage();
        List<TecVerticaltopic> list = tecVerticaltopicService.selectTecVerticaltopicList(tecVerticaltopic);
        return getDataTable(list);
    }

    /**
     * 查询所有纵向课题列表
     */
    @GetMapping("/allList")
    public AjaxResult allList(TecVerticaltopic tecVerticaltopic)
    {
        List<TecVerticaltopic> list = tecVerticaltopicService.selectTecVerticaltopicList(tecVerticaltopic);
        return AjaxResult.success(list);
    }

    /**
     * 导出纵向课题列表
     */
    @Log(title = "纵向课题", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(TecVerticaltopic tecVerticaltopic)
    {
        List<TecVerticaltopic> list = tecVerticaltopicService.selectTecVerticaltopicList(tecVerticaltopic);
        ExcelUtil<TecVerticaltopic> util = new ExcelUtil<TecVerticaltopic>(TecVerticaltopic.class);
        return util.exportExcel(list, "纵向课题数据");
    }

    /**
     * 获取纵向课题详细信息
     */
    @GetMapping(value = "/{topicId}")
    public AjaxResult getInfo(@PathVariable("topicId") Long topicId)
    {
        return AjaxResult.success(tecVerticaltopicService.selectTecVerticaltopicByTopicId(topicId));
    }

    /**
     * 新增纵向课题
     */
    @Log(title = "纵向课题", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TecVerticaltopic tecVerticaltopic)
    {
        return toAjax(tecVerticaltopicService.insertTecVerticaltopic(tecVerticaltopic));
    }

    /**
     * 新增纵向课题列表
     */
    @Log(title = "纵向课题", businessType = BusinessType.INSERT)
    @PostMapping("/addTecVerticaltopicList")
    public AjaxResult addTecVerticaltopicList(@RequestBody List<TecVerticaltopic> tecVerticaltopicList)
    {
        if (!CollectionUtils.isEmpty(tecVerticaltopicList)) {
            for (TecVerticaltopic tecVerticaltopic : tecVerticaltopicList) {
                tecVerticaltopicService.insertTecVerticaltopic(tecVerticaltopic);
            }
        }

        return AjaxResult.success("1");
    }

    /**
     * 修改纵向课题
     */
    @Log(title = "纵向课题", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TecVerticaltopic tecVerticaltopic)
    {
        return toAjax(tecVerticaltopicService.updateTecVerticaltopic(tecVerticaltopic));
    }

    /**
     * 修改纵向课题
     */
    @Log(title = "纵向课题", businessType = BusinessType.UPDATE)
    @PostMapping("/updateTecVerticaltopicList")
    public AjaxResult updateTecVerticaltopicList(@RequestBody List<TecVerticaltopic> tecVerticaltopicList)
    {
        if (!CollectionUtils.isEmpty(tecVerticaltopicList)) {
            for (TecVerticaltopic tecVerticaltopic : tecVerticaltopicList) {
                tecVerticaltopicService.updateTecVerticaltopic(tecVerticaltopic);
            }
        }

        return AjaxResult.success("1");
    }

    /**
     * 删除纵向课题
     */
    @Log(title = "纵向课题", businessType = BusinessType.DELETE)
	@DeleteMapping("/{topicIds}")
    public AjaxResult remove(@PathVariable Long[] topicIds)
    {
        return toAjax(tecVerticaltopicService.deleteTecVerticaltopicByTopicIds(topicIds));
    }

}

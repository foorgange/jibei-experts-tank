package com.jb.expert.controller;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.jb.expert.domain.ExpertMajor;
import com.jb.expert.service.IExpertMajorService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 专业管理Controller
 *
 * @author ruoyi
 * @date 2022-02-20
 */
@RestController
@RequestMapping("/expert/major")
public class ExpertMajorController extends BaseController
{
    @Autowired
    private IExpertMajorService expertMajorService;

    /**
     * 查询专业管理列表
     */

    @GetMapping("/list")
    public TableDataInfo list(ExpertMajor expertMajor)
    {
        startPage();
        List<ExpertMajor> list = expertMajorService.selectExpertMajorList(expertMajor);
        return getDataTable(list);
    }

    /**
     * 查询所有专业管理列表
     */

    @GetMapping("/allList")
    public AjaxResult allList(ExpertMajor expertMajor)
    {
        List<ExpertMajor> list = expertMajorService.selectExpertMajorList(expertMajor);
        return AjaxResult.success(list);
    }



    /**
     * 导出专业管理列表
     */
    @PreAuthorize("@ss.hasPermi('expert:major:export')")
    @Log(title = "专业管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ExpertMajor expertMajor)
    {
        List<ExpertMajor> list = expertMajorService.selectExpertMajorList(expertMajor);
        ExcelUtil<ExpertMajor> util = new ExcelUtil<ExpertMajor>(ExpertMajor.class);
        return util.exportExcel(list, "专业管理数据");
    }

    /**
     * 获取专业管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('expert:major:query')")
    @GetMapping(value = "/{majorId}")
    public AjaxResult getInfo(@PathVariable("majorId") Long majorId)
    {
        return AjaxResult.success(expertMajorService.selectExpertMajorByMajorId(majorId));
    }

    /**
     * 新增专业管理
     */
    @PreAuthorize("@ss.hasPermi('expert:major:add')")
    @Log(title = "专业管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExpertMajor expertMajor)
    {
        return toAjax(expertMajorService.insertExpertMajor(expertMajor));
    }

    /**
     * 修改专业管理
     */
    @PreAuthorize("@ss.hasPermi('expert:major:edit')")
    @Log(title = "专业管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExpertMajor expertMajor)
    {
        return toAjax(expertMajorService.updateExpertMajor(expertMajor));
    }

    /**
     * 删除专业管理
     */
    @PreAuthorize("@ss.hasPermi('expert:major:remove')")
    @Log(title = "专业管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{majorIds}")
    public AjaxResult remove(@PathVariable Long[] majorIds)
    {
        return toAjax(expertMajorService.deleteExpertMajorByMajorIds(majorIds));
    }

}

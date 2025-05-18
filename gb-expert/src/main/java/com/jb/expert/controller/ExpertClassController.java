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
import com.jb.expert.domain.ExpertClass;
import com.jb.expert.service.IExpertClassService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 专家类别管理Controller
 *
 * @author ruoyi
 * @date 2022-02-20
 */
@RestController
@RequestMapping("/expert/class")
public class ExpertClassController extends BaseController
{
    @Autowired
    private IExpertClassService expertClassService;

    /**
     * 查询专家类别管理列表
     */

    @GetMapping("/list")
    public TableDataInfo list(ExpertClass expertClass)
    {
        startPage();
        List<ExpertClass> list = expertClassService.selectExpertClassList(expertClass);
        return getDataTable(list);
    }

    /**
     * 查询所有专家类别管理列表
     */

    @GetMapping("/allList")
    public AjaxResult allList(ExpertClass expertClass)
    {
        List<ExpertClass> list = expertClassService.selectExpertClassList(expertClass);
        return AjaxResult.success(list);
    }



    /**
     * 导出专家类别管理列表
     */
    @PreAuthorize("@ss.hasPermi('expert:class:export')")
    @Log(title = "专家类别管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ExpertClass expertClass)
    {
        List<ExpertClass> list = expertClassService.selectExpertClassList(expertClass);
        ExcelUtil<ExpertClass> util = new ExcelUtil<ExpertClass>(ExpertClass.class);
        return util.exportExcel(list, "专家类别管理数据");
    }

    /**
     * 获取专家类别管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('expert:class:query')")
    @GetMapping(value = "/{classId}")
    public AjaxResult getInfo(@PathVariable("classId") Long classId)
    {
        return AjaxResult.success(expertClassService.selectExpertClassByClassId(classId));
    }

    /**
     * 新增专家类别管理
     */
    @PreAuthorize("@ss.hasPermi('expert:class:add')")
    @Log(title = "专家类别管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExpertClass expertClass)
    {
        return toAjax(expertClassService.insertExpertClass(expertClass));
    }

    /**
     * 修改专家类别管理
     */
    @PreAuthorize("@ss.hasPermi('expert:class:edit')")
    @Log(title = "专家类别管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExpertClass expertClass)
    {
        return toAjax(expertClassService.updateExpertClass(expertClass));
    }

    /**
     * 删除专家类别管理
     */
    @PreAuthorize("@ss.hasPermi('expert:class:remove')")
    @Log(title = "专家类别管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{classIds}")
    public AjaxResult remove(@PathVariable Long[] classIds)
    {
        return toAjax(expertClassService.deleteExpertClassByClassIds(classIds));
    }

}

package com.jb.property.controller;

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
import com.jb.property.domain.ProjectUserProperty;
import com.jb.property.service.IProjectUserPropertyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 知识产权用户关联Controller
 *
 * @author ruoyi
 * @date 2022-03-05
 */
@RestController
@RequestMapping("/property/user_property")
public class ProjectUserPropertyController extends BaseController
{
    @Autowired
    private IProjectUserPropertyService projectUserPropertyService;

    /**
     * 查询知识产权用户关联列表
     */
//    @PreAuthorize("@ss.hasPermi('property:user_property:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProjectUserProperty projectUserProperty)
    {
        startPage();
        List<ProjectUserProperty> list = projectUserPropertyService.selectProjectUserPropertyList(projectUserProperty);
        return getDataTable(list);
    }

    /**
     * 查询所有知识产权用户关联列表
     */
//    @PreAuthorize("@ss.hasPermi('property:user_property:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(ProjectUserProperty projectUserProperty)
    {
        List<ProjectUserProperty> list = projectUserPropertyService.selectProjectUserPropertyList(projectUserProperty);
        return AjaxResult.success(list);
    }



    /**
     * 导出知识产权用户关联列表
     */
//    @PreAuthorize("@ss.hasPermi('property:user_property:export')")
    @Log(title = "知识产权用户关联", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ProjectUserProperty projectUserProperty)
    {
        List<ProjectUserProperty> list = projectUserPropertyService.selectProjectUserPropertyList(projectUserProperty);
        ExcelUtil<ProjectUserProperty> util = new ExcelUtil<ProjectUserProperty>(ProjectUserProperty.class);
        return util.exportExcel(list, "知识产权用户关联数据");
    }

    /**
     * 获取知识产权用户关联详细信息
     */
//    @PreAuthorize("@ss.hasPermi('property:user_property:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") Long userId)
    {
        return AjaxResult.success(projectUserPropertyService.selectProjectUserPropertyByUserId(userId));
    }

    /**
     * 新增知识产权用户关联
     */
//    @PreAuthorize("@ss.hasPermi('property:user_property:add')")
    @Log(title = "知识产权用户关联", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProjectUserProperty projectUserProperty)
    {
        return toAjax(projectUserPropertyService.insertProjectUserProperty(projectUserProperty));
    }

    /**
     * 修改知识产权用户关联
     */
//    @PreAuthorize("@ss.hasPermi('property:user_property:edit')")
    @Log(title = "知识产权用户关联", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProjectUserProperty projectUserProperty)
    {
        return toAjax(projectUserPropertyService.updateProjectUserProperty(projectUserProperty));
    }

    /**
     * 删除知识产权用户关联
     */
    @PreAuthorize("@ss.hasPermi('property:user_property:remove')")
    @Log(title = "知识产权用户关联", businessType = BusinessType.DELETE)
	@DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable Long[] userIds)
    {
        return toAjax(projectUserPropertyService.deleteProjectUserPropertyByUserIds(userIds));
    }

}

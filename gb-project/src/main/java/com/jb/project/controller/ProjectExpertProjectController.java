package com.jb.project.controller;

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
import com.jb.project.domain.ProjectExpertProject;
import com.jb.project.service.IProjectExpertProjectService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 项目用户关联管理Controller
 *
 * @author ruoyi
 * @date 2022-03-12
 */
@RestController
@RequestMapping("/project/projectExpert")
public class ProjectExpertProjectController extends BaseController
{
    @Autowired
    private IProjectExpertProjectService projectExpertProjectService;

    /**
     * 查询项目用户关联管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:projectExpert:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProjectExpertProject projectExpertProject)
    {
        startPage();
        List<ProjectExpertProject> list = projectExpertProjectService.selectProjectExpertProjectList(projectExpertProject);
        return getDataTable(list);
    }

    /**
     * 查询所有项目用户关联管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:projectExpert:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(ProjectExpertProject projectExpertProject)
    {
        List<ProjectExpertProject> list = projectExpertProjectService.selectProjectExpertProjectList(projectExpertProject);
        return AjaxResult.success(list);
    }



    /**
     * 导出项目用户关联管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:projectExpert:export')")
    @Log(title = "项目用户关联管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ProjectExpertProject projectExpertProject)
    {
        List<ProjectExpertProject> list = projectExpertProjectService.selectProjectExpertProjectList(projectExpertProject);
        ExcelUtil<ProjectExpertProject> util = new ExcelUtil<ProjectExpertProject>(ProjectExpertProject.class);
        return util.exportExcel(list, "项目用户关联管理数据");
    }

    /**
     * 获取项目用户关联管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:projectExpert:query')")
    @GetMapping(value = "/{projectUserId}")
    public AjaxResult getInfo(@PathVariable("projectUserId") Long projectUserId)
    {
        return AjaxResult.success(projectExpertProjectService.selectProjectExpertProjectByProjectUserId(projectUserId));
    }

    /**
     * 新增项目用户关联管理
     */
    @PreAuthorize("@ss.hasPermi('project:projectExpert:add')")
    @Log(title = "项目用户关联管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProjectExpertProject projectExpertProject)
    {
        return toAjax(projectExpertProjectService.insertProjectExpertProject(projectExpertProject));
    }

    /**
     * 修改项目用户关联管理
     */
    @PreAuthorize("@ss.hasPermi('project:projectExpert:edit')")
    @Log(title = "项目用户关联管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProjectExpertProject projectExpertProject)
    {
        return toAjax(projectExpertProjectService.updateProjectExpertProject(projectExpertProject));
    }

    /**
     * 删除项目用户关联管理
     */
    @PreAuthorize("@ss.hasPermi('project:projectExpert:remove')")
    @Log(title = "项目用户关联管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{projectUserIds}")
    public AjaxResult remove(@PathVariable Long[] projectUserIds)
    {
        return toAjax(projectExpertProjectService.deleteProjectExpertProjectByProjectUserIds(projectUserIds));
    }

}

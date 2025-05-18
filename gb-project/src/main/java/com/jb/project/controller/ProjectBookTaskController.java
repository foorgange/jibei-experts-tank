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
import com.jb.project.domain.ProjectBookTask;
import com.jb.project.service.IProjectBookTaskService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 制定任务书任务Controller
 *
 * @author ruoyi
 * @date 2022-03-12
 */
@RestController
@RequestMapping("/project/bookTask")
public class ProjectBookTaskController extends BaseController
{
    @Autowired
    private IProjectBookTaskService projectBookTaskService;

    /**
     * 查询制定任务书任务列表
     */
    @PreAuthorize("@ss.hasPermi('project:bookTask:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProjectBookTask projectBookTask)
    {
        startPage();
        List<ProjectBookTask> list = projectBookTaskService.selectProjectBookTaskList(projectBookTask);
        return getDataTable(list);
    }

    /**
     * 查询所有制定任务书任务列表
     */
    @PreAuthorize("@ss.hasPermi('project:bookTask:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(ProjectBookTask projectBookTask)
    {
        List<ProjectBookTask> list = projectBookTaskService.selectProjectBookTaskList(projectBookTask);
        return AjaxResult.success(list);
    }



    /**
     * 导出制定任务书任务列表
     */
    @PreAuthorize("@ss.hasPermi('project:bookTask:export')")
    @Log(title = "制定任务书任务", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ProjectBookTask projectBookTask)
    {
        List<ProjectBookTask> list = projectBookTaskService.selectProjectBookTaskList(projectBookTask);
        ExcelUtil<ProjectBookTask> util = new ExcelUtil<ProjectBookTask>(ProjectBookTask.class);
        return util.exportExcel(list, "制定任务书任务数据");
    }

    /**
     * 获取制定任务书任务详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:bookTask:query')")
    @GetMapping(value = "/{bookTaskId}")
    public AjaxResult getInfo(@PathVariable("bookTaskId") Long bookTaskId)
    {
        return AjaxResult.success(projectBookTaskService.selectProjectBookTaskByBookTaskId(bookTaskId));
    }

    /**
     * 新增制定任务书任务
     */
    @PreAuthorize("@ss.hasPermi('project:bookTask:add')")
    @Log(title = "制定任务书任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProjectBookTask projectBookTask)
    {
        return toAjax(projectBookTaskService.insertProjectBookTask(projectBookTask));
    }

    /**
     * 修改制定任务书任务
     */
    @PreAuthorize("@ss.hasPermi('project:bookTask:edit')")
    @Log(title = "制定任务书任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProjectBookTask projectBookTask)
    {
        return toAjax(projectBookTaskService.updateProjectBookTask(projectBookTask));
    }

    /**
     * 删除制定任务书任务
     */
    @PreAuthorize("@ss.hasPermi('project:bookTask:remove')")
    @Log(title = "制定任务书任务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{bookTaskIds}")
    public AjaxResult remove(@PathVariable Long[] bookTaskIds)
    {
        return toAjax(projectBookTaskService.deleteProjectBookTaskByBookTaskIds(bookTaskIds));
    }

}

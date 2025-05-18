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
import com.jb.project.domain.ProjectOperationLog;
import com.jb.project.service.IProjectOperationLogService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 项目管理操作日志Controller
 *
 * @author ruoyi
 * @date 2022-04-30
 */
@RestController
@RequestMapping("/project/projectOperLog")
public class ProjectOperationLogController extends BaseController
{
    @Autowired
    private IProjectOperationLogService projectOperationLogService;

    /**
     * 查询项目管理操作日志列表
     */
    @PreAuthorize("@ss.hasPermi('project:projectOperLog:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProjectOperationLog projectOperationLog)
    {
        startPage();
        List<ProjectOperationLog> list = projectOperationLogService.selectProjectOperationLogList(projectOperationLog);
        return getDataTable(list);
    }

    /**
     * 查询所有项目管理操作日志列表
     */
    @PreAuthorize("@ss.hasPermi('project:projectOperLog:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(ProjectOperationLog projectOperationLog)
    {
        List<ProjectOperationLog> list = projectOperationLogService.selectProjectOperationLogList(projectOperationLog);
        return AjaxResult.success(list);
    }



    /**
     * 导出项目管理操作日志列表
     */
    @PreAuthorize("@ss.hasPermi('project:projectOperLog:export')")
    @Log(title = "项目管理操作日志", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ProjectOperationLog projectOperationLog)
    {
        List<ProjectOperationLog> list = projectOperationLogService.selectProjectOperationLogList(projectOperationLog);
        ExcelUtil<ProjectOperationLog> util = new ExcelUtil<ProjectOperationLog>(ProjectOperationLog.class);
        return util.exportExcel(list, "项目管理操作日志数据");
    }

    /**
     * 获取项目管理操作日志详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:projectOperLog:query')")
    @GetMapping(value = "/{logId}")
    public AjaxResult getInfo(@PathVariable("logId") Long logId)
    {
        return AjaxResult.success(projectOperationLogService.selectProjectOperationLogByLogId(logId));
    }

    /**
     * 新增项目管理操作日志
     */
    @PreAuthorize("@ss.hasPermi('project:projectOperLog:add')")
    @Log(title = "项目管理操作日志", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProjectOperationLog projectOperationLog)
    {
        return toAjax(projectOperationLogService.insertProjectOperationLog(projectOperationLog));
    }

    /**
     * 修改项目管理操作日志
     */
    @PreAuthorize("@ss.hasPermi('project:projectOperLog:edit')")
    @Log(title = "项目管理操作日志", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProjectOperationLog projectOperationLog)
    {
        return toAjax(projectOperationLogService.updateProjectOperationLog(projectOperationLog));
    }

    /**
     * 删除项目管理操作日志
     */
    @PreAuthorize("@ss.hasPermi('project:projectOperLog:remove')")
    @Log(title = "项目管理操作日志", businessType = BusinessType.DELETE)
	@DeleteMapping("/{logIds}")
    public AjaxResult remove(@PathVariable Long[] logIds)
    {
        return toAjax(projectOperationLogService.deleteProjectOperationLogByLogIds(logIds));
    }

}

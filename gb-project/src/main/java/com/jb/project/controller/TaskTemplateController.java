package com.jb.project.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.jb.project.domain.ProjectBookTask;
import com.jb.project.domain.ProjectOperationLog;
import com.jb.project.domain.ProjectTask;
import com.jb.project.service.IProjectOperationLogService;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
import com.ruoyi.common.utils.file.FileUploadUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.jb.project.domain.TaskTemplate;
import com.jb.project.service.ITaskTemplateService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 模板管理Controller
 *
 * @author ruoyi
 * @date 2022-03-12
 */
@RestController
@RequestMapping("/project/template")
public class TaskTemplateController extends BaseController
{
    @Autowired
    private ITaskTemplateService taskTemplateService;
    @Autowired
    private IProjectOperationLogService projectOperationLogService;

    /**
     * 查询模板管理列表
     */
    @GetMapping("/list")
    public TableDataInfo list(TaskTemplate taskTemplate)
    {
        startPage();
        List<TaskTemplate> list = taskTemplateService.selectTaskTemplateList(taskTemplate);
        return getDataTable(list);
    }

    /**
     * 查询所有模板管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:template:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(TaskTemplate taskTemplate)
    {
        List<TaskTemplate> list = taskTemplateService.selectTaskTemplateList(taskTemplate);
        return AjaxResult.success(list);
    }



    /**
     * 导出模板管理列表
     */
    @PreAuthorize("@ss.hasPermi('project:template:export')")
    @Log(title = "模板管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(TaskTemplate taskTemplate)
    {
        List<TaskTemplate> list = taskTemplateService.selectTaskTemplateList(taskTemplate);
        ExcelUtil<TaskTemplate> util = new ExcelUtil<TaskTemplate>(TaskTemplate.class);
        return util.exportExcel(list, "模板管理数据");
    }

    /**
     * 获取模板管理详细信息
     */
    @GetMapping(value = "/{templateId}")
    public AjaxResult getInfo(@PathVariable("templateId") Long templateId)
    {
        return AjaxResult.success(taskTemplateService.selectTaskTemplateByTemplateId(templateId));
    }

    /**
     * 新增模板管理
     */
    @PreAuthorize("@ss.hasPermi('project:template:add')")
    @Log(title = "模板管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TaskTemplate taskTemplate)
    {
        LoginUser user = getLoginUser();
        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("模板管理");
        log.setOperUserId(user.getUserId());
        log.setOperSubjectId(user.getUserId());
        log.setOperTime(new Date());
        log.setRemark(user.getUser().getNickName()+"上传了模板到路径"+taskTemplate.getTemplatePath());
        projectOperationLogService.insertProjectOperationLog(log);

        return toAjax(taskTemplateService.insertTaskTemplate(taskTemplate));
    }

    /**
     * 修改模板管理
     */
    @PreAuthorize("@ss.hasPermi('project:template:edit')")
    @Log(title = "模板管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TaskTemplate taskTemplate)
    {
        return toAjax(taskTemplateService.updateTaskTemplate(taskTemplate));
    }

    /**
     * 删除模板管理
     */
    @PreAuthorize("@ss.hasPermi('project:template:remove')")
    @Log(title = "模板管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{templateIds}")
    public AjaxResult remove(@PathVariable Long[] templateIds)
    {
        LoginUser user = getLoginUser();
        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("模板管理");
        log.setOperUserId(user.getUserId());
        log.setOperSubjectId(user.getUserId());
        log.setOperTime(new Date());
        log.setRemark(user.getUser().getNickName()+"删除了模板");
        projectOperationLogService.insertProjectOperationLog(log);

        return toAjax(taskTemplateService.deleteTaskTemplateByTemplateIds(templateIds));
    }


    @PostMapping("/uploadTemplate")
    public AjaxResult uploadTemplate(@RequestParam("file") MultipartFile file, @RequestParam("templateInfo") String templateInfo) throws IOException {

        TaskTemplate taskTemplate = JSON.parseObject(templateInfo,TaskTemplate.class);
        if (!file.isEmpty()) {
            String templatePath = FileUploadUtils.upload(RuoYiConfig.getTemplatePath(), file);
            taskTemplate.setTemplatePath(templatePath);

            LoginUser user = getLoginUser();
            ProjectOperationLog log = new ProjectOperationLog();
            log.setOperPage("模板管理");
            log.setOperUserId(user.getUserId());
            log.setOperSubjectId(user.getUserId());
            log.setOperTime(new Date());
            log.setRemark(user.getUser().getNickName()+"上传了模板"+taskTemplate.getTemplateName());
            projectOperationLogService.insertProjectOperationLog(log);

            // 有id则更新
            if(taskTemplate.getTemplateId() != null){
                return toAjax(taskTemplateService.updateTaskTemplate(taskTemplate));
            }
            // 无id则插入
            else{
                return toAjax(taskTemplateService.insertTaskTemplate(taskTemplate));
            }
        }
        else
        {
            return AjaxResult.error("文件为空");
        }
    }
}

package com.jb.project.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.jb.project.domain.ProjectOperationLog;
import com.jb.project.domain.TaskTemplate;
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
import com.jb.project.domain.ExpertTemplate;
import com.jb.project.service.IExpertTemplateService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 用户私有模板Controller
 *
 * @author ruoyi
 * @date 2022-04-26
 */
@RestController
@RequestMapping("/project/privateTemplate")
public class ExpertTemplateController extends BaseController
{
    @Autowired
    private IExpertTemplateService expertTemplateService;
    @Autowired
    private IProjectOperationLogService projectOperationLogService;
    /**
     * 查询用户私有模板列表
     */
//    @PreAuthorize("@ss.hasPermi('project:privateTemplate:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExpertTemplate expertTemplate)
    {
        startPage();
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        //将参数中的userid设置为发起请求的用户的userid
        expertTemplate.setUserId(user.getUserId());

        List<ExpertTemplate> list = expertTemplateService.selectExpertTemplateList(expertTemplate);
        return getDataTable(list);
    }

    /**
     * 查询所有用户私有模板列表
     */
//    @PreAuthorize("@ss.hasPermi('project:privateTemplate:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(ExpertTemplate expertTemplate)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        //将参数中的userid设置为发起请求的用户的userid
        expertTemplate.setUserId(user.getUserId());

        List<ExpertTemplate> list = expertTemplateService.selectExpertTemplateList(expertTemplate);
        return AjaxResult.success(list);
    }



    /**
     * 导出用户私有模板列表
     */
//    @PreAuthorize("@ss.hasPermi('project:privateTemplate:export')")
    @Log(title = "用户私有模板", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ExpertTemplate expertTemplate)
    {
        List<ExpertTemplate> list = expertTemplateService.selectExpertTemplateList(expertTemplate);
        ExcelUtil<ExpertTemplate> util = new ExcelUtil<ExpertTemplate>(ExpertTemplate.class);
        return util.exportExcel(list, "用户私有模板数据");
    }

    /**
     * 获取用户私有模板详细信息
     */
//    @PreAuthorize("@ss.hasPermi('project:privateTemplate:query')")
    @GetMapping(value = "/{templateId}")
    public AjaxResult getInfo(@PathVariable("templateId") Long templateId)
    {
        return AjaxResult.success(expertTemplateService.selectExpertTemplateByTemplateId(templateId));
    }

    /**
     * 新增用户私有模板
     */
//    @PreAuthorize("@ss.hasPermi('project:privateTemplate:add')")
    @Log(title = "用户私有模板", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExpertTemplate expertTemplate)
    {
        LoginUser user = getLoginUser();
        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("个人模板");
        log.setOperUserId(user.getUserId());
        log.setOperSubjectId(user.getUserId());
        log.setOperTime(new Date());
        log.setRemark(user.getUser().getNickName()+"上传了模板到路径"+expertTemplate.getTemplatePath());
        projectOperationLogService.insertProjectOperationLog(log);
        return toAjax(expertTemplateService.insertExpertTemplate(expertTemplate));
    }

    /**
     * 修改用户私有模板
     */
//    @PreAuthorize("@ss.hasPermi('project:privateTemplate:edit')")
    @Log(title = "用户私有模板", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExpertTemplate expertTemplate)
    {
        return toAjax(expertTemplateService.updateExpertTemplate(expertTemplate));
    }

    /**
     * 删除用户私有模板
     */
//    @PreAuthorize("@ss.hasPermi('project:privateTemplate:remove')")
    @Log(title = "用户私有模板", businessType = BusinessType.DELETE)
	@DeleteMapping("/{templateIds}")
    public AjaxResult remove(@PathVariable Long[] templateIds)
    {
        LoginUser user = getLoginUser();
        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("个人模板");
        log.setOperUserId(user.getUserId());
        log.setOperSubjectId(user.getUserId());
        log.setOperTime(new Date());
        log.setRemark(user.getUser().getNickName()+"删除了模板");
        projectOperationLogService.insertProjectOperationLog(log);

        return toAjax(expertTemplateService.deleteExpertTemplateByTemplateIds(templateIds));
    }

    /**
     * 上传私有模板
     *
     * */
    @PostMapping("/uploadTemplate")
    public AjaxResult uploadTemplate(@RequestParam("file") MultipartFile file, @RequestParam("templateInfo") String templateInfo) throws IOException {

        LoginUser user = getLoginUser();
        ExpertTemplate template = JSON.parseObject(templateInfo,ExpertTemplate.class);
        template.setUserId(user.getUserId());
        if (!file.isEmpty()) {
            String templatePath = FileUploadUtils.upload(RuoYiConfig.getTemplatePath(), file);
            template.setTemplatePath(templatePath);

            ProjectOperationLog log = new ProjectOperationLog();
            log.setOperPage("个人模板");
            log.setOperUserId(user.getUserId());
            log.setOperSubjectId(user.getUserId());
            log.setOperTime(new Date());
            log.setRemark(user.getUser().getNickName()+"上传了模板"+template.getTemplateName());
            projectOperationLogService.insertProjectOperationLog(log);

            // 有id则更新
            if(template.getTemplateId() != null){
                return toAjax(expertTemplateService.updateExpertTemplate(template));
            }
            // 无id则插入
            else{
                return toAjax(expertTemplateService.insertExpertTemplate(template));
            }
        }
        else
        {
            return AjaxResult.error("文件为空");
        }
    }
}

package com.jb.project.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.alibaba.fastjson.JSON;
import com.jb.expert.domain.ProjectExperts;
import com.jb.project.domain.*;
import com.jb.project.service.*;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.core.domain.model.LoginUser;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 项目列表Controller
 *
 * @author ruoyi
 * @date 2022-03-12
 */
@RestController
@RequestMapping("/project/projects")
public class ProjectController extends BaseController
{
    @Autowired
    private IProjectService projectService;
    @Autowired
    private IProjectExpertProjectService projectExpertProjectService;
    @Autowired
    private IProjectTaskService projectTaskService;
    @Autowired
    private IExpertTemplateService expertTemplateService;
    @Autowired
    private ITaskTemplateService taskTemplateService;
    @Autowired
    private IProjectOperationLogService projectOperationLogService;

    /**
     * 查询项目列表
     */
//    @PreAuthorize("@ss.hasPermi('project:projects:list')")
    @GetMapping("/list")
    public TableDataInfo list(Project project)
    {
        startPage();
        List<Project> list = projectService.selectProjectList(project);
        return getDataTable(list);
    }

    /**
     * 查询所有项目列表列表
     */
//    @PreAuthorize("@ss.hasPermi('project:projects:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(Project project)
    {
        List<Project> list = projectService.selectProjectList(project);
        return AjaxResult.success(list);
    }

    /**
     * 导出项目列表列表
     */
//    @PreAuthorize("@ss.hasPermi('project:projects:export')")
    @Log(title = "项目列表", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Project project)
    {
        List<Project> list = projectService.selectProjectList(project);
        ExcelUtil<Project> util = new ExcelUtil<Project>(Project.class);
        return util.exportExcel(list, "项目列表数据");
    }

    /**
     * 导出我申请的项目列表
     */
//    @PreAuthorize("@ss.hasPermi('project:projects:export')")
    @Log(title = "我申请的项目列表", businessType = BusinessType.EXPORT)
    @GetMapping("/myexport")
    public AjaxResult exportMyProject(Project project)
    {
        LoginUser loginUser = getLoginUser();
        Long userId = loginUser.getUser().getUserId();
        project.setCreateUserId(userId);

        List<Project> list = projectService.selectProjectList(project);
        ExcelUtil<Project> util = new ExcelUtil<Project>(Project.class);
        return util.exportExcel(list, "项目列表数据");
    }

    /**
     * 获取项目列表详细信息
     */
//    @PreAuthorize("@ss.hasPermi('project:projects:query')")
    @GetMapping(value = "/{projectId}")
    public AjaxResult getInfo(@PathVariable("projectId") Long projectId)
    {
        return AjaxResult.success(projectService.selectProjectByProjectId(projectId));
    }

    /**
     * 新增项目列表
     */
//    @PreAuthorize("@ss.hasPermi('project:projects:add')")
    @Log(title = "项目列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Project project)
    {
        //根据项目名称获得项目id
        Integer proId = projectService.getProjectIdByName(project.getProjectName());
        // 获取申请项目用户id
        LoginUser loginUser = getLoginUser();
        Long createUserId = loginUser.getUserId();

        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("项目模块");
        log.setOperUserId(loginUser.getUserId());
        log.setOperSubjectId(loginUser.getUserId());
        log.setOperTime(new Date());
        log.setRemark(loginUser.getUser().getNickName()+"添加了项目"+project.getProjectName());
        projectOperationLogService.insertProjectOperationLog(log);

        if(proId != null){
            return AjaxResult.error("已有重名项目");
        }
        else {
            project.setProjectStatus(0L);
            project.setCreateUserId(createUserId);
            return toAjax(projectService.insertProject(project));
        }

    }

    /**
     * 修改项目列表
     */
//    @PreAuthorize("@ss.hasPermi('project:projects:edit')")
    @Log(title = "项目列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Project project)
    {
        LoginUser user = getLoginUser();
        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("项目管理");
        log.setOperUserId(user.getUserId());
        log.setOperSubjectId(user.getUserId());
        log.setOperTime(new Date());
        log.setRemark(user.getUser().getNickName()+"修改了项目");
        projectOperationLogService.insertProjectOperationLog(log);

        //修改任务状态
        Long projectId = project.getProjectId();
        projectTaskService.updateStatus1to2ById(projectId);

        return toAjax(projectService.updateProject(project));
    }

//    /**
//     * 修改项目状态从2(团队组建中)到3(组建完成)
//     */
//    @Log(title = "项目列表", businessType = BusinessType.UPDATE)
//    @PutMapping("/edit2to3")
//    public AjaxResult edit2to3(@RequestBody Project project)
//    {
//        //判断人数是否已满
//        //各级别所需人数
//        Long needSeniorNum = project.getSeniorNum();
//        Long needMiddleNum = project.getMiddleNum();
//        Long needPrimaryNum = project.getPrimaryNum();
//        //各级别已有人数
//        Long haveSeniorNum = 0L;
//        Long haveMiddleNum = 0L;
//        Long havePrimaryNum = 0L;
//        //1.根据项目id查询项目用户关联表中所有用户id
//        List<Integer> list = projectService.getUserIdList(project.getProjectId());
//        //2.根据用户id查询用户名和用户级别
//        for(int i = 0;i<list.size();i++){
//            Long userStar = projectService.getUserStarById(Integer.parseInt(String.valueOf(list.get(i))));
//            if(userStar == 3){
//                haveSeniorNum++;
//            }
//            else if(userStar == 2){
//                haveMiddleNum++;
//            }
//            else{
//                havePrimaryNum++;
//            }
//        }
//        //判断人数是否达到要求,达到要求将项目状态改为3(组建完成)
//        if(haveSeniorNum == needSeniorNum && haveMiddleNum == haveMiddleNum && havePrimaryNum == needPrimaryNum){
//            //写入操作日志
//            LoginUser user = getLoginUser();
//            ProjectOperationLog log = new ProjectOperationLog();
//            log.setOperPage("项目管理");
//            log.setOperUserId(user.getUserId());
//            log.setOperSubjectId(user.getUserId());
//            log.setOperTime(new Date());
//            log.setRemark(user.getUser().getNickName()+"修改了项目");
//            projectOperationLogService.insertProjectOperationLog(log);
//            //改为3
//            projectService.updateProjectStatus2to3(project.getProjectId());
//            return AjaxResult.error("人员不够,不能提交");
//        }
//    }


    /**
     * 删除项目列表
     */
    @PreAuthorize("@ss.hasPermi('project:projects:remove')")
    @Log(title = "项目列表", businessType = BusinessType.DELETE)
	@DeleteMapping("/{projectIds}")
    public AjaxResult remove(@PathVariable Long[] projectIds)
    {
        LoginUser user = getLoginUser();
        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("项目管理");
        log.setOperUserId(user.getUserId());
        log.setOperSubjectId(user.getUserId());
        log.setOperTime(new Date());
        log.setRemark(user.getUser().getNickName()+"删除了项目");
        projectOperationLogService.insertProjectOperationLog(log);

        return toAjax(projectService.deleteProjectByProjectIds(projectIds));
    }


    //加入项目
    @PostMapping("/joinProject")
    public AjaxResult partInProject(@RequestBody Long projectId){

        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        //检查是否已加入项目
        Project project = projectService.selectProjectByProjectId(projectId);
        ProjectExpertProject projectExpertProject = new ProjectExpertProject();
        projectExpertProject.setProjectId(projectId);
        projectExpertProject.setUserId(user.getUserId());
        //各级别所需人数
        Long needSeniorNum = project.getSeniorNum();
        Long needMiddleNum = project.getMiddleNum();
        Long needPrimaryNum = project.getPrimaryNum();
        //各级别已有人数
        Long haveSeniorNum = 0L;
        Long haveMiddleNum = 0L;
        Long havePrimaryNum = 0L;
        //1.根据项目id查询项目用户关联表中所有用户id
        List<Integer> list = projectService.getUserIdList(projectId);
        //2.根据用户id查询用户名和用户级别
        for(int i = 0;i<list.size();i++){
            Long userStar = projectService.getUserStarById(Integer.parseInt(String.valueOf(list.get(i))));
            if(userStar == 3){
                haveSeniorNum++;
            }
            else if(userStar == 2){
                haveMiddleNum++;
            }
            else{
                havePrimaryNum++;
            }
        }
        //获得当前用户星级
        Long userStar = projectService.getUserStarById(Integer.parseInt(String.valueOf(user.getUserId())));
        //记录日志
        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("项目管理");
        log.setOperUserId(user.getUserId());
        log.setOperSubjectId(user.getUserId());
        log.setOperTime(new Date());
        log.setRemark(user.getNickName()+"加入了项目"+project.getProjectName());
        projectOperationLogService.insertProjectOperationLog(log);
        //无结果，则加入
        if(projectExpertProjectService.selectProjectExpertProjectList(projectExpertProject).size() == 0) {
            if(userStar == 3){
                if(haveSeniorNum < needSeniorNum){
                    haveSeniorNum++;
                    return toAjax(projectExpertProjectService.insertProjectExpertProject(projectExpertProject));
                }else {
                    return AjaxResult.error("该星级专家人数已满");
                }
            }
            else if(userStar == 2){
                if(haveMiddleNum < needMiddleNum){
                    haveMiddleNum++;
                    return toAjax(projectExpertProjectService.insertProjectExpertProject(projectExpertProject));
                }else {
                    return AjaxResult.error("该星级专家人数已满");
                }
            }
            else{
                if(havePrimaryNum < needPrimaryNum){
                    havePrimaryNum++;
                    return toAjax(projectExpertProjectService.insertProjectExpertProject(projectExpertProject));
                }else {
                    return AjaxResult.error("该星级专家人数已满");
                }
            }
        }
        //有结果则提示已加入
        else {
            return AjaxResult.error("您已加入该项目");
        }
    }

    //根据项目专家关联表的用户id查询项目id
    public AjaxResult getProjectIdByUserId(int userId){
        return toAjax(projectService.getProjectIdByUserId(userId));
    }



    //获取自己加入的项目，不包括自己申请的项目
    @GetMapping("/joinedProject")
    public TableDataInfo getJoinedProjectList(){
        LoginUser loginUser = getLoginUser();
        Long userId = loginUser.getUser().getUserId();

        startPage();
        return getDataTable(projectService.getJoinedProjectListByUserId(userId));
    }

    //获取我申请的项目
    @GetMapping("/myProject")
    public TableDataInfo getMyProjectList(Project project)
    {
        LoginUser loginUser = getLoginUser();
        Long userId = loginUser.getUser().getUserId();
        project.setCreateUserId(userId);

        startPage();
        List<Project> list = projectService.selectProjectList(project);
        return getDataTable(list);
    }

    //根据项目id获取参与项目的专家列表
    @GetMapping("/projectExperts/{proId}")
    public AjaxResult getJoinedExperts(@PathVariable String proId){
        Long projectId = new Long(proId);
        List<ProjectExperts> projectExpertsList = projectService.getJoinedExperts(projectId);
        return AjaxResult.success(projectExpertsList);
    }

    //发布任务到任务列表
    @PostMapping("/publishTask")
    public AjaxResult publishTask(@RequestBody String taskData){

        TaskJson task = JSON.parseObject(taskData, TaskJson.class);


        LoginUser loginUser = getLoginUser();
        Long userId = loginUser.getUser().getUserId();

        ProjectTask projectTask = new ProjectTask();

        projectTask.setTaskName(task.getTaskName());
        projectTask.setTaskType(Long.valueOf(task.getTaskType()));
        projectTask.setTaskInfo(task.getTaskInfo());
        projectTask.setProjectId(task.getProjectId());
        projectTask.setTaskStatus(0L);

        ExpertTemplate item = task.getTemplate();

        //判断是任务书还是自评互评
        if(task.getTaskType() == 0){
            projectTask.setTemplatePath(task.getTemplate().getTemplatePath());
        }

        LoginUser user = getLoginUser();
        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("项目管理");
        log.setOperUserId(user.getUserId());
        log.setOperSubjectId(user.getUserId());
        log.setOperTime(new Date());
        log.setRemark(user.getUser().getNickName()+"发布了任务"+task.getTaskName());
        projectOperationLogService.insertProjectOperationLog(log);

        //插入任务数据到任务表
        for(int i=0;i<task.getTaskMember().length;i++){
            projectTask.setUserId(task.getTaskMember()[i].getUserId());
            projectTaskService.insertProjectTask(projectTask);
        }
        Project project = projectService.selectProjectByProjectId(task.getProjectId());
        project.setProjectStatus(4L);
        return toAjax(projectService.updateProject(project));
    }

    //删除成员
    @PostMapping("/delMember")
    public AjaxResult deleteMember(@RequestBody ProjectExpertProject projectExpertProject){
        LoginUser loginUser = getLoginUser();
        Long userId = loginUser.getUser().getUserId();


        LoginUser user = getLoginUser();
        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("项目管理");
        log.setOperUserId(user.getUserId());
        log.setOperSubjectId(projectExpertProject.getUserId());
        log.setOperTime(new Date());
        log.setRemark(user.getUser().getNickName()+"删除了成员"+projectExpertProject.getUserId());
        projectOperationLogService.insertProjectOperationLog(log);

        List<ProjectExpertProject> list = projectExpertProjectService.selectProjectExpertProjectList(projectExpertProject);
        if(projectExpertProject.getUserId() == userId){
            return AjaxResult.error("无法删除建项人");
        }
        else{
            return AjaxResult.success(projectExpertProjectService.deleteProjectExpertProjectByProjectUserId(list.get(0).getProjectUserId()));
        }
    }

    @GetMapping("/getMemberTaskInfo/{projectId}")
    public AjaxResult getMemberTaskInfoList(@PathVariable Long projectId){
        List memberTaskList = projectService.getMemberTaskInfoList(projectId);
        return AjaxResult.success(memberTaskList);
    }

    @GetMapping("/getTemplateList")
    public AjaxResult getTemplateList(){
        LoginUser user = getLoginUser();
        ExpertTemplate expertTemplate = new ExpertTemplate();
        expertTemplate.setUserId(user.getUserId());

        List publicTemplate = taskTemplateService.selectTaskTemplateList(null);
        List privateTemplate = expertTemplateService.selectExpertTemplateList(expertTemplate);

        Map<String,List> result = new HashMap<>();
        result.put("publicTemplate",publicTemplate);
        result.put("privateTemplate",privateTemplate);

        return AjaxResult.success(result);
    }

    /**
     * 查询专家任务是否全部提交
     */
    @PutMapping("/examineTask")
    public AjaxResult examineTask(@RequestBody Project project)
    {
        //根据projectId查询project_task表中所有task_status是否为1
        Long projectId = project.getProjectId();
        List<Integer>list = projectTaskService.selectProjectStatusByProjectId(projectId);
        boolean flag = true;
        int i = 0;
        for(i = 0;i < list.size();i++){
            if(list.get(i) != 1){
                flag = false;
                break;
            }
        }
        if(flag){
            return toAjax(1);
        }else{
            return AjaxResult.error("有专家未提交,不能完成任务");
        }
    }

}

package com.jb.project.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.jb.expert.domain.ProjectExperts;
import com.jb.project.domain.*;
import com.jb.project.service.*;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 任务管理Controller
 *
 * @author ruoyi
 * @date 2022-03-12
 */
@RestController
@RequestMapping("/project/task")
public class ProjectTaskController extends BaseController
{
    @Autowired
    private IProjectTaskService projectTaskService;
    @Autowired
    private IProjectCheckTaskService projectCheckTaskService;
    @Autowired
    private IProjectBookTaskService projectBookTaskService;
    @Autowired
    private IProjectService projectService;
    @Autowired
    private IProjectExpertProjectService projectExpertProjectService;
    @Autowired
    private ITaskTemplateService taskTemplateService;
    @Autowired
    private IProjectOperationLogService projectOperationLogService;

    /**
     * 查询任务管理列表
     */
//    @PreAuthorize("@ss.hasPermi('project:task:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProjectTask projectTask)
    {

        startPage();
        List<ProjectTask> list = projectTaskService.selectProjectTaskList(projectTask);
        return getDataTable(list);
    }

    /**
     * 查询所有任务管理列表
     */
//    @PreAuthorize("@ss.hasPermi('project:task:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(ProjectTask projectTask)
    {
        List<ProjectTask> list = projectTaskService.selectProjectTaskList(projectTask);
        return AjaxResult.success(list);
    }



    /**
     * 导出待办事项列表
     */
//    @PreAuthorize("@ss.hasPermi('project:task:export')")
    @Log(title = "任务管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ProjectTask projectTask)
    {
        LoginUser loginUser = getLoginUser();
        Long userId = loginUser.getUser().getUserId();

        List<ProjectTask> list = projectTaskService.selectProjectTaskList(projectTask);
        ExcelUtil<ProjectTask> util = new ExcelUtil<ProjectTask>(ProjectTask.class);
        return util.exportExcel(list, "任务管理数据");
    }

    /**
     * 获取任务管理详细信息
     */
//    @PreAuthorize("@ss.hasPermi('project:task:query')")
    @GetMapping(value = "/{taskId}")
    public AjaxResult getInfo(@PathVariable("taskId") Long taskId)
    {
        return AjaxResult.success(projectTaskService.selectProjectTaskByTaskId(taskId));
    }

    /**
     * 新增任务管理
     */
//    @PreAuthorize("@ss.hasPermi('project:task:add')")
    @Log(title = "任务管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProjectTask projectTask)
    {
        return toAjax(projectTaskService.insertProjectTask(projectTask));
    }

    /**
     * 修改任务管理
     */
//    @PreAuthorize("@ss.hasPermi('project:task:edit')")
    @Log(title = "任务管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProjectTask projectTask)
    {
        return toAjax(projectTaskService.updateProjectTask(projectTask));
    }

    /**
     * 删除任务管理
     */
    @PreAuthorize("@ss.hasPermi('project:task:remove')")
    @Log(title = "任务管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{taskIds}")
    public AjaxResult remove(@PathVariable Long[] taskIds)
    {
        LoginUser user = getLoginUser();
        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("待办事项");
        log.setOperUserId(user.getUserId());
        log.setOperSubjectId(user.getUserId());
        log.setOperTime(new Date());
        log.setRemark(user.getUser().getNickName()+"删除了任务");
        projectOperationLogService.insertProjectOperationLog(log);

        return toAjax(projectTaskService.deleteProjectTaskByTaskIds(taskIds));
    }

    /**
     * 查询我的任务管理列表
     */
//    @PreAuthorize("@ss.hasPermi('project:task:list')")
    @GetMapping("/myTaskList")
    public TableDataInfo myTaskList(ProjectTask projectTask)
    {
        //当前用户
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();
        //projectTask赋用户id
        projectTask.setUserId(user.getUserId());

        startPage();
        //从任务管理列表(project_task)查询该用户项目任务
        List<ProjectTask> list = projectTaskService.selectProjectTaskList(projectTask);
        return getDataTable(list);
    }

    //获取评分列表
    @GetMapping("/checkList/{proId}")
    public AjaxResult getCheckList(@PathVariable String proId){
        if(proId == null || proId == ""){
            return AjaxResult.error("错误");
        }
        Long projectId = new Long(proId);
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        // 获取任务表中的taskid
        ProjectTask projectTask = new ProjectTask();
        projectTask.setUserId(user.getUserId());
        projectTask.setProjectId(projectId);

        Long taskId = projectTaskService.selectProjectTaskList(projectTask).get(0).getTaskId();

        // 查找评分表中是否有数据
        ProjectCheckTask projectCheckTask = new ProjectCheckTask();
        projectCheckTask.setUserId(user.getUserId());
        projectCheckTask.setProjectId(projectId);
        projectCheckTask.setTaskId(taskId);

        // 查询数据
        List<ProjectCheckTask> list = projectCheckTaskService.selectProjectCheckTaskList(projectCheckTask);
        // 如果数据不存在，就插入再返回
        if (list.size() == 0){
            List<ProjectExperts> projectExpertsList = projectService.getJoinedExperts(projectId);
            for(int i=0;i<projectExpertsList.size();i++){
                projectCheckTask.setSubjectId(projectExpertsList.get(i).getUserId());
                projectCheckTaskService.insertProjectCheckTask(projectCheckTask);
            }
            projectCheckTask.setSubjectId(null);
            List<ProjectCheckTask> checkList = projectCheckTaskService.selectProjectCheckTaskList(projectCheckTask);

            return AjaxResult.success(checkList);
        }
        //存在则直接返回
        return AjaxResult.success(list);
    }
    //保存当前记录
    @PostMapping("/saveCheckList")
    public AjaxResult saveCheck(@RequestBody ProjectCheckTask[] checkList){
        for(int i=0;i<checkList.length;i++) {
            projectCheckTaskService.updateProjectCheckTask(checkList[i]);
        }

        return AjaxResult.success("保存成功");
    }

    @PostMapping("/uploadCheckList")
    public AjaxResult uploadCheck(@RequestBody ProjectCheckTask[] checkList){
        for(int i=0;i<checkList.length;i++) {
            projectCheckTaskService.updateProjectCheckTask(checkList[i]);
        }
        // 根据userid和projectid找到发布的任务
        ProjectTask projectTask = new ProjectTask();
        projectTask.setProjectId(checkList[0].getProjectId());
        projectTask.setUserId(checkList[0].getUserId());

        Long taskId = projectTaskService.selectProjectTaskList(projectTask).get(0).getTaskId();
        projectTask.setTaskId(taskId);
        projectTask.setTaskStatus(1L);

        projectTaskService.updateProjectTask(projectTask);

        LoginUser user = getLoginUser();
        ProjectOperationLog log = new ProjectOperationLog();
        log.setOperPage("待办事项");
        log.setOperUserId(user.getUserId());
        log.setOperSubjectId(user.getUserId());
        log.setOperTime(new Date());
        log.setRemark(user.getUser().getNickName()+"提交了自评互评分数");
        projectOperationLogService.insertProjectOperationLog(log);

        return AjaxResult.success("上传成功");
    }

    @GetMapping("/getInfo/{proId}")
    public AjaxResult getInfoByProjectId(@PathVariable String proId)
    {
        LoginUser loginUser = getLoginUser();
        SysUser user = loginUser.getUser();

        Long projectId = new Long(proId);

        ProjectTask projectTask = new ProjectTask();
        projectTask.setProjectId(projectId);
        projectTask.setUserId(user.getUserId());

        List<ProjectTask> list = projectTaskService.selectProjectTaskList(projectTask);
        if(list.size() == 0){
            return new AjaxResult(0,"无数据");
        }
        return AjaxResult.success(list);
    }

    //上传任务书
    @PostMapping("/uploadBook")
    public AjaxResult uploadBook(@RequestParam("file") MultipartFile file,@RequestParam("task") String task) throws IOException {

        ProjectTask projectTask = JSON.parseObject(task,ProjectTask.class);
        if (!file.isEmpty())
        {
            LoginUser loginUser = getLoginUser();
            SysUser user = loginUser.getUser();

            String bookPath = FileUploadUtils.upload(RuoYiConfig.getBookPath(), file);

            ProjectBookTask projectBookTask = new ProjectBookTask();
            projectBookTask.setTaskId(projectTask.getTaskId());
            projectBookTask.setUserId(user.getUserId());
            projectTask.setTaskStatus(1L);
            // 如果不存在
            List<ProjectBookTask> list = projectBookTaskService.selectProjectBookTaskList(projectBookTask);
            if(list.size() == 0){
                projectBookTask.setBookPath(bookPath);
                projectBookTaskService.insertProjectBookTask(projectBookTask);
                projectTaskService.updateProjectTask(projectTask);

                ProjectOperationLog log = new ProjectOperationLog();
                log.setOperPage("待办事项");
                log.setOperUserId(user.getUserId());
                log.setOperSubjectId(user.getUserId());
                log.setOperTime(new Date());
                log.setRemark(user.getNickName()+"提交了任务"+projectTask.getTaskName()+"任务书");
                projectOperationLogService.insertProjectOperationLog(log);

                return AjaxResult.success("提交成功");
            }
            //如果存在
            else if(list.size() == 1){
                list.get(0).setBookPath(bookPath);
                projectTaskService.updateProjectTask(projectTask);

                ProjectOperationLog log = new ProjectOperationLog();
                log.setOperPage("待办事项");
                log.setOperUserId(user.getUserId());
                log.setOperSubjectId(user.getUserId());
                log.setOperTime(new Date());
                log.setRemark(user.getNickName()+"提交了任务"+projectTask.getTaskName()+"任务书");
                projectOperationLogService.insertProjectOperationLog(log);

                return AjaxResult.success("提交成功");
            }
            else{
                return AjaxResult.error("上传异常，请联系管理员");
            }
        }
        else{
            return AjaxResult.error("上传异常，请联系管理员");
        }
    }

    //获得文件地址
    @GetMapping("/getFileUrl")
    public AjaxResult getBookFile(ProjectBookTask booktask){
        if(booktask.getUserId() == -1){
            LoginUser loginUser = getLoginUser();
            SysUser user = loginUser.getUser();
            // 如果传来的userid不存在，则返回当前访问业务的id
            booktask.setUserId(user.getUserId());
        }

        List<ProjectBookTask> list = projectBookTaskService.selectProjectBookTaskList(booktask);
        return AjaxResult.success(list.get(0).getBookPath());
    }



    //根据用户id查询项目专家关联表中项目id
    //LoginUser loginUser = getLoginUser();
    //SysUser user = loginUser.getUser();
    //List<Long> list = projectTaskService.getProjectIdByExpertId(user.getUserId());


    //根据项目id查询项目任务表中任务类型
    //Long taskType = projectTaskService.getTaskTypeByProjectId(projectId);


    //根据项目id查询项目专家关联表中该项目所有人员
    //List<Long> list = projectTaskService.getAllExpertIdByProjectId(projectId);
    //List<String> nameList = new ArrayList<String>();
    //for(int i = 0;i < list.size();i++){    //根据id查专家姓名并放入新集合nameList中
    //    nameList.add(projectTaskService.getExpertNameByExpertId(list.get(i)));
    //}


    //根据项目id和用户id修改项目专家关联表中任务状态为3任务类型修改为1
    //LoginUser loginUser = getLoginUser();
    //SysUser user = loginUser.getUser();
    //projectTaskService.updateStatus3AndType1ById(user.getUserId(),projectId);


    //根据项目id查询项目任务表中模板id
    //Long Temp = projectTaskService.getTemplateIdByProjectId(projectId);


    //通过项目id和用户id添加到制定任务书任务表修改任务状态为1任务类型修改为0
    //LoginUser loginUser = getLoginUser();
    //SysUser user = loginUser.getUser();
    //projectTaskService.updateStatus1AndType0ById(user.getUserId(),projectId);

}

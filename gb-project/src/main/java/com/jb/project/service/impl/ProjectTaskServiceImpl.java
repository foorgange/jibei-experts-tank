package com.jb.project.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.project.mapper.ProjectTaskMapper;
import com.jb.project.domain.ProjectTask;
import com.jb.project.service.IProjectTaskService;

/**
 * 任务管理Service业务层处理
 *
 * @author ruoyi
 * @date 2022-03-12
 */
@Service
public class ProjectTaskServiceImpl implements IProjectTaskService
{
    @Autowired
    private ProjectTaskMapper projectTaskMapper;

    /**
     * 查询任务管理
     *
     * @param taskId 任务管理主键
     * @return 任务管理
     */
    @Override
    public ProjectTask selectProjectTaskByTaskId(Long taskId)
    {
        return projectTaskMapper.selectProjectTaskByTaskId(taskId);
    }

    /**
     * 查询任务管理列表
     *
     * @param projectTask 任务管理
     * @return 任务管理
     */
    @Override
    public List<ProjectTask> selectProjectTaskList(ProjectTask projectTask)
    {
        return projectTaskMapper.selectProjectTaskList(projectTask);
    }

    /**
     * 新增任务管理
     *
     * @param projectTask 任务管理
     * @return 结果
     */
    @Override
    public int insertProjectTask(ProjectTask projectTask)
    {
        projectTask.setCreateTime(DateUtils.getNowDate());
        return projectTaskMapper.insertProjectTask(projectTask);
    }

    /**
     * 修改任务管理
     *
     * @param projectTask 任务管理
     * @return 结果
     */
    @Override
    public int updateProjectTask(ProjectTask projectTask)
    {
        return projectTaskMapper.updateProjectTask(projectTask);
    }

    /**
     * 批量删除任务管理
     *
     * @param taskIds 需要删除的任务管理主键
     * @return 结果
     */
    @Override
    public int deleteProjectTaskByTaskIds(Long[] taskIds)
    {
        return projectTaskMapper.deleteProjectTaskByTaskIds(taskIds);
    }

    /**
     * 删除任务管理信息
     *
     * @param taskId 任务管理主键
     * @return 结果
     */
    @Override
    public int deleteProjectTaskByTaskId(Long taskId)
    {
        return projectTaskMapper.deleteProjectTaskByTaskId(taskId);
    }

    //根据用户id查询项目专家关联表项目id
    @Override
    public List<Long> getProjectIdByExpertId(Long userId) {
        return projectTaskMapper.getProjectIdByExpertId(userId);
    }

    //根据项目id查询项目任务表中任务类型
    @Override
    public Long getTaskTypeByProjectId(Long projectId) {
        return projectTaskMapper.getTaskTypeByProjectId(projectId);
    }

    //根据项目id和用户id修改项目专家关联表中任务状态为3任务类型修改为1
    @Override
    public void updateStatus3AndType1ById(Long userId, Long projectId) {
        projectTaskMapper.updateStatus3AndType1ById(userId,projectId);
    }

    //根据项目id查询项目任务表中模板id
    @Override
    public Long getTemplateIdByProjectId(Long projectId) {
        return projectTaskMapper.getTemplateIdByProjectId(projectId);
    }

    //根据项目id查询项目专家关联表中该项目所有人员
    @Override
    public List<Long> getAllExpertIdByProjectId(Long projectId) {
        return projectTaskMapper.getAllExpertIdByProjectId(projectId);
    }

    //根据专家id查询sys_user表获得专家姓名
    @Override
    public String getExpertNameByExpertId(Long expertId) {
        return projectTaskMapper.getExpertNameByExpertId(expertId);
    }

    //通过项目id和用户id添加到制定任务书任务表修改任务状态为1任务类型修改为0
    @Override
    public void updateStatus1AndType0ById(Long userId, Long projectId) {
        projectTaskMapper.updateStatus1AndType0ById(userId,projectId);
    }

    //修改任务状态从1(待审核)到2(已完成)
    @Override
    public void updateStatus1to2ById(Long projectId) {
        projectTaskMapper.updateStatus1to2ById(projectId);
    }


    //查询专家任务是否全部提交
    @Override
    public List<Integer> selectProjectStatusByProjectId(Long projectId) {
        return projectTaskMapper.selectProjectStatusByProjectId(projectId);
    }


}

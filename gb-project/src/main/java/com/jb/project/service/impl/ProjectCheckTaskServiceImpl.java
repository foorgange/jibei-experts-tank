package com.jb.project.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.project.mapper.ProjectCheckTaskMapper;
import com.jb.project.domain.ProjectCheckTask;
import com.jb.project.service.IProjectCheckTaskService;

/**
 * 自评互评任务Service业务层处理
 *
 * @author ruoyi
 * @date 2022-03-12
 */
@Service
public class ProjectCheckTaskServiceImpl implements IProjectCheckTaskService
{
    @Autowired
    private ProjectCheckTaskMapper projectCheckTaskMapper;

    /**
     * 查询自评互评任务
     *
     * @param checkTaskId 自评互评任务主键
     * @return 自评互评任务
     */
    @Override
    public ProjectCheckTask selectProjectCheckTaskByCheckTaskId(Long checkTaskId)
    {
        return projectCheckTaskMapper.selectProjectCheckTaskByCheckTaskId(checkTaskId);
    }

    /**
     * 查询自评互评任务列表
     *
     * @param projectCheckTask 自评互评任务
     * @return 自评互评任务
     */
    @Override
    public List<ProjectCheckTask> selectProjectCheckTaskList(ProjectCheckTask projectCheckTask)
    {
        return projectCheckTaskMapper.selectProjectCheckTaskList(projectCheckTask);
    }


    /**
     * 查询自评互评任务列表
     */
    @Override
    public List<ProjectCheckTask> selectProjectCheckTaskListByProjectId(Integer projectId)
    {
        return projectCheckTaskMapper.selectProjectCheckTaskListByProjectId(projectId);
    }

    /**
     * 新增自评互评任务
     *
     * @param projectCheckTask 自评互评任务
     * @return 结果
     */
    @Override
    public int insertProjectCheckTask(ProjectCheckTask projectCheckTask)
    {
        return projectCheckTaskMapper.insertProjectCheckTask(projectCheckTask);
    }

    /**
     * 修改自评互评任务
     *
     * @param projectCheckTask 自评互评任务
     * @return 结果
     */
    @Override
    public int updateProjectCheckTask(ProjectCheckTask projectCheckTask)
    {
        return projectCheckTaskMapper.updateProjectCheckTask(projectCheckTask);
    }

    /**
     * 批量删除自评互评任务
     *
     * @param checkTaskIds 需要删除的自评互评任务主键
     * @return 结果
     */
    @Override
    public int deleteProjectCheckTaskByCheckTaskIds(Long[] checkTaskIds)
    {
        return projectCheckTaskMapper.deleteProjectCheckTaskByCheckTaskIds(checkTaskIds);
    }

    /**
     * 删除自评互评任务信息
     *
     * @param checkTaskId 自评互评任务主键
     * @return 结果
     */
    @Override
    public int deleteProjectCheckTaskByCheckTaskId(Long checkTaskId)
    {
        return projectCheckTaskMapper.deleteProjectCheckTaskByCheckTaskId(checkTaskId);
    }

    @Override
    public String getUserNameByUserId(Long userId) {
        return projectCheckTaskMapper.getUserNameByUserId(userId);
    }

    @Override
    public String getProjectNameByProjectId(Long projectId) {
        return projectCheckTaskMapper.getProjectNameByProjectId(projectId);
    }
}

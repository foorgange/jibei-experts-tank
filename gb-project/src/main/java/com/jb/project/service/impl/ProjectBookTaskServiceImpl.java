package com.jb.project.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.project.mapper.ProjectBookTaskMapper;
import com.jb.project.domain.ProjectBookTask;
import com.jb.project.service.IProjectBookTaskService;

/**
 * 制定任务书任务Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-12
 */
@Service
public class ProjectBookTaskServiceImpl implements IProjectBookTaskService 
{
    @Autowired
    private ProjectBookTaskMapper projectBookTaskMapper;

    /**
     * 查询制定任务书任务
     * 
     * @param bookTaskId 制定任务书任务主键
     * @return 制定任务书任务
     */
    @Override
    public ProjectBookTask selectProjectBookTaskByBookTaskId(Long bookTaskId)
    {
        return projectBookTaskMapper.selectProjectBookTaskByBookTaskId(bookTaskId);
    }

    /**
     * 查询制定任务书任务列表
     * 
     * @param projectBookTask 制定任务书任务
     * @return 制定任务书任务
     */
    @Override
    public List<ProjectBookTask> selectProjectBookTaskList(ProjectBookTask projectBookTask)
    {
        return projectBookTaskMapper.selectProjectBookTaskList(projectBookTask);
    }

    /**
     * 新增制定任务书任务
     * 
     * @param projectBookTask 制定任务书任务
     * @return 结果
     */
    @Override
    public int insertProjectBookTask(ProjectBookTask projectBookTask)
    {
        return projectBookTaskMapper.insertProjectBookTask(projectBookTask);
    }

    /**
     * 修改制定任务书任务
     * 
     * @param projectBookTask 制定任务书任务
     * @return 结果
     */
    @Override
    public int updateProjectBookTask(ProjectBookTask projectBookTask)
    {
        return projectBookTaskMapper.updateProjectBookTask(projectBookTask);
    }

    /**
     * 批量删除制定任务书任务
     * 
     * @param bookTaskIds 需要删除的制定任务书任务主键
     * @return 结果
     */
    @Override
    public int deleteProjectBookTaskByBookTaskIds(Long[] bookTaskIds)
    {
        return projectBookTaskMapper.deleteProjectBookTaskByBookTaskIds(bookTaskIds);
    }

    /**
     * 删除制定任务书任务信息
     * 
     * @param bookTaskId 制定任务书任务主键
     * @return 结果
     */
    @Override
    public int deleteProjectBookTaskByBookTaskId(Long bookTaskId)
    {
        return projectBookTaskMapper.deleteProjectBookTaskByBookTaskId(bookTaskId);
    }
}

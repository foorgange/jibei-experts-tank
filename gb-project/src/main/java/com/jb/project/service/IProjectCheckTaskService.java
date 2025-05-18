package com.jb.project.service;

import java.util.List;
import com.jb.project.domain.ProjectCheckTask;

/**
 * 自评互评任务Service接口
 *
 * @author ruoyi
 * @date 2022-03-12
 */
public interface IProjectCheckTaskService
{
    /**
     * 查询自评互评任务
     *
     * @param checkTaskId 自评互评任务主键
     * @return 自评互评任务
     */
    public ProjectCheckTask selectProjectCheckTaskByCheckTaskId(Long checkTaskId);

    /**
     * 查询自评互评任务列表
     *
     * @param projectCheckTask 自评互评任务
     * @return 自评互评任务集合
     */
    public List<ProjectCheckTask> selectProjectCheckTaskList(ProjectCheckTask projectCheckTask);

    /**
     * 查询自评互评任务列表
     */
    public List<ProjectCheckTask> selectProjectCheckTaskListByProjectId(Integer projectId);

    /**
     * 新增自评互评任务
     *
     * @param projectCheckTask 自评互评任务
     * @return 结果
     */
    public int insertProjectCheckTask(ProjectCheckTask projectCheckTask);

    /**
     * 修改自评互评任务
     *
     * @param projectCheckTask 自评互评任务
     * @return 结果
     */
    public int updateProjectCheckTask(ProjectCheckTask projectCheckTask);

    /**
     * 批量删除自评互评任务
     *
     * @param checkTaskIds 需要删除的自评互评任务主键集合
     * @return 结果
     */
    public int deleteProjectCheckTaskByCheckTaskIds(Long[] checkTaskIds);

    /**
     * 删除自评互评任务信息
     *
     * @param checkTaskId 自评互评任务主键
     * @return 结果
     */
    public int deleteProjectCheckTaskByCheckTaskId(Long checkTaskId);

    //通过userId获得userName
    public String getUserNameByUserId(Long userId);

    //根据项目id获得项目名称
    public String getProjectNameByProjectId(Long projectId);
}

package com.jb.project.mapper;

import java.util.List;
import com.jb.project.domain.ProjectCheckTask;

/**
 * 自评互评任务Mapper接口
 *
 * @author ruoyi
 * @date 2022-03-12
 */
public interface ProjectCheckTaskMapper
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
     * 删除自评互评任务
     *
     * @param checkTaskId 自评互评任务主键
     * @return 结果
     */
    public int deleteProjectCheckTaskByCheckTaskId(Long checkTaskId);

    /**
     * 批量删除自评互评任务
     *
     * @param checkTaskIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProjectCheckTaskByCheckTaskIds(Long[] checkTaskIds);

    public String getUserNameByUserId(Long userId);

    public String getProjectNameByProjectId(Long projectId);
}

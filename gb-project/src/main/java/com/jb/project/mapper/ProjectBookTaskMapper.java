package com.jb.project.mapper;

import java.util.List;
import com.jb.project.domain.ProjectBookTask;

/**
 * 制定任务书任务Mapper接口
 * 
 * @author ruoyi
 * @date 2022-03-12
 */
public interface ProjectBookTaskMapper 
{
    /**
     * 查询制定任务书任务
     * 
     * @param bookTaskId 制定任务书任务主键
     * @return 制定任务书任务
     */
    public ProjectBookTask selectProjectBookTaskByBookTaskId(Long bookTaskId);

    /**
     * 查询制定任务书任务列表
     * 
     * @param projectBookTask 制定任务书任务
     * @return 制定任务书任务集合
     */
    public List<ProjectBookTask> selectProjectBookTaskList(ProjectBookTask projectBookTask);

    /**
     * 新增制定任务书任务
     * 
     * @param projectBookTask 制定任务书任务
     * @return 结果
     */
    public int insertProjectBookTask(ProjectBookTask projectBookTask);

    /**
     * 修改制定任务书任务
     * 
     * @param projectBookTask 制定任务书任务
     * @return 结果
     */
    public int updateProjectBookTask(ProjectBookTask projectBookTask);

    /**
     * 删除制定任务书任务
     * 
     * @param bookTaskId 制定任务书任务主键
     * @return 结果
     */
    public int deleteProjectBookTaskByBookTaskId(Long bookTaskId);

    /**
     * 批量删除制定任务书任务
     * 
     * @param bookTaskIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProjectBookTaskByBookTaskIds(Long[] bookTaskIds);

}

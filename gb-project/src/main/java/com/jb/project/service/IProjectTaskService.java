package com.jb.project.service;

import java.util.List;
import com.jb.project.domain.ProjectTask;

/**
 * 任务管理Service接口
 *
 * @author ruoyi
 * @date 2022-03-12
 */
public interface IProjectTaskService
{
    /**
     * 查询任务管理
     *
     * @param taskId 任务管理主键
     * @return 任务管理
     */
    public ProjectTask selectProjectTaskByTaskId(Long taskId);

    /**
     * 查询任务管理列表
     *
     * @param projectTask 任务管理
     * @return 任务管理集合
     */
    public List<ProjectTask> selectProjectTaskList(ProjectTask projectTask);

    /**
     * 新增任务管理
     *
     * @param projectTask 任务管理
     * @return 结果
     */
    public int insertProjectTask(ProjectTask projectTask);

    /**
     * 修改任务管理
     *
     * @param projectTask 任务管理
     * @return 结果
     */
    public int updateProjectTask(ProjectTask projectTask);

    /**
     * 批量删除任务管理
     *
     * @param taskIds 需要删除的任务管理主键集合
     * @return 结果
     */
    public int deleteProjectTaskByTaskIds(Long[] taskIds);

    /**
     * 删除任务管理信息
     *
     * @param taskId 任务管理主键
     * @return 结果
     */
    public int deleteProjectTaskByTaskId(Long taskId);

    //根据用户id查询项目专家关联表项目id
    public List<Long> getProjectIdByExpertId(Long userId);

    //根据项目id查询项目任务表中任务类型
    public Long getTaskTypeByProjectId(Long projectId);

    //根据项目id和用户id修改项目专家关联表中任务状态为3任务类型修改为1
    public void updateStatus3AndType1ById(Long userId, Long projectId);

    //根据项目id查询项目任务表中模板id
    public Long getTemplateIdByProjectId(Long projectId);

    //根据项目id查询项目专家关联表中该项目所有人员
    public List<Long> getAllExpertIdByProjectId(Long projectId);

    //根据专家id查询sys_user表获得专家姓名
    public String getExpertNameByExpertId(Long expertId);

    //通过项目id和用户id添加到制定任务书任务表修改任务状态为1任务类型修改为0
    public void updateStatus1AndType0ById(Long userId, Long projectId);

    //修改任务状态从1(待审核)到2(已完成)
    public void updateStatus1to2ById(Long projectId);

    //查询专家任务是否全部提交
    public List<Integer> selectProjectStatusByProjectId(Long projectId);
}

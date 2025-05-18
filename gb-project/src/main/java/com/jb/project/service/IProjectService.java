package com.jb.project.service;

import java.util.List;

import com.jb.expert.domain.ProjectExperts;
import com.jb.project.domain.Project;
import com.jb.project.domain.ProjectExpertProject;
import com.jb.project.domain.TaskMemberInfo;

/**
 * 项目列表Service接口
 *
 * @author ruoyi
 * @date 2022-03-12
 */
public interface IProjectService
{
    /**
     * 查询项目列表
     *
     * @param projectId 项目列表主键
     * @return 项目列表
     */
    public Project selectProjectByProjectId(Long projectId);

    /**
     * 查询项目列表列表
     *
     * @param project 项目列表
     * @return 项目列表集合
     */
    public List<Project> selectProjectList(Project project);

    /**
     * 新增项目列表
     *
     * @param project 项目列表
     * @return 结果
     */
    public int insertProject(Project project);

    /**
     * 修改项目列表
     *
     * @param project 项目列表
     * @return 结果
     */
    public int updateProject(Project project);

    /**
     * 批量删除项目列表
     *
     * @param projectIds 需要删除的项目列表主键集合
     * @return 结果
     */
    public int deleteProjectByProjectIds(Long[] projectIds);

    /**
     * 删除项目列表信息
     *
     * @param projectId 项目列表主键
     * @return 结果
     */
    public int deleteProjectByProjectId(Long projectId);

    /**
     * 根据项目名称获得项目id
     *
     * @param projectName 项目名称
     * @return 结果
     */
    public Integer getProjectIdByName(String projectName);

    /**
     * 根据项目id查询项目项目用户关联表中所有用户id
     *
     * @param proId 项目id
     * @return 结果
     */
    public List<Integer> getUserIdList(Long proId);

    public Long getUserStarById(Integer userId);


    public int getProjectIdByUserId(int userId);

    public List<Project> getJoinedProjectListByUserId(Long userId);

    public List<ProjectExperts> getJoinedExperts(Long projectId);

    public List<TaskMemberInfo> getMemberTaskInfoList(Long projectId);

    public void updateProjectStatus2to3(Long projectId);
}

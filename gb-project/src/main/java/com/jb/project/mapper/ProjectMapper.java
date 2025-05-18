package com.jb.project.mapper;

import java.util.List;

import com.jb.expert.domain.ProjectExperts;
import com.jb.project.domain.Project;
import com.jb.project.domain.ProjectExpertProject;
import com.jb.project.domain.TaskMemberInfo;

/**
 * 项目列表Mapper接口
 *
 * @author ruoyi
 * @date 2022-03-12
 */
public interface ProjectMapper
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
     * 删除项目列表
     *
     * @param projectId 项目列表主键
     * @return 结果
     */
    public int deleteProjectByProjectId(Long projectId);

    /**
     * 批量删除项目列表
     *
     * @param projectIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProjectByProjectIds(Long[] projectIds);

    /**
     * 根据项目名称获得项目id
     *
     * @param projectName 项目名称
     * @return 结果
     */
    public Integer getProjectIdByName(String projectName);

    public int insertProjectExpertProject(ProjectExpertProject projectExpertProject);

    public List<Integer> getUserIdList(Long proId);

    public Long getUserStarById(Integer userId);

    public int getProjectIdByUserId(int userId);

    public List<Project> getJoinedProjectListByUserId(Long userId);

    public List<ProjectExperts> getJoinedExperts(Long projectId);

    public List<TaskMemberInfo> getMemberTaskInfoList(Long projectId);

    public void updateProjectStatus2to3(Long projectId);
}

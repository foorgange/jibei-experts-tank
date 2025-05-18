package com.jb.project.service.impl;

import java.util.List;

import com.jb.expert.domain.ProjectExperts;
import com.jb.project.domain.ProjectExpertProject;
import com.jb.project.domain.TaskMemberInfo;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.project.mapper.ProjectMapper;
import com.jb.project.domain.Project;
import com.jb.project.service.IProjectService;

/**
 * 项目列表Service业务层处理
 *
 * @author ruoyi
 * @date 2022-03-12
 */
@Service
public class ProjectServiceImpl implements IProjectService
{
    @Autowired
    private ProjectMapper projectMapper;

    /**
     * 查询项目列表
     *
     * @param projectId 项目列表主键
     * @return 项目列表
     */
    @Override
    public Project selectProjectByProjectId(Long projectId)
    {
        return projectMapper.selectProjectByProjectId(projectId);
    }

    /**
     * 查询项目列表列表
     *
     * @param project 项目列表
     * @return 项目列表
     */
    @Override
    public List<Project> selectProjectList(Project project)
    {
        return projectMapper.selectProjectList(project);
    }

    /**
     * 新增项目列表
     *
     * @param project 项目列表
     * @return 结果
     */
    @Override
    public int insertProject(Project project)
    {
        project.setCreateTime(DateUtils.getNowDate());
        projectMapper.insertProject(project);

        int projectId = projectMapper.getProjectIdByName(project.getProjectName());

        ProjectExpertProject projectExpertProject=new ProjectExpertProject();
        projectExpertProject.setProjectId((Long.valueOf(projectId)));
        projectExpertProject.setUserId(project.getCreateUserId());

        projectMapper.insertProjectExpertProject(projectExpertProject);
        return 1;
    }

    /**
     * 修改项目列表
     *
     * @param project 项目列表
     * @return 结果
     */
    @Override
    public int updateProject(Project project)
    {
        return projectMapper.updateProject(project);
    }

    /**
     * 批量删除项目列表
     *
     * @param projectIds 需要删除的项目列表主键
     * @return 结果
     */
    @Override
    public int deleteProjectByProjectIds(Long[] projectIds)
    {
        return projectMapper.deleteProjectByProjectIds(projectIds);
    }

    /**
     * 删除项目列表信息
     *
     * @param projectId 项目列表主键
     * @return 结果
     */
    @Override
    public int deleteProjectByProjectId(Long projectId)
    {
        return projectMapper.deleteProjectByProjectId(projectId);
    }

    /**
     * 根据项目名称获得项目id
     *
     * @param projectName 项目名称
     * @return 结果
     */
    @Override
    public Integer getProjectIdByName(String projectName) {
        return projectMapper.getProjectIdByName(projectName);
    }

    /**
     * 根据项目id查询项目项目用户关联表中所有用户id
     *
     * @param proId 项目id
     * @return 结果
     */
    @Override
    public List<Integer> getUserIdList(Long proId) {
        return projectMapper.getUserIdList(proId);
    }

    @Override
    public Long getUserStarById(Integer userId) {
        return projectMapper.getUserStarById(userId);
    }

    @Override
    public int getProjectIdByUserId(int userId) {
        return projectMapper.getProjectIdByUserId(userId);
    }

    @Override
    public List<Project> getJoinedProjectListByUserId(Long userId){
        return projectMapper.getJoinedProjectListByUserId(userId);
    }

    @Override
    public List<ProjectExperts> getJoinedExperts(Long projectId){
        return projectMapper.getJoinedExperts(projectId);
    }

    @Override
    public List<TaskMemberInfo> getMemberTaskInfoList(Long projectId){
        return projectMapper.getMemberTaskInfoList(projectId);
    }

    @Override
    public void updateProjectStatus2to3(Long projectId) {
        projectMapper.updateProjectStatus2to3(projectId);
    }

}

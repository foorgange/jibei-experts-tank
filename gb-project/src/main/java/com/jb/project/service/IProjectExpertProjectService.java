package com.jb.project.service;

import java.util.List;

import com.jb.project.domain.Project;
import com.jb.project.domain.ProjectExpertProject;

/**
 * 项目用户关联管理Service接口
 * 
 * @author ruoyi
 * @date 2022-03-12
 */
public interface IProjectExpertProjectService 
{
    /**
     * 查询项目用户关联管理
     * 
     * @param projectUserId 项目用户关联管理主键
     * @return 项目用户关联管理
     */
    public ProjectExpertProject selectProjectExpertProjectByProjectUserId(Long projectUserId);

    /**
     * 查询项目用户关联管理列表
     * 
     * @param projectExpertProject 项目用户关联管理
     * @return 项目用户关联管理集合
     */
    public List<ProjectExpertProject> selectProjectExpertProjectList(ProjectExpertProject projectExpertProject);

    /**
     * 新增项目用户关联管理
     * 
     * @param projectExpertProject 项目用户关联管理
     * @return 结果
     */
    public int insertProjectExpertProject(ProjectExpertProject projectExpertProject);

    /**
     * 修改项目用户关联管理
     * 
     * @param projectExpertProject 项目用户关联管理
     * @return 结果
     */
    public int updateProjectExpertProject(ProjectExpertProject projectExpertProject);

    /**
     * 批量删除项目用户关联管理
     * 
     * @param projectUserIds 需要删除的项目用户关联管理主键集合
     * @return 结果
     */
    public int deleteProjectExpertProjectByProjectUserIds(Long[] projectUserIds);

    /**
     * 删除项目用户关联管理信息
     * 
     * @param projectUserId 项目用户关联管理主键
     * @return 结果
     */
    public int deleteProjectExpertProjectByProjectUserId(Long projectUserId);

}

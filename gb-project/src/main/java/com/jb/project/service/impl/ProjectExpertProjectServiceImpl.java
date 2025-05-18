package com.jb.project.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.project.mapper.ProjectExpertProjectMapper;
import com.jb.project.domain.ProjectExpertProject;
import com.jb.project.service.IProjectExpertProjectService;

/**
 * 项目用户关联管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-12
 */
@Service
public class ProjectExpertProjectServiceImpl implements IProjectExpertProjectService 
{
    @Autowired
    private ProjectExpertProjectMapper projectExpertProjectMapper;

    /**
     * 查询项目用户关联管理
     * 
     * @param projectUserId 项目用户关联管理主键
     * @return 项目用户关联管理
     */
    @Override
    public ProjectExpertProject selectProjectExpertProjectByProjectUserId(Long projectUserId)
    {
        return projectExpertProjectMapper.selectProjectExpertProjectByProjectUserId(projectUserId);
    }

    /**
     * 查询项目用户关联管理列表
     * 
     * @param projectExpertProject 项目用户关联管理
     * @return 项目用户关联管理
     */
    @Override
    public List<ProjectExpertProject> selectProjectExpertProjectList(ProjectExpertProject projectExpertProject)
    {
        return projectExpertProjectMapper.selectProjectExpertProjectList(projectExpertProject);
    }

    /**
     * 新增项目用户关联管理
     * 
     * @param projectExpertProject 项目用户关联管理
     * @return 结果
     */
    @Override
    public int insertProjectExpertProject(ProjectExpertProject projectExpertProject)
    {
        return projectExpertProjectMapper.insertProjectExpertProject(projectExpertProject);
    }

    /**
     * 修改项目用户关联管理
     * 
     * @param projectExpertProject 项目用户关联管理
     * @return 结果
     */
    @Override
    public int updateProjectExpertProject(ProjectExpertProject projectExpertProject)
    {
        return projectExpertProjectMapper.updateProjectExpertProject(projectExpertProject);
    }

    /**
     * 批量删除项目用户关联管理
     * 
     * @param projectUserIds 需要删除的项目用户关联管理主键
     * @return 结果
     */
    @Override
    public int deleteProjectExpertProjectByProjectUserIds(Long[] projectUserIds)
    {
        return projectExpertProjectMapper.deleteProjectExpertProjectByProjectUserIds(projectUserIds);
    }

    /**
     * 删除项目用户关联管理信息
     * 
     * @param projectUserId 项目用户关联管理主键
     * @return 结果
     */
    @Override
    public int deleteProjectExpertProjectByProjectUserId(Long projectUserId)
    {
        return projectExpertProjectMapper.deleteProjectExpertProjectByProjectUserId(projectUserId);
    }
}

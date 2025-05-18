package com.jb.expert.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.expert.mapper.ProjectTitleMapper;
import com.jb.expert.domain.ProjectTitle;
import com.jb.expert.service.IProjectTitleService;

/**
 * 职称管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-02-20
 */
@Service
public class ProjectTitleServiceImpl implements IProjectTitleService 
{
    @Autowired
    private ProjectTitleMapper projectTitleMapper;

    /**
     * 查询职称管理
     * 
     * @param titleId 职称管理主键
     * @return 职称管理
     */
    @Override
    public ProjectTitle selectProjectTitleByTitleId(Long titleId)
    {
        return projectTitleMapper.selectProjectTitleByTitleId(titleId);
    }

    /**
     * 查询职称管理列表
     * 
     * @param projectTitle 职称管理
     * @return 职称管理
     */
    @Override
    public List<ProjectTitle> selectProjectTitleList(ProjectTitle projectTitle)
    {
        return projectTitleMapper.selectProjectTitleList(projectTitle);
    }

    /**
     * 新增职称管理
     * 
     * @param projectTitle 职称管理
     * @return 结果
     */
    @Override
    public int insertProjectTitle(ProjectTitle projectTitle)
    {
        return projectTitleMapper.insertProjectTitle(projectTitle);
    }

    /**
     * 修改职称管理
     * 
     * @param projectTitle 职称管理
     * @return 结果
     */
    @Override
    public int updateProjectTitle(ProjectTitle projectTitle)
    {
        return projectTitleMapper.updateProjectTitle(projectTitle);
    }

    /**
     * 批量删除职称管理
     * 
     * @param titleIds 需要删除的职称管理主键
     * @return 结果
     */
    @Override
    public int deleteProjectTitleByTitleIds(Long[] titleIds)
    {
        return projectTitleMapper.deleteProjectTitleByTitleIds(titleIds);
    }

    /**
     * 删除职称管理信息
     * 
     * @param titleId 职称管理主键
     * @return 结果
     */
    @Override
    public int deleteProjectTitleByTitleId(Long titleId)
    {
        return projectTitleMapper.deleteProjectTitleByTitleId(titleId);
    }
}

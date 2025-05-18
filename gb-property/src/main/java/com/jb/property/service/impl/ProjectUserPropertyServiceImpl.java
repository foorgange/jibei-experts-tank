package com.jb.property.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.property.mapper.ProjectUserPropertyMapper;
import com.jb.property.domain.ProjectUserProperty;
import com.jb.property.service.IProjectUserPropertyService;

/**
 * 知识产权用户关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-05
 */
@Service
public class ProjectUserPropertyServiceImpl implements IProjectUserPropertyService 
{
    @Autowired
    private ProjectUserPropertyMapper projectUserPropertyMapper;

    /**
     * 查询知识产权用户关联
     * 
     * @param userId 知识产权用户关联主键
     * @return 知识产权用户关联
     */
    @Override
    public ProjectUserProperty selectProjectUserPropertyByUserId(Long userId)
    {
        return projectUserPropertyMapper.selectProjectUserPropertyByUserId(userId);
    }

    /**
     * 查询知识产权用户关联列表
     * 
     * @param projectUserProperty 知识产权用户关联
     * @return 知识产权用户关联
     */
    @Override
    public List<ProjectUserProperty> selectProjectUserPropertyList(ProjectUserProperty projectUserProperty)
    {
        return projectUserPropertyMapper.selectProjectUserPropertyList(projectUserProperty);
    }

    /**
     * 新增知识产权用户关联
     * 
     * @param projectUserProperty 知识产权用户关联
     * @return 结果
     */
    @Override
    public int insertProjectUserProperty(ProjectUserProperty projectUserProperty)
    {
        return projectUserPropertyMapper.insertProjectUserProperty(projectUserProperty);
    }

    /**
     * 修改知识产权用户关联
     * 
     * @param projectUserProperty 知识产权用户关联
     * @return 结果
     */
    @Override
    public int updateProjectUserProperty(ProjectUserProperty projectUserProperty)
    {
        return projectUserPropertyMapper.updateProjectUserProperty(projectUserProperty);
    }

    /**
     * 批量删除知识产权用户关联
     * 
     * @param userIds 需要删除的知识产权用户关联主键
     * @return 结果
     */
    @Override
    public int deleteProjectUserPropertyByUserIds(Long[] userIds)
    {
        return projectUserPropertyMapper.deleteProjectUserPropertyByUserIds(userIds);
    }

    /**
     * 删除知识产权用户关联信息
     * 
     * @param userId 知识产权用户关联主键
     * @return 结果
     */
    @Override
    public int deleteProjectUserPropertyByUserId(Long userId)
    {
        return projectUserPropertyMapper.deleteProjectUserPropertyByUserId(userId);
    }
    /**
     *
     * 根据知识产权id获取列表
     *
     * @param propertyId
     * @return
     */
    @Override
    public List<ProjectUserProperty> selectPropertyWorkerList(Long propertyId){
        return projectUserPropertyMapper.selectPropertyWorkerList(propertyId);
    }
}

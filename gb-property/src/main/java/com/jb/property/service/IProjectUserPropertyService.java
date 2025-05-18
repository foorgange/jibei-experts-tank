package com.jb.property.service;

import java.util.List;
import com.jb.property.domain.ProjectUserProperty;

/**
 * 知识产权用户关联Service接口
 * 
 * @author ruoyi
 * @date 2022-03-05
 */
public interface IProjectUserPropertyService 
{
    /**
     * 查询知识产权用户关联
     * 
     * @param userId 知识产权用户关联主键
     * @return 知识产权用户关联
     */
    public ProjectUserProperty selectProjectUserPropertyByUserId(Long userId);

    /**
     * 查询知识产权用户关联列表
     * 
     * @param projectUserProperty 知识产权用户关联
     * @return 知识产权用户关联集合
     */
    public List<ProjectUserProperty> selectProjectUserPropertyList(ProjectUserProperty projectUserProperty);

    /**
     * 新增知识产权用户关联
     * 
     * @param projectUserProperty 知识产权用户关联
     * @return 结果
     */
    public int insertProjectUserProperty(ProjectUserProperty projectUserProperty);

    /**
     * 修改知识产权用户关联
     * 
     * @param projectUserProperty 知识产权用户关联
     * @return 结果
     */
    public int updateProjectUserProperty(ProjectUserProperty projectUserProperty);

    /**
     * 批量删除知识产权用户关联
     * 
     * @param userIds 需要删除的知识产权用户关联主键集合
     * @return 结果
     */
    public int deleteProjectUserPropertyByUserIds(Long[] userIds);

    /**
     * 删除知识产权用户关联信息
     * 
     * @param userId 知识产权用户关联主键
     * @return 结果
     */
    public int deleteProjectUserPropertyByUserId(Long userId);

    /**
     *
     * 根据知识产权id获取列表
     *
     * @param propertyId
     * @return
     */
    public List<ProjectUserProperty> selectPropertyWorkerList(Long propertyId);
}

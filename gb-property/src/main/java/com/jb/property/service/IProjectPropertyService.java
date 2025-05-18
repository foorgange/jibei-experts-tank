package com.jb.property.service;

import java.util.List;
import com.jb.property.domain.ProjectProperty;
import com.jb.property.domain.ProjectUserProperty;

/**
 * 知识产权Service接口
 *
 * @author ruoyi
 * @date 2022-03-05
 */
public interface IProjectPropertyService
{
    /**
     * 查询知识产权
     *
     * @param propertyId 知识产权主键
     * @return 知识产权
     */
    public ProjectProperty selectProjectPropertyByPropertyId(Long propertyId);

    /**
     * 查询知识产权列表
     *
     * @param projectProperty 知识产权
     * @return 知识产权集合
     */
    public List<ProjectProperty> selectProjectPropertyList(ProjectProperty projectProperty);

    /**
     * 新增知识产权
     *
     * @param projectProperty 知识产权
     * @return 结果
     */
    public Long insertProjectProperty(ProjectProperty projectProperty);

    /**
     * 修改知识产权
     *
     * @param projectProperty 知识产权
     * @return 结果
     */
    public Long updateProjectProperty(ProjectProperty projectProperty);

    /**
     * 批量删除知识产权
     *
     * @param propertyIds 需要删除的知识产权主键集合
     * @return 结果
     */
    public int deleteProjectPropertyByPropertyIds(Long[] propertyIds);

    /**
     * 删除知识产权信息
     *
     * @param propertyId 知识产权主键
     * @return 结果
     */
    public int deleteProjectPropertyByPropertyId(Long propertyId);

    /**
     * 根据著作名获得产权id
     *
     * @param property_name
     * @return 结果
     */
    public Long getPropertyIdByName(String property_name);

    //将产权id,作者插入产权作者关联表
    public int insertUserProjectProperty(ProjectUserProperty projectUserProperty);

    //根据产权id查询所有作者
    public List selectPropertyWorkerList(Long propertyId);

    //更新到期状态
    public void updateFareStatus();
}

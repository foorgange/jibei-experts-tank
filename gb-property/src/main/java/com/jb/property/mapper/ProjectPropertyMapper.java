package com.jb.property.mapper;

import java.util.List;
import com.jb.property.domain.ProjectProperty;
import com.jb.property.domain.ProjectUserProperty;

/**
 * 知识产权Mapper接口
 *
 * @author ruoyi
 * @date 2022-03-05
 */
public interface ProjectPropertyMapper
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
    public int updateProjectProperty(ProjectProperty projectProperty);

    /**
     * 删除知识产权
     *
     * @param propertyId 知识产权主键
     * @return 结果
     */
    public int deleteProjectPropertyByPropertyId(Long propertyId);

    /**
     * 批量删除知识产权
     *
     * @param propertyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProjectPropertyByPropertyIds(Long[] propertyIds);

    public Long getPropertyIdByName(String property_name);

    public int insertUserProjectProperty(ProjectUserProperty projectUserProperty);

    public List<String> selectPropertyWorkerList(Long propertyId);

    public void  updateFareStatus();
}

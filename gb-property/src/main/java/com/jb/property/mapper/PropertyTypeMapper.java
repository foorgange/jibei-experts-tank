package com.jb.property.mapper;

import java.util.List;
import com.jb.property.domain.PropertyType;

/**
 * 知识产权类型管理Mapper接口
 * 
 * @author ruoyi
 * @date 2022-03-05
 */
public interface PropertyTypeMapper 
{
    /**
     * 查询知识产权类型管理
     * 
     * @param propertyTypeId 知识产权类型管理主键
     * @return 知识产权类型管理
     */
    public PropertyType selectPropertyTypeByPropertyTypeId(Long propertyTypeId);

    /**
     * 查询知识产权类型管理列表
     * 
     * @param propertyType 知识产权类型管理
     * @return 知识产权类型管理集合
     */
    public List<PropertyType> selectPropertyTypeList(PropertyType propertyType);

    /**
     * 新增知识产权类型管理
     * 
     * @param propertyType 知识产权类型管理
     * @return 结果
     */
    public int insertPropertyType(PropertyType propertyType);

    /**
     * 修改知识产权类型管理
     * 
     * @param propertyType 知识产权类型管理
     * @return 结果
     */
    public int updatePropertyType(PropertyType propertyType);

    /**
     * 删除知识产权类型管理
     * 
     * @param propertyTypeId 知识产权类型管理主键
     * @return 结果
     */
    public int deletePropertyTypeByPropertyTypeId(Long propertyTypeId);

    /**
     * 批量删除知识产权类型管理
     * 
     * @param propertyTypeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePropertyTypeByPropertyTypeIds(Long[] propertyTypeIds);

}

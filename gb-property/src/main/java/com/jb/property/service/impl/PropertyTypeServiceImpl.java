package com.jb.property.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.property.mapper.PropertyTypeMapper;
import com.jb.property.domain.PropertyType;
import com.jb.property.service.IPropertyTypeService;

/**
 * 知识产权类型管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-05
 */
@Service
public class PropertyTypeServiceImpl implements IPropertyTypeService 
{
    @Autowired
    private PropertyTypeMapper propertyTypeMapper;

    /**
     * 查询知识产权类型管理
     * 
     * @param propertyTypeId 知识产权类型管理主键
     * @return 知识产权类型管理
     */
    @Override
    public PropertyType selectPropertyTypeByPropertyTypeId(Long propertyTypeId)
    {
        return propertyTypeMapper.selectPropertyTypeByPropertyTypeId(propertyTypeId);
    }

    /**
     * 查询知识产权类型管理列表
     * 
     * @param propertyType 知识产权类型管理
     * @return 知识产权类型管理
     */
    @Override
    public List<PropertyType> selectPropertyTypeList(PropertyType propertyType)
    {
        return propertyTypeMapper.selectPropertyTypeList(propertyType);
    }

    /**
     * 新增知识产权类型管理
     * 
     * @param propertyType 知识产权类型管理
     * @return 结果
     */
    @Override
    public int insertPropertyType(PropertyType propertyType)
    {
        return propertyTypeMapper.insertPropertyType(propertyType);
    }

    /**
     * 修改知识产权类型管理
     * 
     * @param propertyType 知识产权类型管理
     * @return 结果
     */
    @Override
    public int updatePropertyType(PropertyType propertyType)
    {
        return propertyTypeMapper.updatePropertyType(propertyType);
    }

    /**
     * 批量删除知识产权类型管理
     * 
     * @param propertyTypeIds 需要删除的知识产权类型管理主键
     * @return 结果
     */
    @Override
    public int deletePropertyTypeByPropertyTypeIds(Long[] propertyTypeIds)
    {
        return propertyTypeMapper.deletePropertyTypeByPropertyTypeIds(propertyTypeIds);
    }

    /**
     * 删除知识产权类型管理信息
     * 
     * @param propertyTypeId 知识产权类型管理主键
     * @return 结果
     */
    @Override
    public int deletePropertyTypeByPropertyTypeId(Long propertyTypeId)
    {
        return propertyTypeMapper.deletePropertyTypeByPropertyTypeId(propertyTypeId);
    }
}

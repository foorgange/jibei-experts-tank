package com.jb.property.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 知识产权类型管理对象 property_type
 *
 * @author ruoyi
 * @date 2022-03-05
 */
public class PropertyType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 知识产权类型id */
    private Long propertyTypeId;

    /** 知识产权名称 */
    @Excel(name = "知识产权名称")
    private String propertyTypeName;

    public void setPropertyTypeId(Long propertyTypeId)
    {
        this.propertyTypeId = propertyTypeId;
    }

    public Long getPropertyTypeId()
    {
        return propertyTypeId;
    }
    public void setPropertyTypeName(String propertyTypeName)
    {
        this.propertyTypeName = propertyTypeName;
    }

    public String getPropertyTypeName()
    {
        return propertyTypeName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("propertyTypeId", getPropertyTypeId())
            .append("propertyTypeName", getPropertyTypeName())
            .toString();
    }
}

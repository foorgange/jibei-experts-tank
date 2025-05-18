package com.jb.property.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 知识产权用户关联对象 project_user_property
 *
 * @author ruoyi
 * @date 2022-03-05
 */
public class ProjectUserProperty extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 知识产权所属用户id */
    private Long userId;

    /** 知识产权id */
    private Long propertyId;

    /** 知识产权所属用户姓名 */
    @Excel(name = "知识产权所属用户姓名")
    private String userNickName;

    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setPropertyId(Long propertyId)
    {
        this.propertyId = propertyId;
    }

    public Long getPropertyId()
    {
        return propertyId;
    }
    public void setUserNickName(String userNickName)
    {
        this.userNickName = userNickName;
    }

    public String getUserNickName()
    {
        return userNickName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("userId", getUserId())
            .append("propertyId", getPropertyId())
            .append("userNickName", getUserNickName())
            .toString();
    }
}

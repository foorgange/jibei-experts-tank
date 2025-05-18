package com.jb.expert.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 职位管理对象 project_position
 *
 * @author ruoyi
 * @date 2022-02-20
 */
public class ProjectPosition extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 职位id */
    private Long positionId;

    /** 职位名称 */
    @Excel(name = "职位名称")
    private String positionName;

    public void setPositionId(Long positionId)
    {
        this.positionId = positionId;
    }

    public Long getPositionId()
    {
        return positionId;
    }
    public void setPositionName(String positionName)
    {
        this.positionName = positionName;
    }

    public String getPositionName()
    {
        return positionName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("positionId", getPositionId())
            .append("positionName", getPositionName())
            .toString();
    }
}

package com.jb.expert.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 职称管理对象 project_title
 *
 * @author ruoyi
 * @date 2022-02-20
 */
public class ProjectTitle extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 职称id */
    private Long titleId;

    /** 职称名称 */
    @Excel(name = "职称名称")
    private String titleName;

    public void setTitleId(Long titleId)
    {
        this.titleId = titleId;
    }

    public Long getTitleId()
    {
        return titleId;
    }
    public void setTitleName(String titleName)
    {
        this.titleName = titleName;
    }

    public String getTitleName()
    {
        return titleName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("titleId", getTitleId())
            .append("titleName", getTitleName())
            .toString();
    }
}

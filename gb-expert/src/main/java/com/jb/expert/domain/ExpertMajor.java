package com.jb.expert.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 专业管理对象 expert_major
 *
 * @author ruoyi
 * @date 2022-02-20
 */
public class ExpertMajor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 专业id */
    private Long majorId;

    /** 专业名称 */
    @Excel(name = "专业名称")
    private String majorName;

    public void setMajorId(Long majorId)
    {
        this.majorId = majorId;
    }

    public Long getMajorId()
    {
        return majorId;
    }
    public void setMajorName(String majorName)
    {
        this.majorName = majorName;
    }

    public String getMajorName()
    {
        return majorName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("majorId", getMajorId())
            .append("majorName", getMajorName())
            .toString();
    }
}

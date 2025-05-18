package com.jb.expert.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 专家类别管理对象 expert_class
 *
 * @author ruoyi
 * @date 2022-02-20
 */
public class ExpertClass extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 专家类别id */
    private Long classId;

    /** 类别名称 */
    @Excel(name = "类别名称")
    private String className;

    public void setClassId(Long classId)
    {
        this.classId = classId;
    }

    public Long getClassId()
    {
        return classId;
    }
    public void setClassName(String className)
    {
        this.className = className;
    }

    public String getClassName()
    {
        return className;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("classId", getClassId())
            .append("className", getClassName())
            .toString();
    }
}

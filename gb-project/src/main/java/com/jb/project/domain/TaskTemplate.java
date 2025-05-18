package com.jb.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 模板管理对象 task_template
 *
 * @author ruoyi
 * @date 2022-03-12
 */
public class TaskTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 模板id */
    private Long templateId;

    /** 模板名称 */
    @Excel(name = "模板名称")
    private String templateName;

    /** 模板存储路径 */
    @Excel(name = "模板存储路径")
    private String templatePath;

    public void setTemplateId(Long templateId)
    {
        this.templateId = templateId;
    }

    public Long getTemplateId()
    {
        return templateId;
    }
    public void setTemplateName(String templateName)
    {
        this.templateName = templateName;
    }

    public String getTemplateName()
    {
        return templateName;
    }
    public void setTemplatePath(String templatePath)
    {
        this.templatePath = templatePath;
    }

    public String getTemplatePath()
    {
        return templatePath;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("templateId", getTemplateId())
            .append("templateName", getTemplateName())
            .append("templatePath", getTemplatePath())
            .toString();
    }
}

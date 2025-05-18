package com.jb.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 用户私有模板对象 expert_template
 *
 * @author ruoyi
 * @date 2022-04-26
 */
public class ExpertTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 模板id */
    private Long templateId;

    /** 所属用户id */
    @Excel(name = "所属用户id")
    private Long userId;

    /** 模板文件存储路径 */
    @Excel(name = "模板文件存储路径")
    private String templatePath;

    /** 模板文件名称 */
    @Excel(name = "模板文件名称")
    private String templateName;

    public void setTemplateId(Long templateId)
    {
        this.templateId = templateId;
    }

    public Long getTemplateId()
    {
        return templateId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setTemplatePath(String templatePath)
    {
        this.templatePath = templatePath;
    }

    public String getTemplatePath()
    {
        return templatePath;
    }
    public void setTemplateName(String templateName)
    {
        this.templateName = templateName;
    }

    public String getTemplateName()
    {
        return templateName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("templateId", getTemplateId())
            .append("userId", getUserId())
            .append("templatePath", getTemplatePath())
            .append("templateName", getTemplateName())
            .toString();
    }
}

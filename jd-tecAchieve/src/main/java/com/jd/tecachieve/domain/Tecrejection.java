package com.jd.tecachieve.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 tec_rejection
 * 
 * @author ruoyi
 * @date 2023-10-25
 */
public class Tecrejection extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long rejectionId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long achievementId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String rejectionInfo;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Date rejectionDate;

    public void setRejectionId(Long rejectionId) 
    {
        this.rejectionId = rejectionId;
    }

    public Long getRejectionId() 
    {
        return rejectionId;
    }
    public void setAchievementId(Long achievementId) 
    {
        this.achievementId = achievementId;
    }

    public Long getAchievementId() 
    {
        return achievementId;
    }
    public void setRejectionInfo(String rejectionInfo) 
    {
        this.rejectionInfo = rejectionInfo;
    }

    public String getRejectionInfo() 
    {
        return rejectionInfo;
    }
    public void setRejectionDate(Date rejectionDate) 
    {
        this.rejectionDate = rejectionDate;
    }

    public Date getRejectionDate() 
    {
        return rejectionDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("rejectionId", getRejectionId())
            .append("achievementId", getAchievementId())
            .append("rejectionInfo", getRejectionInfo())
            .append("rejectionDate", getRejectionDate())
            .toString();
    }
}

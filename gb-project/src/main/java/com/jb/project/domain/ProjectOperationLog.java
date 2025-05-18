package com.jb.project.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 项目管理操作日志对象 project_operation_log
 *
 * @author ruoyi
 * @date 2022-04-30
 */
public class ProjectOperationLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 操作日志id */
    private Long logId;

    /** 操作用户 */
    @Excel(name = "操作用户")
    private Long operUserId;

    /** 被操作用户 */
    @Excel(name = "被操作用户")
    private Long operSubjectId;

    /** 操作时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "操作时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date operTime;

    /** 操作所属界面 */
    @Excel(name = "操作所属界面")
    private String operPage;

    public void setLogId(Long logId)
    {
        this.logId = logId;
    }

    public Long getLogId()
    {
        return logId;
    }
    public void setOperUserId(Long operUserId)
    {
        this.operUserId = operUserId;
    }

    public Long getOperUserId()
    {
        return operUserId;
    }
    public void setOperSubjectId(Long operSubjectId)
    {
        this.operSubjectId = operSubjectId;
    }

    public Long getOperSubjectId()
    {
        return operSubjectId;
    }
    public void setOperTime(Date operTime)
    {
        this.operTime = operTime;
    }

    public Date getOperTime()
    {
        return operTime;
    }
    public void setOperPage(String operPage)
    {
        this.operPage = operPage;
    }

    public String getOperPage()
    {
        return operPage;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("logId", getLogId())
            .append("operUserId", getOperUserId())
            .append("operSubjectId", getOperSubjectId())
            .append("operTime", getOperTime())
            .append("remark", getRemark())
            .append("operPage", getOperPage())
            .toString();
    }
}

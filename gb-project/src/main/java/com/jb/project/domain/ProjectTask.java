package com.jb.project.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 任务管理对象 project_task
 *
 * @author ruoyi
 * @date 2022-03-12
 */
public class ProjectTask extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 任务id */
    private Long taskId;

    /** 任务名称 */
    @Excel(name = "任务名称")
    private String taskName;

    /** 任务类型 */
    @Excel(name = "任务类型",readConverterExp = "0=任务书,1=评价")
    private Long taskType;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date finishTime;

    /** 任务信息 */
    @Excel(name = "任务信息")
    private String taskInfo;

    /** 项目id */
    @Excel(name = "项目id")
    private Long projectId;

    private String projectName;

    /** 任务状态 */
    @Excel(name = "任务状态",readConverterExp = "0=任务待办,1=任务待审核,2=任务驳回,3=已评价")
    private Long taskStatus;

    /** 模板id */
    @Excel(name = "模板id")
    private Long templateId;

    private String templatePath;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    private String userName;

    public void setTaskId(Long taskId)
    {
        this.taskId = taskId;
    }

    public Long getTaskId()
    {
        return taskId;
    }
    public void setTaskName(String taskName)
    {
        this.taskName = taskName;
    }

    public String getTaskName()
    {
        return taskName;
    }
    public void setTaskType(Long taskType)
    {
        this.taskType = taskType;
    }

    public Long getTaskType()
    {
        return taskType;
    }
    public void setFinishTime(Date finishTime)
    {
        this.finishTime = finishTime;
    }

    public Date getFinishTime()
    {
        return finishTime;
    }
    public void setTaskInfo(String taskInfo)
    {
        this.taskInfo = taskInfo;
    }

    public String getTaskInfo()
    {
        return taskInfo;
    }
    public void setProjectId(Long projectId)
    {
        this.projectId = projectId;
    }

    public Long getProjectId()
    {
        return projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public void setTaskStatus(Long taskStatus)
    {
        this.taskStatus = taskStatus;
    }

    public Long getTaskStatus()
    {
        return taskStatus;
    }
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

    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getTemplatePath() {
        return templatePath;
    }

    public void setTemplatePath(String templatePath) {
        this.templatePath = templatePath;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("taskId", getTaskId())
            .append("taskName", getTaskName())
            .append("taskType", getTaskType())
            .append("createTime", getCreateTime())
            .append("finishTime", getFinishTime())
            .append("taskInfo", getTaskInfo())
            .append("projectId", getProjectId())
            .append("projectName",getProjectName())
            .append("taskStatus", getTaskStatus())
            .append("templateId", getTemplateId())
            .append("userId", getUserId())
            .toString();
    }
}

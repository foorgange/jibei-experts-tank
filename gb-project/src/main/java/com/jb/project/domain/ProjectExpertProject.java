package com.jb.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 项目用户关联管理对象 project_expert_project
 *
 * @author ruoyi
 * @date 2022-03-12
 */
public class ProjectExpertProject extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 用户项目关联id */
    private Long projectUserId;

    /** 项目id */
    @Excel(name = "项目id")
    private Long projectId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 任务状态 */
    @Excel(name = "任务状态")
    private Long projectTaskStatus;

    /** 任务类型 */
    @Excel(name = "任务类型")
    private Long taskType;

    public void setProjectUserId(Long projectUserId)
    {
        this.projectUserId = projectUserId;
    }

    public Long getProjectUserId()
    {
        return projectUserId;
    }
    public void setProjectId(Long projectId)
    {
        this.projectId = projectId;
    }

    public Long getProjectId()
    {
        return projectId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setProjectTaskStatus(Long projectTaskStatus)
    {
        this.projectTaskStatus = projectTaskStatus;
    }

    public Long getProjectTaskStatus()
    {
        return projectTaskStatus;
    }
    public void setTaskType(Long taskType)
    {
        this.taskType = taskType;
    }

    public Long getTaskType()
    {
        return taskType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("projectUserId", getProjectUserId())
            .append("projectId", getProjectId())
            .append("userId", getUserId())
            .append("projectTaskStatus", getProjectTaskStatus())
            .append("taskType", getTaskType())
            .toString();
    }
}

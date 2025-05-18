package com.jb.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 自评互评任务对象 project_check_task
 *
 * @author ruoyi
 * @date 2022-03-12
 */
public class ProjectCheckTask extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 自评互评任务id */
    private Long checkTaskId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;


    /** 项目id */
    @Excel(name = "项目id")
    private Long projectId;

    /** 被评价客体id */
    @Excel(name = "被评价客体id")
    private Long subjectId;

    @Excel(name = "客体姓名")
    private String subjectName;

    /** 指标1 */
    @Excel(name = "指标1")
    private Long indicator1;

    /** 指标2 */
    @Excel(name = "指标2")
    private Long indicator2;

    /** 指标3 */
    @Excel(name = "指标3")
    private Long indicator3;

    /** 指标4 */
    @Excel(name = "指标4")
    private Long indicator4;

    /** 指标5 */
    @Excel(name = "指标5")
    private Long indicator5;

    /** 指标6 */
    @Excel(name = "指标6")
    private Long indicator6;

    /** 任务id */
    @Excel(name = "任务id")
    private Long taskId;

    public void setCheckTaskId(Long checkTaskId)
    {
        this.checkTaskId = checkTaskId;
    }

    public Long getCheckTaskId()
    {
        return checkTaskId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setProjectId(Long projectId)
    {
        this.projectId = projectId;
    }

    public Long getProjectId()
    {
        return projectId;
    }
    public void setSubjectId(Long subjectId)
    {
        this.subjectId = subjectId;
    }

    public Long getSubjectId()
    {
        return subjectId;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public void setIndicator1(Long indicator1)
    {
        this.indicator1 = indicator1;
    }

    public Long getIndicator1()
    {
        return indicator1;
    }
    public void setIndicator2(Long indicator2)
    {
        this.indicator2 = indicator2;
    }

    public Long getIndicator2()
    {
        return indicator2;
    }
    public void setIndicator3(Long indicator3)
    {
        this.indicator3 = indicator3;
    }

    public Long getIndicator3()
    {
        return indicator3;
    }
    public void setIndicator4(Long indicator4)
    {
        this.indicator4 = indicator4;
    }

    public Long getIndicator4()
    {
        return indicator4;
    }
    public void setIndicator5(Long indicator5)
    {
        this.indicator5 = indicator5;
    }

    public Long getIndicator5()
    {
        return indicator5;
    }
    public void setIndicator6(Long indicator6)
    {
        this.indicator6 = indicator6;
    }

    public Long getIndicator6()
    {
        return indicator6;
    }
    public void setTaskId(Long taskId)
    {
        this.taskId = taskId;
    }

    public Long getTaskId()
    {
        return taskId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("checkTaskId", getCheckTaskId())
            .append("userId", getUserId())
            .append("projectId", getProjectId())
            .append("subjectId", getSubjectId())
            .append("indicator1", getIndicator1())
            .append("indicator2", getIndicator2())
            .append("indicator3", getIndicator3())
            .append("indicator4", getIndicator4())
            .append("indicator5", getIndicator5())
            .append("indicator6", getIndicator6())
            .append("taskId", getTaskId())
            .toString();
    }
}

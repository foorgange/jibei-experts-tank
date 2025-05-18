package com.jb.project.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 制定任务书任务对象 project_book_task
 *
 * @author ruoyi
 * @date 2022-03-12
 */
public class ProjectBookTask extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 制定任务书任务id */
    private Long bookTaskId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 提交任务书名称 */
    @Excel(name = "提交任务书名称")
    private String bookName;

    /** 任务书存储路径 */
    @Excel(name = "任务书存储路径")
    private String bookPath;

    /** 任务id */
    @Excel(name = "任务id")
    private Long taskId;

    public void setBookTaskId(Long bookTaskId)
    {
        this.bookTaskId = bookTaskId;
    }

    public Long getBookTaskId()
    {
        return bookTaskId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setBookName(String bookName)
    {
        this.bookName = bookName;
    }

    public String getBookName()
    {
        return bookName;
    }
    public void setBookPath(String bookPath)
    {
        this.bookPath = bookPath;
    }

    public String getBookPath()
    {
        return bookPath;
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
            .append("bookTaskId", getBookTaskId())
            .append("userId", getUserId())
            .append("bookName", getBookName())
            .append("bookPath", getBookPath())
            .append("taskId", getTaskId())
            .toString();
    }
}

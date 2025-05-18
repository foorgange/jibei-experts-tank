package com.jb.expert.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 申请记录对象 project_user_apply
 *
 * @author ruoyi
 * @date 2022-02-21
 */
public class ProjectUserApply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 申请id */
    private Long applyId;

    /** 专家姓名 */
    @Excel(name = "专家姓名")
    private String userId;

    /** 审核员姓名 */
    @Excel(name = "审核员姓名")
    private String examineUserName;

    /** 审核员id*/
    private Long examineUserId;

    /** 审核时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date examineTime;

    /** 申请时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "申请时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /** 审核状态 */
    @Excel(name = "审核状态",readConverterExp = "0=审核未通过,1=审核通过")
    private Long examineStatus;

    /** 审核备注 */
    @Excel(name = "审核备注")
    private String examineRemark;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public void setApplyId(Long applyId)
    {
        this.applyId = applyId;
    }

    public Long getApplyId()
    {
        return applyId;
    }
    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getUserId()
    {
        return userId;
    }
    public void setExamineUserId(Long examineUserId)
    {
        this.examineUserId = examineUserId;
    }

    public Long getExamineUserId()
    {
        return examineUserId;
    }
    public void setExamineTime(Date examineTime)
    {
        this.examineTime = examineTime;
    }

    public Date getExamineTime()
    {
        return examineTime;
    }
    public void setExamineStatus(Long examineStatus)
    {
        this.examineStatus = examineStatus;
    }

    public Long getExamineStatus()
    {
        return examineStatus;
    }
    public void setExamineRemark(String examineRemark)
    {
        this.examineRemark = examineRemark;
    }

    public String getExamineRemark()
    {
        return examineRemark;
    }

    public String getExamineUserName() {
        return examineUserName;
    }

    public void setExamineUserName(String examineUserName) {
        this.examineUserName = examineUserName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("applyId", getApplyId())
            .append("userId", getUserId())
            .append("examineUserId", getExamineUserId())
            .append("examineUserName",getExamineUserName())
            .append("createTime", getCreateTime())
            .append("examineTime", getExamineTime())
            .append("examineStatus", getExamineStatus())
            .append("examineRemark", getExamineRemark())
            .toString();
    }
}

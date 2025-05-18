package com.jb.project.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 项目列表对象 project
 *
 * @author ruoyi
 * @date 2022-03-12
 */
public class Project extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 项目id */
    private Long projectId;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String projectName;

    /** 项目内容 */
    @Excel(name = "项目内容")
    private String projectContent;

    /** 高级人数 */
    @Excel(name = "高级人数")
    private Long seniorNum;

    /** 中级人数 */
    @Excel(name = "中级人数")
    private Long middleNum;

    /** 初级人数 */
    @Excel(name = "初级人数")
    private Long primaryNum;

    /** 业主 */
    @Excel(name = "业主")
    private String owner;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date finishTime;

    /** 建项人 */
    @Excel(name = "建项人")
    private String createUserName;

    private Long createUserId;

    /** 经理 */
    @Excel(name = "经理")
    private String manageUser;

    /** 项目状态 */
    @Excel(name = "项目状态",readConverterExp = "0=待审核,1=审核失败,2=团队组建中,3=组建完成,4=项目执行中,5=项目结束")
    private Long projectStatus;

    /** 抽取状态 */
    @Excel(name = "抽取状态",readConverterExp = "0=无抽取,1=抽取中,2=已抽取")
    private Long extractionStatus;


    public void setProjectId(Long projectId)
    {
        this.projectId = projectId;
    }

    public Long getProjectId()
    {
        return projectId;
    }
    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }

    public String getProjectName()
    {
        return projectName;
    }
    public void setProjectContent(String projectContent)
    {
        this.projectContent = projectContent;
    }

    public String getProjectContent()
    {
        return projectContent;
    }
    public void setSeniorNum(Long seniorNum)
    {
        this.seniorNum = seniorNum;
    }

    public Long getSeniorNum()
    {
        return seniorNum;
    }
    public void setMiddleNum(Long middleNum)
    {
        this.middleNum = middleNum;
    }

    public Long getMiddleNum()
    {
        return middleNum;
    }
    public void setPrimaryNum(Long primaryNum)
    {
        this.primaryNum = primaryNum;
    }

    public Long getPrimaryNum()
    {
        return primaryNum;
    }
    public void setOwner(String owner)
    {
        this.owner = owner;
    }

    public String getOwner()
    {
        return owner;
    }
    public void setFinishTime(Date finishTime)
    {
        this.finishTime = finishTime;
    }

    public Date getFinishTime()
    {
        return finishTime;
    }

    public String getCreateUserName() {
        return createUserName;
    }

    public void setCreateUserName(String createUserName) {
        this.createUserName = createUserName;
    }

    public void setCreateUserId(Long createUserId)
    {
        this.createUserId = createUserId;
    }

    public Long getCreateUserId()
    {
        return createUserId;
    }
    public void setManageUser(String manageUser)
    {
        this.manageUser = manageUser;
    }

    public String getManageUser()
    {
        return manageUser;
    }
    public void setProjectStatus(Long projectStatus)
    {
        this.projectStatus = projectStatus;
    }

    public Long getProjectStatus()
    {
        return projectStatus;
    }
    public void setExtractionStatus(Long extractionStatus)
    {
        this.extractionStatus = extractionStatus;
    }

    public Long getExtractionStatus()
    {
        return extractionStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("projectId", getProjectId())
            .append("projectName", getProjectName())
            .append("projectContent", getProjectContent())
            .append("seniorNum", getSeniorNum())
            .append("middleNum", getMiddleNum())
            .append("primaryNum", getPrimaryNum())
            .append("owner", getOwner())
            .append("createTime", getCreateTime())
            .append("finishTime", getFinishTime())
            .append("createUserId", getCreateUserId())
            .append("manageUser", getManageUser())
            .append("projectStatus", getProjectStatus())
            .append("extractionStatus", getExtractionStatus())
            .toString();
    }
}

package com.jd.tecachieve.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 团队成员增删改查对象 tec_team
 *
 * @author lzz
 * @date 2023-09-12
 */
public class Tecteam extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 团队id */
    @Excel(name = "团队id")
    private Long teamId;

    /** 团队成员工号 */
    @Excel(name = "团队成员工号")
    private String teamStaffId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String teamName;

    /** 性别 */
    @Excel(name = "性别")
    private String teamSex;

    /** 成员电话 */
    @Excel(name = "成员电话")
    private String teamPhone;

    /** 成员邮箱 */
    @Excel(name = "成员邮箱")
    private String teamEmail;

    /** 出生日期 */
    @Excel(name = "出生日期")
    private String teamBirthday;

    /** 职务 */
    @Excel(name = "职务")
    private String teamJobTitle;

    /** 通讯地址 */
    @Excel(name = "通讯地址")
    private String teamCommAddress;

    /** 工作单位 */
    @Excel(name = "工作单位")
    private String teamJobAddress;

    public Long getTeamId()
    {
        return teamId;
    }
    public void setTeamId(Long teamId)
    {
        this.teamId = teamId;
    }

    public String getTeamStaffId() {
        return teamStaffId;
    }
    public void setTeamStaffId(String teamStaffId) { this.teamStaffId = teamStaffId; }

    public String getTeamName()
    {
        return teamName;
    }
    public void setTeamName(String teamName)
    {
        this.teamName = teamName;
    }

    public String getTeamSex()
    {
        return teamSex;
    }
    public void setTeamSex(String teamSex)
    {
        this.teamSex = teamSex;
    }

    public String getTeamPhone() { return teamPhone; }
    public void setTeamPhone(String teamPhone) {
        this.teamPhone = teamPhone;
    }

    public String getTeamEmail() {
        return teamEmail;
    }
    public void setTeamEmail(String teamEmail) {
        this.teamEmail = teamEmail;
    }

    public String getTeamBirthday() {
        return teamBirthday;
    }

    public void setTeamBirthday(String teamBirthday) {
        this.teamBirthday = teamBirthday;
    }

    public String getTeamJobTitle()
    {
        return teamJobTitle;
    }
    public void setTeamJobTitle(String teamJobTitle) {this.teamJobTitle = teamJobTitle;}

    public String getTeamCommAddress() {
        return teamCommAddress;
    }
    public void setTeamCommAddress(String teamCommAddress) {
        this.teamCommAddress = teamCommAddress;
    }

    public String getTeamJobAddress()
    {
        return teamJobAddress;
    }
    public void setTeamJobAddress(String teamJobAddress)
    {
        this.teamJobAddress = teamJobAddress;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("teamId", getTeamId())
            .append("teamStaffId",getTeamStaffId())
            .append("teamName", getTeamName())
            .append("teamSex", getTeamSex())
            .append("teamPhone", getTeamPhone())
            .append("teamEmail", getTeamEmail())
            .append("teamBirthday", getTeamBirthday())
            .append("teamJobTitle", getTeamJobTitle())
            .append("teamCommAddress", getTeamCommAddress())
            .append("teamJobAddress", getTeamJobAddress())
            .toString();
    }
}

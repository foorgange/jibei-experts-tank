package com.jd.tecachieve.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.springframework.stereotype.Component;

/**
 * 成果负责人增删改查对象 tec_pi
 *
 * @author lzz
 * @date 2023-09-22
 */

public class Tecpi extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 成果负责人id */
    private Long piId;

    /** 姓名 */
    @Excel(name = "工号")
    private String piStaffId;

    /** 姓名 */
    @Excel(name = "姓名")
    private String piName;

    /** 性别 */
    @Excel(name = "性别")
    private String piSex;

    /** 所属学院 */
    @Excel(name = "所属学院")
    private String piCollege;

    /** 职称 */
    @Excel(name = "职称")
    private String piJobTitle;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String piEmail;

    /** 电话 */
    @Excel(name = "电话")
    private String piPhone;

    /** 通讯地址 */
    @Excel(name = "通讯地址")
    private String piCommAddress;

    /** 简介 */
    @Excel(name = "简介")
    private String piInformation;

    /** 图片 */
    @Excel(name = "图片")
    private String piImg;

    public Long getPiId()
    {
        return piId;
    }
    public void setPiId(Long piId)
    {
        this.piId = piId;
    }

    public String getPiStaffId() {
        return piStaffId;
    }
    public void setPiStaffId(String piStaffId) {
        this.piStaffId = piStaffId;
    }

    public String getPiName()
    {
        return piName;
    }
    public void setPiName(String piName)
    {
        this.piName = piName;
    }

    public String getPiSex()
    {
        return piSex;
    }
    public void setPiSex(String piSex)
    {
        this.piSex = piSex;
    }

    public String getPiCollege()
    {
        return piCollege;
    }
    public void setPiCollege(String piCollege)
    {
        this.piCollege = piCollege;
    }

    public String getPiJobTitle()
    {
        return piJobTitle;
    }
    public void setPiJobTitle(String piJobTitle)
    {
        this.piJobTitle = piJobTitle;
    }

    public String getPiEmail()
    {
        return piEmail;
    }
    public void setPiEmail(String piEmail)
    {
        this.piEmail = piEmail;
    }

    public String getPiPhone() {return piPhone; }
    public void setPiPhone(String piPhone)
    {
        this.piPhone = piPhone;
    }

    public String getPiCommAddress() { return piCommAddress; }
    public void setPiCommAddress(String piCommAddress)
    {
        this.piCommAddress = piCommAddress;
    }

    public String getPiInformation() { return piInformation; }
    public void setPiInformation(String piInformation)
    {
        this.piInformation = piInformation;
    }

    public String getPiImg() {
        return piImg;
    }
    public void setPiImg(String piImg) {
        this.piImg = piImg;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("piId", getPiId())
            .append("piStaffId",getPiStaffId())
            .append("piName", getPiName())
            .append("piSex", getPiSex())
            .append("piCollege", getPiCollege())
            .append("piJobTitle", getPiJobTitle())
            .append("piEmail", getPiEmail())
            .append("piPhone", getPiPhone())
            .append("piCommAddress", getPiCommAddress())
            .append("piInformation", getPiInformation())
            .append("piImg", getPiImg())
            .toString();
    }
}

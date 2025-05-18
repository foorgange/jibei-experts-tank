package com.jd.tecachieve.domain;




import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;


public class Patent extends BaseEntity {

    private Long id; // 主键ID


    private String publicationNumber; // 公开号


    private String applicationNumber; // 申请号


    private Date applicationDate; // 申请日


    private String patentName; // 发明名称


    private String abstractText; // 摘要


    private String mainClaim; // 主权力要求


    private String agency; // 代理机构名称


    private String inventors; // 发明人，多个发明人用分号分隔


    private String applicants; // 申请人，多个申请人用分号分隔


    private String applicantCountry; // 申请人所在国家/地区/组织


    private String publicationDate; // 公开日期


    private String ipcClass; // IPC分类（公开）分号分割


    private String remark; // 备注


    private Date createTime; // 创建时间


    private Date updateTime; // 更新时间

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPublicationNumber() {
        return publicationNumber;
    }

    public void setPublicationNumber(String publicationNumber) {
        this.publicationNumber = publicationNumber;
    }

    public String getApplicationNumber() {
        return applicationNumber;
    }

    public void setApplicationNumber(String applicationNumber) {
        this.applicationNumber = applicationNumber;
    }

    public Date getApplicationDate() {
        return applicationDate;
    }

    public void setApplicationDate(Date applicationDate) {
        this.applicationDate = applicationDate;
    }

    public String getPatentName() {
        return patentName;
    }

    public void setPatentName(String patentName) {
        this.patentName = patentName;
    }

    public String getAbstractText() {
        return abstractText;
    }

    public void setAbstractText(String abstractText) {
        this.abstractText = abstractText;
    }

    public String getMainClaim() {
        return mainClaim;
    }

    public void setMainClaim(String mainClaim) {
        this.mainClaim = mainClaim;
    }

    public String getAgency() {
        return agency;
    }

    public void setAgency(String agency) {
        this.agency = agency;
    }

    public String getInventors() {
        return inventors;
    }

    public void setInventors(String inventors) {
        this.inventors = inventors;
    }

    public String getApplicants() {
        return applicants;
    }

    public void setApplicants(String applicants) {
        this.applicants = applicants;
    }

    public String getApplicantCountry() {
        return applicantCountry;
    }

    public void setApplicantCountry(String applicantCountry) {
        this.applicantCountry = applicantCountry;
    }

    public String getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(String publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getIpcClass() {
        return ipcClass;
    }

    public void setIpcClass(String ipcClass) {
        this.ipcClass = ipcClass;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdatedTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return "Patent{" +
                "id=" + id +
                ", publicationNumber='" + publicationNumber + '\'' +
                ", applicationNumber='" + applicationNumber + '\'' +
                ", applicationDate=" + applicationDate +
                ", patentName='" + patentName + '\'' +
                ", abstractText='" + abstractText + '\'' +
                ", mainClaim='" + mainClaim + '\'' +
                ", agency='" + agency + '\'' +
                ", inventors='" + inventors + '\'' +
                ", applicants='" + applicants + '\'' +
                ", applicantCountry='" + applicantCountry + '\'' +
                ", publicationDate=" + publicationDate +
                ", ipcClass='" + ipcClass + '\'' +
                ", remark='" + remark + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}

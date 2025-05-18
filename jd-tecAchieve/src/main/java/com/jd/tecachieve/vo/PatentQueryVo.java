package com.jd.tecachieve.vo;

public class PatentQueryVo {

    // 查询条件字段
    private String publicationNumber;
    private String applicationNumber;
    private String patentName;
    private String agency;
    private String inventors;
    private String applicants;
    private String applicantCountry;
    private String ipcClass;
    private String remark;

    // 默认构造函数
    public PatentQueryVo() {
    }

    // 带参数的构造函数（可选）
    public PatentQueryVo(String publicationNumber, String applicationNumber, String patentName,
                         String agency, String inventors, String applicants, String applicantCountry,
                         String ipcClass, String remark) {
        this.publicationNumber = publicationNumber;
        this.applicationNumber = applicationNumber;
        this.patentName = patentName;
        this.agency = agency;
        this.inventors = inventors;
        this.applicants = applicants;
        this.applicantCountry = applicantCountry;
        this.ipcClass = ipcClass;
        this.remark = remark;
    }

    // Getter 和 Setter 方法
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

    public String getPatentName() {
        return patentName;
    }

    public void setPatentName(String patentName) {
        this.patentName = patentName;
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

    // 可选：重写toString方法以便于调试
    @Override
    public String toString() {
        return "PatentQueryVo{" +
                "publicationNumber='" + publicationNumber + '\'' +
                ", applicationNumber='" + applicationNumber + '\'' +
                ", patentName='" + patentName + '\'' +
                ", agency='" + agency + '\'' +
                ", inventors='" + inventors + '\'' +
                ", applicants='" + applicants + '\'' +
                ", applicantCountry='" + applicantCountry + '\'' +
                ", ipcClass='" + ipcClass + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}

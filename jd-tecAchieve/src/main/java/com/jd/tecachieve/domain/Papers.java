package com.jd.tecachieve.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class Papers extends BaseEntity {

    // Fields corresponding to the columns in the papers table
    private String supervisorName; // 导师名称
    private String paperTitle; // 论文题目
    private String author; // 作者
    private String publicationVenue; // 发表期刊/会议
    private String volumeIssuePages; // 卷期号，页码
    private Integer publishYear; // 发表年份
    private String isCorrespondingFirstAuthor; // 是否通讯/一作
    private String eiSci; // EI/SCI
    private String remarks; // 备注（中科院分区或者CCF分类）
    private String instituteOfSupervisor; // 导师所在研究所

    private Integer id; // 推荐使用包装类型，避免默认值问题



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    // Constructors
    public Papers() {
        // Default constructor
    }

    // Getters and Setters
    public String getSupervisorName() {
        return supervisorName;
    }

    public void setSupervisorName(String supervisorName) {
        this.supervisorName = supervisorName;
    }

    public String getPaperTitle() {
        return paperTitle;
    }

    public void setPaperTitle(String paperTitle) {
        this.paperTitle = paperTitle;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublicationVenue() {
        return publicationVenue;
    }

    public void setPublicationVenue(String publicationVenue) {
        this.publicationVenue = publicationVenue;
    }

    public String getVolumeIssuePages() {
        return volumeIssuePages;
    }

    public void setVolumeIssuePages(String volumeIssuePages) {
        this.volumeIssuePages = volumeIssuePages;
    }

    public Integer getPublishYear() {
        return publishYear;
    }

    public void setPublishYear(Integer publishYear) {
        this.publishYear = publishYear;
    }

    public String getIsCorrespondingFirstAuthor() {
        return isCorrespondingFirstAuthor;
    }

    public void setIsCorrespondingFirstAuthor(String isCorrespondingFirstAuthor) {
        this.isCorrespondingFirstAuthor = isCorrespondingFirstAuthor;
    }

    public String getEiSci() {
        return eiSci;
    }

    public void setEiSci(String eiSci) {
        this.eiSci = eiSci;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public String getInstituteOfSupervisor() {
        return instituteOfSupervisor;
    }

    public void setInstituteOfSupervisor(String instituteOfSupervisor) {
        this.instituteOfSupervisor = instituteOfSupervisor;
    }
}
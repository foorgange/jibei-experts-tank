package com.jd.tecachieve.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class PatentTotal extends BaseEntity {

    private Integer id;

    private Integer transfers; // 专利转让

    private Integer licenses; // 专利许可

    private Integer pledges; // 专利质押

    private Integer grade_a; // 等级A

    private Integer grade_b; // 等级B

    private Integer grade_c; // 等级C

    private Integer grade_d; // 等级D

    private Integer grade_e; // 等级E

    private Integer year; // 新增字段

    private Integer applications; // 总申请数

    private Integer authorizedCounts; // 授权数

    private Integer publishedCounts; // 公开总数

    public Integer getApplications() {
        return applications;
    }

    public void setApplications(Integer applications) {
        this.applications = applications;
    }

    public Integer getAuthorizedCounts() {
        return authorizedCounts;
    }

    public void setAuthorizedCounts(Integer authorizedCounts) {
        this.authorizedCounts = authorizedCounts;
    }

    public Integer getPublishedCounts() {
        return publishedCounts;
    }

    public void setPublishedCounts(Integer publishedCounts) {
        this.publishedCounts = publishedCounts;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTransfers() {
        return transfers;
    }

    public void setTransfers(Integer transfers) {
        this.transfers = transfers;
    }

    public Integer getLicenses() {
        return licenses;
    }

    public void setLicenses(Integer licenses) {
        this.licenses = licenses;
    }

    public Integer getPledges() {
        return pledges;
    }

    public void setPledges(Integer pledges) {
        this.pledges = pledges;
    }

    public Integer getGrade_a() {
        return grade_a;
    }

    public void setGrade_a(Integer grade_a) {
        this.grade_a = grade_a;
    }

    public Integer getGrade_b() {
        return grade_b;
    }

    public void setGrade_b(Integer grade_b) {
        this.grade_b = grade_b;
    }

    public Integer getGrade_c() {
        return grade_c;
    }

    public void setGrade_c(Integer grade_c) {
        this.grade_c = grade_c;
    }

    public Integer getGrade_d() {
        return grade_d;
    }

    public void setGrade_d(Integer grade_d) {
        this.grade_d = grade_d;
    }

    public Integer getGrade_e() {
        return grade_e;
    }

    public void setGrade_e(Integer grade_e) {
        this.grade_e = grade_e;
    }

    @Override
    public String toString() {
        return "PatentTotal{" +
                "id=" + id +
                ", transfers=" + transfers +
                ", licenses=" + licenses +
                ", pledges=" + pledges +
                ", grade_a=" + grade_a +
                ", grade_b=" + grade_b +
                ", grade_c=" + grade_c +
                ", grade_d=" + grade_d +
                ", grade_e=" + grade_e +
                ", year=" + year +
                '}';
    }
}

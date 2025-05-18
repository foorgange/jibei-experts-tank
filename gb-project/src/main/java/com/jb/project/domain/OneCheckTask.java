package com.jb.project.domain;

import com.ruoyi.common.core.domain.BaseEntity;


public class OneCheckTask extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /** 项目名称 */
    private String projectName;

    /** 评价专家 */
    private String userName;

    /** 被评价专家 */
    private String subjectName;

    /** 指标1 */
    private Long indicator1;

    /** 指标2 */
    private Long indicator2;

    /** 指标3 */
    private Long indicator3;

    /** 指标4 */
    private Long indicator4;

    /** 指标5 */
    private Long indicator5;

    /** 指标6 */
    private Long indicator6;


    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public Long getIndicator1() {
        return indicator1;
    }

    public void setIndicator1(Long indicator1) {
        this.indicator1 = indicator1;
    }

    public Long getIndicator2() {
        return indicator2;
    }

    public void setIndicator2(Long indicator2) {
        this.indicator2 = indicator2;
    }

    public Long getIndicator3() {
        return indicator3;
    }

    public void setIndicator3(Long indicator3) {
        this.indicator3 = indicator3;
    }

    public Long getIndicator4() {
        return indicator4;
    }

    public void setIndicator4(Long indicator4) {
        this.indicator4 = indicator4;
    }

    public Long getIndicator5() {
        return indicator5;
    }

    public void setIndicator5(Long indicator5) {
        this.indicator5 = indicator5;
    }

    public Long getIndicator6() {
        return indicator6;
    }

    public void setIndicator6(Long indicator6) {
        this.indicator6 = indicator6;
    }

    @Override
    public String toString() {
        return "OneCheckTask{" +
                "projectName='" + projectName + '\'' +
                ", userName='" + userName + '\'' +
                ", subjectName='" + subjectName + '\'' +
                ", indicator1=" + indicator1 +
                ", indicator2=" + indicator2 +
                ", indicator3=" + indicator3 +
                ", indicator4=" + indicator4 +
                ", indicator5=" + indicator5 +
                ", indicator6=" + indicator6 +
                '}';
    }
}

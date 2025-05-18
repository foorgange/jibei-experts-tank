package com.jb.expert.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 专家属性对象 project_experts
 *
 * @author ruoyi
 * @date 2022-02-21
 */
public class ProjectExperts extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private String examineRemark;//审核备注

    private Long examineUserId;//审核员姓名

    public String getExamineRemark() {
        return examineRemark;
    }

    public void setExamineRemark(String examineRemark) {
        this.examineRemark = examineRemark;
    }

    public Long getExamineUserId() {
        return examineUserId;
    }

    public void setExamineUserId(Long examineUserId) {
        this.examineUserId = examineUserId;
    }

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 专家姓名
     */
    @Excel(name = "专家姓名")
    private String nickName;

    /**
     * 专家邮箱
     */
    @Excel(name = "专家邮箱")
    private String email;

    /**
     * 专家联系电话
     */
    @Excel(name = "专家联系电话")
    private String phoneNumber;

    /**
     * 专家性别
     */
    @Excel(name = "专家性别",readConverterExp = "0=男,1=女")
    private char sex;

    /**
     * 专家部门id
     */
    private Long deptId;

    public Long getDeptId() {
        return deptId;
    }

    public void setDeptId(Long deptId) {
        this.deptId = deptId;
    }

    /**
     * 专家头像地址
     */
    @Excel(name = "专家头像地址")
    private String avatar;

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public char getSex() {
        return sex;
    }

    public void setSex(char sex) {
        this.sex = sex;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    /**
     * 专家部门名称
     */
    @Excel(name = "专家部门名称")
    private String deptName;

    /**
     * 专家性质
     */
    @Excel(name = "专家性质")
    private Long expertProperties;

    /**
     * 专家星级
     */
    @Excel(name = "专家星级")
    private Long expertStar;

    /**
     * 出生日期
     */
    private Date birthday;

    /**
     * 地区
     */
    private String area;

    /**
     * 城市
     */
    private String city;

    /**
     * 地址
     */
    private String address;

    /**
     * 学历
     */
    @Excel(name = "学历")
    private String education;

    /**
     * 毕业院校
     */
    private String graduateSchool;

    /**
     * 毕业时间
     */
    private Date graduateDate;

    /**
     * 身份证号
     */
    private String idNumber;

    /**
     * 审核状态
     */
    @Excel(name = "审核状态")
    private Long userStatus;

    /**
     * 工作单位
     */
    private String workPlace;

    private Date createTime;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 职位
     */
    @Excel(name = "职位")
    private Long positionId;

    /**
     * 职称
     */
    @Excel(name = "职称")
    private Long titleId;

    /**
     * 专业
     */
    @Excel(name = "专业")
    private Long majorId;

    /**
     * 专家类别一
     */
    @Excel(name = "专家类别一")
    private Long expertClassId1;

    /**
     * 专家类别二
     */
    @Excel(name = "专家类别二")
    private Long expertClassId2;

    /**
     * 专家类别三
     */
    @Excel(name = "专家类别三")
    private Long expertClassId3;

    /**
     * 传真
     */
    private String fax;

    /**
     * 邮编
     */
    private String postcodes;

    /**
     * 工程业绩
     */
    private String workPerformance;

    /**
     * 工作简历
     */
    private String workResume;

    /**
     * 主要著作
     */
    private String mainProperty;

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setExpertProperties(Long expertProperties) {
        this.expertProperties = expertProperties;
    }

    public Long getExpertProperties() {
        return expertProperties;
    }

    public void setExpertStar(Long expertStar) {
        this.expertStar = expertStar;
    }

    public Long getExpertStar() {
        return expertStar;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getArea() {
        return area;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCity() {
        return city;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getEducation() {
        return education;
    }

    public void setGraduateSchool(String graduateSchool) {
        this.graduateSchool = graduateSchool;
    }

    public String getGraduateSchool() {
        return graduateSchool;
    }

    public void setGraduateDate(Date graduateDate) {
        this.graduateDate = graduateDate;
    }

    public Date getGraduateDate() {
        return graduateDate;
    }

    public void setIdNumber(String idNumber) {
        this.idNumber = idNumber;
    }

    public String getIdNumber() {
        return idNumber;
    }

    public void setUserStatus(Long userStatus) {
        this.userStatus = userStatus;
    }

    public Long getUserStatus() {
        return userStatus;
    }

    public void setWorkPlace(String workPlace) {
        this.workPlace = workPlace;
    }

    public String getWorkPlace() {
        return workPlace;
    }

    public void setPositionId(Long positionId) {
        this.positionId = positionId;
    }

    public Long getPositionId() {
        return positionId;
    }

    public void setTitleId(Long titleId) {
        this.titleId = titleId;
    }

    public Long getTitleId() {
        return titleId;
    }

    public void setMajorId(Long majorId) {
        this.majorId = majorId;
    }

    public Long getMajorId() {
        return majorId;
    }

    public void setExpertClassId1(Long expertClassId1) {
        this.expertClassId1 = expertClassId1;
    }

    public Long getExpertClassId1() {
        return expertClassId1;
    }

    public void setExpertClassId2(Long expertClassId2) {
        this.expertClassId2 = expertClassId2;
    }

    public Long getExpertClassId2() {
        return expertClassId2;
    }

    public void setExpertClassId3(Long expertClassId3) {
        this.expertClassId3 = expertClassId3;
    }

    public Long getExpertClassId3() {
        return expertClassId3;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getFax() {
        return fax;
    }

    public void setPostcodes(String postcodes) {
        this.postcodes = postcodes;
    }

    public String getPostcodes() {
        return postcodes;
    }

    public void setWorkPerformance(String workPerformance) {
        this.workPerformance = workPerformance;
    }

    public String getWorkPerformance() {
        return workPerformance;
    }

    public void setWorkResume(String workResume) {
        this.workResume = workResume;
    }

    public String getWorkResume() {
        return workResume;
    }

    public void setMainProperty(String mainProperty) {
        this.mainProperty = mainProperty;
    }

    public String getMainProperty() {
        return mainProperty;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("userId", getUserId())
                .append("expertProperties", getExpertProperties())
                .append("expertStar", getExpertStar())
                .append("birthday", getBirthday())
                .append("area", getArea())
                .append("city", getCity())
                .append("address", getAddress())
                .append("education", getEducation())
                .append("graduateSchool", getGraduateSchool())
                .append("graduateDate", getGraduateDate())
                .append("idNumber", getIdNumber())
                .append("userStatus", getUserStatus())
                .append("workPlace", getWorkPlace())
                .append("positionId", getPositionId())
                .append("titleId", getTitleId())
                .append("majorId", getMajorId())
                .append("expertClassId1", getExpertClassId1())
                .append("expertClassId2", getExpertClassId2())
                .append("expertClassId3", getExpertClassId3())
                .append("fax", getFax())
                .append("postcodes", getPostcodes())
                .append("workPerformance", getWorkPerformance())
                .append("workResume", getWorkResume())
                .append("mainProperty", getMainProperty())
                .append("nickName", getNickName())
                .append("email", getEmail())
                .append("phoneNumber", getPhoneNumber())
                .append("sex", getSex())
                .append("avatar", getAvatar())
                .append("deptName", getDeptName())
                .append("deptId", getDeptId())
                .append("createTime",getCreateTime())
                .toString();
    }
}

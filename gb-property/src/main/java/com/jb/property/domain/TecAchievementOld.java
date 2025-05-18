package com.jb.property.domain;

import lombok.Data;

import java.sql.Date;


@Data
public class TecAchievementOld {

    private Integer achievementId;      //自增主键
    private String achievementName;     //成果名称
    private String college;             //所属学院
    private String field;               //所属领域
    private String category;            //类别
    private String contactName;         //联系人1姓名
    private String contactName2;         //联系人2姓名
    private String phoneNumber;         //联系方式1---手机号
    private String phoneNumber2;         //联系方式2---手机号
    private String email;               //联系方式---邮箱
    private String cooperationMethods;  //合作需求方式
    private String attachFileName;      //附件名称
    private Date registrationDate;      //登记日期
    private Date archiveDate;           //归档日期
    private Integer pageNumber;         //所在页码


}

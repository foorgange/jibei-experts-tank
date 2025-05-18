package com.jd.tecachieve.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * 科技成果增删改查对象 tecachievement
 *
 * @author ruoyi
 * @date 2023-09-15
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Tecachievement extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long achievementid;     //主键

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String achievementname;     //成果名称

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String field;               //所属领域

    private String fieldDeatil;         //所属领域---表格回显
    private List<String> fieldDeatilList = new ArrayList<>();         //所属领域---word导出
    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String college;             //所属学院

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String way;                 //需求合作方式

    private String wayDeatil;           //需求合作方式---表格回显
    private List<String> wayDeatilList = new ArrayList<>();           //需求合作方式---word导出
    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String typesresults;        //成果类型
    private String introductionImg;     //成果介绍图片路径
    private List<String> introductionImgBase64List = new ArrayList<>();     //成果介绍图片Base64码列表

    private String typesresultsDeatil;  //成果类型---表格回显
    private List<String> typesresultsList = new ArrayList<>();  //成果类型---word导出
    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long technologylevel;       //技术成熟度
    private String TechnologylevelText; //技术成熟度-表格回显

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long advancementleve;       //先进度
    private String advancementleveText; //先进度-表格回显
    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String introduction;        //成果介绍

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String intellectualproperty;    //知识产权情况

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String staffid;         //联系人工号

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String contactname;         //联系人姓名

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String email;               //联系人邮箱

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String phone;               //联系人电话

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String address;             //联系人地址

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String award;               //获奖情况

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String benefit;             //效益分析

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long piId;                  //成果负责人ID

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long teamId;                //团队ID


    private String background;          //研究背景与基础
    private int status;                 //成果项状态

    private long dept_id;               //成果项所属部门ID
    private String statusDeatil;        //状态---表格回显

    private Tecpi tecpi;                //成果负责人---word导出

    private List<TecVerticaltopic> tecVerticaltopicList = new ArrayList<>();    //依托课题列表

    @Excel(name = "创建时间", readConverterExp = "yyyy-MM-dd")
    private Date createTime;  // 创建时间

}

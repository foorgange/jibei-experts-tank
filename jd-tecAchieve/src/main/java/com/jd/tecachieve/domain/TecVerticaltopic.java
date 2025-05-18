package com.jd.tecachieve.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 纵向课题对象 tec_verticaltopic
 *
 * @author ruoyi
 * @date 2023-11-10
 */
public class TecVerticaltopic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long topicId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long achievementid;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String topicCode;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String topicName;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String topicCategory;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String topicSubcategory;

    public Long getTopicId() {
        return topicId;
    }

    public void setTopicId(Long topicId) {
        this.topicId = topicId;
    }

    public Long getAchievementid() {
        return achievementid;
    }

    public void setAchievementid(Long achievementid) {
        this.achievementid = achievementid;
    }

    public String getTopicCode() {
        return topicCode;
    }

    public void setTopicCode(String topicCode) {
        this.topicCode = topicCode;
    }

    public String getTopicName() {
        return topicName;
    }

    public void setTopicName(String topicName) {
        this.topicName = topicName;
    }

    public String getTopicCategory() {
        return topicCategory;
    }

    public void setTopicCategory(String topicCategory) {
        this.topicCategory = topicCategory;
    }

    public String getTopicSubcategory() {
        return topicSubcategory;
    }

    public void setTopicSubcategory(String topicSubcategory) {
        this.topicSubcategory = topicSubcategory;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("topicId", getTopicId())
            .append("achievementid", getAchievementid())
            .append("topicCode", getTopicCode())
            .append("topicName", getTopicName())
            .append("topicCategory", getTopicCategory())
            .append("topicSubcategory", getTopicSubcategory())
            .toString();
    }
}

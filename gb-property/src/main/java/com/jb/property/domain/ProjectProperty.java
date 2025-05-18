package com.jb.property.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 知识产权对象 project_property
 *
 * @author ruoyi
 * @date 2022-03-05
 */
public class ProjectProperty extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 产权id */
    private Long propertyId;

    /** 著作名称 */
    @Excel(name = "著作名称")
    private String propertyName;

    /** 项目名称 */
    @Excel(name = "项目名称")
    private String projectName;

    /** 著作类型 */
    @Excel(name = "著作类型")
    private Long propertyType;

    /** 出版社名称 */
    @Excel(name = "出版社名称")
    private String publisher;

    /** 期刊名称 */
    @Excel(name = "期刊名称")
    private String periodical;

    /** 到期时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "到期时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date finishTime;

    /** 到期状态（0未到期1到期） */
    @Excel(name = "到期状态",readConverterExp = "0=未到期,1=已到期")
    private String fareStatus;

    /** 作者 */

    private String auth;

    /*产权作者*/
//    @Excel(name = "作者")
    private List<ProjectUserProperty> propertyWorker;

    public void setPropertyId(Long propertyId)
    {
        this.propertyId = propertyId;
    }
    public Long getPropertyId()
    {
        return propertyId;
    }

    public void setPropertyName(String propertyName)
    {
        this.propertyName = propertyName;
    }
    public String getPropertyName()
    {
        return propertyName;
    }

    public void setProjectName(String projectName)
    {
        this.projectName = projectName;
    }
    public String getProjectName()
    {
        return projectName;
    }

    public void setPropertyType(Long propertyType)
    {
        this.propertyType = propertyType;
    }
    public Long getPropertyType()
    {
        return propertyType;
    }

    public void setPublisher(String publisher)
    {
        this.publisher = publisher;
    }
    public String getPublisher()
    {
        return publisher;
    }

    public void setPeriodical(String periodical)
    {
        this.periodical = periodical;
    }
    public String getPeriodical()
    {
        return periodical;
    }

    public void setFinishTime(Date finishTime)
    {
        this.finishTime = finishTime;
    }
    public Date getFinishTime()
    {
        return finishTime;
    }

    public void setFareStatus(String fareStatus)
    {
        this.fareStatus = fareStatus;
    }
    public String getFareStatus()
    {
        return fareStatus;
    }

    public void setAuth(String auth)
    {
        this.auth = auth;
    }
    public String getAuth()
    {
        return auth;
    }

    public void setPropertyWorker(List<ProjectUserProperty> propertyWorker)
    {
        this.propertyWorker = propertyWorker;
    };
    public List<ProjectUserProperty> getPropertyWorker(){
        return propertyWorker;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("propertyId", getPropertyId())
            .append("propertyName", getPropertyName())
            .append("projectName", getProjectName())
            .append("propertyType", getPropertyType())
            .append("publisher", getPublisher())
            .append("periodical", getPeriodical())
            .append("createTime", getCreateTime())
            .append("finishTime", getFinishTime())
            .append("fareStatus", getFareStatus())
            .append("auth", getAuth())
            .toString();
    }
}

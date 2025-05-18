package com.jb.expert.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 通行码管理对象 pass_code
 *
 * @author ruoyi
 * @date 2022-02-21
 */
public class PassCode extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 通行码id
     */
    private Long passCodeId;

    /**
     * 通行码
     */
    @Excel(name = "通行码")
    private Long passCodeValue;

    /**
     * 专家名称
     */
    @Excel(name = "专家名称")
    private String userName;

    private String  code;

    private String  uuid;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    /**
     * 使用时间
     */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "使用时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date useTime;

    /**
     * 通行码状态
     */
    @Excel(name = "通行码状态",readConverterExp = "0=未使用,1=已使用")
    private String codeStatus;



    public void setPassCodeId(Long passCodeId) {
        this.passCodeId = passCodeId;
    }

    public Long getPassCodeId() {
        return passCodeId;
    }

    public void setPassCodeValue(Long passCodeValue) {
        this.passCodeValue = passCodeValue;
    }

    public Long getPassCodeValue() {
        return passCodeValue;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUseTime(Date useTime) {
        this.useTime = useTime;
    }

    public Date getUseTime() {
        return useTime;
    }

    public void setCodeStatus(String codeStatus) {
        this.codeStatus = codeStatus;
    }

    public String getCodeStatus() {
        return codeStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("passCodeId", getPassCodeId())
                .append("passCodeValue", getPassCodeValue())
                .append("userName", getUserName())
                .append("createTime", getCreateTime())
                .append("useTime", getUseTime())
                .append("codeStatus", getCodeStatus())
                .append("code", getCode())
                .append("uuid", getUuid())
                .toString();
    }
}

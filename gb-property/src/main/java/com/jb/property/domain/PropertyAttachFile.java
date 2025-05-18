package com.jb.property.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 知识产权附件对象 property_attach_file
 *
 * @author ruoyi
 * @date 2022-04-30
 */
public class PropertyAttachFile extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 文件id */
    private Long fileId;

    /** 文件名 */
    @Excel(name = "文件名")
    private String fileName;

    /** 文件路径 */
    private String filePath;

    /** 所属知识产权id */
    @Excel(name = "所属知识产权id")
    private Long propertyId;

    public void setFileId(Long fileId)
    {
        this.fileId = fileId;
    }

    public Long getFileId()
    {
        return fileId;
    }
    public void setFileName(String fileName)
    {
        this.fileName = fileName;
    }

    public String getFileName()
    {
        return fileName;
    }
    public void setFilePath(String filePath)
    {
        this.filePath = filePath;
    }

    public String getFilePath()
    {
        return filePath;
    }
    public void setPropertyId(Long propertyId)
    {
        this.propertyId = propertyId;
    }

    public Long getPropertyId()
    {
        return propertyId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("fileId", getFileId())
            .append("fileName", getFileName())
            .append("filePath", getFilePath())
            .append("propertyId", getPropertyId())
            .toString();
    }
}

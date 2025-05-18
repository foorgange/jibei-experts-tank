package com.jb.property.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 科技成果附件对象 tec_attachfile
 *
 * @author ruoyi
 * @date 2023-08-17
 */
public class TecAttachfile extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Integer fileId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Integer achievementId;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String fileName;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String filePath;

    public void setFileId(Integer fileId)
    {
        this.fileId = fileId;
    }

    public Integer getFileId()
    {
        return fileId;
    }
    public void setAchievementId(Integer achievementId)
    {
        this.achievementId = achievementId;
    }

    public Integer getAchievementId()
    {
        return achievementId;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("fileId", getFileId())
            .append("achievementId", getAchievementId())
            .append("fileName", getFileName())
            .append("filePath", getFilePath())
            .toString();
    }
}

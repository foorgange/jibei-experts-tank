package com.jb.property.mapper;

import java.util.List;
import com.jb.property.domain.PropertyAttachFile;

/**
 * 知识产权附件Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-30
 */
public interface PropertyAttachFileMapper 
{
    /**
     * 查询知识产权附件
     * 
     * @param fileId 知识产权附件主键
     * @return 知识产权附件
     */
    public PropertyAttachFile selectPropertyAttachFileByFileId(Long fileId);

    /**
     * 查询知识产权附件列表
     * 
     * @param propertyAttachFile 知识产权附件
     * @return 知识产权附件集合
     */
    public List<PropertyAttachFile> selectPropertyAttachFileList(PropertyAttachFile propertyAttachFile);

    /**
     * 新增知识产权附件
     * 
     * @param propertyAttachFile 知识产权附件
     * @return 结果
     */
    public int insertPropertyAttachFile(PropertyAttachFile propertyAttachFile);

    /**
     * 修改知识产权附件
     * 
     * @param propertyAttachFile 知识产权附件
     * @return 结果
     */
    public int updatePropertyAttachFile(PropertyAttachFile propertyAttachFile);

    /**
     * 删除知识产权附件
     * 
     * @param fileId 知识产权附件主键
     * @return 结果
     */
    public int deletePropertyAttachFileByFileId(Long fileId);

    /**
     * 批量删除知识产权附件
     * 
     * @param fileIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePropertyAttachFileByFileIds(Long[] fileIds);

}

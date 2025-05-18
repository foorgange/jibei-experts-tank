package com.jb.property.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.property.mapper.PropertyAttachFileMapper;
import com.jb.property.domain.PropertyAttachFile;
import com.jb.property.service.IPropertyAttachFileService;

/**
 * 知识产权附件Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-30
 */
@Service
public class PropertyAttachFileServiceImpl implements IPropertyAttachFileService 
{
    @Autowired
    private PropertyAttachFileMapper propertyAttachFileMapper;

    /**
     * 查询知识产权附件
     * 
     * @param fileId 知识产权附件主键
     * @return 知识产权附件
     */
    @Override
    public PropertyAttachFile selectPropertyAttachFileByFileId(Long fileId)
    {
        return propertyAttachFileMapper.selectPropertyAttachFileByFileId(fileId);
    }

    /**
     * 查询知识产权附件列表
     * 
     * @param propertyAttachFile 知识产权附件
     * @return 知识产权附件
     */
    @Override
    public List<PropertyAttachFile> selectPropertyAttachFileList(PropertyAttachFile propertyAttachFile)
    {
        return propertyAttachFileMapper.selectPropertyAttachFileList(propertyAttachFile);
    }

    /**
     * 新增知识产权附件
     * 
     * @param propertyAttachFile 知识产权附件
     * @return 结果
     */
    @Override
    public int insertPropertyAttachFile(PropertyAttachFile propertyAttachFile)
    {
        return propertyAttachFileMapper.insertPropertyAttachFile(propertyAttachFile);
    }

    /**
     * 修改知识产权附件
     * 
     * @param propertyAttachFile 知识产权附件
     * @return 结果
     */
    @Override
    public int updatePropertyAttachFile(PropertyAttachFile propertyAttachFile)
    {
        return propertyAttachFileMapper.updatePropertyAttachFile(propertyAttachFile);
    }

    /**
     * 批量删除知识产权附件
     * 
     * @param fileIds 需要删除的知识产权附件主键
     * @return 结果
     */
    @Override
    public int deletePropertyAttachFileByFileIds(Long[] fileIds)
    {
        return propertyAttachFileMapper.deletePropertyAttachFileByFileIds(fileIds);
    }

    /**
     * 删除知识产权附件信息
     * 
     * @param fileId 知识产权附件主键
     * @return 结果
     */
    @Override
    public int deletePropertyAttachFileByFileId(Long fileId)
    {
        return propertyAttachFileMapper.deletePropertyAttachFileByFileId(fileId);
    }
}

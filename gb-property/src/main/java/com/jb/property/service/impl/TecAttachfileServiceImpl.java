package com.jb.property.service.impl;

import java.util.List;

import com.jb.property.domain.TecAttachfile;
import com.jb.property.mapper.TecAttachfileMapper;
import com.jb.property.service.ITecAttachfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 科技成果附件Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-08-17
 */
@Service
public class TecAttachfileServiceImpl implements ITecAttachfileService
{
    @Autowired
    private TecAttachfileMapper tecAttachfileMapper;

    /**
     * 查询科技成果附件
     * 
     * @param fileId 科技成果附件主键
     * @return 科技成果附件
     */
    @Override
    public TecAttachfile selectTecAttachfileByFileId(Integer fileId)
    {
        return tecAttachfileMapper.selectTecAttachfileByFileId(fileId);
    }

    /**
     * 查询科技成果附件列表
     * 
     * @param tecAttachfile 科技成果附件
     * @return 科技成果附件
     */
    @Override
    public List<TecAttachfile> selectTecAttachfileList(TecAttachfile tecAttachfile)
    {
        return tecAttachfileMapper.selectTecAttachfileList(tecAttachfile);
    }

    /**
     * 新增科技成果附件
     * 
     * @param tecAttachfile 科技成果附件
     * @return 结果
     */
    @Override
    public int insertTecAttachfile(TecAttachfile tecAttachfile)
    {
        return tecAttachfileMapper.insertTecAttachfile(tecAttachfile);
    }

    /**
     * 修改科技成果附件
     * 
     * @param tecAttachfile 科技成果附件
     * @return 结果
     */
    @Override
    public int updateTecAttachfile(TecAttachfile tecAttachfile)
    {
        return tecAttachfileMapper.updateTecAttachfile(tecAttachfile);
    }

    /**
     * 批量删除科技成果附件
     * 
     * @param fileIds 需要删除的科技成果附件主键
     * @return 结果
     */
    @Override
    public int deleteTecAttachfileByFileIds(Integer[] fileIds)
    {
        return tecAttachfileMapper.deleteTecAttachfileByFileIds(fileIds);
    }

    /**
     * 删除科技成果附件信息
     * 
     * @param fileId 科技成果附件主键
     * @return 结果
     */
    @Override
    public int deleteTecAttachfileByFileId(Integer fileId)
    {
        return tecAttachfileMapper.deleteTecAttachfileByFileId(fileId);
    }
}

package com.jb.property.service;

import java.util.List;

import com.jb.property.domain.TecAttachfile;

/**
 * 科技成果附件Service接口
 * 
 * @author ruoyi
 * @date 2023-08-17
 */
public interface ITecAttachfileService 
{
    /**
     * 查询科技成果附件
     * 
     * @param fileId 科技成果附件主键
     * @return 科技成果附件
     */
    public TecAttachfile selectTecAttachfileByFileId(Integer fileId);

    /**
     * 查询科技成果附件列表
     * 
     * @param tecAttachfile 科技成果附件
     * @return 科技成果附件集合
     */
    public List<TecAttachfile> selectTecAttachfileList(TecAttachfile tecAttachfile);

    /**
     * 新增科技成果附件
     * 
     * @param tecAttachfile 科技成果附件
     * @return 结果
     */
    public int insertTecAttachfile(TecAttachfile tecAttachfile);

    /**
     * 修改科技成果附件
     * 
     * @param tecAttachfile 科技成果附件
     * @return 结果
     */
    public int updateTecAttachfile(TecAttachfile tecAttachfile);

    /**
     * 批量删除科技成果附件
     * 
     * @param fileIds 需要删除的科技成果附件主键集合
     * @return 结果
     */
    public int deleteTecAttachfileByFileIds(Integer[] fileIds);

    /**
     * 删除科技成果附件信息
     * 
     * @param fileId 科技成果附件主键
     * @return 结果
     */
    public int deleteTecAttachfileByFileId(Integer fileId);

}

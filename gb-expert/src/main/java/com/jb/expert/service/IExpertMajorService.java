package com.jb.expert.service;

import java.util.List;
import com.jb.expert.domain.ExpertMajor;

/**
 * 专业管理Service接口
 * 
 * @author ruoyi
 * @date 2022-02-20
 */
public interface IExpertMajorService 
{
    /**
     * 查询专业管理
     * 
     * @param majorId 专业管理主键
     * @return 专业管理
     */
    public ExpertMajor selectExpertMajorByMajorId(Long majorId);

    /**
     * 查询专业管理列表
     * 
     * @param expertMajor 专业管理
     * @return 专业管理集合
     */
    public List<ExpertMajor> selectExpertMajorList(ExpertMajor expertMajor);

    /**
     * 新增专业管理
     * 
     * @param expertMajor 专业管理
     * @return 结果
     */
    public int insertExpertMajor(ExpertMajor expertMajor);

    /**
     * 修改专业管理
     * 
     * @param expertMajor 专业管理
     * @return 结果
     */
    public int updateExpertMajor(ExpertMajor expertMajor);

    /**
     * 批量删除专业管理
     * 
     * @param majorIds 需要删除的专业管理主键集合
     * @return 结果
     */
    public int deleteExpertMajorByMajorIds(Long[] majorIds);

    /**
     * 删除专业管理信息
     * 
     * @param majorId 专业管理主键
     * @return 结果
     */
    public int deleteExpertMajorByMajorId(Long majorId);

}

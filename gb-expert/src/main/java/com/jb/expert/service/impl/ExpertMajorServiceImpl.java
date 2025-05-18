package com.jb.expert.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.expert.mapper.ExpertMajorMapper;
import com.jb.expert.domain.ExpertMajor;
import com.jb.expert.service.IExpertMajorService;

/**
 * 专业管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-02-20
 */
@Service
public class ExpertMajorServiceImpl implements IExpertMajorService 
{
    @Autowired
    private ExpertMajorMapper expertMajorMapper;

    /**
     * 查询专业管理
     * 
     * @param majorId 专业管理主键
     * @return 专业管理
     */
    @Override
    public ExpertMajor selectExpertMajorByMajorId(Long majorId)
    {
        return expertMajorMapper.selectExpertMajorByMajorId(majorId);
    }

    /**
     * 查询专业管理列表
     * 
     * @param expertMajor 专业管理
     * @return 专业管理
     */
    @Override
    public List<ExpertMajor> selectExpertMajorList(ExpertMajor expertMajor)
    {
        return expertMajorMapper.selectExpertMajorList(expertMajor);
    }

    /**
     * 新增专业管理
     * 
     * @param expertMajor 专业管理
     * @return 结果
     */
    @Override
    public int insertExpertMajor(ExpertMajor expertMajor)
    {
        return expertMajorMapper.insertExpertMajor(expertMajor);
    }

    /**
     * 修改专业管理
     * 
     * @param expertMajor 专业管理
     * @return 结果
     */
    @Override
    public int updateExpertMajor(ExpertMajor expertMajor)
    {
        return expertMajorMapper.updateExpertMajor(expertMajor);
    }

    /**
     * 批量删除专业管理
     * 
     * @param majorIds 需要删除的专业管理主键
     * @return 结果
     */
    @Override
    public int deleteExpertMajorByMajorIds(Long[] majorIds)
    {
        return expertMajorMapper.deleteExpertMajorByMajorIds(majorIds);
    }

    /**
     * 删除专业管理信息
     * 
     * @param majorId 专业管理主键
     * @return 结果
     */
    @Override
    public int deleteExpertMajorByMajorId(Long majorId)
    {
        return expertMajorMapper.deleteExpertMajorByMajorId(majorId);
    }
}

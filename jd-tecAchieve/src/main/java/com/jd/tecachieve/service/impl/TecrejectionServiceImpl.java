package com.jd.tecachieve.service.impl;

import java.util.Date;
import java.util.List;

import com.jd.tecachieve.domain.Tecrejection;
import com.jd.tecachieve.service.ITecrejectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jd.tecachieve.mapper.TecrejectionMapper;


/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-10-25
 */
@Service
public class TecrejectionServiceImpl implements ITecrejectionService
{
    @Autowired
    private TecrejectionMapper tecrejectionMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param rejectionId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public Tecrejection selectTecrejectionByRejectionId(Long rejectionId)
    {
        return tecrejectionMapper.selectTecrejectionByRejectionId(rejectionId);
    }

    @Override
    public List<Tecrejection> getListByachievementId(Long achievementId) {
        return tecrejectionMapper.getListByachievementId(achievementId);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tecrejection 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<Tecrejection> selectTecrejectionList(Tecrejection tecrejection)
    {
        return tecrejectionMapper.selectTecrejectionList(tecrejection);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param tecrejection 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertTecrejection(Tecrejection tecrejection)
    {
        return tecrejectionMapper.insertTecrejection(tecrejection);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param tecrejection 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateTecrejection(Tecrejection tecrejection)
    {
        return tecrejectionMapper.updateTecrejection(tecrejection);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param rejectionIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteTecrejectionByRejectionIds(Long[] rejectionIds)
    {
        return tecrejectionMapper.deleteTecrejectionByRejectionIds(rejectionIds);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param rejectionId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteTecrejectionByRejectionId(Long rejectionId)
    {
        return tecrejectionMapper.deleteTecrejectionByRejectionId(rejectionId);
    }
}

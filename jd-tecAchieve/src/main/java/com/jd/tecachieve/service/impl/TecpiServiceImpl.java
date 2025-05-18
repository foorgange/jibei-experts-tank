package com.jd.tecachieve.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jd.tecachieve.mapper.TecpiMapper;
import com.jd.tecachieve.domain.Tecpi;
import com.jd.tecachieve.service.ITecpiService;

/**
 * 成果负责人增删改查Service业务层处理
 * 
 * @author lzz
 * @date 2023-09-22
 */
@Service
public class TecpiServiceImpl implements ITecpiService 
{
    @Autowired
    private TecpiMapper tecpiMapper;

    /**
     * 查询成果负责人增删改查
     * 
     * @param piId 成果负责人增删改查主键
     * @return 成果负责人增删改查
     */
    @Override
    public Tecpi selectTecpiByPiid(Long piId)
    {
        return tecpiMapper.selectTecpiByPiid(piId);
    }

    /**
     * 查询成果负责人增删改查列表
     * 
     * @param tecpi 成果负责人增删改查
     * @return 成果负责人增删改查
     */
    @Override
    public List<Tecpi> selectTecpiList(Tecpi tecpi)
    {
        return tecpiMapper.selectTecpiList(tecpi);
    }

    /**
     * 新增成果负责人增删改查
     * 
     * @param tecpi 成果负责人增删改查
     * @return 结果
     */
    @Override
    public int insertTecpi(Tecpi tecpi)
    {
        return tecpiMapper.insertTecpi(tecpi);
    }

    /**
     * 修改成果负责人增删改查
     * 
     * @param tecpi 成果负责人增删改查
     * @return 结果
     */
    @Override
    public int updateTecpi(Tecpi tecpi)
    {
        return tecpiMapper.updateTecpi(tecpi);
    }

    /**
     * 批量删除成果负责人增删改查
     * 
     * @param piIds 需要删除的成果负责人增删改查主键
     * @return 结果
     */
    @Override
    public int deleteTecpiByPiids(Long[] piIds)
    {
        return tecpiMapper.deleteTecpiByPiids(piIds);
    }

    /**
     * 删除成果负责人增删改查信息
     * 
     * @param piId 成果负责人增删改查主键
     * @return 结果
     */
    @Override
    public int deleteTecpiByPiid(Long piId)
    {
        return tecpiMapper.deleteTecpiByPiid(piId);
    }
}

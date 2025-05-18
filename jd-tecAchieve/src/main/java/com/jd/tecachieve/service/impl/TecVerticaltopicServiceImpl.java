package com.jd.tecachieve.service.impl;

import java.util.List;

import com.jd.tecachieve.domain.TecVerticaltopic;
import com.jd.tecachieve.mapper.TecVerticaltopicMapper;
import com.jd.tecachieve.service.ITecVerticaltopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 纵向课题Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-11-10
 */
@Service
public class TecVerticaltopicServiceImpl implements ITecVerticaltopicService
{
    @Autowired
    private TecVerticaltopicMapper tecVerticaltopicMapper;

    /**
     * 查询纵向课题
     * 
     * @param topicId 纵向课题主键
     * @return 纵向课题
     */
    @Override
    public TecVerticaltopic selectTecVerticaltopicByTopicId(Long topicId)
    {
        return tecVerticaltopicMapper.selectTecVerticaltopicByTopicId(topicId);
    }

    /**
     * 查询纵向课题列表
     * 
     * @param tecVerticaltopic 纵向课题
     * @return 纵向课题
     */
    @Override
    public List<TecVerticaltopic> selectTecVerticaltopicList(TecVerticaltopic tecVerticaltopic)
    {
        return tecVerticaltopicMapper.selectTecVerticaltopicList(tecVerticaltopic);
    }

    /**
     * 新增纵向课题
     * 
     * @param tecVerticaltopic 纵向课题
     * @return 结果
     */
    @Override
    public int insertTecVerticaltopic(TecVerticaltopic tecVerticaltopic)
    {
        return tecVerticaltopicMapper.insertTecVerticaltopic(tecVerticaltopic);
    }

    /**
     * 修改纵向课题
     * 
     * @param tecVerticaltopic 纵向课题
     * @return 结果
     */
    @Override
    public int updateTecVerticaltopic(TecVerticaltopic tecVerticaltopic)
    {
        return tecVerticaltopicMapper.updateTecVerticaltopic(tecVerticaltopic);
    }

    /**
     * 批量删除纵向课题
     * 
     * @param topicIds 需要删除的纵向课题主键
     * @return 结果
     */
    @Override
    public int deleteTecVerticaltopicByTopicIds(Long[] topicIds)
    {
        return tecVerticaltopicMapper.deleteTecVerticaltopicByTopicIds(topicIds);
    }

    /**
     * 删除纵向课题信息
     * 
     * @param topicId 纵向课题主键
     * @return 结果
     */
    @Override
    public int deleteTecVerticaltopicByTopicId(Long topicId)
    {
        return tecVerticaltopicMapper.deleteTecVerticaltopicByTopicId(topicId);
    }

    @Override
    public int deleteTecVerticaltopicByachievementid(Long achievementid) {
        return tecVerticaltopicMapper.deleteTecVerticaltopicByachievementid(achievementid);
    }
}

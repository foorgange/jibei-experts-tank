package com.jd.tecachieve.service;

import java.util.List;

import com.jd.tecachieve.domain.TecVerticaltopic;

/**
 * 纵向课题Service接口
 * 
 * @author ruoyi
 * @date 2023-11-10
 */
public interface ITecVerticaltopicService 
{
    /**
     * 查询纵向课题
     * 
     * @param topicId 纵向课题主键
     * @return 纵向课题
     */
    public TecVerticaltopic selectTecVerticaltopicByTopicId(Long topicId);

    /**
     * 查询纵向课题列表
     * 
     * @param tecVerticaltopic 纵向课题
     * @return 纵向课题集合
     */
    public List<TecVerticaltopic> selectTecVerticaltopicList(TecVerticaltopic tecVerticaltopic);

    /**
     * 新增纵向课题
     * 
     * @param tecVerticaltopic 纵向课题
     * @return 结果
     */
    public int insertTecVerticaltopic(TecVerticaltopic tecVerticaltopic);

    /**
     * 修改纵向课题
     * 
     * @param tecVerticaltopic 纵向课题
     * @return 结果
     */
    public int updateTecVerticaltopic(TecVerticaltopic tecVerticaltopic);

    /**
     * 批量删除纵向课题
     * 
     * @param topicIds 需要删除的纵向课题主键集合
     * @return 结果
     */
    public int deleteTecVerticaltopicByTopicIds(Long[] topicIds);

    /**
     * 删除纵向课题信息
     * 
     * @param topicId 纵向课题主键
     * @return 结果
     */
    public int deleteTecVerticaltopicByTopicId(Long topicId);

    public int deleteTecVerticaltopicByachievementid(Long achievementid);
}

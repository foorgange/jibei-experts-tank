package com.jd.tecachieve.mapper;

import java.util.List;

import com.jd.tecachieve.domain.TecVerticaltopic;
import org.springframework.stereotype.Repository;

/**
 * 纵向课题Mapper接口
 * 
 * @author ruoyi
 * @date 2023-11-10
 */
@Repository
public interface TecVerticaltopicMapper 
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
     * 删除纵向课题
     * 
     * @param topicId 纵向课题主键
     * @return 结果
     */
    public int deleteTecVerticaltopicByTopicId(Long topicId);

    /**
     * 批量删除纵向课题
     * 
     * @param topicIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTecVerticaltopicByTopicIds(Long[] topicIds);

    public int deleteTecVerticaltopicByachievementid(Long achievementid);
}

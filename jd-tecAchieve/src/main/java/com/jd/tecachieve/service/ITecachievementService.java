package com.jd.tecachieve.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jd.tecachieve.domain.Tecachievement;
import com.jd.tecachieve.vo.TecachievementVO;

/**
 * 科技成果增删改查Service接口
 * 
 * @author ruoyi
 * @date 2023-09-11
 */
public interface ITecachievementService 
{
    /**
     * 查询科技成果增删改查
     * 
     * @param achievementid 科技成果增删改查主键
     * @return 科技成果增删改查
     */
    public Tecachievement selectTecachievementByAchievementid(Long achievementid);

    /**
     * 查询科技成果增删改查列表
     * 
     * @param tecachievement 科技成果增删改查
     * @return 科技成果增删改查集合
     */
    public List<Tecachievement> selectTecachievementList(Tecachievement tecachievement);

    /**
     * 查询科技成果增删改查列表
     *
     * @param tecachievementVO 科技成果增删改查
     * @return 科技成果增删改查集合
     */
    public List<Tecachievement> selectTecachievementListByTecachievementVO(TecachievementVO tecachievementVO);

    /**
     * 查询科技成果增删改查列表
     *
     * @param achievementids 需要查询的科技成果增删改查主键集合
     * @return 科技成果增删改查集合
     */
    public List<Tecachievement> selectTecachievementByAchievementidArray(Long[] achievementids);

    /**
     * 新增科技成果增删改查
     * 
     * @param tecachievement 科技成果增删改查
     * @return 结果
     */
    public int insertTecachievement(Tecachievement tecachievement);

    /**
     * 修改科技成果增删改查
     * 
     * @param tecachievement 科技成果增删改查
     * @return 结果
     */
    public int updateTecachievement(Tecachievement tecachievement);

//    /**
//     * 修改多个科技成果增删改查
//     *
//     * @param tecachievementList 科技成果增删改查
//     * @return 结果
//     */
//    public int updateTecachievementBatch(List<Tecachievement> tecachievementList);

    /**
     * 批量删除科技成果增删改查
     * 
     * @param achievementids 需要删除的科技成果增删改查主键集合
     * @return 结果
     */
    public int deleteTecachievementByAchievementids(Long[] achievementids);

    /**
     * 删除科技成果增删改查信息
     * 
     * @param achievementid 科技成果增删改查主键
     * @return 结果
     */
    public int deleteTecachievementByAchievementid(Long achievementid);

    public int updateTecachievementStatus(Long achievementid);

    public List<Tecachievement> selectTecAchiListByPiId(Long piId);

    /**
     * 获取 way 字段中各个数字的统计结果
     *
     * @return 统计结果列表，每个 Map 包含两个键：
     *         - "way_value": 数字值
     *         - "count": 该数字出现的次数
     */
    List<Map<String, Object>> getWayValueCounts();

    /**
     * 统计 advancementLeve 字段中 1 到 5 出现的次数
     *
     * @return 包含统计结果的 Map 列表
     */
    List<Map<String, Object>> getAdvancementLevelCounts();

    /**
     * 统计 tecachievement 表中 college 字段各个值的出现次数
     * @return List<Map<String, Object>> 每个 Map 包含 "college" 和 "count" 两个键
     */
    List<Map<String, Object>> countCollegeOccurrences();

    /**
     * 统计 technologyLevel 各个数值出现的次数
     * @return List<Map<String, Object>> 包含 technologyLevel 和 count 的键值对列表
     */
    List<Map<String, Object>> getTechnologyLevelCounts();

    List<Map<String, Object>> countFieldNumbers(); // 统计所有数字出现次数

}

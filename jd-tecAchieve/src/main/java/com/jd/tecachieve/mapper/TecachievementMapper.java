package com.jd.tecachieve.mapper;

import java.util.List;
import java.util.Map;

import com.jd.tecachieve.domain.Tecachievement;
import com.jd.tecachieve.vo.TecachievementVO;
import org.springframework.stereotype.Repository;

/**
 * 科技成果增删改查Mapper接口
 * 
 * @author ruoyi
 * @date 2023-09-11
 */
@Repository
public interface TecachievementMapper 
{



    /**
     * 统计field字段中每个数字出现的次数，并过滤掉空值。
     *
     * @return 包含数字及其出现次数的Map列表。每条记录包含一个数字（num）和它的出现次数（count）。
     */
    List<Map<String, Object>> countFieldNumbers();


    /**
     * 统计 technologyLevel 各个数值出现的次数
     * @return Map<technologyLevel, count>
     */
    List<Map<String, Object>> countTechnologyLevels();
    /**
     * 统计 tecachievement 表中 college 字段各个值的出现次数
     * @return List<Map<String, Object>> 每个 Map 包含 "college" 和 "count" 两个键
     */
    List<Map<String, Object>> countCollegeOccurrences();

    /**
     * 统计 advancementLeve 字段中 1 到 5 出现的次数
     *
     * @return 包含统计结果的 Map 列表
     */
    List<Map<String, Object>> countAdvancementLevels();

    /**
     * 统计 tecachievement 表中 way 字段各个数字出现的次数
     *
     * @return List<Map<String, Object>> 每个 Map 包含两个键：
     *         - "way_value": 数字值
     *         - "count": 该数字出现的次数
     */
    List<Map<String, Object>> countWayValues();
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
     * @param achievementids 科技成果增删改查主键集合
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
//     * 修改科技多个成果增删改查
//     *
//     * @param tecachievementList 科技成果增删改查
//     * @return 结果
//     */
//    public int updateTecachievementBatch(List<Tecachievement> tecachievementList);

    /**
     * 删除科技成果增删改查
     * 
     * @param achievementid 科技成果增删改查主键
     * @return 结果
     */
    public int deleteTecachievementByAchievementid(Long achievementid);

    /**
     * 批量删除科技成果增删改查
     * 
     * @param achievementids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTecachievementByAchievementids(Long[] achievementids);


    public int updateTecachievementStatus(Long achievementid);

    /**
     * 通过成果负责人ID查询其所属的科技成果列表
     * @param piId 成果负责人ID
     * @return 科技成果列表
     */
    public List<Tecachievement> selectTecAchiListByPiId(Long piId);

}

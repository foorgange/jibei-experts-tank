package com.jd.tecachieve.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jd.tecachieve.vo.TecachievementVO;
import com.ruoyi.common.annotation.DataScope;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jd.tecachieve.mapper.TecachievementMapper;
import com.jd.tecachieve.domain.Tecachievement;
import com.jd.tecachieve.service.ITecachievementService;

/**
 * 科技成果增删改查Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-09-11
 */
@Service
public class TecachievementServiceImpl implements ITecachievementService 
{
    @Autowired
    private TecachievementMapper tecachievementMapper;


    /**
     * 统计 field 字段中每个数字出现的次数
     * 用于展示所有数字及其出现频率
     *
     * @return 包含每个数字和对应出现次数的Map列表
     */
    @Override
    public List<Map<String, Object>> countFieldNumbers() {
        return tecachievementMapper.countFieldNumbers();
    }

    /**
     * 统计 technologyLevel 各个数值出现的次数
     * @return List<Map<String, Object>> 包含 technologyLevel 和 count 的键值对列表
     */
    @Override
    public List<Map<String, Object>> getTechnologyLevelCounts() {
        // 调用 Mapper 方法获取统计数据
        return tecachievementMapper.countTechnologyLevels();
    }

    /**
     * 统计 tecachievement 表中 college 字段各个值的出现次数
     * @return List<Map<String, Object>> 每个 Map 包含 "college" 和 "count" 两个键
     */
    @Override
    public List<Map<String, Object>> countCollegeOccurrences() {
        // 调用 Mapper 方法获取统计结果
        return tecachievementMapper.countCollegeOccurrences();
    }

    /**
     * 实现统计 advancementLeve 字段中 1 到 5 出现的次数
     *
     * @return 包含统计结果的 Map 列表
     */
    @Override
    public List<Map<String, Object>> getAdvancementLevelCounts() {
        return tecachievementMapper.countAdvancementLevels();
    }

    /**
     * 实现接口方法：统计 way 字段中各个数字出现的次数
     *
     * @return 统计结果列表，每个 Map 包含两个键：
     *         - "way_value": 数字值
     *         - "count": 该数字出现的次数
     */
    @Override
    public List<Map<String, Object>> getWayValueCounts() {
        // 调用 Mapper 层的方法获取统计结果
        return tecachievementMapper.countWayValues();
    }

    /**
     * 查询科技成果增删改查
     * 
     * @param achievementid 科技成果增删改查主键
     * @return 科技成果增删改查
     */
    @Override
    public Tecachievement selectTecachievementByAchievementid(Long achievementid)
    {
        return tecachievementMapper.selectTecachievementByAchievementid(achievementid);
    }

    /**
     * 查询科技成果增删改查列表
     * 
     * @param tecachievement 科技成果增删改查
     * @return 科技成果增删改查
     */
    @Override
    @DataScope(deptAlias = "tecachievement")
    public List<Tecachievement> selectTecachievementList(Tecachievement tecachievement)
    {
        return tecachievementMapper.selectTecachievementList(tecachievement);
    }

    /**
     * 查询科技成果增删改查列表
     *
     * @param tecachievementVO 科技成果增删改查
     * @return 科技成果增删改查
     */
    @Override
    @DataScope(deptAlias = "tecachievement")
    public List<Tecachievement> selectTecachievementListByTecachievementVO(TecachievementVO tecachievementVO)
    {
        return tecachievementMapper.selectTecachievementListByTecachievementVO(tecachievementVO);
    }

    /**
     * 查询科技成果增删改查列表
     *
     * @param achievementids 需要查询的科技成果增删改查主键集合
     * @return 科技成果增删改查集合
     */
    @Override
    public List<Tecachievement> selectTecachievementByAchievementidArray(Long[] achievementids)
    {
        return tecachievementMapper.selectTecachievementByAchievementidArray(achievementids);
    }

    /**
     * 新增科技成果增删改查
     * 
     * @param tecachievement 科技成果增删改查
     * @return 结果
     */
    @Override
    public int insertTecachievement(Tecachievement tecachievement)
    {
        return tecachievementMapper.insertTecachievement(tecachievement);
    }

    /**
     * 修改科技成果增删改查
     * 
     * @param tecachievement 科技成果增删改查
     * @return 结果
     */
    @Override
    public int updateTecachievement(Tecachievement tecachievement)
    {
        return tecachievementMapper.updateTecachievement(tecachievement);
    }

//    /**
//     * 修改多个科技成果增删改查
//     *
//     * @param tecachievementList 科技成果增删改查
//     * @return 结果
//     */
//    @Override
//    public int updateTecachievementBatch(List<Tecachievement> tecachievementList)
//    {
//        return tecachievementMapper.updateTecachievementBatch(tecachievementList);
//    }

    /**
     * 批量删除科技成果增删改查
     * 
     * @param achievementids 需要删除的科技成果增删改查主键
     * @return 结果
     */
    @Override
    public int deleteTecachievementByAchievementids(Long[] achievementids)
    {
        return tecachievementMapper.deleteTecachievementByAchievementids(achievementids);
    }

    /**
     * 删除科技成果增删改查信息
     * 
     * @param achievementid 科技成果增删改查主键
     * @return 结果
     */
    @Override
    public int deleteTecachievementByAchievementid(Long achievementid)
    {
        return tecachievementMapper.deleteTecachievementByAchievementid(achievementid);
    }

    @Override
    public int updateTecachievementStatus(Long achievementid) {
        return tecachievementMapper.updateTecachievementStatus(achievementid);
    }

    /**
     * 通过成果负责人ID查询其所属的科技成果列表
     * @param piId 成果负责人ID
     * @return 科技成果列表
     */
    @Override
    public List<Tecachievement> selectTecAchiListByPiId(Long piId) {
        return tecachievementMapper.selectTecAchiListByPiId(piId);
    }
}

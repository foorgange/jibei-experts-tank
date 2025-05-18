package com.jb.property.service;

import com.jb.property.domain.TecAchievementOld;

import java.util.List;

/**
 * TecAchievementService 接口
 */
public interface ITecAchievementService {

    /**
     * 根据 achievementId 查询 TecAchievement 实体
     * @param achievementId ：主键
     * @return TecAchievement实体
     */
    TecAchievementOld selectTecAchievementById(Integer achievementId);

    /**
     * 根据 TecAchievement 实体类查询 TecAchievement 列表
     * @param tecAchievementOld ： 实体
     * @return TecAchievement列表
     */
    List<TecAchievementOld> selectTecAchievementList(TecAchievementOld tecAchievementOld);

    /**
     * 根据 achievementId 删除 TecAchievement 实体
     * @param achievementId ：主键
     * @return 删除 结果
     */
    int delTecAchievementById(Integer achievementId);


    /**
     * 根据 TecAchievement 实体类新增TecAchievement
     * @param tecAchievementOld ： 实体
     * @return 新增结果
     */
    int addTecAchievement(TecAchievementOld tecAchievementOld);


    /**
     * 根据 TecAchievement 实体类更新TecAchievement
     * @param tecAchievementOld ： 实体
     * @return 更新结果
     */
    int updateTecAchievement(TecAchievementOld tecAchievementOld);

}

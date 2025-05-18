package com.jb.property.service.impl;

import com.jb.property.domain.TecAchievementOld;
import com.jb.property.mapper.TecAchievementMapperOld;
import com.jb.property.service.ITecAchievementService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


/**
 * ITecAchievementService 接口实现类
 */
//@Service
public class TecAchievementServiceImpl implements ITecAchievementService {

    @Autowired
    TecAchievementMapperOld tecAchievementMapperOld;

    /**
     * 根据 achievementId 查询 TecAchievement 实体
     * @param achievementId ：主键
     * @return TecAchievement实体
     */
    @Override
    public TecAchievementOld selectTecAchievementById(Integer achievementId) {
        return tecAchievementMapperOld.selectTecAchievementById(achievementId);
    }

    /**
     * 根据 TecAchievement 实体类查询 TecAchievement 列表
     * @param tecAchievementOld ： 实体
     * @return TecAchievement集合
     */
    @Override
    public List<TecAchievementOld> selectTecAchievementList(TecAchievementOld tecAchievementOld) {
        return tecAchievementMapperOld.selectTecAchievementList(tecAchievementOld);
    }

    /**
     *
     * @param achievementId ：主键
     * @return
     */
    @Override
    public int delTecAchievementById(Integer achievementId) {

        return tecAchievementMapperOld.delTecAchievementById(achievementId);
    }

    /**
     *
     * @param tecAchievementOld ： 实体
     * @return
     */
    @Override
    public int addTecAchievement(TecAchievementOld tecAchievementOld) {

        return tecAchievementMapperOld.addTecAchievement(tecAchievementOld);
    }

    /**
     *
     * @param tecAchievementOld ： 实体
     * @return
     */
    @Override
    public int updateTecAchievement(TecAchievementOld tecAchievementOld) {
        return tecAchievementMapperOld.updateTecAchievement(tecAchievementOld);
    }

}

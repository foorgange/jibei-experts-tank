package com.jb.property.mapper;

import com.jb.property.domain.TecAchievementOld;

import java.util.List;

//@Repository
public interface TecAchievementMapperOld {

    TecAchievementOld selectTecAchievementById(Integer achievementId);

    List<TecAchievementOld> selectTecAchievementList(TecAchievementOld tecAchievementOld);

    int delTecAchievementById(Integer achievementId);

    int addTecAchievement(TecAchievementOld tecAchievementOld);

    int updateTecAchievement(TecAchievementOld tecAchievementOld);
}

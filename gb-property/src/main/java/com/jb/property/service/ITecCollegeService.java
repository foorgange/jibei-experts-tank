package com.jb.property.service;

import com.jb.property.domain.PropertyType;
import com.jb.property.domain.TecCollege;

import java.util.List;



public interface ITecCollegeService {
    /**
     * 查询学院
     *
     * @param tecCollegeId ： 主键
     * @return 学院实体
     */
    TecCollege selectTecCollegeByCollegeId(Integer tecCollegeId);

    /**
     * 查询知识产权类型管理列表
     *
     * @param tecCollege 学院实体
     * @return 学院集合
     */
    List<TecCollege> selectTecCollegeList(TecCollege tecCollege);

}

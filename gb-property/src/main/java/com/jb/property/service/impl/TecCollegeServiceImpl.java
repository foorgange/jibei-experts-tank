package com.jb.property.service.impl;

import com.jb.property.domain.PropertyType;
import com.jb.property.domain.TecCollege;
import com.jb.property.mapper.TecCollegeMapper;
import com.jb.property.service.ITecCollegeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class TecCollegeServiceImpl implements ITecCollegeService {

    @Autowired
    private TecCollegeMapper tecCollegeMapper;

    /**
     * 查询学院
     *
     * @param tecCollegeId ： 主键
     * @return 学院实体
     */
    @Override
    public TecCollege selectTecCollegeByCollegeId(Integer tecCollegeId) {
        return tecCollegeMapper.selectTecCollegeByCollegeId(tecCollegeId);
    }

    /**
     * 查询知识产权类型管理列表
     *
     * @param tecCollege 学院实体
     * @return 学院集合
     */
    @Override
    public List<TecCollege> selectTecCollegeList(TecCollege tecCollege) {
        return tecCollegeMapper.selectTecCollegeList(tecCollege);
    }

}

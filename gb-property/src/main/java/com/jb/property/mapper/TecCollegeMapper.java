package com.jb.property.mapper;

import com.jb.property.domain.TecCollege;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface TecCollegeMapper {

    TecCollege selectTecCollegeByCollegeId(Integer collegeId);

    List<TecCollege> selectTecCollegeList(TecCollege tecCollege);

}

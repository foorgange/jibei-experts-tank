package com.jd.tecachieve.mapper;


import com.jd.tecachieve.domain.PatentTotal;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface PatentTotalMapper {
    List<PatentTotal> findAll();

    /**
     * 获取所有记录中 transfers, licenses, pledges 字段的总和。
     *
     * @return 包含 transfers, licenses, pledges 总和的结果 Map
     */
    Map<String, Object> getTotalCounts();

    // 获取grade_a到grade_e的总数
    Map<String, Object> getGradesTotal();
}

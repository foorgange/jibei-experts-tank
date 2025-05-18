package com.jd.tecachieve.service;

import com.jd.tecachieve.domain.PatentTotal;

import java.util.List;
import java.util.Map;

public interface PatentTotalService {
    List<PatentTotal> getAllPatentTotals();


    /**
     * 获取所有记录中 transfers, licenses, pledges 字段的总和。
     *
     * @return 包含 transfers, licenses, pledges 总和的结果 Map
     */
    Map<String, Object> getTotalCounts();

    Map<String, Object> getGradesTotal();


}

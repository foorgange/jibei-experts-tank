package com.jd.tecachieve.service.impl;

import com.jd.tecachieve.domain.PatentTotal;
import com.jd.tecachieve.mapper.PatentTotalMapper;
import com.jd.tecachieve.service.PatentTotalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Map;

@Service
public class PantentTotalServiceImpl implements PatentTotalService {

    @Autowired
    private PatentTotalMapper patentTotalMapper;


    @Override
    public Map<String, Object> getGradesTotal() {
        return patentTotalMapper.getGradesTotal();
    }

    @Override
    public List<PatentTotal> getAllPatentTotals() {
        return patentTotalMapper.findAll();
    }


    @Override
    public Map<String, Object> getTotalCounts() {
        return patentTotalMapper.getTotalCounts();
    }




}

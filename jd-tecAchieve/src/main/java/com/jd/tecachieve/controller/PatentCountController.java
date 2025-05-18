package com.jd.tecachieve.controller;

import com.jd.tecachieve.domain.PatentTotal;
import com.jd.tecachieve.service.PatentTotalService;
import com.ruoyi.common.core.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/api/patentCounts")
public class PatentCountController extends BaseController {

    @Autowired
    private PatentTotalService patentTotalService;

    /**
     * 获取grade_a到grade_e的总数统计
     */
    @GetMapping("/grades/total")
    public Map<String, Object> getGradesTotal() {
        return patentTotalService.getGradesTotal();
    }

    @GetMapping("/total-counts")
    public Map<String, Object> getTotalCounts() {
        return patentTotalService.getTotalCounts();
    }


    @GetMapping
    public ResponseEntity<List<PatentTotal>> getAllPatentCounts() {
        List<PatentTotal> patentTotals = patentTotalService.getAllPatentTotals();
        return ResponseEntity.ok(patentTotals);
    }

}

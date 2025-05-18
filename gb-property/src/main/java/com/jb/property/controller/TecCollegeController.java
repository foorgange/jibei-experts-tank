package com.jb.property.controller;

import com.jb.property.domain.TecCollege;
import com.jb.property.service.ITecCollegeService;
import com.ruoyi.common.core.domain.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/tec")
public class TecCollegeController {

    @Autowired
    private ITecCollegeService tecCollegeService;

    /**
     * 查询学院详细信息
     */
    @PostMapping("/getTecCollegeInfo/{tecCollegeID}")
    public AjaxResult getTecCollegeInfo(@PathVariable(value = "tecCollegeID") Integer tecCollegeID) {

        TecCollege tecCollege = tecCollegeService.selectTecCollegeByCollegeId(tecCollegeID);

        return AjaxResult.success(tecCollege);
    }


    /**
     * 查询学院列表
     */
    @PostMapping("/getTecCollegeList")
    public AjaxResult getTecCollegeList(TecCollege tecCollege) {

        List<TecCollege> list = tecCollegeService.selectTecCollegeList(tecCollege);

        return AjaxResult.success(list);
    }





}

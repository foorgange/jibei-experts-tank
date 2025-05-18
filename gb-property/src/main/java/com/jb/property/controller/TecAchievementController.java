package com.jb.property.controller;

import com.jb.property.domain.TecAchievementOld;
import com.jb.property.domain.TecAttachfile;
import com.jb.property.service.ITecAchievementService;
import com.jb.property.service.ITecAttachfileService;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

//@RestController
@RequestMapping("/tec")
public class TecAchievementController {

    @Autowired
    ITecAchievementService tecAchievementService;

    @Autowired
    ITecAttachfileService tecAttachfileService;

    @RequestMapping("/getTecAchiInfoById/{tecAchievementId}")
    public AjaxResult getTecAchiInfoById(@PathVariable(value = "tecAchievementId") Integer TecAchiId){

        TecAchievementOld tecAchievementOld = tecAchievementService.selectTecAchievementById(TecAchiId);

        return AjaxResult.success(tecAchievementOld);
    }

    @RequestMapping("/getTecAchiList")
    public AjaxResult getTecAchiList(@RequestBody TecAchievementOld tecAchievementOld){
        List<TecAchievementOld> tecAchievementOldList = tecAchievementService.selectTecAchievementList(tecAchievementOld);

        return AjaxResult.success(tecAchievementOldList);
    }

    @PostMapping("/delTecAchi/{tecAchievementId}")
    public AjaxResult delTecAchievementById(@PathVariable(value = "tecAchievementId") Integer TecAchiId){

        int result = tecAchievementService.delTecAchievementById(TecAchiId);

        if (result == 1){
            return AjaxResult.success();
        }else {
            return AjaxResult.error();
        }
    }

    @Transactional
    @RequestMapping("/addTecAchi")
    public AjaxResult addTecAchi(@RequestBody TecAchievementOld tecAchievementOld){
        String attachFileName = StringUtils.substringAfterLast(tecAchievementOld.getAttachFileName(), "/");
        String attachFilePath = tecAchievementOld.getAttachFileName();

        tecAchievementOld.setAttachFileName(attachFileName);

        int result = tecAchievementService.addTecAchievement(tecAchievementOld);

        if (result == 1){
            TecAttachfile tecAttachfile = new TecAttachfile();
            tecAttachfile.setAchievementId(tecAchievementOld.getAchievementId());
            tecAttachfile.setFileName(attachFileName);
            tecAttachfile.setFilePath(attachFilePath);

            if (tecAttachfileService.insertTecAttachfile(tecAttachfile) == 1){
                return AjaxResult.success();
            }else {
                return AjaxResult.error();
            }
        }else {
            return AjaxResult.error();
        }
    }

    @RequestMapping("/updateTecAchi")
    public AjaxResult updateTecAchi(@RequestBody TecAchievementOld tecAchievementOld){
//        int result = tecAchievementService.updateTecAchievement(tecAchievement);
//
//        if (result == 1){
//            return AjaxResult.success();
//        }else {
//            return AjaxResult.error();
//        }
        int result = tecAchievementService.updateTecAchievement(tecAchievementOld);

        if (result == 1) {
            String attachFileName = StringUtils.substringAfterLast(tecAchievementOld.getAttachFileName(), "/");
            String attachFilePath = tecAchievementOld.getAttachFileName();

            tecAchievementOld.setAttachFileName(attachFileName);

            TecAttachfile tecAttachfile = new TecAttachfile();
            tecAttachfile.setAchievementId(tecAchievementOld.getAchievementId());
            tecAttachfile.setFileName(attachFileName);
            tecAttachfile.setFilePath(attachFilePath);

            if (tecAttachfileService.insertTecAttachfile(tecAttachfile) == 1) {
                return AjaxResult.success();
            } else {
                return AjaxResult.error();
            }
        } else {
            return AjaxResult.error();
        }
    }

}

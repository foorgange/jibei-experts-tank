package com.jd.tecachieve.controller;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.jd.tecachieve.domain.Tecteam;
import com.jd.tecachieve.service.ITecteamService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 团队成员增删改查Controller
 *
 * @author lzz
 * @date 2023-09-12
 */
@RestController
@RequestMapping("/tec/tecteam")
public class TecteamController extends BaseController
{
    @Autowired
    private ITecteamService tecteamService;

    /**
     * 查询团队成员增删改查列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Tecteam tecteam)
    {
        startPage();
        List<Tecteam> list = tecteamService.selectTecteamList(tecteam);
        return getDataTable(list);
    }

    /**
     * 查询所有团队成员增删改查列表
     */
    @GetMapping("/allList")
    public AjaxResult allList(Tecteam tecteam)
    {
        List<Tecteam> list = tecteamService.selectTecteamList(tecteam);
        return AjaxResult.success(list);
    }

    /**
     * 导出团队成员增删改查列表
     */
    @Log(title = "团队成员增删改查", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Tecteam tecteam)
    {
        List<Tecteam> list = tecteamService.selectTecteamList(tecteam);
        ExcelUtil<Tecteam> util = new ExcelUtil<Tecteam>(Tecteam.class);
        return util.exportExcel(list, "团队成员增删改查数据");
    }

    /**
     * 获取团队成员增删改查详细信息
     */
    @GetMapping(value = "/{teamId}")
    public AjaxResult getInfo(@PathVariable("teamId") Long teamId)
    {
        return AjaxResult.success(tecteamService.selectTecteamByTeamid(teamId));
    }

    /**
     * 新增团队成员增删改查
     */
    @Log(title = "团队成员增删改查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody JSONArray tecteamArray)
    {
        for (int i = 0; i < tecteamArray.size(); i++){
            JSONObject tecTeamObject = tecteamArray.getJSONObject(i);
            System.out.println("--------" + tecTeamObject);
            Tecteam tecteam1 = new Tecteam();
            tecteam1.setTeamName(tecTeamObject.getString("teamName"));
            tecteamService.insertTecteam(tecteam1);
            tecteam1.setTeamSex(tecTeamObject.getString("teamSex"));
            tecteamService.insertTecteam(tecteam1);
            tecteam1.setTeamBirthday(tecTeamObject.getString("teamBirthday"));
            tecteamService.insertTecteam(tecteam1);
            tecteam1.setTeamJobTitle(tecTeamObject.getString("teamJobTitle"));
            tecteamService.insertTecteam(tecteam1);
            tecteam1.setTeamJobAddress(tecTeamObject.getString("teamJobAddress"));
            tecteamService.insertTecteam(tecteam1);
        }
        System.out.println(tecteamArray);
        return AjaxResult.success();
    }

    /**
     * 修改团队成员增删改查
     */
    @Log(title = "团队成员增删改查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Tecteam tecteam)
    {
        return toAjax(tecteamService.updateTecteam(tecteam));
    }

    /**
     * 删除团队成员增删改查
     */
    @Log(title = "团队成员增删改查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{teamIds}")
    public AjaxResult remove(@PathVariable Long[] teamIds)
    {
        return AjaxResult.success(tecteamService.deleteTecteamByTeamids(teamIds));
    }

}

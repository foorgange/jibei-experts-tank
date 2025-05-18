package com.jd.tecachieve.controller;

import java.util.List;
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
import com.jd.tecachieve.domain.Tecpi;
import com.jd.tecachieve.service.ITecpiService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 成果负责人增删改查Controller
 *
 * @author lzz
 * @date 2023-09-22
 */
@RestController
@RequestMapping("/tec/tecpi")
public class TecpiController extends BaseController
{
    @Autowired
    private ITecpiService tecpiService;

    /**
     * 查询成果负责人增删改查列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Tecpi tecpi)
    {
        startPage();
        List<Tecpi> list = tecpiService.selectTecpiList(tecpi);
        return getDataTable(list);
    }

    /**
     * 查询所有成果负责人增删改查列表
     */
    @GetMapping("/allList")
    public AjaxResult allList(Tecpi tecpi)
    {
        List<Tecpi> list = tecpiService.selectTecpiList(tecpi);
        return AjaxResult.success(list);
    }


    /**
     * 导出成果负责人增删改查列表
     */
    @Log(title = "成果负责人增删改查", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Tecpi tecpi)
    {
        List<Tecpi> list = tecpiService.selectTecpiList(tecpi);
        ExcelUtil<Tecpi> util = new ExcelUtil<Tecpi>(Tecpi.class);
        return util.exportExcel(list, "成果负责人增删改查数据");
    }

    /**
     * 获取成果负责人增删改查详细信息
     */
    @GetMapping(value = "/{piId}")
    public AjaxResult getInfo(@PathVariable("piId") Long piId)
    {
        return AjaxResult.success(tecpiService.selectTecpiByPiid(piId));
    }

    /**
     * 新增成果负责人增删改查
     */
    @Log(title = "成果负责人增删改查", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Tecpi tecpi)
    {
        return toAjax(tecpiService.insertTecpi(tecpi));
    }

    /**
     * 修改成果负责人增删改查
     */
    @Log(title = "成果负责人增删改查", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Tecpi tecpi)
    {
        return AjaxResult.success(tecpiService.updateTecpi(tecpi));
    }

    /**
     * 删除成果负责人增删改查
     */
    @Log(title = "成果负责人增删改查", businessType = BusinessType.DELETE)
	@DeleteMapping("/{piIds}")
    public AjaxResult remove(@PathVariable Long[] piIds)
    {
        return toAjax(tecpiService.deleteTecpiByPiids(piIds));
    }

}

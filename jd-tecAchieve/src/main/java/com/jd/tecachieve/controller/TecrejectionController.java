package com.jd.tecachieve.controller;

import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import com.jd.tecachieve.domain.Tecrejection;
import com.jd.tecachieve.service.ITecrejectionService;
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
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 驳回信息Controller
 * 
 * @author ruoyi
 * @date 2023-10-25
 */
@RestController
@RequestMapping("/tec/tecrejection")
public class TecrejectionController extends BaseController
{
    @Autowired
    private ITecrejectionService tecrejectionService;

    /**
     * 查询驳回信息列表
     */
    @GetMapping("/list")
    public TableDataInfo list(Tecrejection tecrejection)
    {
        startPage();
        List<Tecrejection> list = tecrejectionService.selectTecrejectionList(tecrejection);
        return getDataTable(list);
    }

    /**
     * 导出驳回信息列表
     */
    @Log(title = "驳回信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Tecrejection tecrejection)
    {
        List<Tecrejection> list = tecrejectionService.selectTecrejectionList(tecrejection);
        ExcelUtil<Tecrejection> util = new ExcelUtil<Tecrejection>(Tecrejection.class);
        util.exportExcel(response, list, "驳回信息数据");
    }

    /**
     * 获取驳回信息详细信息
     */
    @GetMapping(value = "/gettecrejection")
    public AjaxResult getInfo(@PathVariable("rejectionId") Long rejectionId)
    {
        return AjaxResult.success(tecrejectionService.selectTecrejectionByRejectionId(rejectionId));
    }
    /**
     * 根据achievementId获取列表数据
     */
    @GetMapping("/getListByachievementId")
    public TableDataInfo getListByachievementId(Long achievementid)
    {
        List<Tecrejection> list = tecrejectionService.getListByachievementId(achievementid);
        return getDataTable(list);
    }
    /**
     * 新增驳回信息
     */
    @Log(title = "驳回信息", businessType = BusinessType.INSERT)
    @PostMapping("/addrejection")
    public AjaxResult add(@RequestBody Tecrejection tecrejection)
    {
        Date now = new Date();
        tecrejection.setRejectionDate(now);
        return toAjax(tecrejectionService.insertTecrejection(tecrejection));
    }

    /**
     * 修改驳回信息
     */
    @Log(title = "驳回信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Tecrejection tecrejection)
    {
        return toAjax(tecrejectionService.updateTecrejection(tecrejection));
    }

    /**
     * 删除驳回信息
     */
    @Log(title = "驳回信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{rejectionIds}")
    public AjaxResult remove(@PathVariable Long[] rejectionIds)
    {
        return toAjax(tecrejectionService.deleteTecrejectionByRejectionIds(rejectionIds));
    }
}

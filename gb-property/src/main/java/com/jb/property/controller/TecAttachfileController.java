package com.jb.property.controller;

import java.util.List;

import com.jb.property.domain.TecAttachfile;
import com.jb.property.service.ITecAttachfileService;
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
 * 科技成果附件Controller
 *
 * @author ruoyi
 * @date 2023-08-17
 */
@RestController
@RequestMapping("/tec/attachfile")
public class TecAttachfileController extends BaseController
{
    @Autowired
    private ITecAttachfileService tecAttachfileService;

    /**
     * 查询科技成果附件列表
     */
//    @PreAuthorize("@ss.hasPermi('system:attachfile:list')")
    @GetMapping("/list")
    public TableDataInfo list(TecAttachfile tecAttachfile)
    {
        startPage();
        List<TecAttachfile> list = tecAttachfileService.selectTecAttachfileList(tecAttachfile);
        return getDataTable(list);
    }

    /**
     * 查询所有科技成果附件列表
     */
//    @PreAuthorize("@ss.hasPermi('system:attachfile:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(TecAttachfile tecAttachfile)
    {
        List<TecAttachfile> list = tecAttachfileService.selectTecAttachfileList(tecAttachfile);
        return AjaxResult.success(list);
    }



    /**
     * 导出科技成果附件列表
     */
//    @PreAuthorize("@ss.hasPermi('system:attachfile:export')")
    @Log(title = "科技成果附件", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(TecAttachfile tecAttachfile)
    {
        List<TecAttachfile> list = tecAttachfileService.selectTecAttachfileList(tecAttachfile);
        ExcelUtil<TecAttachfile> util = new ExcelUtil<TecAttachfile>(TecAttachfile.class);
        return util.exportExcel(list, "科技成果附件数据");
    }

    /**
     * 获取科技成果附件详细信息
     */
//    @PreAuthorize("@ss.hasPermi('system:attachfile:query')")
    @GetMapping(value = "/{fileId}")
    public AjaxResult getInfo(@PathVariable("fileId") Integer fileId)
    {
        return AjaxResult.success(tecAttachfileService.selectTecAttachfileByFileId(fileId));
    }

    /**
     * 新增科技成果附件
     */
//    @PreAuthorize("@ss.hasPermi('system:attachfile:add')")
    @Log(title = "科技成果附件", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TecAttachfile tecAttachfile)
    {
        return toAjax(tecAttachfileService.insertTecAttachfile(tecAttachfile));
    }

    /**
     * 修改科技成果附件
     */
//    @PreAuthorize("@ss.hasPermi('system:attachfile:edit')")
    @Log(title = "科技成果附件", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TecAttachfile tecAttachfile)
    {
        return toAjax(tecAttachfileService.updateTecAttachfile(tecAttachfile));
    }

    /**
     * 删除科技成果附件
     */
//    @PreAuthorize("@ss.hasPermi('system:attachfile:remove')")
    @Log(title = "科技成果附件", businessType = BusinessType.DELETE)
	@DeleteMapping("/{fileIds}")
    public AjaxResult remove(@PathVariable Integer[] fileIds)
    {
        return toAjax(tecAttachfileService.deleteTecAttachfileByFileIds(fileIds));
    }

}

package com.jb.property.controller;

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
import com.jb.property.domain.PropertyAttachFile;
import com.jb.property.service.IPropertyAttachFileService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 知识产权附件Controller
 *
 * @author ruoyi
 * @date 2022-04-30
 */
@RestController
@RequestMapping("/property/propertyAttachFile")
public class PropertyAttachFileController extends BaseController
{
    @Autowired
    private IPropertyAttachFileService propertyAttachFileService;

    /**
     * 查询知识产权附件列表
     */
//    @PreAuthorize("@ss.hasPermi('property:propertyAttachFile:list')")
    @GetMapping("/list")
    public TableDataInfo list(PropertyAttachFile propertyAttachFile)
    {
        startPage();
        List<PropertyAttachFile> list = propertyAttachFileService.selectPropertyAttachFileList(propertyAttachFile);
        return getDataTable(list);
    }

    /**
     * 查询所有知识产权附件列表
     */
//    @PreAuthorize("@ss.hasPermi('property:propertyAttachFile:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(PropertyAttachFile propertyAttachFile)
    {
        List<PropertyAttachFile> list = propertyAttachFileService.selectPropertyAttachFileList(propertyAttachFile);
        return AjaxResult.success(list);
    }



    /**
     * 导出知识产权附件列表
     */
//    @PreAuthorize("@ss.hasPermi('property:propertyAttachFile:export')")
    @Log(title = "知识产权附件", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(PropertyAttachFile propertyAttachFile)
    {
        List<PropertyAttachFile> list = propertyAttachFileService.selectPropertyAttachFileList(propertyAttachFile);
        ExcelUtil<PropertyAttachFile> util = new ExcelUtil<PropertyAttachFile>(PropertyAttachFile.class);
        return util.exportExcel(list, "知识产权附件数据");
    }

    /**
     * 获取知识产权附件详细信息
     */
//    @PreAuthorize("@ss.hasPermi('property:propertyAttachFile:query')")
    @GetMapping(value = "/{fileId}")
    public AjaxResult getInfo(@PathVariable("fileId") Long fileId)
    {
        return AjaxResult.success(propertyAttachFileService.selectPropertyAttachFileByFileId(fileId));
    }

    /**
     * 新增知识产权附件
     */
//    @PreAuthorize("@ss.hasPermi('property:propertyAttachFile:add')")
    @Log(title = "知识产权附件", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PropertyAttachFile propertyAttachFile)
    {
        return toAjax(propertyAttachFileService.insertPropertyAttachFile(propertyAttachFile));
    }

    /**
     * 修改知识产权附件
     */
//    @PreAuthorize("@ss.hasPermi('property:propertyAttachFile:edit')")
    @Log(title = "知识产权附件", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PropertyAttachFile propertyAttachFile)
    {
        return toAjax(propertyAttachFileService.updatePropertyAttachFile(propertyAttachFile));
    }

    /**
     * 删除知识产权附件
     */
//    @PreAuthorize("@ss.hasPermi('property:propertyAttachFile:remove')")
    @Log(title = "知识产权附件", businessType = BusinessType.DELETE)
	@DeleteMapping("/{fileIds}")
    public AjaxResult remove(@PathVariable Long[] fileIds)
    {
        return toAjax(propertyAttachFileService.deletePropertyAttachFileByFileIds(fileIds));
    }

}

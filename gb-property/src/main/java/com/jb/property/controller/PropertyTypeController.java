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
import com.jb.property.domain.PropertyType;
import com.jb.property.service.IPropertyTypeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 知识产权类型管理Controller
 *
 * @author ruoyi
 * @date 2022-03-05
 */
@RestController
@RequestMapping("/property/type")
public class PropertyTypeController extends BaseController
{
    @Autowired
    private IPropertyTypeService propertyTypeService;

    /**
     * 查询知识产权类型管理列表
     */
//    @PreAuthorize("@ss.hasPermi('property:type:list')")
    @GetMapping("/list")
    public TableDataInfo list(PropertyType propertyType)
    {
        startPage();
        List<PropertyType> list = propertyTypeService.selectPropertyTypeList(propertyType);
        return getDataTable(list);
    }

    /**
     * 查询所有知识产权类型管理列表
     */
    @PreAuthorize("@ss.hasPermi('property:type:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(PropertyType propertyType)
    {
        List<PropertyType> list = propertyTypeService.selectPropertyTypeList(propertyType);
        return AjaxResult.success(list);
    }



    /**
     * 导出知识产权类型管理列表
     */
    @PreAuthorize("@ss.hasPermi('property:type:export')")
    @Log(title = "知识产权类型管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(PropertyType propertyType)
    {
        List<PropertyType> list = propertyTypeService.selectPropertyTypeList(propertyType);
        ExcelUtil<PropertyType> util = new ExcelUtil<PropertyType>(PropertyType.class);
        return util.exportExcel(list, "知识产权类型管理数据");
    }

    /**
     * 获取知识产权类型管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('property:type:query')")
    @GetMapping(value = "/{propertyTypeId}")
    public AjaxResult getInfo(@PathVariable("propertyTypeId") Long propertyTypeId)
    {
        return AjaxResult.success(propertyTypeService.selectPropertyTypeByPropertyTypeId(propertyTypeId));
    }

    /**
     * 新增知识产权类型管理
     */
    @PreAuthorize("@ss.hasPermi('property:type:add')")
    @Log(title = "知识产权类型管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PropertyType propertyType)
    {
        return toAjax(propertyTypeService.insertPropertyType(propertyType));
    }

    /**
     * 修改知识产权类型管理
     */
    @PreAuthorize("@ss.hasPermi('property:type:edit')")
    @Log(title = "知识产权类型管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PropertyType propertyType)
    {
        return toAjax(propertyTypeService.updatePropertyType(propertyType));
    }

    /**
     * 删除知识产权类型管理
     */
    @PreAuthorize("@ss.hasPermi('property:type:remove')")
    @Log(title = "知识产权类型管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{propertyTypeIds}")
    public AjaxResult remove(@PathVariable Long[] propertyTypeIds)
    {
        return toAjax(propertyTypeService.deletePropertyTypeByPropertyTypeIds(propertyTypeIds));
    }

}

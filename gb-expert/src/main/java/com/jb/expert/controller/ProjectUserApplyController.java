package com.jb.expert.controller;

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
import com.jb.expert.domain.ProjectUserApply;
import com.jb.expert.service.IProjectUserApplyService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 申请记录Controller
 *
 * @author ruoyi
 * @date 2022-02-21
 */
@RestController
@RequestMapping("/expert/apply")
public class ProjectUserApplyController extends BaseController
{
    @Autowired
    private IProjectUserApplyService projectUserApplyService;

    /**
     * 查询申请记录列表
     */
    @PreAuthorize("@ss.hasPermi('expert:apply:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProjectUserApply projectUserApply)
    {
        startPage();
        List<ProjectUserApply> list = projectUserApplyService.selectProjectUserApplyList(projectUserApply);
        return getDataTable(list);
    }

    @GetMapping("/mes/{name}")
    public String getMes(@PathVariable("name") String name)
    {
        if(name!=null){
            ProjectUserApply Mes = projectUserApplyService.selectMes(name);
            return Mes.getExamineRemark();
        }
        return "非法请求";
    }

    /**
     * 查询所有申请记录列表
     */
    @PreAuthorize("@ss.hasPermi('expert:apply:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(ProjectUserApply projectUserApply)
    {
        List<ProjectUserApply> list = projectUserApplyService.selectProjectUserApplyList(projectUserApply);
        return AjaxResult.success(list);
    }



    /**
     * 导出申请记录列表
     */
    @PreAuthorize("@ss.hasPermi('expert:apply:export')")
    @Log(title = "申请记录", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ProjectUserApply projectUserApply)
    {
        List<ProjectUserApply> list = projectUserApplyService.selectProjectUserApplyList(projectUserApply);
        ExcelUtil<ProjectUserApply> util = new ExcelUtil<ProjectUserApply>(ProjectUserApply.class);
        return util.exportExcel(list, "申请记录");
    }

    /**
     * 获取申请记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('expert:apply:query')")
    @GetMapping(value = "/{applyId}")
    public AjaxResult getInfo(@PathVariable("applyId") Long applyId)
    {
        return AjaxResult.success(projectUserApplyService.selectProjectUserApplyByApplyId(applyId));
    }

    /**
     * 新增申请记录
     */
    @PreAuthorize("@ss.hasPermi('expert:apply:add')")
    @Log(title = "申请记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProjectUserApply projectUserApply)
    {
        return toAjax(projectUserApplyService.insertProjectUserApply(projectUserApply));
    }

    /**
     * 修改申请记录
     */
    @PreAuthorize("@ss.hasPermi('expert:apply:edit')")
    @Log(title = "申请记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProjectUserApply projectUserApply)
    {
        return toAjax(projectUserApplyService.updateProjectUserApply(projectUserApply));
    }

    /**
     * 删除申请记录
     */
    @PreAuthorize("@ss.hasPermi('expert:apply:remove')")
    @Log(title = "申请记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{applyIds}")
    public AjaxResult remove(@PathVariable Long[] applyIds)
    {
        return toAjax(projectUserApplyService.deleteProjectUserApplyByApplyIds(applyIds));
    }

}

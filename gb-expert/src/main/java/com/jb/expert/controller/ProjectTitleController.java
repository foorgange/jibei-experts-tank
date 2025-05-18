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
import com.jb.expert.domain.ProjectTitle;
import com.jb.expert.service.IProjectTitleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 职称管理Controller
 *
 * @author ruoyi
 * @date 2022-02-20
 */
@RestController
@RequestMapping("/expert/title")
public class ProjectTitleController extends BaseController
{
    @Autowired
    private IProjectTitleService projectTitleService;

    /**
     * 查询职称管理列表
     */

    @GetMapping("/list")
    public TableDataInfo list(ProjectTitle projectTitle)
    {
        startPage();
        List<ProjectTitle> list = projectTitleService.selectProjectTitleList(projectTitle);
        return getDataTable(list);
    }

    /**
     * 查询所有职称管理列表
     */

    @GetMapping("/allList")
    public AjaxResult allList(ProjectTitle projectTitle)
    {
        List<ProjectTitle> list = projectTitleService.selectProjectTitleList(projectTitle);
        return AjaxResult.success(list);
    }



    /**
     * 导出职称管理列表
     */
    @PreAuthorize("@ss.hasPermi('expert:title:export')")
    @Log(title = "职称管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ProjectTitle projectTitle)
    {
        List<ProjectTitle> list = projectTitleService.selectProjectTitleList(projectTitle);
        ExcelUtil<ProjectTitle> util = new ExcelUtil<ProjectTitle>(ProjectTitle.class);
        return util.exportExcel(list, "职称管理数据");
    }

    /**
     * 获取职称管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('expert:title:query')")
    @GetMapping(value = "/{titleId}")
    public AjaxResult getInfo(@PathVariable("titleId") Long titleId)
    {
        return AjaxResult.success(projectTitleService.selectProjectTitleByTitleId(titleId));
    }

    /**
     * 新增职称管理
     */
    @PreAuthorize("@ss.hasPermi('expert:title:add')")
    @Log(title = "职称管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProjectTitle projectTitle)
    {
        return toAjax(projectTitleService.insertProjectTitle(projectTitle));
    }

    /**
     * 修改职称管理
     */
    @PreAuthorize("@ss.hasPermi('expert:title:edit')")
    @Log(title = "职称管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProjectTitle projectTitle)
    {
        return toAjax(projectTitleService.updateProjectTitle(projectTitle));
    }

    /**
     * 删除职称管理
     */
    @PreAuthorize("@ss.hasPermi('expert:title:remove')")
    @Log(title = "职称管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{titleIds}")
    public AjaxResult remove(@PathVariable Long[] titleIds)
    {
        return toAjax(projectTitleService.deleteProjectTitleByTitleIds(titleIds));
    }

}

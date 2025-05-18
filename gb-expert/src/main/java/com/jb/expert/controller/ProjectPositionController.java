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
import com.jb.expert.domain.ProjectPosition;
import com.jb.expert.service.IProjectPositionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 职位管理Controller
 *
 * @author ruoyi
 * @date 2022-02-20
 */
@RestController
@RequestMapping("/expert/position")
public class ProjectPositionController extends BaseController
{
    @Autowired
    private IProjectPositionService projectPositionService;

    /**
     * 查询职位管理列表
     */

    @GetMapping("/list")
    public TableDataInfo list(ProjectPosition projectPosition)
    {
        startPage();
        List<ProjectPosition> list = projectPositionService.selectProjectPositionList(projectPosition);
        return getDataTable(list);
    }

    /**
     * 查询所有职位管理列表
     */

    @GetMapping("/allList")
    public AjaxResult allList(ProjectPosition projectPosition)
    {
        List<ProjectPosition> list = projectPositionService.selectProjectPositionList(projectPosition);
        return AjaxResult.success(list);
    }



    /**
     * 导出职位管理列表
     */
    @PreAuthorize("@ss.hasPermi('expert:position:export')")
    @Log(title = "职位管理", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ProjectPosition projectPosition)
    {
        List<ProjectPosition> list = projectPositionService.selectProjectPositionList(projectPosition);
        ExcelUtil<ProjectPosition> util = new ExcelUtil<ProjectPosition>(ProjectPosition.class);
        return util.exportExcel(list, "职位管理数据");
    }

    /**
     * 获取职位管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('expert:position:query')")
    @GetMapping(value = "/{positionId}")
    public AjaxResult getInfo(@PathVariable("positionId") Long positionId)
    {
        return AjaxResult.success(projectPositionService.selectProjectPositionByPositionId(positionId));
    }

    /**
     * 新增职位管理
     */
    @PreAuthorize("@ss.hasPermi('expert:position:add')")
    @Log(title = "职位管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProjectPosition projectPosition)
    {
        return toAjax(projectPositionService.insertProjectPosition(projectPosition));
    }

    /**
     * 修改职位管理
     */
    @PreAuthorize("@ss.hasPermi('expert:position:edit')")
    @Log(title = "职位管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProjectPosition projectPosition)
    {
        return toAjax(projectPositionService.updateProjectPosition(projectPosition));
    }

    /**
     * 删除职位管理
     */
    @PreAuthorize("@ss.hasPermi('expert:position:remove')")
    @Log(title = "职位管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{positionIds}")
    public AjaxResult remove(@PathVariable Long[] positionIds)
    {
        return toAjax(projectPositionService.deleteProjectPositionByPositionIds(positionIds));
    }

}

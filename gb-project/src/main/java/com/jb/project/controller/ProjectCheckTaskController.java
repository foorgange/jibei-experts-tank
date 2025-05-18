package com.jb.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.alibaba.druid.sql.ast.statement.SQLForeignKeyImpl;
import com.jb.project.domain.OneCheckTask;
import com.jb.project.service.IProjectService;
import com.ruoyi.common.constant.HttpStatus;
import com.ruoyi.common.core.page.PageDomain;
import com.ruoyi.common.core.page.TableSupport;
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
import com.jb.project.domain.ProjectCheckTask;
import com.jb.project.service.IProjectCheckTaskService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 自评互评任务Controller
 *
 * @author ruoyi
 * @date 2022-03-12
 */
@RestController
@RequestMapping("/project/check")
public class ProjectCheckTaskController extends BaseController
{
    @Autowired
    private IProjectCheckTaskService projectCheckTaskService;

    @Autowired
    private IProjectService projectService;

    /**
     * 查询自评互评任务列表
     */
    @PreAuthorize("@ss.hasPermi('project:check:list')")
    @GetMapping("/list")
    public TableDataInfo list(OneCheckTask oneCheckTask)
    {
//        startPage();
        //根据项目名称从project表中获得项目id
        Integer projectId = projectService.getProjectIdByName(oneCheckTask.getProjectName());
        //获得项目名称
        //String projectName = projectCheckTaskService.getProjectNameByProjectId(projectId.longValue());
        //获得项目类型
        //Integer projectType = projectCheckTaskService.getProjectTypeByProjectId();


        //根据项目id从project_check_task表中获得该项目所有记录
        List<ProjectCheckTask> list = projectCheckTaskService.selectProjectCheckTaskListByProjectId(projectId);
        //新建OneCheckTask类型数组
        List<OneCheckTask> newList = new ArrayList<>();
        //遍历list,修改数据后填入newOneCheckTask对象中,再放入newList数组
        for(int i = 0;i < list.size();i ++){
            //oneCheckTask对象存储修改后记录
            OneCheckTask newOneCheckTask = new OneCheckTask();
            if(oneCheckTask.getProjectName() != null){
                newOneCheckTask.setProjectName(oneCheckTask.getProjectName());
            }else {
                newOneCheckTask.setProjectName(projectCheckTaskService.getProjectNameByProjectId(list.get(i).getProjectId()));
            }
            newOneCheckTask.setUserName(projectCheckTaskService.getUserNameByUserId(list.get(i).getUserId()));
            newOneCheckTask.setSubjectName(projectCheckTaskService.getUserNameByUserId(list.get(i).getSubjectId()));
            newOneCheckTask.setIndicator1(list.get(i).getIndicator1());
            newOneCheckTask.setIndicator2(list.get(i).getIndicator2());
            newOneCheckTask.setIndicator3(list.get(i).getIndicator3());
            newOneCheckTask.setIndicator4(list.get(i).getIndicator4());
            newOneCheckTask.setIndicator5(list.get(i).getIndicator5());
            newOneCheckTask.setIndicator6(list.get(i).getIndicator6());
            newList.add(newOneCheckTask);
        }

        //处理分页
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();

        //分页数据
        List<OneCheckTask> li = newList;
        List<OneCheckTask> currentList = page(li,pageNum,pageSize);

        //将结果包装为tabledatainfo
        TableDataInfo rspData = new TableDataInfo();
        rspData.setRows(currentList);
        rspData.setTotal(newList.size());
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");

        return rspData;

    }

    /**
     * 单个项目评价汇总
     */
    @PreAuthorize("@ss.hasPermi('project:check:sumlist')")
    @GetMapping("/sumlist")
    public TableDataInfo sumlist(OneCheckTask oneCheckTask)
    {
        //根据项目名称从project表中获得项目id
        Integer projectId = projectService.getProjectIdByName(oneCheckTask.getProjectName());
        //获得项目名称
        //String projectName = projectCheckTaskService.getProjectNameByProjectId(projectId.longValue());
        //获得项目类型
        //Integer projectType = projectCheckTaskService.getProjectTypeByProjectId();


        //根据项目id从project_check_task表中获得该项目所有记录
        List<ProjectCheckTask> list = projectCheckTaskService.selectProjectCheckTaskListByProjectId(projectId);
        //新建OneCheckTask类型数组
        List<OneCheckTask> newList = new ArrayList<>();
        //遍历list,修改数据后填入newOneCheckTask对象中,再放入newList数组
        for(int i = 0;i < list.size();i ++){
            boolean flag = true; //ture表示是newList中无数据
            int j;
            String subjectName = projectCheckTaskService.getUserNameByUserId(list.get(i).getSubjectId());
            if(newList.size() != 0){
                for(j = 0;j < newList.size();j ++){
                    if(subjectName.equals(newList.get(j).getSubjectName())){
                        flag = false;
                        break;
                    }
                }
                if(flag){
                    //oneCheckTask对象存储修改后记录
                    OneCheckTask newOneCheckTask = new OneCheckTask();
                    newOneCheckTask.setProjectName(oneCheckTask.getProjectName());
                    newOneCheckTask.setUserName(projectCheckTaskService.getUserNameByUserId(list.get(i).getUserId()));
                    newOneCheckTask.setSubjectName(projectCheckTaskService.getUserNameByUserId(list.get(i).getSubjectId()));
                    newOneCheckTask.setIndicator1(list.get(i).getIndicator1());
                    newOneCheckTask.setIndicator2(list.get(i).getIndicator2());
                    newOneCheckTask.setIndicator3(list.get(i).getIndicator3());
                    newOneCheckTask.setIndicator4(list.get(i).getIndicator4());
                    newOneCheckTask.setIndicator5(list.get(i).getIndicator5());
                    newOneCheckTask.setIndicator6(list.get(i).getIndicator6());
                    newList.add(newOneCheckTask);
                }else {
                    OneCheckTask newOneCheckTask = newList.get(j);
                    Long indicator1;
                    if(newList.get(j).getIndicator1() == null){
                        indicator1 = 0L;
                    }else
                        indicator1 = newList.get(j).getIndicator1();
                    Long indicator2;
                    if(newList.get(j).getIndicator2() == null){
                        indicator2 = 0L;
                    }else
                        indicator2 = newList.get(j).getIndicator2();
                    Long indicator3;
                    if(newList.get(j).getIndicator3() == null){
                        indicator3 = 0L;
                    }else
                        indicator3 = newList.get(j).getIndicator3();
                    Long indicator4;
                    if(newList.get(j).getIndicator4() == null){
                        indicator4 = 0L;
                    }else
                        indicator4 = newList.get(j).getIndicator4();
                    Long indicator5;
                    if(newList.get(j).getIndicator5() == null){
                        indicator5 = 0L;
                    }else
                        indicator5 = newList.get(j).getIndicator5();
                    Long indicator6;
                    if(newList.get(j).getIndicator6() == null){
                        indicator6 = 0L;
                    }else
                        indicator6 = newList.get(j).getIndicator6();

                    Long i1;
                    if(list.get(i).getIndicator1() == null){
                        i1 = 0L;
                    }else
                        i1 = list.get(i).getIndicator1();
                    Long i2;
                    if(list.get(i).getIndicator2() == null){
                        i2 = 0L;
                    }else
                        i2 = list.get(i).getIndicator2();
                    Long i3;
                    if(list.get(i).getIndicator3() == null){
                        i3 = 0L;
                    }else
                        i3 = list.get(i).getIndicator3();
                    Long i4;
                    if(list.get(i).getIndicator4() == null){
                        i4 = 0L;
                    }else
                        i4 = list.get(i).getIndicator4();
                    Long i5;
                    if(list.get(i).getIndicator5() == null){
                        i5 = 0L;
                    }else
                        i5 = list.get(i).getIndicator5();
                    Long i6;
                    if(list.get(i).getIndicator6() == null){
                        i6 = 0L;
                    }else
                        i6 = list.get(i).getIndicator6();

                    newOneCheckTask.setProjectName(oneCheckTask.getProjectName());
                    newOneCheckTask.setIndicator1(indicator1 + i1);
                    newOneCheckTask.setIndicator2(indicator2 + i2);
                    newOneCheckTask.setIndicator3(indicator3 + i3);
                    newOneCheckTask.setIndicator4(indicator4 + i4);
                    newOneCheckTask.setIndicator5(indicator5 + i5);
                    newOneCheckTask.setIndicator6(indicator6 + i6);
                    newList.set(j,newOneCheckTask);
                }
            }else {
                //oneCheckTask对象存储修改后记录
                OneCheckTask newOneCheckTask = new OneCheckTask();
                newOneCheckTask.setProjectName(oneCheckTask.getProjectName());
                newOneCheckTask.setUserName(null);
                newOneCheckTask.setSubjectName(projectCheckTaskService.getUserNameByUserId(list.get(i).getSubjectId()));
                newOneCheckTask.setIndicator1(list.get(i).getIndicator1());
                newOneCheckTask.setIndicator2(list.get(i).getIndicator2());
                newOneCheckTask.setIndicator3(list.get(i).getIndicator3());
                newOneCheckTask.setIndicator4(list.get(i).getIndicator4());
                newOneCheckTask.setIndicator5(list.get(i).getIndicator5());
                newOneCheckTask.setIndicator6(list.get(i).getIndicator6());
                newList.add(newOneCheckTask);
            }

        }

        //处理分页
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();

        //分页数据
        List<OneCheckTask> li = newList;
        List<OneCheckTask> currentList = page(li,pageNum,pageSize);

        //将结果包装为tabledatainfo
        TableDataInfo rspData = new TableDataInfo();
        rspData.setRows(currentList);
        rspData.setTotal(newList.size());
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");

        return rspData;

    }

    public static List<OneCheckTask> page(List<OneCheckTask> datalist, Integer page, Integer size) {
        List<OneCheckTask> list = new ArrayList<>();
        if (datalist != null && datalist.size() > 0) {
            int cuurIdx = (page > 1 ? (page - 1) * size : 0);
            for (int i = 0; i < size && i < datalist.size() - cuurIdx; i++) {
                OneCheckTask user = datalist.get(cuurIdx + i);
                list.add(user);
            }
        }
        return list;
    }

    /**
     * 查询所有自评互评任务列表
     */
    @PreAuthorize("@ss.hasPermi('project:check:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(ProjectCheckTask projectCheckTask)
    {
        List<ProjectCheckTask> list = projectCheckTaskService.selectProjectCheckTaskList(projectCheckTask);
        return AjaxResult.success(list);
    }



//    /**
//     * 导出自评互评任务列表
//     */
//    @PreAuthorize("@ss.hasPermi('project:check:export')")
//    @Log(title = "自评互评任务", businessType = BusinessType.EXPORT)
//    @GetMapping("/export")
//    public AjaxResult export(ProjectCheckTask projectCheckTask)
//    {
//        List<ProjectCheckTask> list = projectCheckTaskService.selectProjectCheckTaskList(projectCheckTask);
//        ExcelUtil<ProjectCheckTask> util = new ExcelUtil<ProjectCheckTask>(ProjectCheckTask.class);
//        return util.exportExcel(list, "自评互评任务数据");
//    }

    /**
     * 获取自评互评任务详细信息
     */
    @PreAuthorize("@ss.hasPermi('project:check:query')")
    @GetMapping(value = "/{checkTaskId}")
    public AjaxResult getInfo(@PathVariable("checkTaskId") Long checkTaskId)
    {
        return AjaxResult.success(projectCheckTaskService.selectProjectCheckTaskByCheckTaskId(checkTaskId));
    }

    /**
     * 新增自评互评任务
     */
    @PreAuthorize("@ss.hasPermi('project:check:add')")
    @Log(title = "自评互评任务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ProjectCheckTask projectCheckTask)
    {
        return toAjax(projectCheckTaskService.insertProjectCheckTask(projectCheckTask));
    }

    /**
     * 修改自评互评任务
     */
    @PreAuthorize("@ss.hasPermi('project:check:edit')")
    @Log(title = "自评互评任务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ProjectCheckTask projectCheckTask)
    {
        return toAjax(projectCheckTaskService.updateProjectCheckTask(projectCheckTask));
    }

    /**
     * 删除自评互评任务
     */
    @PreAuthorize("@ss.hasPermi('project:check:remove')")
    @Log(title = "自评互评任务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{checkTaskIds}")
    public AjaxResult remove(@PathVariable Long[] checkTaskIds)
    {
        return toAjax(projectCheckTaskService.deleteProjectCheckTaskByCheckTaskIds(checkTaskIds));
    }

}

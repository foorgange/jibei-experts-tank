package com.jb.property.controller;

import com.alibaba.fastjson.JSONObject;
import com.jb.property.domain.ProjectProperty;
import com.jb.property.domain.ProjectUserProperty;
import com.jb.property.domain.PropertyAttachFile;
import com.jb.property.service.IProjectPropertyService;
import com.jb.property.service.IProjectUserPropertyService;
import com.jb.property.service.IPropertyAttachFileService;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 知识产权Controller
 *
 * @author ruoyi
 * @date 2022-03-05
 */
@RestController
@RequestMapping("/property/propertys")
public class ProjectPropertyController extends BaseController {
    @Autowired
    private IProjectPropertyService projectPropertyService;
    @Autowired
    private IProjectUserPropertyService projectUserPropertyService;
    @Autowired
    private IPropertyAttachFileService propertyAttachFileService;

    /**
     * 查询知识产权列表
     */
//    @PreAuthorize("@ss.hasPermi('property:propertys:list')")
    @GetMapping("/list")
    public TableDataInfo list(ProjectProperty projectProperty) {
        startPage();
        List<ProjectProperty> list = projectPropertyService.selectProjectPropertyList(projectProperty);
        return getDataTable(list);
    }

    /**
     * 查询所有知识产权列表
     */
//    @PreAuthorize("@ss.hasPermi('property:propertys:allList')")
    @GetMapping("/allList")
    public AjaxResult allList(ProjectProperty projectProperty) {
        List<ProjectProperty> list = projectPropertyService.selectProjectPropertyList(projectProperty);
        return AjaxResult.success(list);
    }


    /**
     * 导出知识产权列表
     */
//    @PreAuthorize("@ss.hasPermi('property:propertys:export')")
    @Log(title = "知识产权", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(ProjectProperty projectProperty) {
        List<ProjectProperty> list = projectPropertyService.selectProjectPropertyList(projectProperty);
//        List<ProjectUserProperty> puplist;
//        for(ProjectProperty item : list){
//            puplist = projectUserPropertyService.selectPropertyWorkerList(item.getPropertyId());
//            item.setPropertyWorker(puplist);
//        }
        ExcelUtil<ProjectProperty> util = new ExcelUtil<ProjectProperty>(ProjectProperty.class);
        return util.exportExcel(list, "知识产权数据");
    }

    /**
     * 获取知识产权详细信息
     */
//    @PreAuthorize("@ss.hasPermi('property:propertys:query')")
    @GetMapping(value = "/{propertyId}")
    public AjaxResult getInfo(@PathVariable("propertyId") Long propertyId) {
        ProjectProperty projectProperty = projectPropertyService.selectProjectPropertyByPropertyId(propertyId);
        List<ProjectUserProperty> list = projectUserPropertyService.selectPropertyWorkerList(propertyId);
        projectProperty.setPropertyWorker((list));
        return AjaxResult.success(projectProperty);
    }

    /**
     * 新增知识产权
     */
//    @PreAuthorize("@ss.hasPermi('property:propertys:add')")
    @Log(title = "知识产权", businessType = BusinessType.INSERT)
    @PostMapping("/addWithFile")
    public AjaxResult add(@RequestParam("file") MultipartFile[] file, @RequestParam("form") String projectPropertyForm) throws IOException {
        ProjectProperty projectProperty = JSONObject.parseObject(projectPropertyForm, ProjectProperty.class);
//        ProjectProperty projectProperty = (ProjectProperty) propertyInfo.get(formName);
        Long resId = projectPropertyService.getPropertyIdByName(projectProperty.getPropertyName());
        if (resId != null) {
            return AjaxResult.error("已有重名知识产权");
        } else {
            Long propertyId = projectPropertyService.insertProjectProperty(projectProperty);
            // 循环插入文件
            for (int i = 0; i < file.length; i++) {
                PropertyAttachFile fileItem = new PropertyAttachFile();
                // 上传文件路径
                String filePath = FileUploadUtils.upload(RuoYiConfig.getTemplatePath(), file[i]);
                // 设置属性
                fileItem.setFileName(file[i].getOriginalFilename());
                fileItem.setPropertyId(propertyId);
                fileItem.setFilePath(filePath);

                propertyAttachFileService.insertPropertyAttachFile(fileItem);
            }
            return AjaxResult.success("知识产权添加完成");
        }
    }

    @Log(title = "知识产权", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestParam("form") String projectPropertyForm) throws IOException {
        ProjectProperty projectProperty = JSONObject.parseObject(projectPropertyForm, ProjectProperty.class);
//        ProjectProperty projectProperty = (ProjectProperty) propertyInfo.get(formName);
        Long resId = projectPropertyService.getPropertyIdByName(projectProperty.getPropertyName());
        if (resId != null) {
            return AjaxResult.error("已有重名知识产权");
        } else {
            Long propertyId = projectProperty.getPropertyId();
            projectPropertyService.insertProjectProperty(projectProperty);
            return AjaxResult.success("知识产权添加完成");
        }
    }
    /**
     * 修改有文件上传的知识产权
     */
//    @PreAuthorize("@ss.hasPermi('property:propertys:edit')")
    @Log(title = "知识产权", businessType = BusinessType.UPDATE)
    @PutMapping("/addFiles")
    public AjaxResult edit(@RequestParam("file") MultipartFile[] file, @RequestParam("form") String projectPropertyForm) throws IOException {
        ProjectProperty projectProperty = JSONObject.parseObject(projectPropertyForm, ProjectProperty.class);

        Long resId = projectPropertyService.getPropertyIdByName(projectProperty.getPropertyName());

        if (resId != null && resId != projectProperty.getPropertyId()) {
            return AjaxResult.error("已有重名知识产权");
        } else {
            Long propertyId = projectProperty.getPropertyId();
//            Long propertyId = projectPropertyService.insertProjectProperty(projectProperty);
            // 循环插入文件
            for (int i = 0; i < file.length; i++) {
                PropertyAttachFile fileItem = new PropertyAttachFile();
                // 上传文件路径
                String filePath = FileUploadUtils.upload(RuoYiConfig.getTemplatePath(), file[i]);
                // 设置属性
                fileItem.setFileName(file[i].getOriginalFilename());
                fileItem.setPropertyId(propertyId);
                fileItem.setFilePath(filePath);

                propertyAttachFileService.insertPropertyAttachFile(fileItem);
            }
            projectPropertyService.updateProjectProperty(projectProperty);
            return AjaxResult.success("知识产权更新完成");
//            return toAjax();
        }
    }

    /**
     * 修改无上传文件的知识产权
     * @param projectPropertyForm
     * @return
     * @throws IOException
     */
    @Log(title = "知识产权", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestParam("form") String projectPropertyForm) throws IOException {
        ProjectProperty projectProperty = JSONObject.parseObject(projectPropertyForm, ProjectProperty.class);

        Long resId = projectPropertyService.getPropertyIdByName(projectProperty.getPropertyName());

        if (resId != null && resId != projectProperty.getPropertyId()) {
            return AjaxResult.error("已有重名知识产权");
        } else {
            projectPropertyService.updateProjectProperty(projectProperty);
            return AjaxResult.success("知识产权更新完成");
//            return toAjax();
        }
    }

    /**
     * 删除知识产权
     */
    @PreAuthorize("@ss.hasPermi('property:propertys:remove')")
    @Log(title = "知识产权", businessType = BusinessType.DELETE)
    @DeleteMapping("/{propertyIds}")
    public AjaxResult remove(@PathVariable Long[] propertyIds) {
        return toAjax(projectPropertyService.deleteProjectPropertyByPropertyIds(propertyIds));
    }


//    //根据产权id查询所有作者
//    public AjaxResult allWorker(Long projectId)
//    {
//        List<String> list = projectPropertyService.selectPropertyWorkerList(projectId);
//        ProjectProperty projectProperty = new ProjectProperty();
//        projectProperty.setPropertyWorker(list);
//        return AjaxResult.success(projectProperty);
//    }

    //加入知识产权信息
    public AjaxResult addPropertyWorker(@RequestBody ProjectProperty projectProperty) {
        //获得产权到期时间
        Date date1 = projectProperty.getFinishTime();
        //获得当前时间
        Date date2 = new Date();
        if (date1.after(date2)) {
            projectPropertyService.updateFareStatus();
            return AjaxResult.error("知识产权已到期");
        } else {
            //根据产权名称查询产权id
            Long resId = projectPropertyService.getPropertyIdByName(projectProperty.getPropertyName());
            //新建projectUserProperty对象存储产权id和作者
            ProjectUserProperty projectUserProperty = new ProjectUserProperty();
            projectUserProperty.setPropertyId((Long.valueOf(resId)));
            projectUserProperty.setUserNickName(projectProperty.getAuth());
            //将产权id和作者存储到产权作者关联表
            return AjaxResult.success(projectPropertyService.insertUserProjectProperty(projectUserProperty));
        }
    }

    /**
     * 上传多个知识产权附件
     *
     * @return
     */

    @PostMapping("/uploadFiles")
    public AjaxResult uploadAttachFiles(@RequestParam Map<String, MultipartFile> formData) throws IOException {
//        System.out.println(formData);
        for (int i = 0; i < formData.size(); i++) {
            String fileName = "file" + i;

            MultipartFile file = formData.get(fileName);
            String AttachFilePath = FileUploadUtils.upload(RuoYiConfig.getTemplatePath(), file);

            PropertyAttachFile propertyAttachFile = new PropertyAttachFile();
            propertyAttachFile.setFileName(file.getOriginalFilename());
            propertyAttachFile.setFilePath(AttachFilePath);
//            propertyAttachFile.setPropertyId();

            propertyAttachFileService.insertPropertyAttachFile(propertyAttachFile);
        }
        return AjaxResult.success("成功");
    }
    @PostMapping("/testUploadFile")
    public AjaxResult uploadFile(){

        System.out.println("-------请求到文件上传接口：testUploadFile-----");
        return AjaxResult.success("请求到接口");
    }
}

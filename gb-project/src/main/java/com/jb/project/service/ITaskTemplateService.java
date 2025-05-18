package com.jb.project.service;

import java.util.List;
import com.jb.project.domain.TaskTemplate;

/**
 * 模板管理Service接口
 * 
 * @author ruoyi
 * @date 2022-03-12
 */
public interface ITaskTemplateService 
{
    /**
     * 查询模板管理
     * 
     * @param templateId 模板管理主键
     * @return 模板管理
     */
    public TaskTemplate selectTaskTemplateByTemplateId(Long templateId);

    /**
     * 查询模板管理列表
     * 
     * @param taskTemplate 模板管理
     * @return 模板管理集合
     */
    public List<TaskTemplate> selectTaskTemplateList(TaskTemplate taskTemplate);

    /**
     * 新增模板管理
     * 
     * @param taskTemplate 模板管理
     * @return 结果
     */
    public int insertTaskTemplate(TaskTemplate taskTemplate);

    /**
     * 修改模板管理
     * 
     * @param taskTemplate 模板管理
     * @return 结果
     */
    public int updateTaskTemplate(TaskTemplate taskTemplate);

    /**
     * 批量删除模板管理
     * 
     * @param templateIds 需要删除的模板管理主键集合
     * @return 结果
     */
    public int deleteTaskTemplateByTemplateIds(Long[] templateIds);

    /**
     * 删除模板管理信息
     * 
     * @param templateId 模板管理主键
     * @return 结果
     */
    public int deleteTaskTemplateByTemplateId(Long templateId);

}

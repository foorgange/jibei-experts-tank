package com.jb.project.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.project.mapper.TaskTemplateMapper;
import com.jb.project.domain.TaskTemplate;
import com.jb.project.service.ITaskTemplateService;

/**
 * 模板管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-03-12
 */
@Service
public class TaskTemplateServiceImpl implements ITaskTemplateService 
{
    @Autowired
    private TaskTemplateMapper taskTemplateMapper;

    /**
     * 查询模板管理
     * 
     * @param templateId 模板管理主键
     * @return 模板管理
     */
    @Override
    public TaskTemplate selectTaskTemplateByTemplateId(Long templateId)
    {
        return taskTemplateMapper.selectTaskTemplateByTemplateId(templateId);
    }

    /**
     * 查询模板管理列表
     * 
     * @param taskTemplate 模板管理
     * @return 模板管理
     */
    @Override
    public List<TaskTemplate> selectTaskTemplateList(TaskTemplate taskTemplate)
    {
        return taskTemplateMapper.selectTaskTemplateList(taskTemplate);
    }

    /**
     * 新增模板管理
     * 
     * @param taskTemplate 模板管理
     * @return 结果
     */
    @Override
    public int insertTaskTemplate(TaskTemplate taskTemplate)
    {
        return taskTemplateMapper.insertTaskTemplate(taskTemplate);
    }

    /**
     * 修改模板管理
     * 
     * @param taskTemplate 模板管理
     * @return 结果
     */
    @Override
    public int updateTaskTemplate(TaskTemplate taskTemplate)
    {
        return taskTemplateMapper.updateTaskTemplate(taskTemplate);
    }

    /**
     * 批量删除模板管理
     * 
     * @param templateIds 需要删除的模板管理主键
     * @return 结果
     */
    @Override
    public int deleteTaskTemplateByTemplateIds(Long[] templateIds)
    {
        return taskTemplateMapper.deleteTaskTemplateByTemplateIds(templateIds);
    }

    /**
     * 删除模板管理信息
     * 
     * @param templateId 模板管理主键
     * @return 结果
     */
    @Override
    public int deleteTaskTemplateByTemplateId(Long templateId)
    {
        return taskTemplateMapper.deleteTaskTemplateByTemplateId(templateId);
    }
}

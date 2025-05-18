package com.jb.project.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.project.mapper.ExpertTemplateMapper;
import com.jb.project.domain.ExpertTemplate;
import com.jb.project.service.IExpertTemplateService;

/**
 * 用户私有模板Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-26
 */
@Service
public class ExpertTemplateServiceImpl implements IExpertTemplateService 
{
    @Autowired
    private ExpertTemplateMapper expertTemplateMapper;

    /**
     * 查询用户私有模板
     * 
     * @param templateId 用户私有模板主键
     * @return 用户私有模板
     */
    @Override
    public ExpertTemplate selectExpertTemplateByTemplateId(Long templateId)
    {
        return expertTemplateMapper.selectExpertTemplateByTemplateId(templateId);
    }

    /**
     * 查询用户私有模板列表
     * 
     * @param expertTemplate 用户私有模板
     * @return 用户私有模板
     */
    @Override
    public List<ExpertTemplate> selectExpertTemplateList(ExpertTemplate expertTemplate)
    {
        return expertTemplateMapper.selectExpertTemplateList(expertTemplate);
    }

    /**
     * 新增用户私有模板
     * 
     * @param expertTemplate 用户私有模板
     * @return 结果
     */
    @Override
    public int insertExpertTemplate(ExpertTemplate expertTemplate)
    {
        return expertTemplateMapper.insertExpertTemplate(expertTemplate);
    }

    /**
     * 修改用户私有模板
     * 
     * @param expertTemplate 用户私有模板
     * @return 结果
     */
    @Override
    public int updateExpertTemplate(ExpertTemplate expertTemplate)
    {
        return expertTemplateMapper.updateExpertTemplate(expertTemplate);
    }

    /**
     * 批量删除用户私有模板
     * 
     * @param templateIds 需要删除的用户私有模板主键
     * @return 结果
     */
    @Override
    public int deleteExpertTemplateByTemplateIds(Long[] templateIds)
    {
        return expertTemplateMapper.deleteExpertTemplateByTemplateIds(templateIds);
    }

    /**
     * 删除用户私有模板信息
     * 
     * @param templateId 用户私有模板主键
     * @return 结果
     */
    @Override
    public int deleteExpertTemplateByTemplateId(Long templateId)
    {
        return expertTemplateMapper.deleteExpertTemplateByTemplateId(templateId);
    }

}

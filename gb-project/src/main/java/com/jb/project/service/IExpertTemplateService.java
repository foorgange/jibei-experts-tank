package com.jb.project.service;

import java.util.List;
import com.jb.project.domain.ExpertTemplate;

/**
 * 用户私有模板Service接口
 * 
 * @author ruoyi
 * @date 2022-04-26
 */
public interface IExpertTemplateService 
{
    /**
     * 查询用户私有模板
     * 
     * @param templateId 用户私有模板主键
     * @return 用户私有模板
     */
    public ExpertTemplate selectExpertTemplateByTemplateId(Long templateId);

    /**
     * 查询用户私有模板列表
     * 
     * @param expertTemplate 用户私有模板
     * @return 用户私有模板集合
     */
    public List<ExpertTemplate> selectExpertTemplateList(ExpertTemplate expertTemplate);

    /**
     * 新增用户私有模板
     * 
     * @param expertTemplate 用户私有模板
     * @return 结果
     */
    public int insertExpertTemplate(ExpertTemplate expertTemplate);

    /**
     * 修改用户私有模板
     * 
     * @param expertTemplate 用户私有模板
     * @return 结果
     */
    public int updateExpertTemplate(ExpertTemplate expertTemplate);

    /**
     * 批量删除用户私有模板
     * 
     * @param templateIds 需要删除的用户私有模板主键集合
     * @return 结果
     */
    public int deleteExpertTemplateByTemplateIds(Long[] templateIds);

    /**
     * 删除用户私有模板信息
     * 
     * @param templateId 用户私有模板主键
     * @return 结果
     */
    public int deleteExpertTemplateByTemplateId(Long templateId);

}

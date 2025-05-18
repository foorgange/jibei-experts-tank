package com.jb.expert.service;

import java.util.List;
import com.jb.expert.domain.ExpertClass;

/**
 * 专家类别管理Service接口
 * 
 * @author ruoyi
 * @date 2022-02-20
 */
public interface IExpertClassService 
{
    /**
     * 查询专家类别管理
     * 
     * @param classId 专家类别管理主键
     * @return 专家类别管理
     */
    public ExpertClass selectExpertClassByClassId(Long classId);

    /**
     * 查询专家类别管理列表
     * 
     * @param expertClass 专家类别管理
     * @return 专家类别管理集合
     */
    public List<ExpertClass> selectExpertClassList(ExpertClass expertClass);

    /**
     * 新增专家类别管理
     * 
     * @param expertClass 专家类别管理
     * @return 结果
     */
    public int insertExpertClass(ExpertClass expertClass);

    /**
     * 修改专家类别管理
     * 
     * @param expertClass 专家类别管理
     * @return 结果
     */
    public int updateExpertClass(ExpertClass expertClass);

    /**
     * 批量删除专家类别管理
     * 
     * @param classIds 需要删除的专家类别管理主键集合
     * @return 结果
     */
    public int deleteExpertClassByClassIds(Long[] classIds);

    /**
     * 删除专家类别管理信息
     * 
     * @param classId 专家类别管理主键
     * @return 结果
     */
    public int deleteExpertClassByClassId(Long classId);

}

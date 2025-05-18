package com.jb.expert.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.expert.mapper.ExpertClassMapper;
import com.jb.expert.domain.ExpertClass;
import com.jb.expert.service.IExpertClassService;

/**
 * 专家类别管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-02-20
 */
@Service
public class ExpertClassServiceImpl implements IExpertClassService 
{
    @Autowired
    private ExpertClassMapper expertClassMapper;

    /**
     * 查询专家类别管理
     * 
     * @param classId 专家类别管理主键
     * @return 专家类别管理
     */
    @Override
    public ExpertClass selectExpertClassByClassId(Long classId)
    {
        return expertClassMapper.selectExpertClassByClassId(classId);
    }

    /**
     * 查询专家类别管理列表
     * 
     * @param expertClass 专家类别管理
     * @return 专家类别管理
     */
    @Override
    public List<ExpertClass> selectExpertClassList(ExpertClass expertClass)
    {
        return expertClassMapper.selectExpertClassList(expertClass);
    }

    /**
     * 新增专家类别管理
     * 
     * @param expertClass 专家类别管理
     * @return 结果
     */
    @Override
    public int insertExpertClass(ExpertClass expertClass)
    {
        return expertClassMapper.insertExpertClass(expertClass);
    }

    /**
     * 修改专家类别管理
     * 
     * @param expertClass 专家类别管理
     * @return 结果
     */
    @Override
    public int updateExpertClass(ExpertClass expertClass)
    {
        return expertClassMapper.updateExpertClass(expertClass);
    }

    /**
     * 批量删除专家类别管理
     * 
     * @param classIds 需要删除的专家类别管理主键
     * @return 结果
     */
    @Override
    public int deleteExpertClassByClassIds(Long[] classIds)
    {
        return expertClassMapper.deleteExpertClassByClassIds(classIds);
    }

    /**
     * 删除专家类别管理信息
     * 
     * @param classId 专家类别管理主键
     * @return 结果
     */
    @Override
    public int deleteExpertClassByClassId(Long classId)
    {
        return expertClassMapper.deleteExpertClassByClassId(classId);
    }
}

package com.jb.expert.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.expert.mapper.ProjectExpertsMapper;
import com.jb.expert.domain.ProjectExperts;
import com.jb.expert.service.IProjectExpertsService;

/**
 * 专家属性Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-02-21
 */
@Service
public class ProjectExpertsServiceImpl implements IProjectExpertsService 
{
    @Autowired
    private ProjectExpertsMapper projectExpertsMapper;

    /**
     * 查询专家属性
     * 
     * @param userId 专家属性主键
     * @return 专家属性
     */
    @Override
    public ProjectExperts selectProjectExpertsByUserId(Long userId)
    {
        return projectExpertsMapper.selectProjectExpertsByUserId(userId);
    }

    /**
     * 查询专家属性列表
     * 
     * @param projectExperts 专家属性
     * @return 专家属性
     */
    @Override
    public List<ProjectExperts> selectProjectExpertsList(ProjectExperts projectExperts)
    {
        return projectExpertsMapper.selectProjectExpertsList(projectExperts);
    }

    /**
     * 新增专家属性
     * 
     * @param projectExperts 专家属性
     * @return 结果
     */
    @Override
    public int insertProjectExperts(ProjectExperts projectExperts)
    {
        return projectExpertsMapper.insertProjectExperts(projectExperts);
    }

    /**
     * 修改专家属性
     * 
     * @param projectExperts 专家属性
     * @return 结果
     */
    @Override
    public int updateProjectExperts(ProjectExperts projectExperts)
    {
        return projectExpertsMapper.updateProjectExperts(projectExperts);
    }

    /**
     * 批量删除专家属性
     * 
     * @param userIds 需要删除的专家属性主键
     * @return 结果
     */
    @Override
    public int deleteProjectExpertsByUserIds(Long[] userIds)
    {
        return projectExpertsMapper.deleteProjectExpertsByUserIds(userIds);
    }

    /**
     * 删除专家属性信息
     * 
     * @param userId 专家属性主键
     * @return 结果
     */
    @Override
    public int deleteProjectExpertsByUserId(Long userId)
    {
        return projectExpertsMapper.deleteProjectExpertsByUserId(userId);
    }

    @Override
    public Map<String,List> selectExpertNumByStar(){
        return projectExpertsMapper.selectExpertNumByStar();
    }


    @Override
    public Map<String, List> selectNewExpertByRange(int range) {
        return projectExpertsMapper.selectNewExpert(range);
    }
}

package com.jb.expert.service.impl;

import java.util.List;

import com.jb.expert.domain.ProjectExperts;
import com.jb.expert.mapper.ProjectExpertsMapper;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.expert.mapper.ProjectUserApplyMapper;
import com.jb.expert.domain.ProjectUserApply;
import com.jb.expert.service.IProjectUserApplyService;

/**
 * 申请记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-02-21
 */
@Service
public class ProjectUserApplyServiceImpl implements IProjectUserApplyService 
{
    @Autowired
    private ProjectUserApplyMapper projectUserApplyMapper;
    @Autowired
    private ProjectExpertsMapper projectExpertsMapper;
    /**
     * 查询申请记录
     * 
     * @param applyId 申请记录主键
     * @return 申请记录
     */
    @Override
    public ProjectUserApply selectProjectUserApplyByApplyId(Long applyId)
    {
        return projectUserApplyMapper.selectProjectUserApplyByApplyId(applyId);
    }

    /**
     * 查询申请记录列表
     * 
     * @param projectUserApply 申请记录
     * @return 申请记录
     */
    @Override
    public List<ProjectUserApply> selectProjectUserApplyList(ProjectUserApply projectUserApply)
    {
        return projectUserApplyMapper.selectProjectUserApplyList(projectUserApply);
    }

    /**
     * 新增申请记录
     * 
     * @param projectUserApply 申请记录
     * @return 结果
     */
    @Override
    public int insertProjectUserApply(ProjectUserApply projectUserApply)
    {
        ProjectExperts projectExperts = new ProjectExperts();
        projectExperts.setNickName(projectUserApply.getUserId());
        projectExpertsMapper.selectProjectExpertsList(projectExperts);

        projectUserApply.setCreateTime(projectExperts.getUpdateTime());

        return projectUserApplyMapper.insertProjectUserApply(projectUserApply);
    }

    @Override
    public ProjectUserApply selectMes(String name) {
        return projectUserApplyMapper.selectMes(name);
    }

    /**
     * 修改申请记录
     * 
     * @param projectUserApply 申请记录
     * @return 结果
     */
    @Override
    public int updateProjectUserApply(ProjectUserApply projectUserApply)
    {
        return projectUserApplyMapper.updateProjectUserApply(projectUserApply);
    }

    /**
     * 批量删除申请记录
     * 
     * @param applyIds 需要删除的申请记录主键
     * @return 结果
     */
    @Override
    public int deleteProjectUserApplyByApplyIds(Long[] applyIds)
    {
        return projectUserApplyMapper.deleteProjectUserApplyByApplyIds(applyIds);
    }

    /**
     * 删除申请记录信息
     * 
     * @param applyId 申请记录主键
     * @return 结果
     */
    @Override
    public int deleteProjectUserApplyByApplyId(Long applyId)
    {
        return projectUserApplyMapper.deleteProjectUserApplyByApplyId(applyId);
    }
}

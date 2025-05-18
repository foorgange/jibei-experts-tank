package com.jb.expert.mapper;

import java.util.List;
import com.jb.expert.domain.ProjectUserApply;

/**
 * 申请记录Mapper接口
 * 
 * @author ruoyi
 * @date 2022-02-21
 */
public interface ProjectUserApplyMapper 
{
    /**
     * 查询申请记录
     * 
     * @param applyId 申请记录主键
     * @return 申请记录
     */
    public ProjectUserApply selectProjectUserApplyByApplyId(Long applyId);

    /**
     * 查询申请记录列表
     * 
     * @param projectUserApply 申请记录
     * @return 申请记录集合
     */
    public List<ProjectUserApply> selectProjectUserApplyList(ProjectUserApply projectUserApply);

    /**
     * 新增申请记录
     * 
     * @param projectUserApply 申请记录
     * @return 结果
     */
    public int insertProjectUserApply(ProjectUserApply projectUserApply);

    ProjectUserApply selectMes(String name);

    /**
     * 修改申请记录
     * 
     * @param projectUserApply 申请记录
     * @return 结果
     */
    public int updateProjectUserApply(ProjectUserApply projectUserApply);

    /**
     * 删除申请记录
     * 
     * @param applyId 申请记录主键
     * @return 结果
     */
    public int deleteProjectUserApplyByApplyId(Long applyId);

    /**
     * 批量删除申请记录
     * 
     * @param applyIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProjectUserApplyByApplyIds(Long[] applyIds);

}

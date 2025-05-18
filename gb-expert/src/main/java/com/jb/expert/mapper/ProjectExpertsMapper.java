package com.jb.expert.mapper;

import java.util.List;
import java.util.Map;

import com.jb.expert.domain.ProjectExperts;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Param;

/**
 * 专家属性Mapper接口
 * 
 * @author ruoyi
 * @date 2022-02-21
 */
public interface ProjectExpertsMapper 
{
    /**
     * 查询专家属性
     * 
     * @param userId 专家属性主键
     * @return 专家属性
     */
    public ProjectExperts selectProjectExpertsByUserId(Long userId);

    /**
     * 查询专家属性列表
     * 
     * @param projectExperts 专家属性
     * @return 专家属性集合
     */
    public List<ProjectExperts> selectProjectExpertsList(ProjectExperts projectExperts);

    /**
     * 新增专家属性
     * 
     * @param projectExperts 专家属性
     * @return 结果
     */
    public int insertProjectExperts(ProjectExperts projectExperts);

    /**
     * 修改专家属性
     * 
     * @param projectExperts 专家属性
     * @return 结果
     */
    public int updateProjectExperts(ProjectExperts projectExperts);

    /**
     * 删除专家属性
     * 
     * @param userId 专家属性主键
     * @return 结果
     */
    public int deleteProjectExpertsByUserId(Long userId);

    /**
     * 批量删除专家属性
     * 
     * @param userIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProjectExpertsByUserIds(Long[] userIds);

    @MapKey("expert_star")
    public Map<String,List> selectExpertNumByStar();


    /***
     *
     * @param range 查询数据的范围
     * @return
     */
    @MapKey("index")
    public Map<String,List> selectNewExpert(@Param("range")int range);
}

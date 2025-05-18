package com.jb.expert.service;

import java.util.List;
import com.jb.expert.domain.ProjectPosition;

/**
 * 职位管理Service接口
 * 
 * @author ruoyi
 * @date 2022-02-20
 */
public interface IProjectPositionService 
{
    /**
     * 查询职位管理
     * 
     * @param positionId 职位管理主键
     * @return 职位管理
     */
    public ProjectPosition selectProjectPositionByPositionId(Long positionId);

    /**
     * 查询职位管理列表
     * 
     * @param projectPosition 职位管理
     * @return 职位管理集合
     */
    public List<ProjectPosition> selectProjectPositionList(ProjectPosition projectPosition);

    /**
     * 新增职位管理
     * 
     * @param projectPosition 职位管理
     * @return 结果
     */
    public int insertProjectPosition(ProjectPosition projectPosition);

    /**
     * 修改职位管理
     * 
     * @param projectPosition 职位管理
     * @return 结果
     */
    public int updateProjectPosition(ProjectPosition projectPosition);

    /**
     * 批量删除职位管理
     * 
     * @param positionIds 需要删除的职位管理主键集合
     * @return 结果
     */
    public int deleteProjectPositionByPositionIds(Long[] positionIds);

    /**
     * 删除职位管理信息
     * 
     * @param positionId 职位管理主键
     * @return 结果
     */
    public int deleteProjectPositionByPositionId(Long positionId);

}

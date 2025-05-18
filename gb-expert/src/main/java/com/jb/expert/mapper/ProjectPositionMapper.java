package com.jb.expert.mapper;

import java.util.List;
import com.jb.expert.domain.ProjectPosition;

/**
 * 职位管理Mapper接口
 * 
 * @author ruoyi
 * @date 2022-02-20
 */
public interface ProjectPositionMapper 
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
     * 删除职位管理
     * 
     * @param positionId 职位管理主键
     * @return 结果
     */
    public int deleteProjectPositionByPositionId(Long positionId);

    /**
     * 批量删除职位管理
     * 
     * @param positionIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProjectPositionByPositionIds(Long[] positionIds);

}

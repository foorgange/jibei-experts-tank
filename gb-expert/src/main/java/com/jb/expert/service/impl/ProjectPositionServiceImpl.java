package com.jb.expert.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.expert.mapper.ProjectPositionMapper;
import com.jb.expert.domain.ProjectPosition;
import com.jb.expert.service.IProjectPositionService;

/**
 * 职位管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-02-20
 */
@Service
public class ProjectPositionServiceImpl implements IProjectPositionService 
{
    @Autowired
    private ProjectPositionMapper projectPositionMapper;

    /**
     * 查询职位管理
     * 
     * @param positionId 职位管理主键
     * @return 职位管理
     */
    @Override
    public ProjectPosition selectProjectPositionByPositionId(Long positionId)
    {
        return projectPositionMapper.selectProjectPositionByPositionId(positionId);
    }

    /**
     * 查询职位管理列表
     * 
     * @param projectPosition 职位管理
     * @return 职位管理
     */
    @Override
    public List<ProjectPosition> selectProjectPositionList(ProjectPosition projectPosition)
    {
        return projectPositionMapper.selectProjectPositionList(projectPosition);
    }

    /**
     * 新增职位管理
     * 
     * @param projectPosition 职位管理
     * @return 结果
     */
    @Override
    public int insertProjectPosition(ProjectPosition projectPosition)
    {
        return projectPositionMapper.insertProjectPosition(projectPosition);
    }

    /**
     * 修改职位管理
     * 
     * @param projectPosition 职位管理
     * @return 结果
     */
    @Override
    public int updateProjectPosition(ProjectPosition projectPosition)
    {
        return projectPositionMapper.updateProjectPosition(projectPosition);
    }

    /**
     * 批量删除职位管理
     * 
     * @param positionIds 需要删除的职位管理主键
     * @return 结果
     */
    @Override
    public int deleteProjectPositionByPositionIds(Long[] positionIds)
    {
        return projectPositionMapper.deleteProjectPositionByPositionIds(positionIds);
    }

    /**
     * 删除职位管理信息
     * 
     * @param positionId 职位管理主键
     * @return 结果
     */
    @Override
    public int deleteProjectPositionByPositionId(Long positionId)
    {
        return projectPositionMapper.deleteProjectPositionByPositionId(positionId);
    }
}

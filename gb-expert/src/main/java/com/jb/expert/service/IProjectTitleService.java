package com.jb.expert.service;

import java.util.List;
import com.jb.expert.domain.ProjectTitle;

/**
 * 职称管理Service接口
 * 
 * @author ruoyi
 * @date 2022-02-20
 */
public interface IProjectTitleService 
{
    /**
     * 查询职称管理
     * 
     * @param titleId 职称管理主键
     * @return 职称管理
     */
    public ProjectTitle selectProjectTitleByTitleId(Long titleId);

    /**
     * 查询职称管理列表
     * 
     * @param projectTitle 职称管理
     * @return 职称管理集合
     */
    public List<ProjectTitle> selectProjectTitleList(ProjectTitle projectTitle);

    /**
     * 新增职称管理
     * 
     * @param projectTitle 职称管理
     * @return 结果
     */
    public int insertProjectTitle(ProjectTitle projectTitle);

    /**
     * 修改职称管理
     * 
     * @param projectTitle 职称管理
     * @return 结果
     */
    public int updateProjectTitle(ProjectTitle projectTitle);

    /**
     * 批量删除职称管理
     * 
     * @param titleIds 需要删除的职称管理主键集合
     * @return 结果
     */
    public int deleteProjectTitleByTitleIds(Long[] titleIds);

    /**
     * 删除职称管理信息
     * 
     * @param titleId 职称管理主键
     * @return 结果
     */
    public int deleteProjectTitleByTitleId(Long titleId);

}

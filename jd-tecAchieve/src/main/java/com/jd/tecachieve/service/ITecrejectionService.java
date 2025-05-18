package com.jd.tecachieve.service;

import com.jd.tecachieve.domain.Tecrejection;

import java.util.List;


/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2023-10-25
 */
public interface ITecrejectionService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param rejectionId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public Tecrejection selectTecrejectionByRejectionId(Long rejectionId);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param tecrejection 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<Tecrejection> selectTecrejectionList(Tecrejection tecrejection);

    public List<Tecrejection> getListByachievementId(Long achievementId);
    /**
     * 新增【请填写功能名称】
     * 
     * @param tecrejection 【请填写功能名称】
     * @return 结果
     */
    public int insertTecrejection(Tecrejection tecrejection);

    /**
     * 修改【请填写功能名称】
     * 
     * @param tecrejection 【请填写功能名称】
     * @return 结果
     */
    public int updateTecrejection(Tecrejection tecrejection);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param rejectionIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteTecrejectionByRejectionIds(Long[] rejectionIds);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param rejectionId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteTecrejectionByRejectionId(Long rejectionId);
}

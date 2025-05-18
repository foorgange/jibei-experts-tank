package com.jd.tecachieve.mapper;

import java.util.List;
import com.jd.tecachieve.domain.Tecrejection;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2023-10-25
 */
public interface TecrejectionMapper 
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

    /**
     * 根据achievementId查询驳回数据列表
     * */
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
     * 删除【请填写功能名称】
     * 
     * @param rejectionId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteTecrejectionByRejectionId(Long rejectionId);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param rejectionIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTecrejectionByRejectionIds(Long[] rejectionIds);
}

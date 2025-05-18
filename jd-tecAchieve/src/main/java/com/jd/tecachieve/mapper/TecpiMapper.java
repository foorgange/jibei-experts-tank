package com.jd.tecachieve.mapper;

import java.util.List;
import com.jd.tecachieve.domain.Tecpi;

/**
 * 成果负责人增删改查Mapper接口
 * 
 * @author lzz
 * @date 2023-09-22
 */
public interface TecpiMapper 
{
    /**
     * 查询成果负责人增删改查
     * 
     * @param piId 成果负责人增删改查主键
     * @return 成果负责人增删改查
     */
    public Tecpi selectTecpiByPiid(Long piId);

    /**
     * 查询成果负责人增删改查列表
     * 
     * @param tecpi 成果负责人增删改查
     * @return 成果负责人增删改查集合
     */
    public List<Tecpi> selectTecpiList(Tecpi tecpi);

    /**
     * 新增成果负责人增删改查
     * 
     * @param tecpi 成果负责人增删改查
     * @return 结果
     */
    public int insertTecpi(Tecpi tecpi);

    /**
     * 修改成果负责人增删改查
     * 
     * @param tecpi 成果负责人增删改查
     * @return 结果
     */
    public int updateTecpi(Tecpi tecpi);

    /**
     * 删除成果负责人增删改查
     * 
     * @param piId 成果负责人增删改查主键
     * @return 结果
     */
    public int deleteTecpiByPiid(Long piId);

    /**
     * 批量删除成果负责人增删改查
     * 
     * @param piIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTecpiByPiids(Long[] piIds);

}

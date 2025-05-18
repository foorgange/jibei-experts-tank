package com.jd.tecachieve.mapper;

import java.util.List;
import com.jd.tecachieve.domain.Tecteam;
import org.springframework.stereotype.Repository;

/**
 * 团队成员增删改查Mapper接口
 * 
 * @author lzz
 * @date 2023-09-12
 */
@Repository
public interface TecteamMapper 
{
    /**
     * 查询团队成员增删改查
     * 
     * @param teamId 团队成员增删改查主键
     * @return 团队成员增删改查
     */
    public Tecteam selectTecteamByTeamid(Long teamId);

    /**
     * 查询团队成员增删改查列表
     * 
     * @param tecteam 团队成员增删改查
     * @return 团队成员增删改查集合
     */
    public List<Tecteam> selectTecteamList(Tecteam tecteam);

    /**
     * 新增团队成员增删改查
     * 
     * @param tecteam 团队成员增删改查
     * @return 结果
     */
    public int insertTecteam(Tecteam tecteam);

    /**
     * 修改团队成员增删改查
     * 
     * @param tecteam 团队成员增删改查
     * @return 结果
     */
    public int updateTecteam(Tecteam tecteam);

    /**
     * 删除团队成员增删改查
     * 
     * @param teamId 团队成员增删改查主键
     * @return 结果
     */
    public int deleteTecteamByTeamid(Long teamId);

    /**
     * 批量删除团队成员增删改查
     * 
     * @param teamIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTecteamByTeamids(Long[] teamIds);

}

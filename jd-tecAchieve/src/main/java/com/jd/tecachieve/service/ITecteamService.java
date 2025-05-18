package com.jd.tecachieve.service;

import java.util.List;
import com.jd.tecachieve.domain.Tecteam;

/**
 * 团队成员增删改查Service接口
 * 
 * @author lzz
 * @date 2023-09-12
 */
public interface ITecteamService 
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
     * 批量删除团队成员增删改查
     * 
     * @param teamIds 需要删除的团队成员增删改查主键集合
     * @return 结果
     */
    public int deleteTecteamByTeamids(Long[] teamIds);

    /**
     * 删除团队成员增删改查信息
     * 
     * @param teamId 团队成员增删改查主键
     * @return 结果
     */
    public int deleteTecteamByTeamid(Long teamId);

}

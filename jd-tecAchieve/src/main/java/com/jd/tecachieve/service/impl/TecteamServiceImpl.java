package com.jd.tecachieve.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jd.tecachieve.mapper.TecteamMapper;
import com.jd.tecachieve.domain.Tecteam;
import com.jd.tecachieve.service.ITecteamService;

/**
 * 团队成员增删改查Service业务层处理
 * 
 * @author lzz
 * @date 2023-09-12
 */
@Service
public class TecteamServiceImpl implements ITecteamService 
{
    @Autowired
    private TecteamMapper tecteamMapper;

    /**
     * 查询团队成员增删改查
     * 
     * @param teamId 团队成员增删改查主键
     * @return 团队成员增删改查
     */
    @Override
    public Tecteam selectTecteamByTeamid(Long teamId)
    {
        return tecteamMapper.selectTecteamByTeamid(teamId);
    }

    /**
     * 查询团队成员增删改查列表
     * 
     * @param tecteam 团队成员增删改查
     * @return 团队成员增删改查
     */
    @Override
    public List<Tecteam> selectTecteamList(Tecteam tecteam)
    {
        return tecteamMapper.selectTecteamList(tecteam);
    }

    /**
     * 新增团队成员增删改查
     * 
     * @param tecteam 团队成员增删改查
     * @return 结果
     */
    @Override
    public int insertTecteam(Tecteam tecteam)
    {
        return tecteamMapper.insertTecteam(tecteam);
    }

    /**
     * 修改团队成员增删改查
     * 
     * @param tecteam 团队成员增删改查
     * @return 结果
     */
    @Override
    public int updateTecteam(Tecteam tecteam)
    {
        return tecteamMapper.updateTecteam(tecteam);
    }

    /**
     * 批量删除团队成员增删改查
     * 
     * @param teamIds 需要删除的团队成员增删改查主键
     * @return 结果
     */
    @Override
    public int deleteTecteamByTeamids(Long[] teamIds)
    {
        return tecteamMapper.deleteTecteamByTeamids(teamIds);
    }

    /**
     * 删除团队成员增删改查信息
     * 
     * @param teamId 团队成员增删改查主键
     * @return 结果
     */
    @Override
    public int deleteTecteamByTeamid(Long teamId)
    {
        return tecteamMapper.deleteTecteamByTeamid(teamId);
    }
}

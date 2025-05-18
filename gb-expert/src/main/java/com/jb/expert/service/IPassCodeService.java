package com.jb.expert.service;

import java.util.List;
import java.util.Map;

import com.jb.expert.domain.PassCode;

/**
 * 通行码管理Service接口
 * 
 * @author ruoyi
 * @date 2022-02-21
 */
public interface IPassCodeService 
{
    /**
     * 查询通行码管理
     * 
     * @param passCodeId 通行码管理主键
     * @return 通行码管理
     */
    public PassCode selectPassCodeByPassCodeId(Long passCodeId);

    /**
     * 查询通行码管理列表
     * 
     * @param passCode 通行码管理
     * @return 通行码管理集合
     */
    public List<PassCode> selectPassCodeList(PassCode passCode);

    /**
     * 查询通行码管理列表
     *
     * @param passCode 通行码管理
     * @return 通行码管理集合
     */
    public Map<Integer,String> register(PassCode passCode);

    /**
     * 新增通行码管理
     * 
     * @param passCode 通行码管理
     * @return 结果
     */
    public int insertPassCode(PassCode passCode);

    /**
     * 修改通行码管理
     * 
     * @param passCode 通行码管理
     * @return 结果
     */
    public int updatePassCode(PassCode passCode);

    public int usePassCode(PassCode passCode);

    /**
     * 批量删除通行码管理
     * 
     * @param passCodeIds 需要删除的通行码管理主键集合
     * @return 结果
     */
    public int deletePassCodeByPassCodeIds(Long[] passCodeIds);

    /**
     * 删除通行码管理信息
     * 
     * @param passCodeId 通行码管理主键
     * @return 结果
     */
    public int deletePassCodeByPassCodeId(Long passCodeId);

}

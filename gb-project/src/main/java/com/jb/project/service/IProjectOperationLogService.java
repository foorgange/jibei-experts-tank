package com.jb.project.service;

import java.util.List;
import com.jb.project.domain.ProjectOperationLog;

/**
 * 项目管理操作日志Service接口
 * 
 * @author ruoyi
 * @date 2022-04-30
 */
public interface IProjectOperationLogService 
{
    /**
     * 查询项目管理操作日志
     * 
     * @param logId 项目管理操作日志主键
     * @return 项目管理操作日志
     */
    public ProjectOperationLog selectProjectOperationLogByLogId(Long logId);

    /**
     * 查询项目管理操作日志列表
     * 
     * @param projectOperationLog 项目管理操作日志
     * @return 项目管理操作日志集合
     */
    public List<ProjectOperationLog> selectProjectOperationLogList(ProjectOperationLog projectOperationLog);

    /**
     * 新增项目管理操作日志
     * 
     * @param projectOperationLog 项目管理操作日志
     * @return 结果
     */
    public int insertProjectOperationLog(ProjectOperationLog projectOperationLog);

    /**
     * 修改项目管理操作日志
     * 
     * @param projectOperationLog 项目管理操作日志
     * @return 结果
     */
    public int updateProjectOperationLog(ProjectOperationLog projectOperationLog);

    /**
     * 批量删除项目管理操作日志
     * 
     * @param logIds 需要删除的项目管理操作日志主键集合
     * @return 结果
     */
    public int deleteProjectOperationLogByLogIds(Long[] logIds);

    /**
     * 删除项目管理操作日志信息
     * 
     * @param logId 项目管理操作日志主键
     * @return 结果
     */
    public int deleteProjectOperationLogByLogId(Long logId);

}

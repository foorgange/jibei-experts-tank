package com.jb.project.mapper;

import java.util.List;
import com.jb.project.domain.ProjectOperationLog;

/**
 * 项目管理操作日志Mapper接口
 * 
 * @author ruoyi
 * @date 2022-04-30
 */
public interface ProjectOperationLogMapper 
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
     * 删除项目管理操作日志
     * 
     * @param logId 项目管理操作日志主键
     * @return 结果
     */
    public int deleteProjectOperationLogByLogId(Long logId);

    /**
     * 批量删除项目管理操作日志
     * 
     * @param logIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteProjectOperationLogByLogIds(Long[] logIds);

}

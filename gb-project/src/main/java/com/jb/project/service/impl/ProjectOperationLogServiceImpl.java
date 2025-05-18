package com.jb.project.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.project.mapper.ProjectOperationLogMapper;
import com.jb.project.domain.ProjectOperationLog;
import com.jb.project.service.IProjectOperationLogService;

/**
 * 项目管理操作日志Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-04-30
 */
@Service
public class ProjectOperationLogServiceImpl implements IProjectOperationLogService 
{
    @Autowired
    private ProjectOperationLogMapper projectOperationLogMapper;

    /**
     * 查询项目管理操作日志
     * 
     * @param logId 项目管理操作日志主键
     * @return 项目管理操作日志
     */
    @Override
    public ProjectOperationLog selectProjectOperationLogByLogId(Long logId)
    {
        return projectOperationLogMapper.selectProjectOperationLogByLogId(logId);
    }

    /**
     * 查询项目管理操作日志列表
     * 
     * @param projectOperationLog 项目管理操作日志
     * @return 项目管理操作日志
     */
    @Override
    public List<ProjectOperationLog> selectProjectOperationLogList(ProjectOperationLog projectOperationLog)
    {
        return projectOperationLogMapper.selectProjectOperationLogList(projectOperationLog);
    }

    /**
     * 新增项目管理操作日志
     * 
     * @param projectOperationLog 项目管理操作日志
     * @return 结果
     */
    @Override
    public int insertProjectOperationLog(ProjectOperationLog projectOperationLog)
    {
        return projectOperationLogMapper.insertProjectOperationLog(projectOperationLog);
    }

    /**
     * 修改项目管理操作日志
     * 
     * @param projectOperationLog 项目管理操作日志
     * @return 结果
     */
    @Override
    public int updateProjectOperationLog(ProjectOperationLog projectOperationLog)
    {
        return projectOperationLogMapper.updateProjectOperationLog(projectOperationLog);
    }

    /**
     * 批量删除项目管理操作日志
     * 
     * @param logIds 需要删除的项目管理操作日志主键
     * @return 结果
     */
    @Override
    public int deleteProjectOperationLogByLogIds(Long[] logIds)
    {
        return projectOperationLogMapper.deleteProjectOperationLogByLogIds(logIds);
    }

    /**
     * 删除项目管理操作日志信息
     * 
     * @param logId 项目管理操作日志主键
     * @return 结果
     */
    @Override
    public int deleteProjectOperationLogByLogId(Long logId)
    {
        return projectOperationLogMapper.deleteProjectOperationLogByLogId(logId);
    }
}

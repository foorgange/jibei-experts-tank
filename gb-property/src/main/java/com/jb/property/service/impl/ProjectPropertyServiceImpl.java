package com.jb.property.service.impl;

import java.util.Date;
import java.util.List;

import com.jb.property.domain.ProjectUserProperty;
import com.jb.property.mapper.ProjectUserPropertyMapper;
import com.jb.property.service.IProjectPropertyService;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.jb.property.mapper.ProjectPropertyMapper;
import com.jb.property.domain.ProjectProperty;

/**
 * 知识产权Service业务层处理
 *
 * @author ruoyi
 * @date 2022-03-05
 */
@Service
public class ProjectPropertyServiceImpl implements IProjectPropertyService
{
    @Autowired
    private ProjectPropertyMapper projectPropertyMapper;
    @Autowired
    private ProjectUserPropertyMapper projectUserPropertyMapper;
    /**
     * 查询知识产权
     *
     * @param propertyId 知识产权主键
     * @return 知识产权
     */
    @Override
    public ProjectProperty selectProjectPropertyByPropertyId(Long propertyId)
    {
        return projectPropertyMapper.selectProjectPropertyByPropertyId(propertyId);
    }

    /**
     * 查询知识产权列表
     *
     * @param projectProperty 知识产权
     * @return 知识产权
     */
    @Override
    public List<ProjectProperty> selectProjectPropertyList(ProjectProperty projectProperty)
    {
        return projectPropertyMapper.selectProjectPropertyList(projectProperty);
    }

    /**
     * 新增知识产权
     *
     * @param projectProperty 知识产权
     * @return 结果
     */
    @Override
    public Long insertProjectProperty(ProjectProperty projectProperty)
    {
        projectProperty.setCreateTime(DateUtils.getNowDate());

        /*处理到期状态*/
        //获得产权到期时间
        Date date1 = projectProperty.getFinishTime();
        //获得当前时间
        Date date2 = new Date();

        if(date1.after(date2)){
            projectProperty.setFareStatus("0");
        }
        else{
            projectProperty.setFareStatus("1");
        }

        Long result = projectPropertyMapper.insertProjectProperty(projectProperty);

        Long propertyId = projectPropertyMapper.getPropertyIdByName(projectProperty.getPropertyName());
        for(ProjectUserProperty item : projectProperty.getPropertyWorker()){
            item.setPropertyId(propertyId);
            projectPropertyMapper.insertUserProjectProperty(item);
        }

        return propertyId;
    }

    /**
     * 修改知识产权
     *
     * @param projectProperty 知识产权
     * @return 结果
     */
    @Override
    public Long updateProjectProperty(ProjectProperty projectProperty)
    {
        /*处理到期状态*/
        //获得产权到期时间
        Date date1 = projectProperty.getFinishTime();
        //获得当前时间
        Date date2 = new Date();

        if(date1.after(date2)){
            projectProperty.setFareStatus("0");
        }
        else{
            projectProperty.setFareStatus("1");
        }

        for (ProjectUserProperty item : projectProperty.getPropertyWorker()){

            // userid 不为空，即数据库中已有的作者
            if(item.getUserId() != null){
                // 如果传来的对象名字为空，即删除关联数据库中的数据
                if(item.getUserNickName() == ""){
                    projectUserPropertyMapper.deleteProjectUserPropertyByUserId(item.getUserId());
                }
                // 如果传入的数据与数据库中不同，则修改数据库的数据
                else if(item.getUserNickName() != projectUserPropertyMapper.selectProjectUserPropertyByUserId(item.getUserId()).getUserNickName()){
                    projectUserPropertyMapper.updateProjectUserProperty(item);
                }
            }
            // userId 为空，则添加记录
            else{
                item.setPropertyId(projectProperty.getPropertyId());
                projectUserPropertyMapper.insertProjectUserProperty(item);
            }
        }
        Long propertyId = projectPropertyMapper.getPropertyIdByName(projectProperty.getPropertyName());
        projectPropertyMapper.updateProjectProperty(projectProperty);
        return propertyId;
    }

    /**
     * 批量删除知识产权
     *
     * @param propertyIds 需要删除的知识产权主键
     * @return 结果
     */
    @Override
    public int deleteProjectPropertyByPropertyIds(Long[] propertyIds)
    {
        return projectPropertyMapper.deleteProjectPropertyByPropertyIds(propertyIds);
    }

    /**
     * 删除知识产权信息
     *
     * @param propertyId 知识产权主键
     * @return 结果
     */
    @Override
    public int deleteProjectPropertyByPropertyId(Long propertyId)
    {
        return projectPropertyMapper.deleteProjectPropertyByPropertyId(propertyId);
    }

    public Long getPropertyIdByName(String property_name){
        return projectPropertyMapper.getPropertyIdByName(property_name);
    }

    @Override
    public int insertUserProjectProperty(ProjectUserProperty projectUserProperty) {
        return projectPropertyMapper.insertUserProjectProperty(projectUserProperty);
    }

    @Override
    public List selectPropertyWorkerList(Long propertyId){
        return projectPropertyMapper.selectPropertyWorkerList(propertyId);
    }

    @Override
    public void updateFareStatus() {
        projectPropertyMapper.updateFareStatus();
    }





}

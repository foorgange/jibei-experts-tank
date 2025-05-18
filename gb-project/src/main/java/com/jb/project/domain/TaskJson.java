package com.jb.project.domain;

import com.jb.expert.domain.ProjectExperts;

public class TaskJson {
    String taskName;
    String taskInfo;
    ProjectExperts[] taskMember;
    int taskType;
    ExpertTemplate template;
    long projectId;

    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskInfo() {
        return taskInfo;
    }

    public void setTaskInfo(String taskInfo) {
        this.taskInfo = taskInfo;
    }

    public ProjectExperts[] getTaskMember() {
        return taskMember;
    }

    public void setTaskMember(ProjectExperts[] taskMember) {
        this.taskMember = taskMember;
    }

    public int getTaskType() {
        return taskType;
    }

    public void setTaskType(int taskType) {
        this.taskType = taskType;
    }

    public ExpertTemplate getTemplate() {
        return template;
    }

    public void setTemplate(ExpertTemplate template) {
        this.template = template;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }
}

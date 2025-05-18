package com.jb.project.domain;

import com.jb.expert.domain.ProjectExperts;

public class TaskMemberInfo {
    Long userId;
    String nickName;
    Long taskId;
    Long taskType;
    Long taskStatus;

    @Override
    public String toString() {
        return "TaskMemberInfo{" +
                "userId=" + userId +
                ", nick_name='" + nickName + '\'' +
                ", taskId=" + taskId +
                ", taskType=" + taskType +
                ", taskStatus=" + taskStatus +
                '}';
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getNick_name() {
        return nickName;
    }

    public void setNick_name(String nick_name) {
        this.nickName = nick_name;
    }

    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    public Long getTaskType() {
        return taskType;
    }

    public void setTaskType(Long taskType) {
        this.taskType = taskType;
    }

    public Long getTaskStatus() {
        return taskStatus;
    }

    public void setTaskStatus(Long taskStatus) {
        this.taskStatus = taskStatus;
    }
}

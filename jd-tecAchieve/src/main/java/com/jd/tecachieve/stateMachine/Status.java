package com.jd.tecachieve.stateMachine;

public class Status {
    private int initState;
    private int action;
    private int changeState;
    private String key;

    public Status(int initState, int action, int changeState) {
        this.initState = initState;
        this.action = action;
        this.changeState = changeState;
        this.key = String.format("%d%d", initState, action);
    }

    public int getChangeState() {
        return changeState;
    }

    public String getKey() {
        return key;
    }
}

package com.jd.tecachieve.stateMachine;

public enum TecAchieveAuditState {
    CaoGao(1),
    DaiShenHe(2),
    DaiXiuGai(3),
    RuKu(4);

    private final int state;

    TecAchieveAuditState(int state) {
        this.state = state;
    }

    public int getState() {
        return this.state;
    }
}

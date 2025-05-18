package com.jd.tecachieve.stateMachine;

public enum TecAchieveAuditAction {
    TiJiao(1),
    BoHui(2),
    XiuGai(3),
    ShenHeTongGuo(4),
    TuiHui(5);

    private final int action;

    TecAchieveAuditAction(int action) {
        this.action = action;
    }

    public int getAction() {
        return this.action;
    }
}

package com.jd.tecachieve.stateMachine;

import java.util.HashMap;
import java.util.Map;

public class StateMachine {
    private final Map<String, Status> mapState = new HashMap<>();

    public StateMachine() {
//        // 草稿状态---提交---待审核状态
//        Status status1 = new Status(TecAchieveAuditState.CaoGao.getState(), TecAchieveAuditAction.TiJiao.getAction(), TecAchieveAuditState.DaiShenHe.getState());
//        mapState.put(status1.getKey(), status1);
//
//        // 待审核状态---驳回---待修改状态
//        Status status2 = new Status(TecAchieveAuditState.DaiShenHe.getState(), TecAchieveAuditAction.BoHui.getAction(), TecAchieveAuditState.DaiXiuGai.getState());
//        mapState.put(status2.getKey(), status2);
//
//        // 待修改状态---修改---草稿
//        Status status3 = new Status(TecAchieveAuditState.DaiXiuGai.getState(), TecAchieveAuditAction.XiuGai.getAction(), TecAchieveAuditState.CaoGao.getState());
//        mapState.put(status3.getKey(), status3);
//
//        // 待审核状态---审核通过---入库状态
//        Status status4 = new Status(TecAchieveAuditState.DaiShenHe.getState(), TecAchieveAuditAction.ShenHeTongGuo.getAction(), TecAchieveAuditState.RuKu.getState());
//        mapState.put(status4.getKey(), status4);

        // 草稿状态---提交---入库状态
        Status status1 = new Status(TecAchieveAuditState.CaoGao.getState(), TecAchieveAuditAction.TiJiao.getAction(), TecAchieveAuditState.RuKu.getState());
        mapState.put(status1.getKey(), status1);

        // 入库状态---退回---待修改状态
        Status status2 = new Status(TecAchieveAuditState.RuKu.getState(), TecAchieveAuditAction.TuiHui.getAction(), TecAchieveAuditState.DaiXiuGai.getState());
        mapState.put(status2.getKey(), status2);

        // 待修改状态---修改---草稿状态
        Status status3 = new Status(TecAchieveAuditState.DaiXiuGai.getState(), TecAchieveAuditAction.XiuGai.getAction(), TecAchieveAuditState.CaoGao.getState());
        mapState.put(status3.getKey(), status3);
    }

    public int getNextState(int initState, int action) {
        String key = String.format("%s%d", initState, action);
        return mapState.get(key).getChangeState();
    }

//    public static void main(String[] args) {
//        StateMachine stateMachine = new StateMachine();
//        int nextState = stateMachine.getNextState(1, 1);
//        System.out.println(nextState);
//    }

}

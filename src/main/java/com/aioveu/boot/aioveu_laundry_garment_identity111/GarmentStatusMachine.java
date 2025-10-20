//package com.aioveu.boot.aioveu_laundry_garment_identity111;
//
//public class GarmentStatusMachine {
//
//    private static final Map<GarmentStatus, Set<OperationType>> ALLOWED_TRANSITIONS = new HashMap<>();
//
//    static {
//        ALLOWED_TRANSITIONS.put(RECEIVED, EnumSet.of(SEND_FACTORY));
//        ALLOWED_TRANSITIONS.put(TO_FACTORY, EnumSet.of(FACTORY_IN));
//        ALLOWED_TRANSITIONS.put(FACTORY_IN, EnumSet.of(WASHING, RE_WASH_START));
//        ALLOWED_TRANSITIONS.put(WASHING, EnumSet.of(FACTORY_OUT));
//        ALLOWED_TRANSITIONS.put(FACTORY_OUT, EnumSet.of(STORE_IN));
//        ALLOWED_TRANSITIONS.put(STORE_IN, EnumSet.of(STORE_HANG));
//        ALLOWED_TRANSITIONS.put(ON_HANGER, EnumSet.of(STORE_OUT));
//        ALLOWED_TRANSITIONS.put(RE_WASHING, EnumSet.of(FACTORY_IN));
//    }
//
//    public void validateTransition(GarmentStatus current, OperationType operation) {
//        if (!ALLOWED_TRANSITIONS.getOrDefault(current, EnumSet.noneOf(OperationType.class))
//                .contains(operation)) {
//            throw new IllegalStateException("无效的状态转换");
//        }
//    }
//
//    public GarmentStatus getNextStatus(OperationType operation) {
//        switch (operation) {
//            case SEND_FACTORY: return TO_FACTORY;
//            case FACTORY_IN: return FACTORY_IN;
//            case FACTORY_OUT: return FACTORY_OUT;
//            case STORE_IN: return STORE_IN;
//            case STORE_HANG: return ON_HANGER;
//            case STORE_OUT: return RETURNED;
//            case RE_WASH_START: return RE_WASHING;
//            default: throw new IllegalArgumentException("未知操作类型");
//        }
//    }
//}

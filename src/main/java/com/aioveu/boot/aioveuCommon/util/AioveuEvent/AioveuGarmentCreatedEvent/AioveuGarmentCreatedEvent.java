package com.aioveu.boot.aioveuCommon.util.AioveuEvent.AioveuGarmentCreatedEvent;

import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.entity.AioveuLaundryGarmentIdentity;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.form.AioveuLaundryGarmentIdentityForm;
import org.springframework.context.ApplicationEvent;

//使用事件驱动架构（推荐）
public class AioveuGarmentCreatedEvent extends ApplicationEvent {


    private final AioveuLaundryGarmentIdentity entity;


    // 构造方法名必须与类名一致
    public AioveuGarmentCreatedEvent(Object source, AioveuLaundryGarmentIdentity entity) {
        super(source);  // 调用父类构造方法
        this.entity = entity;  // 初始化 final 变量
    }

    public AioveuLaundryGarmentIdentity getEntity() {
        return entity;
    }

}

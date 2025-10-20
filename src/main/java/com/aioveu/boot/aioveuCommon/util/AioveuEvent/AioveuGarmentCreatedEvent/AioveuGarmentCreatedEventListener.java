package com.aioveu.boot.aioveuCommon.util.AioveuEvent.AioveuGarmentCreatedEvent;


import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.entity.AioveuLaundryGarmentIdentity;
import com.aioveu.boot.aioveuLaundryGarmentIdentity.model.form.AioveuLaundryGarmentIdentityForm;
import com.aioveu.boot.aioveuLaundryGarmentTracking.model.entity.AioveuLaundryGarmentTracking;
import com.aioveu.boot.aioveuLaundryGarmentTracking.service.AioveuLaundryGarmentTrackingService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.hpsf.Date;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


/*
创建事件监听器
 */
@Component
@Slf4j
@RequiredArgsConstructor

public class AioveuGarmentCreatedEventListener {

    private final AioveuLaundryGarmentTrackingService trackingService;

    @EventListener
    @Async
    @Transactional(propagation = Propagation.REQUIRES_NEW)
//    @Retryable(value = Exception.class, maxAttempts = 3, backoff = @Backoff(delay = 1000))  //添加重试机制（可选）
    public void handleGarmentCreatedEvent(AioveuGarmentCreatedEvent event) {
        AioveuLaundryGarmentIdentity entity = event.getEntity();

        log.info("为服装创建初始追踪记录: {}", entity.getGarmentCode());

        AioveuLaundryGarmentTracking tracking = new AioveuLaundryGarmentTracking();
        tracking.setGarmentCode(entity.getId());
        tracking.setOperationType(0); // 初始操作类型
        tracking.setOperatorId(1L);
        tracking.setLocationId(1L);
//        tracking.setNotes("Initial garment creation");

        try {
            boolean result = trackingService.save(tracking);
            if (result) {
                log.info("Successfully created tracking record for garment: {}", entity.getId());
            } else {
                log.error("Failed to create tracking record for garment: {}", entity.getId());
            }
        } catch (Exception e) {
            log.error("Error creating tracking record: {}", e.getMessage());
        }
    }
}

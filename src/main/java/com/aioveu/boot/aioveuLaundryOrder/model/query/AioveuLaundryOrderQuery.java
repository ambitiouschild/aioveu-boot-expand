package com.aioveu.boot.aioveuLaundryOrder.model.query;

import com.aioveu.boot.common.base.BasePageQuery;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.List;
import java.math.BigDecimal;

/**
 * 洗衣订单分页查询对象
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:43
 */
@Schema(description ="洗衣订单查询对象")
@Getter
@Setter
public class AioveuLaundryOrderQuery extends BasePageQuery {

    @Schema(description = "订单ID")
    private Long id;
    @Schema(description = "订单号")
    private String orderNo;
    @Schema(description = "会员ID")
    private Long memberId;
    @Schema(description = "客户姓名")
    private String customerName;
    @Schema(description = "订单状态 0创建,1接收,2洗衣,3干燥,4熨烫,5质量检查,6完成,7运送,8取消")
    private Integer status;
    @Schema(description = "支付状态 1-未支付-unpaid,2-部分支付-partial,3-已支付-paid,4-未支付-refunded")
    private Integer paymentStatus;
}

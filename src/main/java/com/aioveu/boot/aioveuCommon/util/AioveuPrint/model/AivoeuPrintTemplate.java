package com.aioveu.boot.aioveuCommon.util.AioveuPrint.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
//添加 Lombok 注解（推荐）
public class AivoeuPrintTemplate {

    private  String id;   // 模板键（key） // standard",
    private  String name;   // 模板描述（description） //"标准模板",
    private  String css;   //css
    private  String singleTemplate;  //singleTemplate,
    private  String batchTemplate;   //null // 标准模板没有批量模板
    private  String itemTemplate;

    public AivoeuPrintTemplate(String id, String name, String css, String singleTemplate) {
        this(id, name, css, singleTemplate, null, null);
    }

    /**
     * 创建标准模板
     */
    public AivoeuPrintTemplate(String id, String name, String css, String singleTemplate,
                               String batchTemplate) {
        this(id, name, css, singleTemplate, batchTemplate, null);
    }


    /**
     * 创建批量打印模板
     */

    /**
     * 创建报告模板
     */
    public AivoeuPrintTemplate(String id, String name, String css, String singleTemplate,
                               String batchTemplate, String itemTemplate) {
        this.id = id;
        this.name = name;
        this.css = css;
        this.singleTemplate = singleTemplate;
        this.batchTemplate = batchTemplate;
        this.itemTemplate = itemTemplate;
    }


    /**
     * 判断是否支持批量打印
     */
    public boolean supportsBatch() {
        return batchTemplate != null && !batchTemplate.isEmpty();
    }

}

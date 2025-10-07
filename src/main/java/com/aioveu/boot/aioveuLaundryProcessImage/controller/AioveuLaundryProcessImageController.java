package com.aioveu.boot.aioveuLaundryProcessImage.controller;

import com.aioveu.boot.aioveuLaundryProcessImage.model.entity.AioveuLaundryProcessImage;
import com.aioveu.boot.aioveuLaundryProcessImage.service.AioveuLaundryProcessImageService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.logging.Log;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.aioveu.boot.aioveuLaundryProcessImage.model.form.AioveuLaundryProcessImageForm;
import com.aioveu.boot.aioveuLaundryProcessImage.model.query.AioveuLaundryProcessImageQuery;
import com.aioveu.boot.aioveuLaundryProcessImage.model.vo.AioveuLaundryProcessImageVO;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.aioveu.boot.common.result.PageResult;
import com.aioveu.boot.common.result.Result;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import jakarta.validation.Valid;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static cn.hutool.poi.excel.cell.CellUtil.getCellValue;

/**
 * 洗衣流程图片记录前端控制层
 *
 * @author 可我不敌可爱
 * @since 2025-09-30 17:58
 */
// 在类顶部添加
@Slf4j
@Tag(name = "洗衣流程图片记录接口")
@RestController
@RequestMapping("/api/v1/aioveu-laundry-process-image")
@RequiredArgsConstructor
public class AioveuLaundryProcessImageController  {

    private final AioveuLaundryProcessImageService aioveuLaundryProcessImageService;

    @Operation(summary = "洗衣流程图片记录分页列表")
    @GetMapping("/page")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:query')")
    public PageResult<AioveuLaundryProcessImageVO> getAioveuLaundryProcessImagePage(AioveuLaundryProcessImageQuery queryParams ) {
        IPage<AioveuLaundryProcessImageVO> result = aioveuLaundryProcessImageService.getAioveuLaundryProcessImagePage(queryParams);
        return PageResult.success(result);
    }

    @Operation(summary = "新增洗衣流程图片记录")
    @PostMapping
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:add')")
    public Result<Void> saveAioveuLaundryProcessImage(@RequestBody @Valid AioveuLaundryProcessImageForm formData ) {
        boolean result = aioveuLaundryProcessImageService.saveAioveuLaundryProcessImage(formData);
        return Result.judge(result);
    }

    @Operation(summary = "获取洗衣流程图片记录表单数据")
    @GetMapping("/{id}/form")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:edit')")
    public Result<AioveuLaundryProcessImageForm> getAioveuLaundryProcessImageForm(
        @Parameter(description = "洗衣流程图片记录ID") @PathVariable Long id
    ) {
        AioveuLaundryProcessImageForm formData = aioveuLaundryProcessImageService.getAioveuLaundryProcessImageFormData(id);
        return Result.success(formData);
    }

    @Operation(summary = "修改洗衣流程图片记录")
    @PutMapping(value = "/{id}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:edit')")
    public Result<Void> updateAioveuLaundryProcessImage(
            @Parameter(description = "洗衣流程图片记录ID") @PathVariable Long id,
            @RequestBody @Validated AioveuLaundryProcessImageForm formData
    ) {
        boolean result = aioveuLaundryProcessImageService.updateAioveuLaundryProcessImage(id, formData);
        return Result.judge(result);
    }

    @Operation(summary = "删除洗衣流程图片记录")
    @DeleteMapping("/{ids}")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:delete')")
    public Result<Void> deleteAioveuLaundryProcessImages(
        @Parameter(description = "洗衣流程图片记录ID，多个以英文逗号(,)分割") @PathVariable String ids
    ) {
        boolean result = aioveuLaundryProcessImageService.deleteAioveuLaundryProcessImages(ids);
        return Result.judge(result);
    }

    @Operation(summary = "导出接口实现")
    @PostMapping("/export")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:export')")
    public void export(@RequestBody AioveuLaundryProcessImageQuery query, HttpServletResponse response) {
        try {
            // 1. 查询数据
            List<AioveuLaundryProcessImageVO> list = aioveuLaundryProcessImageService.list(query);

            // 2. 创建Excel工作簿
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("洗衣流程图片记录");

            // 3. 创建表头
            Row headerRow = sheet.createRow(0);
            String[] headers = {"ID", "订单号", "衣物明细", "图片类型", "图片路径", "上传人", "描述", "创建时间", "更新时间"};
            for (int i = 0; i < headers.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headers[i]);
            }

            // 4. 填充数据
            int rowNum = 1;
            for (AioveuLaundryProcessImageVO item : list) {
                Row row = sheet.createRow(rowNum++);
                row.createCell(0).setCellValue(item.getOrderNo());
                row.createCell(1).setCellValue(item.getProblemDesc());
                row.createCell(2).setCellValue(item.getImageType());
                row.createCell(3).setCellValue(item.getImageUrl());
                row.createCell(4).setCellValue(item.getUploadUserName());
                row.createCell(5).setCellValue(item.getCreateTime().toString());
            }

            // 5. 设置响应头
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=laundry_process_images.xlsx");

            // 6. 写入响应流
            workbook.write(response.getOutputStream());
            workbook.close();
        } catch (IOException e) {
            log.error("导出失败", e);
            throw new RuntimeException("导出失败");
        }
    }

    @Operation(summary = "导入接口实现")
    @PostMapping("/import")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:import')")
    public Result<String> importData(@RequestParam("file") MultipartFile file) {
        try {
            // 1. 检查文件是否为空
            if (file.isEmpty()) {
                return Result.failed("请上传文件");
            }

            // 2. 检查文件类型
            String contentType = file.getContentType();
            if (!"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet".equals(contentType) &&
                    !"application/vnd.ms-excel".equals(contentType)) {
                return Result.failed("只支持Excel文件");
            }

            // 3. 读取Excel数据
            Workbook workbook = new XSSFWorkbook(file.getInputStream());
            Sheet sheet = workbook.getSheetAt(0);

            List<AioveuLaundryProcessImage> importList = new ArrayList<>();

            // 4. 跳过表头行
            for (int i = 1; i <= sheet.getLastRowNum(); i++) {
                Row row = sheet.getRow(i);
                if (row == null) continue;

                AioveuLaundryProcessImage entity = new AioveuLaundryProcessImage();
                entity.setOrderId(Long.parseLong(getCellValue(row.getCell(0))));
                entity.setItemId(Long.parseLong(getCellValue(row.getCell(1))));
                entity.setImageType(Integer.parseInt(getCellValue(row.getCell(2))));
                entity.setImageUrl(getCellValue(row.getCell(3)));
                entity.setUploadUser(Long.parseLong(getCellValue(row.getCell(4))));

                importList.add(entity);
            }

            // 5. 保存数据
            aioveuLaundryProcessImageService.saveBatch(importList);

            return Result.success("导入成功，共导入 " + importList.size() + " 条数据");
        } catch (IOException e) {
            log.error("导入失败", e);
            return Result.failed("导入失败");
        } catch (Exception e) {
            log.error("导入处理失败", e);
            return Result.failed("导入处理失败: " + e.getMessage());
        }
    }

    // 辅助方法：获取单元格值
    private String getCellValue(Cell cell) {
        if (cell == null) return "";
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();// 辅助方法：获取字符串单元格值
            case NUMERIC:
                return String.valueOf(cell.getNumericCellValue());
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            default:
                return "";
        }
    }

    @Operation(summary = " 模板下载接口实现")
    @GetMapping("/template")
    @PreAuthorize("@ss.hasPerm('aioveuLaundryProcessImage:aioveu-laundry-process-image:template')")
    public void downloadTemplate(HttpServletResponse response) {
        try {
            // 1. 创建空模板
            Workbook workbook = new XSSFWorkbook();
            Sheet sheet = workbook.createSheet("模板");

            // 2. 创建表头
            Row headerRow = sheet.createRow(0);
            String[] headers = {"订单ID", "衣物明细ID", "图片类型", "图片路径", "上传人ID"};
            for (int i = 0; i < headers.length; i++) {
                Cell cell = headerRow.createCell(i);
                cell.setCellValue(headers[i]);
            }

            // 3. 设置响应头
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=laundry_process_image_template.xlsx");

            // 4. 写入响应流
            workbook.write(response.getOutputStream());
            workbook.close();
        } catch (IOException e) {
            log.error("模板下载失败", e);
            throw new RuntimeException("模板下载失败");
        }
    }


}

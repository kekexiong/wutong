package com.wutong.wsk.util;


import lombok.Data;

@Data
public class ExcelModle {
    //描述
    private String text;
    //字段名称
    private String field;
    // 字段类型
    private String type;
    // 字段长度
    private int size;
    // 是否可以为空
    private boolean isNull;
    // 字典
    private String dicCode;

    public ExcelModle(String text, String field, String type, int size, boolean isNull, String dicCode) {
        this.text = text;
        this.field = field;
        this.type = type;
        this.size = size;
        this.isNull = isNull;
        this.dicCode = dicCode;
    }

    public ExcelModle(String text, String field, String type, int size, boolean isNull) {
        this.text = text;
        this.field = field;
        this.type = type;
        this.size = size;
        this.isNull = isNull;
    }
}

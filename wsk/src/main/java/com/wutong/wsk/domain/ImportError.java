package com.wutong.wsk.domain;

import lombok.Data;

/**
 * describe: ImportError
 * date 2019/2/26
 */
@Data
public class ImportError {
    private String position;
    private String importValue;
    private String failCode;
    private String failReason;

    public ImportError(String position, String importValue, String failCode, String failReason) {
        super();
        this.position = position;
        this.importValue = importValue;
        this.failReason = failReason;
        this.failCode = failCode;
    }
}

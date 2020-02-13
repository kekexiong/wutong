package com.wutong.demo.domain;

/**
 * describe: ImportError
 * date 2019/2/26
 */
public class ImportError {
    private String position;
    private String importValue;
    private String failReason;

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getImportValue() {
        return importValue;
    }

    public void setImportValue(String importValue) {
        this.importValue = importValue;
    }

    public String getFailReason() {
        return failReason;
    }

    public void setFailReason(String failReason) {
        this.failReason = failReason;
    }

    public ImportError(String position,String importValue, String failReason) {
        super();
        this.position = position;
        this.importValue = importValue;
        this.failReason = failReason;
    }

    @Override
    public String toString() {
        return "[position=" + position + ",importValue=" + importValue + ", failReason=" + failReason + "]";
    }
}

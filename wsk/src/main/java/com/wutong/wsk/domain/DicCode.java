package com.wutong.wsk.domain;
import lombok.Data;

/**
 * @description DicCodedomain
 * @author zhao_qg
 * @date 20200218 20:14:06
 */
@Data
public class DicCode {
    /**
     * 主键UUID
     */
    private String uuid;
    /**
     * 字典KEY
     */
    private String codeKey;
    /**
     * 值
     */
    private String codeValue;
    /**
     * 名称
     */
    private String codeName;
    /**
     * 更新人
     */
    private String uteUserNo;
    /**
     * 更新日期
     */
    private String uteDt;
    /**
     * 创建人
     */
    private String cteUserNo;
    /**
     * 创建日期
     */
    private String cteDt;
}

package com.wutong.wsk.domain.system;
import java.util.Date;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @description DicCodedomain
 * @author zhao_qg
 * @date 20200305 18:43:03
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
     * 状态
     */
    private String codeSts;
    /**
     * 更新人
     */
    private String uteUserNo;
    /**
     * 更新日期
     */
    private Date uteDt;
    /**
     * 创建人
     */
    private String cteUserNo;
    /**
     * 创建日期
     */
    private Date cteDt;
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}

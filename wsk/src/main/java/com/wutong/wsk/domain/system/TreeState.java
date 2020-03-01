package com.wutong.wsk.domain.system;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * @description Menudomain
 * @author zhao_qg
 * @date 20200223 20:41:44
 */
@Data
public class TreeState {
    /**
     * 菜单ID
     */
    private String opened;
    /**
     * 菜单名称
     */
    private String disabled;
    /**
     * 父节点
     */
    private String selected;
    /**
     * 目录类型
     */
    private String loaded;

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}

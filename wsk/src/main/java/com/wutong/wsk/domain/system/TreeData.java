package com.wutong.wsk.domain.system;

import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @description Menudomain
 * @author zhao_qg
 * @date 20200223 20:41:44
 */
@Data
public class TreeData {
    /**
     * 菜单ID
     */
    private String id;
    /**
     * 菜单名称
     */
    private String text;
    /**
     * 状态
     */
    private TreeState state;
    /**
     * 目录类型
     */
    private TreeData children;

    private String type;

    private String li_attr;

    private String a_attr;


    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}

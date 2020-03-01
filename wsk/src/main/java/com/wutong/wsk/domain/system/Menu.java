package com.wutong.wsk.domain.system;
import java.util.Date;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @description Menudomain
 * @author zhao_qg
 * @date 20200229 21:33:58
 */
@Data
public class Menu {
    /**
     * 菜单ID
     */
    private String menuId;
    /**
     * 菜单名称
     */
    private String menuName;
    /**
     * 父节点
     */
    private String parentId;
    /**
     * 目录类型
     */
    private String type;
    /**
     * 排序
     */
    private int sort;
    /**
     * 图标
     */
    private String icon;
    /**
     * 是否显示
     */
    private String isShow;
    /**
     * 状态
     */
    private String sts;
    /**
     * 备注
     */
    private String remarks;
    /**
     * 更新人
     */
    private String uteUserNo;
    /**
     * 更新时间
     */
    private Date uteDt;
    /**
     * 创建人
     */
    private String cteUserNo;
    /**
     * 创建时间
     */
    private Date cteDt;
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}

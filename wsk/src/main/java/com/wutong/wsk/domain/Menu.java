package com.wutong.wsk.domain;
import lombok.Data;

/**
 * @description Menudomain
 * @author zhao_qg
 * @date 20200218 20:37:11
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
     * 图标
     */
    private String icon;
    /**
     * 排序
     */
    private String sort;
    /**
     * 是否显示
     */
    private String isShow;
    /**
     * 权限码
     */
    private String permisssion;
    /**
     * 状态:0:无效  1:有效
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

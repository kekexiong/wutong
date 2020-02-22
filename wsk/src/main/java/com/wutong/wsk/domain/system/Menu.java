package com.wutong.wsk.domain.system;
import java.util.Date;
import lombok.Data;

/**
 * @description Menudomain
 * @author zhao_qg
 * @date 20200222 23:16:53
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
}

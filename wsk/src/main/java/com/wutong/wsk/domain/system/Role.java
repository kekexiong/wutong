package com.wutong.wsk.domain.system;
import lombok.Data;

/**
 * @description Roledomain
 * @author zhao_qg
 * @date 20200220 19:01:00
 */
@Data
public class Role {
    /**
     * 角色ID
     */
    private String roleId;
    /**
     * 角色名称
     */
    private String roleName;
    /**
     * 权限集合
     */
    private String scope;
    /**
     * 状态
     */
    private String sts;
    /**
     * 状态
     */
    private String stsName;
    /**
     * 部门ID
     */
    private String deptId;
    /**
     * 备注
     */
    private String remarks;
    /**
     * 创建人
     */
    private String cteUserNo;
    /**
     * 创建日期
     */
    private String cteDt;
    /**
     * 更新操作人
     */
    private String uteUserNo;
    /**
     * 更新日期
     */
    private String uteDt;
}

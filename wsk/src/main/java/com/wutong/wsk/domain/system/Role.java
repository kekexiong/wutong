package com.wutong.wsk.domain.system;
import java.util.Date;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @description Roledomain
 * @author zhao_qg
 * @date 20200228 18:40:05
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
     * 创建时间
     */
    private Date cteDt;
    /**
     * 更新操作人
     */
    private String uteUserNo;
    /**
     * 更新时间
     */
    private Date uteDt;
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}

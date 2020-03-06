package com.wutong.wsk.domain.user;
import java.util.Date;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @description Userdomain
 * @author zhao_qg
 * @date 20200306 18:06:20
 */
@Data
public class User {
    /**
     * 用户ID
     */
    private String userId;
    /**
     * 昵称
     */
    private String userName;
    /**
     * 真实姓名
     */
    private String realName;
    /**
     * 性别
     */
    private String sex;
    /**
     * 出生年月日
     */
    private Date birthdayBeginDt;
    private Date birthdayEndDt;
    private Date birthday;
    /**
     * 电话号码
     */
    private String telNo;
    /**
     * 邮箱
     */
    private String mail;
    /**
     * 身份证号
     */
    private String idNumber;
    /**
     * 部门编号
     */
    private String deptNo;
    /**
     * 状态
     */
    private String userSts;
    /**
     * 登录密码
     */
    private String loginPwd;
    /**
     * 登录时间
     */
    private String loginTime;
    /**
     * 登录IP
     */
    private String loginIp;
    /**
     * 授权角色
     */
    private String empowerRoles;
    /**
     * 是否允许登录
     */
    private String isAllowLogin;
    /**
     * 密码错误次数
     */
    private String pwdErrCunt;
    /**
     * 密码修改时间
     */
    private Date lastUptPwdTime;
    /**
     * 创建人
     */
    private String cteUserNo;
    /**
     * 更新人
     */
    private String uteUserNo;
    /**
     * 更新日期
     */
    private Date uteDt;
    /**
     * 创建日期
     */
    private Date cteDt;
    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}

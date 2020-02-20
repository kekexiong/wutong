package com.wutong.wsk.domain.user;
import lombok.Data;

/**
 * @description Userdomain
 * @author zhao_qg
 * @date 20200220 20:30:17
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
     * 性别
     */
    private String sexName;
    /**
     * 出生年月日
     */
    private String birthdaybeginDt;
    private String birthdayendDt;
    private String birthday;
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
     * 状态
     */
    private String userStsName;
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
     * 授权角色
     */
    private String empowerRolesName;
    /**
     * 是否允许登录
     */
    private String isAllowLogin;
    /**
     * 是否允许登录
     */
    private String isAllowLoginName;
    /**
     * 密码输入错误次数
     */
    private String pwdErrCunt;
    /**
     * 密码最后修改时间
     */
    private String lastUptPwdTime;
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
    private String uteDt;
    /**
     * 更新时间
     */
    private String uteTm;
    /**
     * 创建日期
     */
    private String cteDt;
    /**
     * 创建时间
     */
    private String cteTm;
}

package com.wutong.wsk.domain;

import com.alibaba.fastjson.JSONArray;
import com.wutong.wsk.util.Encodes;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;


/**
 * 系统安全认证实现类
 * @author Niejun
 * @version 2014-7-7
 */
@Service
public class SystemAuthorizingRealm extends AuthorizingRealm {

    static final Logger logger = LoggerFactory.getLogger(SystemAuthorizingRealm.class);

    /**
     * 认证回调函数, 登录时调用
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken) throws AuthenticationException {
        UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
        Map<String,String> map=new HashMap<String, String>();
        map.put("loginid", token.getUsername());
        map.put("rownum", "2");

        Principal principal=new Principal();
        String pwd="31980e35db2fa0d42de68e6c32883b871c890b2b17c38783f279ed29";
        byte[] salt = Encodes.decodeHex(pwd.substring(0,16));
        return new SimpleAuthenticationInfo(principal, pwd.substring(16), ByteSource.Util.bytes(salt), getName());
    }

    /**
     * 授权查询回调函数, 进行鉴权但缓存中无用户的授权信息时调用
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        Principal principal = (Principal) getAvailablePrincipal(principals);
        logger.debug("==================是否授权 "+principal);
        Map<String,String> map=new HashMap<String, String>();
        JSONArray jsonarray=null;
        map.put("loginid", principal.getLoginName());
        map.put("rownum", "2");
        return new SimpleAuthorizationInfo();
    }

    /**
     * 设定密码校验的Hash算法与迭代次数
     */
    @PostConstruct
    public void initCredentialsMatcher() {
        HashedCredentialsMatcher matcher = new HashedCredentialsMatcher("SHA-1");
        matcher.setHashIterations(1024);
        setCredentialsMatcher(matcher);
    }

    /**
     * 清空用户关联权限认证，待下次使用时重新加载
     */
    public void clearCachedAuthorizationInfo(String principal) {
        SimplePrincipalCollection principals = new SimplePrincipalCollection(principal, getName());
        clearCachedAuthorizationInfo(principals);
    }

    /**
     * 清空所有关联认证
     */
    public void clearAllCachedAuthorizationInfo() {
        Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
        if (cache != null) {
            for (Object key : cache.keys()) {
                cache.remove(key);
            }
        }
    }

    /**
     * 授权用户信息
     */
    public static class Principal implements Serializable {

        private static final long serialVersionUID = 1L;

        private String id;
        private String loginName;
        private String name;
        private String orgId;
        private String orgName;
        private String operator;
        private String departMentId;
        private String deptName; //add by zhangkai 2014-10-23
        private Map<String, Object> cacheMap;

//        public Principal(TBapSysUser user) {
//            this.id = user.getEmpNo();
//            this.loginName = user.getLoginId();
//            this.name = user.getEmpNm();
//            this.orgName=user.getOrgNm();
//            this.orgId=user.getOrgUuid();
//            this.operator=user.getEmpNo();
//            this.departMentId=user.getDeptUuid();
//            this.deptName=user.getDeptNm();
//        }

        public String getOrgName() {
            return orgName;
        }

        public void setOrgName(String orgName) {
            this.orgName = orgName;
        }
        public String getOrgId() {
            return orgId;
        }

        public void setOrgId(String orgId) {
            this.orgId = orgId;
        }

        public String getOperator() {
            return operator;
        }

        public void setOperator(String operator) {
            this.operator = operator;
        }

        public String getId() {
            return id;
        }

        public String getLoginName() {
            return loginName;
        }

        public String getName() {
            return name;
        }
        public String getDepartMentId() {
            return departMentId;
        }

        public void setDepartMentId(String departMentId) {
            this.departMentId = departMentId;
        }

        public String getDeptName() {
            return deptName;
        }

        public void setDeptName(String deptName) {
            this.deptName = deptName;
        }

        public Map<String, Object> getCacheMap() {
            if (cacheMap==null){
                cacheMap = new HashMap<String, Object>();
            }
            return cacheMap;
        }

    }
}

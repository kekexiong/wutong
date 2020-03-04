package com.wutong.wsk.util;

import com.wutong.wsk.domain.SystemAuthorizingRealm.Principal;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

public class LoginUtils {
    static final Logger logger = LoggerFactory.getLogger(LoginUtils.class);

    /**
     * 将一个 JavaBean 对象转化为一个 Map
     *
     * @param bean 要转化的JavaBean 对象
     * @return 转化出来的 Map 对象
     * @throws IntrospectionException    如果分析类属性失败
     * @throws IllegalAccessException    如果实例化 JavaBean 失败
     * @throws InvocationTargetException 如果调用属性的 setter 方法失败
     */
    @SuppressWarnings("rawtypes")
    public static Map convertBean(Object bean) throws IntrospectionException,
            IllegalAccessException, InvocationTargetException {
        Class<? extends Object> type = bean.getClass();
        Map returnMap = new HashMap();
        BeanInfo beanInfo = Introspector.getBeanInfo(type);

        PropertyDescriptor[] propertyDescriptors = beanInfo
                .getPropertyDescriptors();
        for (int i = 0; i < propertyDescriptors.length; i++) {
            PropertyDescriptor descriptor = propertyDescriptors[i];
            String propertyName = descriptor.getName();
            if (!propertyName.equals("class")) {
                Method readMethod = descriptor.getReadMethod();
                Object result = readMethod.invoke(bean, new Object[0]);
                if (result != null) {
                    returnMap.put(propertyName, result);
                }
            }
        }
        return returnMap;
    }

    /**
     * 将一个 Map 对象转化为一个 JavaBean
     *
     * @param type 要转化的类型
     * @param map  包含属性值的 map
     * @return 转化出来的 JavaBean 对象
     * @throws IntrospectionException    如果分析类属性失败
     * @throws IllegalAccessException    如果实例化 JavaBean 失败
     * @throws InstantiationException    如果实例化 JavaBean 失败
     * @throws InvocationTargetException 如果调用属性的 setter 方法失败
     */
    @SuppressWarnings("rawtypes")
    public static Object convertMap(Class type, Map map)
            throws IntrospectionException, IllegalAccessException,
            InstantiationException, InvocationTargetException {
        BeanInfo beanInfo = Introspector.getBeanInfo(type); // 获取类属性
        Object obj = type.newInstance(); // 创建 JavaBean 对象

        // 给 JavaBean 对象的属性赋值
        PropertyDescriptor[] propertyDescriptors = beanInfo
                .getPropertyDescriptors();
        for (int i = 0; i < propertyDescriptors.length; i++) {
            PropertyDescriptor descriptor = propertyDescriptors[i];
            String propertyName = descriptor.getName();

            if (map.containsKey(propertyName)) {
                // 下面一句可以 try 起来，这样当一个属性赋值失败的时候就不会影响其他属性赋值。
                Object value = map.get(propertyName);

                Object[] args = new Object[1];
                args[0] = value;

                descriptor.getWriteMethod().invoke(obj, args);
            }
        }
        return obj;
    }

    /**
     * 获取当前操作员信息
     *
     * @return
     */
    public static Principal getSessionStoreRange() {
        try {
            Subject currentUser = SecurityUtils.getSubject();
            if (currentUser != null) {
                //logger.debug("当前session信息====="+JSONObject.fromObject(currentUser.getPrincipal()));
                return (Principal) currentUser.getPrincipal();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取当前操作员帐号
     *
     * @return String
     * @date: 2014年11月5日 下午3:43:53
     * @author: xingxin
     */
    public static String getLoginName() {
        try {
            //Principal principal = getSessionStoreRange();
            return "admin";//操作员帐号
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 获取当前操作员所属机构号
     *
     * @return String
     * @date 2015年1月19日下午3:25:55
     * @author: xingxin
     */
    public static String getOrgId() {
        try {
            Principal principal = getSessionStoreRange();
            return principal.getOrgId();//操作员所属机构号
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 判断当前操作员所属机构是否为总部
     *
     * @return boolean
     * @date 2015年2月28日下午4:59:21
     * @author: xingxin
     */
    public static boolean isZongbu() {
        try {
            String orgId = getOrgId();
            if ("0010000000".equals(orgId)) {
                return true;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }
}

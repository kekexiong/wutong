package com.wutong.wsk.util;

import com.alibaba.fastjson.JSONObject;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * All rights Reserved, Designed By Suixingpay.
 *
 * @description: 
 * @version: V1.0
 * @create: 2019/7/3 16:41
 * @Copyright 2019 Suixingpay. All rights reserved.
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
public class ObjectUtils {

    /**
     * 字符判空 空格不算空那个
     *
     * @param value
     * @return
     */
    public static boolean isEmpty(String value) {
        return (value == null || value.trim().equals(""));
    }

    public static boolean isEmpty(Object value) {
        return value == null ? true : false;
    }

    public static String trim(String str) {
        return str == null ? "" : str.trim();
    }

    public static boolean isNullOrEmpty(String postScript) {
        // TODO Auto-generated method stub
        return isEmpty(postScript);
    }


    /**
     * 判断字符串是不是符合日期格式 yyyyMMdd
     * @param str
     * @return
     */
    public static boolean isLegalDate(String str) {
        int legalLen = 8;
        if ((str == null) || (str.length() != legalLen)) {
            return false;
        }
        DateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        try {
            Date date = formatter.parse(str);
            return str.equals(formatter.format(date));
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 判断字符串是否符合时间格式 HHmmss
     * @param str
     * @return
     */
    public static boolean isLegalTime(String str) {
        int legalLen = 6;
        if ((str == null) || (str.length() != legalLen)) {
            return false;
        }
        DateFormat formatter = new SimpleDateFormat("HHmmss");
        try {
            Date date = formatter.parse(str);
            return str.equals(formatter.format(date));
        } catch (Exception e) {
            return false;
        }
    }
    /**
     * 获取对应的子List
     *
     * @param i
     * @param insertSum
     * @param insertCount
     * @param list
     * @return
     * @author liudong[liu_dong@suixingpay.com]
     * @date 20180130
     */
    public static <T> List<T> getChildList(int i, int insertSum, int insertCount, List<T> list) {

        List<T> childList = new ArrayList<T>();
        if (i == (insertSum - 1)) {
            childList = list.subList(i * insertCount, list.size());
        } else {
            childList = list.subList(i * insertCount, (i + 1) * insertCount);
        }
        return childList;
    }
    /**
     * 判断字符串是否为合法的金额格式12位整数小数点2位
     * @param bigDecimal
     * @return boolean
     */
    public static boolean isAmtFormat(BigDecimal bigDecimal) {
        String[] strings = bigDecimal.toString().split("\\.");
        if (strings.length != 2) {
            return false;
        }
        if (strings[0].length() > 12 || strings[1].length() != 2) {
            return false;
        }
        return true;
    }

    /*
     * getValue By key
     */
    public static String getStringValue(JSONObject obj, String key) {
        if (obj.get(key) != null) {
            return obj.getString(key);
        } else {
            return "";
        }
    }
}

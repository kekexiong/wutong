package com.wutong.demo.controller;

import java.util.HashMap;
import java.util.Map;

/**
 * @Title: AbstractController.java
 * @Package: com.trs.controller
 * @Description:公共Controller，随着需求添加通用方法
 * @author: fuwei
 * @date: 2014年3月13日
 * @version: V1.0
 */

public abstract class BaseController {

    public final String START = "0";
    public final String LIMIT = "10";

    /**
     * 设置查询返回信息
     *
     * @param list  返回结果集
     * @param count 查询记录数
     */
    protected Map<String, Object> setResult(Object list, int count) {
        Map<String, Object> rsMap = new HashMap<String, Object>(2);
        rsMap.put("items", list);
        rsMap.put("totalCount", count);
        return rsMap;
    }

    /**
     * 设置分页查询通用信息
     *
     * @param start 起始行号
     * @param limit 每页显示的行数
     * @return
     */
    protected Map<String, Object> setParams(int start, int limit) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startRow", start);
        map.put("endRow", start + limit);
        return map;
    }

    /**
     * @param errors
     * @return Map<String                               ,                                                               Object>
     * @Title: setFailure
     * @Description: 设置操作失败信息
     * @return: Map<String                               ,                               Object>
     * @author: xingxin
     * @date: 2014年6月23日 下午4:43:28
     */
    protected Map<String, Object> setFailure(String errors) {
        Map<String, Object> rsMap = new HashMap<String, Object>();
        if (errors != null) {
            errors = errors.replaceAll(":", "： ").replaceAll("\"", "“ ").replaceAll("\r\n", "<br/> ").replaceAll("'", " ").replaceAll("\\\\", "/ ").replaceAll("\n", "<br/> ");
        }
        rsMap.put("success", false);
        rsMap.put("msg", errors);
        return rsMap;
    }

    /**
     * @param message
     * @return Map<String                               ,                                                               Object>
     * @Title: setSuccess
     * @Description: 设置操作成功信息
     * @return: Map<String                               ,                               Object>
     * @author: xingxin
     * @date: 2014年6月23日 下午4:43:28
     */
    protected Map<String, Object> setSuccess(String message) {
        Map<String, Object> rsMap = new HashMap<String, Object>();
        rsMap.put("success", true);
        rsMap.put("msg", message);
        return rsMap;
    }

}
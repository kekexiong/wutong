package com.wutong.demo.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * All rights Reserved, Designed By Suixingpay.
 *
 * @description:
 * @version: V1.0
 * @create: 2019/7/3 16:03
 * @Copyright 2019 Suixingpay. All rights reserved.
 * 注意：本内容仅限于随行付支付有限公司内部传阅，禁止外泄以及用于其他的商业用途。
 */
public class SysUtils {
    static final Logger logger = LoggerFactory.getLogger(SysUtils.class);

    /**
     * 获取当前操作员帐号
     *
     * @return String
     * @date: 2020年02月5日 下午3:43:53
     * @author: zqg
     */
    public static String getLoginName() {
        try {
            return "管理员TODO";
        } catch (Exception e) {
            return null;
        }
    }
}

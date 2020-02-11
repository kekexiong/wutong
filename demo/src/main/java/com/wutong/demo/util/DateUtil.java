package com.wutong.demo.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * describe: DateUtil工具类
 */

public class DateUtil {
    private static final Logger LOGGER = LoggerFactory.getLogger(DateUtil.class);

    public static final String YYYY_MM_DD = "yyyy-MM-dd";
    public static final String YYYYMMDD = "yyyyMMdd";
    public static final String HHMMSS = "HHmmss";

    /**
     * 得到当前时间 格式  yyyyMMddHHmmss
     * 创 建 人:  wenc
     * 创建时间:  2014年6月23日 下午5:55:10
     *
     * @return
     * @see [类、类#方法、类#成员]
     */
    public static String getCurDTTM() {
        return getCurTime("yyyyMMddHHmmss");
    }

    public static String getCurDT() {
        return getCurTime("yyyyMMdd");
    }

    /**
     * 得到当前时间 格式  HHMMSS
     * 创 建 人:  wenc
     * 创建时间:  2014年6月23日 下午5:55:10
     *
     * @return
     * @see [类、类#方法、类#成员]
     */
    public static String getCurTM() {
        return getCurTime("HHmmss");
    }

    /**
     * 当前时间
     * 创 建 人:  wenc
     * 创建时间:  2014年6月26日 下午2:51:54
     *
     * @param format
     * @return
     * @see [类、类#方法、类#成员]
     */
    public static String getCurTime(String format) {
        StringBuilder str = new StringBuilder();
        Date ca = Calendar.getInstance().getTime();
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        str.append(sdf.format(ca));
        return str.toString();
    }


    /**
     * 取得线程耗时
     *
     * @param startTime = System.currentTimeMillis();
     *                  开始时间戳
     * @return
     */
    public static String getHaoShiTimeMsg(long startTime) {
        long endTime = System.currentTimeMillis();
        long time = endTime - startTime;
        long day = time / (24 * 60 * 60 * 1000);
        long hour = time / (60 * 60 * 1000) - day * 24;
        long min = ((time / (60 * 1000)) - day * 24 * 60 - hour * 60);
        long s = (time / 1000 - day * 24 * 60 * 60 - hour * 60 * 60 - min * 60);
        long hs = (time - day * 24 * 60 * 60 * 1000 - hour * 60 * 60 * 1000 - min * 60 * 1000 - s * 1000);
        return "耗时: " + day + "天" + hour + "小时 " + min + "分 " + s + "秒 " + hs + "毫秒";
    }

    public static String getCurMm() {
        return getCurTime("mm");
    }


    /**
     * 获得当地时间，返回Timestamp格式
     * 创 建 人:  wenc
     * 创建时间:  2014年6月23日 下午5:56:26
     *
     * @return
     * @see [类、类#方法、类#成员]
     */
    public static Timestamp getCurTimestamp() {
        return new Timestamp(System.currentTimeMillis());
    }

    public static String formatDate(Date d) {
        SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
        return sf.format(d);
    }
}

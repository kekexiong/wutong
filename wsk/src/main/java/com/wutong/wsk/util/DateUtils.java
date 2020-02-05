/*
 * 文 件 名:  DateUtils.java
 * 版    权:  Copyright  2014. 随行付支付有限公司版权所有
 * 描    述:  <描述>
 * 创 建 人:  wenc
 * 创建时间:  2014年6月23日 下午5:53:16
 *
 * 修改内容:  <修改内容>
 * 修改时间:  <修改时间>
 * 修改人:    <修改人>
 */
package com.wutong.wsk.util;

import org.springframework.util.StringUtils;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


/**
 * <功能详细描述>
 *
 * @author wenc
 * @version [版本号, 2014年6月23日 下午5:53:16 ]
 * @see [相关类/方法]
 * @since [产品/模块版本]
 */
public class DateUtils {

    /**
     * 得到当前时间的日期  YYYYMMDD
     * 创 建 人:  wenc
     * 创建时间:  2014年6月23日 下午5:54:28
     *
     * @return
     * @see [类、类#方法、类#成员]
     */
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

    public static String getCurHS() {
        return getCurTime("HHmm");
    }

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

    /**
     * 获取系统时间字符串，格式"yyyy-MM-dd HH:mm:ss"
     * <p>创 建 人：  wenc<br>
     * 创建时间：  2014年7月14日 下午1:50:53
     *
     * @return
     * @see [类、类#方法、类#成员]
     */
    public static String getSysOptDate() {
        Calendar date = Calendar.getInstance();
        Date sysDate = date.getTime();
        String optDate = DateUtils.dateToString(sysDate, "yyyy-MM-dd HH:mm:ss");
        return optDate;
    }

    /**
     * <功能详细描述>
     * <p>创 建 人：  wenc<br>
     * 创建时间：  2014年8月19日 上午9:08:08
     *
     * @param strFormat
     * @return
     * @see [类、类#方法、类#成员]
     */
    public static String getSysOptDate(String strFormat) {
        Calendar date = Calendar.getInstance();
        Date sysDate = date.getTime();
        String optDate = DateUtils.dateToString(sysDate, strFormat);
        return optDate;
    }

    /**
     * <功能详细描述>
     * <p>创 建 人：  wenc<br>
     * 创建时间：  2014年7月14日 下午1:51:17
     *
     * @param dteValue
     * @param strFormat
     * @return
     * @see [类、类#方法、类#成员]
     */
    private static String dateToString(Date dteValue, String strFormat) {
        SimpleDateFormat clsFormat = new SimpleDateFormat(strFormat);
        return clsFormat.format(dteValue);
    }

    /**
     * <功能详细描述>
     * <p>创 建 人：  wenc<br>
     * 创建时间：  2014年7月29日 下午6:04:26
     *
     * @param strValue
     * @return
     * @see [类、类#方法、类#成员]
     */
    public static Date stringToDate(String strValue) {
        if (StringUtils.isEmpty(strValue)) {
            return null;
        }
        SimpleDateFormat clsFormat = null;
        if (strValue.length() > 19)
            strValue = strValue.substring(0, 19);
        if (strValue.length() == 19)
            clsFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        else if (strValue.length() == 10)
            clsFormat = new SimpleDateFormat("yyyy-MM-dd");
        else if (strValue.length() == 14)
            clsFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        else if (strValue.length() == 8)
            clsFormat = new SimpleDateFormat("yyyyMMdd");

        ParsePosition pos = new ParsePosition(0);
        return clsFormat.parse(strValue, pos);
    }

    /**
     * @Title: timeCompare
     * @Description: 是否早于系统时间
     * @param: String time
     * @return: boolean
     * @author xingxin
     * @date 2015年8月5日 下午3:20:03
     */
    public static boolean timeCompare(String time) {
        DateFormat formart = new SimpleDateFormat("HH:mm:ss");
        try {
            Date date2 = formart.parse(time);
            String str = formart.format(new Date());
            Date sysDate = formart.parse(str);
            if (date2.compareTo(sysDate) < 0) {
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * @Title: dateCompare
     * @Description: 是否早于系统日期
     * @param: String date
     * @return: boolean
     * @author xingxin
     * @date 2015年8月5日 下午3:20:03
     */
    public static boolean dateCompare(String strDate) {
        DateFormat formart = new SimpleDateFormat("yyyyMMdd");
        try {
            Date date = formart.parse(strDate);
            String str = formart.format(new Date());
            Date sysDate = formart.parse(str);
            if (date.compareTo(sysDate) < 0) {
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        System.out.println(DateUtils.getCurDT());
        System.out.println(DateUtils.getCurTM());
    }

    /**
     * 取得线程耗时
     *
     * @param startTime 开始时间戳
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
}

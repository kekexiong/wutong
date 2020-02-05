package com.wutong.cct.util;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;
import java.util.TreeSet;

public class StrUtil {

	/**
	 * 判断字符串是否为空
	 * 
	 * @param str
	 * @return 有值返回true；null或者空返回false ;
	 */
	public static boolean verdict(String str) {
		try {
			return !(str == null || str.trim().length() == 0 || "null".equals(str));
		} catch (NullPointerException e) {
			return false;
		}
	}

	public static String stringDateTime(Date date) {
		if (date == null) {
			return null;
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd HH:mm:ss");
		return dateFormat.format(date);
	}

	public static String stringDate(Date date) {
		if (date == null) {
			return null;
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		return dateFormat.format(date);
	}

	public static Date toDate(String time) {
		if (time == null || time.trim().equals("")) {
			return null;
		}
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			return dateFormat.parse(time);
		} catch (ParseException e) {
			dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			try {
				return dateFormat.parse(time);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 判断字符串是否为数值: true 是数值; false 不是数值
	 */
	public static boolean isNumber(String s) {
		try {
			new BigDecimal(s);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 判断字符串是否为非负整数: true 是非负整数; false 不是非负整数
	 */
	public static boolean isInteger(String s) {
		return s.matches("^[1-9]\\d*$|^0$");
	}

	/**
	 * 将字符串数组，转换成字符串，元素间用"|"分隔
	 */
	public static String arrayToString(String[] s) {
		String str = "";
		for (int i = 0; i < s.length; i++) {
			if (i == s.length - 1)
				str += s[i];
			else
				str += (s[i] + "|");
		}
		return str;
	}

	/**
	 * id串去重
	 * 
	 * @param ids
	 * @return 返回去重后的带单引号的id串，如'2323','32323','333'
	 */
	public static String getFilterSameStr(String ids) {
		String resultstr = "";
		String[] idsattr = ids.split(",");

		// 用TreeSet保证传入和转换有序
		TreeSet<String> set = new TreeSet<String>();
		set = getFilterSameSet(idsattr);

		for (String setv : set) {
			resultstr = resultstr + ",'" + setv + "'";
		}

		if (resultstr.length() > 1) {
			resultstr = resultstr.substring(1);
		}

		return resultstr;
	}

	/**
	 * id串去重
	 * 
	 * @param ids
	 * @return 返回去重后的不带单引号的id串,如232,3343,2323
	 */
	public static String getFilterSameStrNoQuote(String ids) {
		String resultstr = "";
		String[] idsattr = ids.replace("'", "").split(",");

		// 用TreeSet保证传入和转换有序
		TreeSet<String> set = new TreeSet<String>();
		set = getFilterSameSet(idsattr);

		for (String setv : set) {
			resultstr = resultstr + "," + setv + "";
		}

		if (resultstr.length() > 1) {
			resultstr = resultstr.substring(1);
		}

		return resultstr;
	}

	/**
	 * id串去重
	 * 
	 * @param ids
	 * @return 返回去重后的TreeSet
	 */
	public static TreeSet<String> getFilterSameSet(String[] attr) {

		// 用TreeSet保证传入和转换有序
		TreeSet<String> set = new TreeSet<String>();
		for (String v : attr) {
			if (v.length() > 0) {
				set.add(v);
			}

		}

		return set;
	}

	/**
	 * 日期对象比较大小 true: d1晚于d2 false: d1==d2或者d1早于d2
	 * 
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static boolean compareDate(Date d1, Date d2) {
		long l1 = d1.getTime();
		long l2 = d2.getTime();
		return (l1 - l2) > 0;
	}

	/**
	 * 日期相等比较
	 * 
	 * @param d1
	 * @param d2
	 * @return
	 */
	public static boolean equalsDate(Date d1, Date d2) {
		return d1.getTime() == d2.getTime();
	}

	/**
	 * 获取当前日期字符串（yyyyMMdd）
	 */
	public static String getNowDateStr() {
		return new SimpleDateFormat("yyyyMMdd").format(new Date());
	}

	/**
	 * 大写
	 * 
	 * @param s
	 * @return
	 */
	public static final String upperFirst(String s) {
		int len = s.length();
		if (len <= 0)
			return "";
		s=s.toLowerCase();
		String[] splist = s.split("_");
		StringBuilder className = new StringBuilder();

		for (String str : splist) {
			int strLen = str.toString().length();
			StringBuffer sb = new StringBuffer();
			sb.append(str.substring(0, 1).toUpperCase());
			sb.append(str.substring(1, strLen));
			className.append(sb);
		}
	    len = className.toString().length();
		StringBuffer sb = new StringBuffer();
		sb.append(className.toString().substring(0, 1).toUpperCase());
		sb.append(className.toString().substring(1, len));
		return sb.toString();
	}

	/**
	 * 小写
	 * 
	 * @param s
	 * @return
	 */
	public static final String lowerFirst(String s) {
		int len = s.length();
		if (len <= 0)
			return "";
		s=s.toLowerCase();
		String[] splist = s.split("_");
		StringBuilder className = new StringBuilder();

		for (String str : splist) {
			int strLen = str.toString().length();
			StringBuffer sb = new StringBuffer();
			sb.append(str.substring(0, 1).toUpperCase());
			sb.append(str.substring(1, strLen));
			className.append(sb);
		}
		len = className.toString().length();
		StringBuffer sb = new StringBuffer();
		sb.append(className.toString().substring(0, 1).toLowerCase());
		sb.append(className.toString().substring(1, len));
		return sb.toString();
	}

	/**
	 * 1) d 十进制数，表示一个整型值，u 和d一样是整型值，但它是无符号的，而如果它对应的值是负的，则返回时是一个2的32次方减去这个负数的绝对值。
	 * 
	 * 例如：Format("this is %u",-2);
	 * 
	 * 返回的是：this is 4294967294
	 * 
	 * 2）f 对应浮点数
	 * 
	 * 3）e科学表示法，对应整型数和浮点数
	 * 
	 * 例如：Format("this is %e",-2.22);
	 * 
	 * 返回的是：this is -2.220000E+000
	 * 
	 * 4）g 这个只能对应浮点型，且它会将值中多余的数去掉
	 * 
	 * 例如：Format("this is %g",02.200);
	 * 
	 * 返回的是：this is 2.2
	 * 
	 * 5）n 只能对应浮点型，将值转化为号码的形式，看一个例子就明白了
	 * 
	 * 例如：Format("this is %n",4552.2176);
	 * 
	 * 返回的是：this is 4,552.22
	 * 
	 * 注意：一是，只表示到小数后两位
	 * 
	 * 二是，即使小数没有被截断，它也不会也像整数部分一样有逗号来分开的
	 * 
	 * 6）m 钱币类型，但关于货币类型有更好的格式化方法，这里只是简单的格式化，另外它只对应于浮点值
	 * 
	 * 例如：Format("this is %m",9552.21);
	 * 
	 * 返回的是：this is ￥9,552.21
	 * 
	 * 7）p 对应于指针类型，返回的值是指针的地址，以十六进制的形式来表示
	 * 
	 * 例如：Format("this is %p",p);
	 * 
	 * 返回的是：this is 0012F548
	 * 
	 * 8）s 对应字符串类型
	 * 
	 * 9）x 必须是一个整形值，以十六进制的形式返回
	 * 
	 * 例如：Format("this is %X",15);
	 * 
	 * 返回的是：this is F
	 * 
	 * @param format
	 * @param args
	 * @return
	 */
	@SuppressWarnings("resource")
	public static String strFormat(Object... args) {
		String format = "%s";
		for (int i = 1; i < args.length; i++) {
			format = new Formatter().format("%s%s", format, "%s").toString();
		}
		return new Formatter().format(format, args).toString();
	}

}
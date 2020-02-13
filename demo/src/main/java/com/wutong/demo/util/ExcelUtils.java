package com.wutong.demo.util;

import com.wutong.demo.domain.ImportError;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Excel工具类
 *
 * @author zhangkai
 */
public class ExcelUtils {

    public static final String[] mustIncellNum = new String[]{"0", "1"};

    private static final int FIRST_ROW = 1;
    private static final int LAST_ROW = 16383;

    public static final String cellNum[] = new String[]{"0", "8", "9", "12", "13", "15", "17"};
    private static final Logger logger = LoggerFactory.getLogger(ExcelUtils.class);

    /**
     * @param input
     * @param msg
     * @return
     */
    public static XSSFWorkbook checkUploadExcel(InputStream input, Map<String, Object> msg) {
        XSSFWorkbook xwb = null;
        try {
            xwb = new XSSFWorkbook(input);
        } catch (IOException e) {
            logger.info("excel生成对象失败！");
            msg.put("msg", "请导入07+版本EXCEL文件！");
            return null;
        }
        XSSFSheet sheet = xwb.getSheetAt(0); // 获得该工作区的第一个sheet
//        if (sheet.getPhysicalNumberOfRows() != sheet.getLastRowNum() + 1) {
//            msg.put("msg", "excel文件里有空行！");
//            return null;
//        }
        if (sheet.getLastRowNum() > 1000) {
            msg.put("msg", "excel文件最多1000行！");
            return null;
        }
        return xwb;
    }


    /**
     * 将类转化为BigDecimal
     *
     * @param cell
     * @return
     */
    private static BigDecimal getBigDecimal(XSSFCell cell) {
        String value;
        if (cell == null) {
            return new BigDecimal("0.00");
        } else {
            value = getValue(cell);
        }
        if (value.equals("")) {
            return new BigDecimal("0.00");
        } else {
            return new BigDecimal(value);
        }
    }

    /**
     * 将列转为字符串
     *
     * @param cell
     * @return
     */
    private static String getValue(XSSFCell cell) {
        String value = "";
        if (cell == null) {
            return value;
        }
        if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
            value = StringUtils.trim(cell.getStringCellValue());
        } else if (XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()) {
            Double val = cell.getNumericCellValue();
            value = (val != null) ? String.valueOf(val) : "";
        }
        return value;
    }

    public static List<Map<String, Object>> readExcelCheckMnoRe(XSSFWorkbook xwb, String[] fields, String[] columnName,
                                                                int[] sizeLimit, Map<String, Object> msg, int rowNum) {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        msg.put("success", "false");
        logger.info("！！！------文件格式检查完毕，开始遍历数据表！");
        XSSFSheet sheet = xwb.getSheetAt(0); //  获得该工作区的第一个sheet
        XSSFRow row = null;
        XSSFCell cell = null;
        Map<String, Object> map = null;
        Set<String> mnoset = new HashSet<String>();
        // 循环输出表格中的内容
        for (int i = 0; i <= sheet.getLastRowNum(); i++) {
            row = sheet.getRow(i);
            // 防止excel文件有空行
            if (isBlankRow(row)) {
                continue;
            }
            // 获得表头内容，并检查
            if (i == 0) {
                for (int j = 0; j < sizeLimit.length; j++) {
                    cell = row.getCell(j);
                    if (cell != null) {
                        if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
                            if (!cell.getStringCellValue().equals(fields[j])) {
                                msg.put("msg", "excel文件表头信息不符！");
                                return null;
                            }
                        } else {
                            msg.put("msg", "第" + (i + 1) + "行第" + (j + 1) + "列单元格类型不是字符型！");
                            return null;
                        }
                    } else {
                        msg.put("msg", "excel文件表头信息缺少！");
                        return null;
                    }
                }
            } else {
                map = new HashMap<String, Object>();
                if (row.getPhysicalNumberOfCells() != row.getLastCellNum()) {
                    msg.put("msg", "excel文件里第" + (i + 1) + "行有空列！");
                    return null;
                }
                for (int j = 0; j < sizeLimit.length; j++) {
                    cell = row.getCell(j);
                    if (cell == null) {
                        msg.put("msg", "excel文件里第" + (i + 1) + "行第" + (j + 1) + "列是空值！");
                        return null;
                    }
                    // 获取单元格内容，
                    if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
                        String string = cell.getStringCellValue();
                        if (string.length() > sizeLimit[j]) {
                            msg.put("msg", "excel文件里第" + (i + 1) + "行第" + (j + 1) + "列字数超出范围！");
                            return null;
                        }
                        if ("".equals(string.trim())) {
                            msg.put("msg", "excel文件里第" + (i + 1) + "行第" + (j + 1) + "列是空值！");
                            return null;
                        }
                        map.put(columnName[j], string.trim());
                        if (j == rowNum - 1) {
                            if (mnoset.contains(string.trim())) {
                                msg.put("msg", "excel文件里第" + (i + 1) + "行第" + (j + 1) + "列商编重复！");
                                return null;
                            } else {
                                mnoset.add(string.trim());
                            }
                        }
                    } else if (XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()) {
                        Double val = cell.getNumericCellValue();
                        String string = (val != null) ? String.valueOf(val) : "";
                        if ("".equals(string.trim())) {
                            msg.put("msg", "excel文件里第" + (i + 1) + "行第" + (j + 1) + "列是空值！");
                            return null;
                        }
                        if (string.length() > sizeLimit[j]) {
                            msg.put("msg", "excel文件里第" + (i + 1) + "行第" + (j + 1) + "列字数超出范围！");
                            return null;
                        }
                        map.put(columnName[j], string.trim());
                        if (j == rowNum - 1) {
                            if (mnoset.contains(string.trim())) {
                                msg.put("msg", "excel文件里第" + (i + 1) + "行第" + (j + 1) + "列商编重复！");
                                return null;
                            } else {
                                mnoset.add(string.trim());
                            }
                        }
                    } else {
                        String string = cell.getStringCellValue();
                        if ("".equals(string.trim())) {
                            msg.put("msg", "excel文件里第" + (i + 1) + "行第" + (j + 1) + "列是空值！");
                            return null;
                        }
                        msg.put("msg", "第" + (i + 1) + "行第" + (j + 1) + "列单元格类型不是文本型！");
                        return null;
                    }
                }
                if (map != null && map.size() > 0 && !map.isEmpty()) {
                    list.add(map);
                }
            }
        }
        logger.info("！！！------遍历成功，有" + list.size() + "条数据！");
        if (list.isEmpty()) {
            msg.put("msg", "导入excel文件无数据，请核对后再做操作！");
            return null;
        }
        msg.put("success", "true");
        return list;
    }


    // 检查是否是空行，不是空行的话检查当前行是否有空列
    public static boolean isBlankRow(XSSFRow row) {
        if (row == null) {
            return true;
        }
        boolean result = true;
        for (int i = row.getFirstCellNum(); i < row.getLastCellNum(); i++) {
            XSSFCell cell = row.getCell(i, XSSFRow.RETURN_BLANK_AS_NULL);
            String value = "";
            if (cell != null) {
                switch (cell.getCellType()) {
                    case Cell.CELL_TYPE_STRING:
                        value = cell.getStringCellValue();
                        break;
                    case Cell.CELL_TYPE_NUMERIC:
                        value = String.valueOf((int) cell.getNumericCellValue());
                        break;
                    case Cell.CELL_TYPE_BOOLEAN:
                        value = String.valueOf(cell.getBooleanCellValue());
                        break;
                    case Cell.CELL_TYPE_FORMULA:
                        value = String.valueOf(cell.getCellFormula());
                        break;
                    // case Cell.CELL_TYPE_BLANK:
                    // break;
                    default:
                        break;
                }

                if (!value.trim().equals("")) {
                    result = false;
                    break;
                }
            }
        }

        return result;
    }

    public static boolean isNumeric(String str) {
        Pattern pattern = Pattern.compile("[0-9]*");
        Matcher isNum = pattern.matcher(str);
        if (!isNum.matches()) {
            return false;
        }
        return true;
    }

    public static boolean isNum(String str) {
        Pattern pattern = Pattern.compile("^-?[0-9]+");
        if (pattern.matcher(str).matches()) {
            // 数字
            return true;
        } else {
            // 非数字
            return false;
        }
    }

    public static boolean compareDate(String date1, String date2) {
        DateFormat df = new SimpleDateFormat("yyyyMMdd");
        try {
            Date dt1 = df.parse(date1);
            Date dt2 = df.parse(date2);
            if (dt1.getTime() < dt2.getTime()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        return false;
    }

    public static List<ImportError> readExcel(XSSFWorkbook xwb, String[] fields, String[] columnName, int[] sizeLimit, List<Map<String, Object>> list) {
        List<ImportError> errorList = new ArrayList<ImportError>();//存放错误信息list集合
        List<String> cellNumlist = Arrays.asList(cellNum);
        logger.info("#批量导入操作，开始遍历数据表！");
        XSSFSheet sheet = xwb.getSheetAt(0); //  获得该工作区的第一个sheet
        XSSFCell cell = null;
        Map<String, Object> map = null;
        // 循环输出表格中的内容
        for (int i = 0; i <= sheet.getLastRowNum(); i++) {
            XSSFRow row = sheet.getRow(i);
            // 防止excel文件有空行
            if (isBlankRow(row)) {
                continue;
            }
            // 获得表头内容，并检查
            if (i == 0) {
                for (int j = 0; j < sizeLimit.length; j++) {
                    cell = row.getCell(j);
                    if (cell != null) {
                        if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
                            if (!cell.getStringCellValue().trim().equals(fields[j])) {
                                errorList.add(new ImportError(+(1) + "行第" + (j + 1) + "列", String.valueOf(j), "列excel文件表头信息不符！"));
                                return null;
                            }
                        } else {
                            errorList.add(new ImportError(+(1) + "行第" + (j + 1) + "列", String.valueOf(j), "列单元格类型不是字符型！"));
                            return null;
                        }
                    } else {
                        errorList.add(new ImportError(+(1) + "行第" + (j + 1) + "列", String.valueOf(j), "excel文件表头信息缺少！"));
                        return null;
                    }
                }
            } else {
                map = new HashMap<String, Object>();
                for (int j = 0; j < sizeLimit.length; j++) {
                    cell = row.getCell(j);
                    if (cellNumlist.contains(String.valueOf(j))) {
                        if (cell == null) {
                            errorList.add(new ImportError(+(i + 1) + "行第" + (j + 1) + "列", String.valueOf(j), "列缺少必填项！"));
                            break;
                        }
                    }
                    // 获取单元格内容
                    String strValue = "";
                    if (cell != null) {
                        if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
                            strValue = StringUtils.trim(cell.getStringCellValue());
                        } else if (XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()) {
                            Double val = cell.getNumericCellValue();
                            DecimalFormat myformat = new DecimalFormat("0");
                            strValue = (val != null) ? myformat.format(val) : "";
                        } else {
                            strValue = StringUtils.trim(cell.getStringCellValue());
                        }
                    }
                    if (cellNumlist.contains(String.valueOf(j))) {
                        if ("".equals(strValue.trim())) {
                            errorList.add(new ImportError(+(i + 1) + "行第" + (j + 1) + "列", strValue, "列必填项未输入！"));
                            break;
                        }
                    }
                    if (strValue.length() > sizeLimit[j]) {
                        errorList.add(new ImportError(+(i + 1) + "行第" + (j + 1) + "列", strValue, "列输入值不在允许范围内,范围[" + sizeLimit[j] + "]"));
                        break;
                    }
                    map.put(columnName[j], strValue.trim());
                }
                if (map != null && map.size() > 0 && !map.isEmpty() && errorList.isEmpty()) {
                    list.add(map);
                }
            }
        }
        logger.info("#批量导入操作#遍历成功，有" + list.size() + "条数据！");
        return errorList;

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

}

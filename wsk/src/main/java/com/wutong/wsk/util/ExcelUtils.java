package com.wutong.wsk.util;

import com.wutong.wsk.domain.ImportError;
import com.wutong.wsk.service.system.DicCodeUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Excel工具类
 *
 * @author zhangkai
 */
public class ExcelUtils {

    private static final Logger logger = LoggerFactory.getLogger(ExcelUtils.class);

    /**
     * 检查导入文件
     *
     * @param request
     * @param msg
     * @return
     */
    public static XSSFWorkbook checkUploadExcel(HttpServletRequest request, Map<String, Object> msg) {
        MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = mulRequest.getFile("file");
        String filename = file.getOriginalFilename();
        XSSFWorkbook xwb = null;
        try {
            InputStream input = file.getInputStream();
            xwb = new XSSFWorkbook(input);
        } catch (IOException e) {
            logger.info("批量添加的文件上传 获取流异常,上传文件名:{}", filename);
            logger.error("异常信息", e);
            msg.put("msg", "读取文件异常！");
            return null;
        }

        XSSFSheet sheet = xwb.getSheetAt(0); // 获得该工作区的第一个sheet
        if (sheet.getLastRowNum() > 50000) {
            msg.put("msg", "excel文件最多50000行！");
            return null;
        }
        return xwb;
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
            value = ObjectUtils.trim(cell.getStringCellValue());
        } else if (XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()) {
            Double val = cell.getNumericCellValue();
            value = (val != null) ? String.valueOf(val) : "";
        }
        return value;
    }

    /**
     * @param file
     * @param modleList
     * @param list
     * @return
     */
    public static List<ImportError> readExcel(MultipartFile file, List<ExcelModle> modleList, List<Map<String, Object>> list) {
        List<ImportError> errorList = new ArrayList<ImportError>();//存放错误信息list集合
        XSSFWorkbook xwb = null;
        try {
            InputStream input = file.getInputStream();
            xwb = new XSSFWorkbook(input);
        } catch (IOException e) {
            logger.error("批量添加的文件上传 获取流异常", e);
            errorList.add(new ImportError("文件", "", "FILE9000", "读取文件异常！"));
            return errorList;
        }

        XSSFSheet sheet = xwb.getSheetAt(0); // 获得该工作区的第一个sheet
        if (sheet.getLastRowNum() > 50000) {
            errorList.add(new ImportError("文件", "", "FILE9001", "文件最多500000行！"));
            return errorList;
        }

        logger.info("#批量导入操作，开始遍历数据表！");
        XSSFCell cell = null;
        Map<String, Object> map = null;
        // 循环输出表格中的内容
        for (int i = 0; i <= sheet.getLastRowNum(); i++) {
            XSSFRow row = sheet.getRow(i);
            if (row == null) {
                errorList.add(new ImportError("第" + (i + 1) + "行", "", "FILE9002", "该行为空行！"));
                return errorList;
            }

            // 获得表头内容，并检查
            if (i == 0) {
                for (int j = 0; j < modleList.size(); j++) {
                    ExcelModle modle = modleList.get(j);
                    cell = row.getCell(j);
                    String errMsg = "表头";
                    if (cell != null) {
                        if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
                            if (!cell.getStringCellValue().trim().equals(modle.getText())) {
                                errorList.add(new ImportError(errMsg, cell.getStringCellValue(), "FILE9011", "文件表头信息不符！期待值：" + modle.getText()));
                                return errorList;
                            }
                        } else {
                            errorList.add(new ImportError(errMsg, cell.getStringCellValue(), "FILE9012", "单元格类型不是字符型！"));
                            return errorList;
                        }
                    } else {
                        errorList.add(new ImportError(errMsg, cell.getStringCellValue(), "FILE9013", "文件表头信息缺少！"));
                        return errorList;
                    }
                }
            } else {
                map = new HashMap<String, Object>();
                for (int j = 0; j < modleList.size(); j++) {
                    ExcelModle modle = modleList.get(j);
                    cell = row.getCell(j);
                    String errMsg = "第" + (i + 1) + "行第" + (j + 1) + "列";
                    if (cell == null && !modle.isNull()) {
                        errorList.add(new ImportError(errMsg, "", "FILE9023", "必填项未输入！"));
                        continue;
                    }
                    // 获取单元格内容
                    String strValue;
                    if (XSSFCell.CELL_TYPE_STRING == cell.getCellType()) {
                        strValue = ObjectUtils.trim(cell.getStringCellValue());
                        if ("Date".equals(modle.getType()) && !DateUtil.validDateYMD(strValue, "yyyy-MM-dd")) {
                            errorList.add(new ImportError(errMsg, strValue, "FILE9021", "日期错误！样例2020-03-15"));
                            continue;
                        }
                        if (!ObjectUtils.isEmpty(modle.getDicCode())) {//插入字典表数据
                            boolean vaildCode = false;
                            List<Map<String, Object>> codeList = DicCodeUtils.DIC_CODE_MAP_KEY.get(modle.getDicCode());
                            for (Map<String, Object> codeMap : codeList) {
                                if (codeMap.get("codeName").equals(strValue)) {
                                    strValue = codeMap.get("codeValue").toString();
                                    vaildCode = true;
                                }
                            }
                            if (!vaildCode) {
                                errorList.add(new ImportError(errMsg, strValue, "FILE9022", "请输入正确业务类型！"));
                                continue;
                            }
                        }
                    } else if (XSSFCell.CELL_TYPE_NUMERIC == cell.getCellType()) {
                        Double val = cell.getNumericCellValue();
                        DecimalFormat myformat = new DecimalFormat("0");
                        strValue = (val != null) ? myformat.format(val) : "";
                    } else {
                        strValue = ObjectUtils.trim(cell.getStringCellValue());
                    }
                    if (ObjectUtils.isEmpty(strValue) && !modle.isNull()) {
                        errorList.add(new ImportError(errMsg, strValue, "FILE9023", "必填项未输入！"));
                        continue;
                    }
                    if (strValue.length() > modle.getSize()) {
                        errorList.add(new ImportError(errMsg, strValue, "FILE9024", "输入值不在允许范围内,范围[" + modle.getSize() + "]"));
                        continue;
                    }
                    map.put(modle.getField(), strValue.trim());
                }
                if (errorList.isEmpty()) {
                    list.add(map);
                }
            }
        }
        logger.info("#批量导入操作#遍历成功，有" + list.size() + "条数据！");
        return errorList;
    }
}

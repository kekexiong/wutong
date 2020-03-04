package com.wutong.cct.service;

import com.wutong.cct.domain.TableDomain;
import com.wutong.cct.domain.TableItem;
import com.wutong.cct.mapper.TableMapper;
import com.wutong.cct.util.FileWriterFactory;
import com.wutong.cct.util.StrUtil;
import com.wutong.cct.util.TableUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class TableService {
    @Autowired
    private TableMapper tableMapper;


    public String[] updateArray = new String[]{"uteUserNo", "uteDt", "uteTm"};
    public String[] innt_selectArray = new String[]{"UUID", "CTE_USER_NO", "CTE_DT", "CTE_TM", "UTE_USER_NO", "UTE_DT", "UTE_TM", "REMARKS"};

    public String[] insertArray = new String[]{"uuid", "cteUserNo", "cteDt", "cteTm"};
    public String[] innt_insertArray = new String[]{"UUID", "CTE_USER_NO", "CTE_DT", "CTE_TM", "UTE_USER_NO", "UTE_DT", "UTE_TM"};


    public List<TableItem> getTableItem(TableDomain param) {
        List<TableItem> itemList = tableMapper.getTableItemForMysql(param);
        for (int i = 0; i < itemList.size(); i++) {
            if ("UUID".equals(itemList.get(i).getColumnName()) || "uuid".equals(itemList.get(i).getColumnName())) {
                itemList.get(i).setIsPrimaryKey("√");
            } else {
                itemList.get(i).setQueryRule("03");//默认输入框
                itemList.get(i).setQueryShow("√");
                if (!hasThis(innt_selectArray, itemList.get(i).getColumnName()) && i < 4) {// 默认前四个为查询项
                    itemList.get(i).setQueryType("√");
                }
                if (!hasThis(innt_insertArray, itemList.get(i).getColumnName())) {
                    itemList.get(i).setQueryAdd("√");
                    itemList.get(i).setQueryImport("√");
                }
                itemList.get(i).setQueryExport("√");
                itemList.get(i).setQueryView("√");
            }
            if ("PRI".equals(itemList.get(i).getIsPrimaryKey())) {
                itemList.get(i).setIsPrimaryKey("√");
            }
            if ("VARCHAR2".equals(itemList.get(i).getDataType()) || "varchar".equals(itemList.get(i).getDataType()) || "CHAR".equals(itemList.get(i).getDataType())) {
                itemList.get(i).setDataType("String");
            }
            if ("datetime".equals(itemList.get(i).getDataType())) {
                itemList.get(i).setDataType("Date");
                itemList.get(i).setDataLength("20");
                itemList.get(i).setQueryRule("06");//
                itemList.get(i).setValidatorType("04");// YMDHMS
            }
            if ("date".equals(itemList.get(i).getDataType())) {
                itemList.get(i).setDataType("Date");
                itemList.get(i).setDataLength("20");
                itemList.get(i).setQueryRule("06");//默认输入框
                itemList.get(i).setValidatorType("03");// YMD
            }
            if (itemList.get(i).getColumnName().contains("TEL") || itemList.get(i).getComments().contains("电话")){
                itemList.get(i).setValidatorType("05");// 电话
            }else if(itemList.get(i).getColumnName().contains("MAIL")  || itemList.get(i).getComments().contains("邮箱")){
                itemList.get(i).setValidatorType("06");// 邮箱
            }
            if ("NUMBER".equals(itemList.get(i).getDataType())) {
                if ("0".equals(itemList.get(i).getDataScale())) {
                    itemList.get(i).setDataType("int");
                    itemList.get(i).setValidatorType("01");
                } else {
                    itemList.get(i).setDataType("BigDecimal");
                }
            }
            if ("decimal".equals(itemList.get(i).getDataType())) {
                itemList.get(i).setDataType("BigDecimal");
            }
            if ("BigDecimal".equals(itemList.get(i).getDataType())) {
                String intMax = "9";
                int pr = Integer.valueOf(itemList.get(i).getDataPrecision());
                int sc = Integer.valueOf(itemList.get(i).getDataScale());
                int j = 1;
                while (j < pr - sc) {
                    intMax = intMax + "9";
                    j++;
                }
                int g = 0;
                if (!"0".equals(itemList.get(i).getDataScale())) intMax = intMax + ".";
                while (g < Integer.valueOf(itemList.get(i).getDataScale())) {
                    intMax = intMax + "9";
                    g++;
                }

                itemList.get(i).setDataLength(intMax);
                itemList.get(i).setValidatorType("02");
            }

            if ("int".equals(itemList.get(i).getDataType())) {
                String intLength = subString(itemList.get(i).getColumnType(), "(", ")");
                String intMax = "9";
                int j = 1;
                while (j < Integer.valueOf(intLength)) {
                    intMax = intMax + "9";
                    j++;
                }
                itemList.get(i).setValidatorType("01");
                itemList.get(i).setDataLength(intMax);
                itemList.get(i).setDataPrecision(intLength);
            }

            // 如果备注为空  字段名字
            if (StringUtils.isEmpty(itemList.get(i).getComments())) {
                itemList.get(i).setComments(itemList.get(i).getColumnName());
            }
            if (itemList.get(i).getComments().contains(" ")) {
                // 含有空格 且有：视为下拉选
                if (itemList.get(i).getComments().contains(":") || itemList.get(i).getComments().contains("：")) {
                    itemList.get(i).setQueryRule("04");
                }
                itemList.get(i).setComments(itemList.get(i).getComments().substring(0, itemList.get(i).getComments().indexOf(" ")));
            }
        }
        return itemList;
    }


    // 判断集合是否存在
    public boolean hasThis(String[] arr, String targetValue) {
        return Arrays.asList(arr).contains(targetValue);
    }

    /**
     * 截取字符串str中指定字符 strStart、strEnd之间的字符串
     *
     * @return
     */
    public static String subString(String str, String strStart, String strEnd) {

        /* 找出指定的2个字符在 该字符串里面的 位置 */
        int strStartIndex = str.indexOf(strStart);
        int strEndIndex = str.indexOf(strEnd);

        /* index 为负数 即表示该字符串中 没有该字符 */
        if (strStartIndex < 0) {
            return "字符串 :---->" + str + "<---- 中不存在 " + strStart + ", 无法截取目标字符串";
        }
        if (strEndIndex < 0) {
            return "字符串 :---->" + str + "<---- 中不存在 " + strEnd + ", 无法截取目标字符串";
        }
        /* 开始截取 */
        String result = str.substring(strStartIndex, strEndIndex).substring(strStart.length());
        return result;
    }

    public void process(List<TableItem> list, TableDomain table) {
        table.setClassNameD(StrUtil.upperFirst(table.getTableName()));
        table.setClassNameX(StrUtil.lowerFirst(table.getTableName()));
        table.setDomainImportPackageList(new ArrayList<String>());
        List<TableItem> updateCarrays = new ArrayList<TableItem>();
        ;// 更新集合
        List<TableItem> insertCarrays = new ArrayList<TableItem>();
        ;// 插入集合
        List<TableItem> exprotCarrays = new ArrayList<TableItem>();
        ;// 查询集合
        for (TableItem item : list) {
            item.setColumnNameD(StrUtil.upperFirst(item.getColumnName()));
            item.setColumnNameX(StrUtil.lowerFirst(item.getColumnName()));
            swtichType(item, table);
            if ("01".equals(item.getQueryAdd()) || hasThis(insertArray, item.getColumnNameX())) {
                insertCarrays.add(item);
            }
            if ("01".equals(item.getQueryAdd()) || hasThis(updateArray, item.getColumnNameX())) {
                updateCarrays.add(item);
            }
            if ("01".equals(item.getQueryExport())) {
                exprotCarrays.add(item);
            }
        }
        table.setTableCarrays(list);
        table.setInsertCarrays(insertCarrays);
        table.setUpdateCarrays(updateCarrays);
        table.setExprotCarrays(exprotCarrays);
        try {
            TableUtil.getTables(table, list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        FileWriterFactory.dataSourceOut("domain.ftl", table, table.getClassNameD() + ".java", FileWriterFactory.DOMAIN);
        FileWriterFactory.dataSourceOut("mapper.ftl", table, table.getClassNameD() + "Mapper.java",
                FileWriterFactory.MAPPER);
        FileWriterFactory.dataSourceOut("mapperXml.ftl", table, table.getClassNameD() + "Mapper.xml",
                FileWriterFactory.MAPPER_XML);
        FileWriterFactory.dataSourceOut("service.ftl", table, table.getClassNameD() + "Service.java",
                FileWriterFactory.SERVICE);
        FileWriterFactory.dataSourceOut("controller.ftl", table, table.getClassNameD() + "Controller.java",
                FileWriterFactory.CONTROLLER);

        FileWriterFactory.dataSourceOut("bapJsp.ftl", table, table.getClassNameX() + ".jsp", FileWriterFactory.JSP);
        FileWriterFactory.dataSourceOut("excel-templateXml.ftl", table, "excel-templateXml.xml",
                FileWriterFactory.EXCELTEMPLATE_XML);

    }

    ;

    private String swtichType(TableItem item, TableDomain table) {
        String bigDecimalImprot = "java.math.BigDecimal";
        String dateImprot = "java.util.Date";
        if ("Date".equals(item.getDataType())) {
            existImprot(table.getDomainImportPackageList(), dateImprot);
        }
        if ("BigDecimal".equals(item.getDataType())) {

            existImprot(table.getDomainImportPackageList(), bigDecimalImprot);
        }
        return item.getDataType();
    }

    /**
     * 判断是否存在引对象
     *
     * @param improtList
     * @param bigDecimalImprot
     */
    private void existImprot(List<String> improtList, String bigDecimalImprot) {
        boolean exist = false;
        if (improtList == null) {
            improtList = new ArrayList<String>();
            improtList.add(bigDecimalImprot);
        } else {
            for (String aa : improtList) {
                if (bigDecimalImprot.equals(aa)) {
                    exist = true;
                }
            }
            if (!exist) {
                improtList.add(bigDecimalImprot);
            }
        }
    }
}

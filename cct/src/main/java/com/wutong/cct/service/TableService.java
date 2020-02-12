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

    public List<TableItem> getTableItem(TableDomain param) {
        List<TableItem> itemList = tableMapper.getTableItemForMysql(param);
        for (int i = 0; i < itemList.size(); i++) {
            if ("UUID".equals(itemList.get(i).getColumnName()) || "uuid".equals(itemList.get(i).getColumnName())) {
                itemList.get(i).setIsPrimaryKey("√");
            }else{
                itemList.get(i).setQueryRule("03");//默认输入框
                itemList.get(i).setQueryShow("√");
                itemList.get(i).setQueryAdd("√");
                itemList.get(i).setQueryExport("√");
                itemList.get(i).setQueryType("√");
                itemList.get(i).setQueryView("√");
                itemList.get(i).setQueryImport("√");
            }
            if ("VARCHAR2".equals(itemList.get(i).getColumnName())) {

            }
            // 如果备注为空  字段名字天剑
            if (StringUtils.isEmpty(itemList.get(i).getComments())) {
                itemList.get(i).setComments(itemList.get(i).getColumnName());
            }

        }
        return itemList;
    }

    private String[] updateArray = new String[]{"opId", "opDt", "opTm"};
    private String[] insertArray = new String[]{"uuid", "opId", "opDt", "opTm", "ctId", "ctDt", "ctTm"};

    // 判断集合是否存在
    public boolean hasThis(String[] arr, String targetValue) {
        return Arrays.asList(arr).contains(targetValue);
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

        FileWriterFactory.dataSourceOut("bapJsp.ftl", table, table.getClassNameD() + ".jsp", FileWriterFactory.JSP);
        FileWriterFactory.dataSourceOut("excel-templateXml.ftl", table, "excel-templateXml.xml",
                FileWriterFactory.EXCELTEMPLATE_XML);

    }

    ;

    private String swtichType(TableItem item, TableDomain table) {
        String bigDecimalImprot = "java.math.BigDecimal";
        if ("VARCHAR2".equals(item.getDataType()) || "varchar".equals(item.getDataType()) || "CHAR".equals(item.getDataType())) {
            item.setDataType("String");
        }
        if ("NUMBER".equals(item.getDataType())) {
            if ("0".equals(item.getDataScale())) {
                item.setDataType("int");
            } else {
                item.setDataType("BigDecimal");
                existImprot(table.getDomainImportPackageList(), bigDecimalImprot);
            }
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

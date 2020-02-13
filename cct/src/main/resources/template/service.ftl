package ${servicePackage};
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ${domainPackage}.${classNameD};
import ${mapperPackage}.${classNameD}Mapper;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import com.wutong.demo.util.FileUtil;
import com.wutong.demo.domain.ImportError;
import com.wutong.demo.util.ExcelUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.wutong.demo.util.UuidUtil;
import com.google.common.collect.Lists;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @title  ${classNameD}Service
 * @author ${classAuthor}
 * @date   ${classTime}
 */
 @Service
public class ${classNameD}Service {

	private static final Logger LOGGER = LoggerFactory.getLogger(${classNameD}Service.class);
	
	@Autowired
	private ${classNameD}Mapper ${classNameX}Mapper;
	<#list tableCarrays as tableCarray>
	<#if (tableCarray.queryRule??) && tableCarray.queryRule == "05">
	/**
	 * @description: 获取付款类型字段
	 * @return map
	 * @author ${classAuthor}
	 * @data ${classTime}
	 */
	public List<Map<String, Object>> get${tableCarray.columnNameD}(){
		return  ${classNameX}Mapper.get${tableCarray.columnNameD}();
	}
	</#if>
	</#list>

	<#if isQuery == "01">
	/**
	 * 根据条件查询
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map) {
		return  ${classNameX}Mapper.findByCondition(map);
	}
	</#if>
	<#if isQuery == "01">
	/**
	 * 根据条件查询总数
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  ${classNameX}Mapper.findByConditionCount(map);
	}
	</#if>
	<#if isQuery == "01">
	/**
	 * 根据主键查询详细
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param paramVo
	 * @return
	 */
	public ${classNameD} getByKey(${classNameD} paramVo) {
		return  ${classNameX}Mapper.getByKey(paramVo);
	}
	</#if>

	<#if isUpdate=="01">
	/**
	 * 更新
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param ${classNameX}
	 * @return
	 */
	public int update(${classNameD} ${classNameX}) {
		return  ${classNameX}Mapper.update(${classNameX});
	}
	</#if>
	<#if isAdd == "01">
	/**
	 * 插入
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param ${classNameX}
	 * @return
	 */
	public int insert(${classNameD} ${classNameX}) {
		return  ${classNameX}Mapper.insert(${classNameX});
	}
	</#if>
	<#if isDetele=="01">
	/**
	 * 根据主键删除
	 * @author ${classAuthor}
 	 * @date   ${classTime}
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map) {
		return  ${classNameX}Mapper.delete(map);
	}
	</#if>
	<#if isImport == "01">
	/**
     * @description:主页面导入功能
     * @param request
     * @return:Map<String, Object>
     * @author:${classAuthor}
     * @date:${classTime}
     */
	public Map<String, Object> batchOperate (HttpServletRequest request){
		LOGGER.info("批量添加${businessName}信息", "", "批量添加${businessName}信息开始");
		Map<String, Object> resultMap = new HashMap<String, Object>();//返回结果map
		//设置表头信息
		String[] fields = {<#list exprotCarrays as tableCarray><#if tableCarray.queryImport == "01">"${tableCarray.comments}"<#if (tableCarray_has_next)>, </#if></#if></#list>};
		//设置表头对应字段
		String [] columnName = {<#list exprotCarrays as tableCarray><#if tableCarray.queryImport == "01">"${tableCarray.columnNameX}"<#if (tableCarray_has_next)>, </#if></#if></#list>};
		//字段对应的长度限制
		int [] sizeLimit = {<#list exprotCarrays as tableCarray><#if tableCarray.queryImport == "01">${tableCarray.dataLength}<#if (tableCarray_has_next)>, </#if></#if></#list>};
        List<Map<String, Object>> readDataList = new ArrayList<Map<String, Object>>();//创建一个存放读取Excel内容的list
        resultMap.put("msgCd", "FILE0000");
        this.fileValid(request, fields, columnName, sizeLimit, readDataList, resultMap);
        resultMap.put("successCount", 0);
        if (!resultMap.get("msgCd").equals("FILE0000") || !Lists.newArrayList(resultMap.get("errorList")).isEmpty()) {
            return resultMap;
        }
        //遍历读取数据
        List<TUser> insertList = organizeData(readDataList);
        List<TUser> subList;
        int insertCount = 1000;
        int result = 0;
        int insertSum = (readDataList.size() % insertCount == 0) ? (readDataList.size() / insertCount) : (readDataList.size() / insertCount + 1);
        for (int i = 0; i < insertSum; i++) {
            subList = ExcelUtils.getChildList(i, insertSum, insertCount, insertList);
            result = i;
            LOGGER.info("批量添加${businessName}信息", "", "批量添加用户信息结束");
            result = result + ${classNameX}Mapper.insertBatch(subList);
        }
        resultMap.put("msgInfo", "导入成功");
        resultMap.put("successCount", result);
        LOGGER.info("#批量添加${businessName}信息#批量导入添加成功#map:{}", resultMap);
        return resultMap;
    }

    /**
     * @description:读取Excel
     * @param request
     * @return:List<TUser>
     * @author:zhao_qg
     * @date:${classTime}
     */
    public Map<String, Object> fileValid(HttpServletRequest request, String[] fields, String[] columnName, int[] sizeLimit, List<Map<String, Object>> readDataList,
                                         Map<String, Object> resultMap) {
        //获取上传文件
        FileUtil fileUtil = new FileUtil();
        InputStream input = fileUtil.getUploadInputStream(request, resultMap);
        if (input == null) {
            LOGGER.info("批量操作${businessName}信息", "", "获取上传的文件流失败");
            resultMap.put("msgCd", "FILE9901");
            resultMap.put("msgInfo", resultMap.get("msg"));
            return resultMap;
        }
        //检查文件是否超出范围
        XSSFWorkbook xwb = ExcelUtils.checkUploadExcel(input, resultMap);
        if (xwb == null) {
            LOGGER.info("批量操作${businessName}信息", "", "上传的文件有问题");
            resultMap.put("msgCd", "FILE9902");
            resultMap.put("msgInfo", resultMap.get("msg"));
            return resultMap;
        }

        // 读取excel
        List<ImportError> errorList = ExcelUtils.readExcel(xwb, fields, columnName, sizeLimit, readDataList);
        if (errorList.size() > 0) {
            resultMap.put("msgCd", "FILE0000");
            resultMap.put("msgInfo", "读取文件错误");
            if (!errorList.isEmpty()) {
                resultMap.put("errorList", errorList);
                resultMap.put("failureCount", errorList.size());
                resultMap.put("hasError", true);
            }
            return resultMap;
        }
        if (readDataList.size() == 0) {
            resultMap.put("msgCd", "FILE9904");
            resultMap.put("msgInfo", "导入excel文件无数据，请核对后再做操作！");
            return resultMap;
        }
        return resultMap;
    }
	/**
     * @description:读取Excel之后，保存数据
     * @param dataMaps
     * @return:List<${classNameD}>
     * @author:${classAuthor}
     * @date:${classTime}
     */
	public List<${classNameD}> organizeData(List<Map<String, Object>> dataMaps){
		//返回list集合数据
		List<${classNameD}> ${classNameX}List = new ArrayList<${classNameD}>();
		for(int i=0;i<dataMaps.size();i++){
			Map<String,Object> dataMap = dataMaps.get(i);
			${classNameD} po = new ${classNameD}();
        <#list insertCarrays as tableCarray>
            <#if tableCarray.columnNameX == "uuid">
            po.set${tableCarray.columnNameD}(UuidUtil.getUUID());
            </#if>
            <#if tableCarray.queryImport == "01">
                <#if tableCarray.dataType == "String">
            po.set${tableCarray.columnNameD}(String.valueOf(dataMap.get("${tableCarray.columnNameX}")));
                </#if>
                <#if tableCarray.dataType == "BigDecimal">
            po.set${tableCarray.columnNameD}(BigDecimal.valueOf(dataMap.get("${tableCarray.columnNameX}")));
                </#if>
                <#if tableCarray.dataType == "int">
            po.set${tableCarray.columnNameD}(Integer.valueOf(dataMap.geget("${tableCarray.columnNameX}")));
                </#if>
            </#if>
         </#list>
        ${classNameX}List.add(po);
		}
		return ${classNameX}List;
	}
	
	/**
     * @description:导入之后导出错误信息
     * @param erroList
     * @param loginName
     * @return:List<${classNameD}>
     * @author:${classAuthor}
     * @date:${classTime}
     */
	public SXSSFWorkbook exportExcelFail (List<Map<String, Object>> erroList, String loginName) throws Exception{
		int count = erroList.size();
        int pageSize = 10000;
        List<Map<String, Object>> infoList;
        String[] tableName = {"错误位置","插入值","错误原因"};
        String[] tableValue = {"position","importValue","failReason"};
        SXSSFWorkbook swb = new SXSSFWorkbook(10000);
            Sheet sheet = swb.createSheet("Sheet");
            Row tableNameRow = sheet.createRow(0);
            for (int j = 0; j < tableName.length; j++) {
                tableNameRow.createCell(j).setCellValue(tableName[j]);
            }
            for (int k = 0; k < count; k++) {
                for (int l = 0; l < erroList.size(); l++) {

                    int curRows = k + l + 1;
                    Row row = sheet.createRow(curRows);
                    Map<String, Object> content = erroList.get(l);

                    for (int m = 0; m < tableValue.length; m++) {
                        row.createCell(m).setCellValue(String.valueOf(content.get(tableValue[m])));
                    }
                    if (0 == curRows % pageSize) {
                        LOGGER.info("SXSSF已处理数据条数" + erroList.size());
                    }
                }
                erroList.clear();
            }
        return swb;
	}
	</#if>
	<#if isExport == "01" >
	/**
	 * 导出
	 * @param paramMap
	 * @return SXSSFWorkbook
	 * @throws Exception
     * @date:${classTime}
	 */
	public SXSSFWorkbook export(Map<String, Object> paramMap) throws Exception{
        int count = findByConditionCount(paramMap);
        int pageSize = 10000; //每次查询10000条
        List<Map<String, Object>> infoList;
        String[] tableName = {<#list exprotCarrays as tableCarray><#if tableCarray.queryExport == "01">"${tableCarray.comments}"<#if (tableCarray_has_next)>,</#if></#if></#list>};
        String[] tableValue = {<#list exprotCarrays as tableCarray><#if tableCarray.queryExport == "01">"${tableCarray.columnNameX}"<#if (tableCarray_has_next)>,</#if></#if></#list>};
        SXSSFWorkbook swb = new SXSSFWorkbook(10000);
        int sheetContentCount = 1000000;
        int sheetCount = 0 == count % sheetContentCount ? count / sheetContentCount : count / sheetContentCount + 1;

        for (int i = 0; i < sheetCount; i++) {
            Sheet sheet = swb.createSheet("Sheet" + (i + 1));
            Row tableNameRow = sheet.createRow(0);
            for (int j = 0; j < tableName.length; j++) {
                tableNameRow.createCell(j).setCellValue(tableName[j]);
            }

            int queryCount = 0 == sheetContentCount % pageSize ? sheetContentCount / pageSize : sheetContentCount / pageSize + 1;
            for (int k = 0; k < queryCount; k++) {
                //循环查询
                paramMap.put("pageNumber", i * queryCount + k + 1);
                paramMap.put("pageSize", pageSize);
                infoList = findByCondition(paramMap);
                if (infoList.isEmpty()) {
                    break;
                }

                for (int l = 0; l < infoList.size(); l++) {

                    int curRows = k * pageSize + l + 1;
                    Row row = sheet.createRow(curRows);
                    Map<String, Object> content = infoList.get(l);

                    for (int m = 0; m < tableValue.length; m++) {
                        row.createCell(m).setCellValue(String.valueOf(content.get(tableValue[m])));
                    }
                    if (0 == curRows % pageSize) {
                        LOGGER.info("SXSSF已处理数据条数" + (curRows + i * sheetContentCount));
                    }
                }
                infoList.clear();
            }
        }
        return swb;
	}
	</#if>
}
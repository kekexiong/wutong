package ${servicePackage};
import ${domainPackage}.${classNameD};
import ${mapperPackage}.${classNameD}Mapper;
import ${classPackage}.domain.ImportError;
import ${classPackage}.util.DateUtil;
import ${classPackage}.util.ExcelModle;
import ${classPackage}.util.ExcelUtils;
import ${classPackage}.util.LoginUtils;
import ${classPackage}.util.ObjectUtils;
import ${classPackage}.service.system.DicCodeUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
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
    <#list tableCarrays as tableCarray>
        <#if tableCarray.columnNameX == "uteDt">
            <#if tableCarray.dataType == "String">
                ${classNameX}.setUteDt(DateUtil.getCurDT());
            </#if>
            <#if tableCarray.dataType == "Date">
                ${classNameX}.setUteDt(DateUtil.getDate());
            </#if>
        </#if>
        <#if tableCarray.columnNameX == "uteTm">
            ${classNameX}.setUteDt(DateUtil.getCurTM());
        </#if>
        <#if tableCarray.columnNameX == "uteUserNo">
            ${classNameX}.setUteUserNo(LoginUtils.getLoginName());
        </#if>
    </#list>
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
    <#list tableCarrays as tableCarray>
        <#if tableCarray.columnNameX == "cteDt">
            <#if tableCarray.dataType == "String">
                ${classNameX}.setCteDt(DateUtil.getCurDT());
            </#if>
            <#if tableCarray.dataType == "Date">
                ${classNameX}.setCteDt(DateUtil.getDate());
            </#if>
        </#if>
        <#if tableCarray.columnNameX == "cteTm">
            ${classNameX}.setCteDt(DateUtil.getCurTM());
        </#if>
        <#if tableCarray.columnNameX == "cteUserNo">
            ${classNameX}.setCteUserNo(LoginUtils.getLoginName());
        </#if>
    </#list>
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

        // 配置导入模板
        List<ExcelModle> excelModleList = getExcelModles();
		List<Map<String, Object>> readDataList = new ArrayList<Map<String, Object>>();//创建一个存放读取Excel内容的list
        resultMap.put("msgCd", "FILE0000");
        resultMap.put("successCount", 0);
        resultMap.put("failureCount", 0);
         // 读取excel
        MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;
        List<ImportError> errorList = ExcelUtils.readExcel(mulRequest.getFile("file"), excelModleList, readDataList);
        if (errorList.size() > 0) {
            resultMap.put("msgCd", "FILE0000");
            resultMap.put("msgInfo", "读取文件错误");
            resultMap.put("errorList", errorList);
            resultMap.put("failureCount", errorList.size());
            return resultMap;
        }
        if (readDataList.size() == 0) {
            resultMap.put("msgCd", "FILE9004");
            resultMap.put("msgInfo", "导入excel文件无数据，请核对后再做操作！");
            return resultMap;
        }
        //遍历读取数据
        List<${classNameD}> insertList = organizeData(readDataList);
        List<${classNameD}> subList;
        int insertCount = 1000;
        int result = 0;
        int insertSum = (readDataList.size() % insertCount == 0) ? (readDataList.size() / insertCount) : (readDataList.size() / insertCount + 1);
        for (int i = 0; i < insertSum; i++) {
            subList = ObjectUtils.getChildList(i, insertSum, insertCount, insertList);
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
     * 配置导入模板
     * @return
     */
    private List<ExcelModle> getExcelModles() {
        List<ExcelModle> excelModleList = new ArrayList<>();
    <#list exprotCarrays as tableCarray>
        <#if tableCarray.queryImport == "01" && tableCarray.queryRule == "04">
        excelModleList.add(new ExcelModle("${tableCarray.comments}", "${tableCarray.columnNameX}", "${tableCarray.dataType}", ${tableCarray.dataLength}, <#if tableCarray.nullable == "YES">true<#else>false</#if>, "${tableName}-${tableCarray.columnName}"));
        <#elseif tableCarray.queryImport == "01">
        excelModleList.add(new ExcelModle("${tableCarray.comments}", "${tableCarray.columnNameX}", "${tableCarray.dataType}", ${tableCarray.dataLength}, <#if tableCarray.nullable == "YES">true<#else>false</#if>));
        </#if>
    </#list>
        return excelModleList;
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
            po.set${tableCarray.columnNameD}(Integer.valueOf(dataMap.get("${tableCarray.columnNameX}")));
                </#if>
                <#if tableCarray.dataType == "Date" && tableCarray.validatorType=="03">
            po.set${tableCarray.columnNameD}(DateUtil.getDate(String.valueOf(dataMap.get("${tableCarray.columnNameX}")), "yyyy-MM-dd"));
                </#if>
                <#if tableCarray.dataType == "Date" && tableCarray.validatorType=="04">
            po.set${tableCarray.columnNameD}(DateUtil.getDate(String.valueOf(dataMap.get("${tableCarray.columnNameX}")), "yyyy-MM-dd HH:mm:ss"));
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
        String[] tableName = {"位置","插入值","失败编码","失败原因"};
        String[] tableValue = {"position","importValue","failCode","failReason"};
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
                <#list exprotCarrays as tableCarray>
                    <#if tableCarray.queryRule == "04">
                    content.put("${tableCarray.columnNameX}", DicCodeUtils.DIC_CODE_MAP.get("${tableName}-${tableCarray.columnName}" + content.get("${tableCarray.columnNameX}")));
                    </#if>
                </#list>
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
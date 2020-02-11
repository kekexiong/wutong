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
     * @date:
     */
	public Map<String, Object> batchOperate (HttpServletRequest request){
		LOGGER.info("批量添加${businessName}信息", "", "批量添加${businessName}信息开始");
		List<Map<String, Object>> reList = new ArrayList<Map<String, Object>>();//存放读取数据list
		Map<String, Object> map = new HashMap<String, Object>();//返回结果map
		List<BnkRetPo> errors = new ArrayList<BnkRetPo>();//存放错误信息list集合
		//设置表头信息
		String[] fields = {
				//在此处手动添加导入文件的表头信息
		};
		//设置表头对应字段
		String [] columnName = {
				//在此处手动添加导入文件的表头对应字段
		};
		//字段对应的长度限制
		int [] sizeLimit = {
				//在此处手动添加导入文件的内容长度限制
		};
		List<Map<String, Object>> dataMaps = new ArrayList<Map<String, Object>>();//创建一个存放读取Excel内容的list
		this.fileValid(request, fields,  columnName, sizeLimit, reList, errors, dataMaps, map);
		if (!(Boolean) map.get("success")) {
            return map;
        }
		//遍历读取数据
		List<${classNameD}> payRefImpTmpList = organizeData(dataMaps);
		//可以在次数对数据特定处理
		//
		//
		//
		map.put("msgCd", "MEC00000");
        map.put("msgInfo", "导入成功");
        /*map.put("successCount", succCount);
        map.put("failureCount", failCount);*/
        if (errors.size() > 0) {
            map.put("hasError", true);
            map.put("errors", errors);
        } else {
            map.put("hasError", false);
            map.put("errors", null);
        }
        LOGGER.info("#批量添加${businessName}信息#批量导入添加成功#map:{}", map);
        return map;
	}
	/**
     * @description:读取Excel
     * @param dataMaps
     * @return:List<${classNameD}>
     * @author:${classAuthor}
     * @date:
     */
	public Map<String, Object> fileValid(HttpServletRequest request, String[] fields, String[] columnName,int[] sizeLimit,
			List<Map<String, Object>> reList, List<BnkRetPo> errors,List<Map<String, Object>> dataMaps,
			Map<String, Object> map){
		//获取上传文件
		FileUtils fileUtils = new FileUtils();
		InputStream input = fileUtils.getUploadInputStream(request, map);
		if (input == null) {
            LOGGER.info("批量操作${businessName}信息", "", "获取上传的文件流失败");
            map.put("success", false);
            map.put("msgCd", "MEC99999");
            map.put("msgInfo", map.get("msg"));
            return map;
        }
		//检查文件是否超出范围
		XSSFWorkbook xwb = ExcelUtils.checkUploadExcel(input, map);
		if (xwb == null) {
            LOGGER.info(LogUtils.genLogs(LogType.BAP, "批量操作${businessName}信息", "", "上传的文件有问题"));
            map.put("success", false);
            map.put("msgCd", "MEC99999");
            map.put("msgInfo", map.get("msg"));
            return map;
        }
		//调用ExcelUtils.readExcelForTSesBinUseful方法，要考虑这个方法是否满足读取需要，如果不满足   则需要自己拷贝并修改读取方法
		ExcelUtils.readExcelForTSesBinUseful(xwb, fields, columnName, sizeLimit, reList, map, errors, dataMaps);
		if (map.get("success").equals("false")) {
            LOGGER.info(LogUtils.genLogs(LogType.BAP, "批量操作${businessName}信息", "", "上传的文件有问题"));
            map.put("success", false);
            map.put("msgCd", "MEC99999");
            map.put("msgInfo", map.get("msg"));
            return map;
        }
		if (dataMaps.size() == 0 && reList.size() == 0) {
            map.put("success", false);
            map.put("msgCd", "MEC99999");
            map.put("msgInfo", "导入excel文件无数据，请核对后再做操作！");
            return map;
        }
		map.put("success", true);
        return map;
	}
	/**
     * @description:读取Excel之后，保存数据
     * @param dataMaps
     * @return:List<${classNameD}>
     * @author:${classAuthor}
     * @date:
     */
	public List<${classNameD}> organizeData(List<Map<String, Object>> dataMaps){
		//返回list集合数据
		List<${classNameD}> ${classNameX}List = new ArrayList<${classNameD}>();
		for(int i=0;i<dataMaps.size();i++){
			Map<String,Object> dataMap = dataMaps.get(i);
			//在此处手动添加要提取的值放入list中
			//可以在次数对数据特定处理
			${classNameD} po = new ${classNameD}();
			${classNameX}List.add(po);
		}
		return ${classNameX}List;
	}
	
	/**
     * @description:导入之后导出错误信息
     * @param dataMaps
     * @return:List<${classNameD}>
     * @author:${classAuthor}
     * @date:
     */
	public File exportExcelFail (List<Map<String, Object>> erroList, String loginName) throws Exception{
		String excelTemplateID = "${classNameX}FailExcel";
        String filePath = FilePathConfigs.ses_file_path + File.separator + excelTemplateID + File.separator;
        FileUtil.mkdirs(filePath);
        String fileId = DateUtils.getCurTime(TimeFormater.yyyyMMddhhmmssSSS);
        filePath = filePath + loginName + "_" + excelTemplateID + fileId + File.separator;
        FileUtil.mkdirs(filePath);
        // 1.获取excel模版
        ExcelTemplateType excelTemplate = ExcelXmlModelFactory.getInstance().getExcelInfo(excelTemplateID);
        // 2.创建excel工具对象
        ExcelExportUtil excelExport = new ExcelExportUtil(excelTemplate);
        // 3.根据模版创建HSSFWorkbook对象
        excelExport.createWorkBookByTemplate();
        // 4.写数据
        excelExport.writeQueryResult(erroList);
        // 5.生成excel文件
        String fileName = "${classNameX}" + System.currentTimeMillis() + ".xls";
        File excelFile = excelExport.genExcel(filePath + fileName);
        return excelFile;
	}
	</#if>
	<#if isExport == "01" >
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
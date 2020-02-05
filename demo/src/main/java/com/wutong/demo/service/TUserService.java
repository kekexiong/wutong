package com.wutong.demo.service;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wutong.demo.domain.TUser;
import com.wutong.demo.mapper.TUserMapper;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @title  TUserService
 * @author zhao_qg
 * @date   20200204 12:09:57
 */
 @Service
public class TUserService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TUserService.class);
	
	@Autowired
	private TUserMapper tUserMapper;
	
	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200204 12:09:57
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map) {
		return  tUserMapper.findByCondition(map);
	}
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200204 12:09:57
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  tUserMapper.findByConditionCount(map);
	}
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200204 12:09:57
	 * @param paramVo
	 * @return
	 */
	public TUser getByKey(TUser paramVo) {
		return  tUserMapper.getByKey(paramVo);
	}
	
	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200204 12:09:57
	 * @param tUser
	 * @return
	 */
	public int update(TUser tUser) {
		return  tUserMapper.update(tUser);
	}
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date   20200204 12:09:57
	 * @param tUser
	 * @return
	 */
	public int insert(TUser tUser) {
		return  tUserMapper.insert(tUser);
	}
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200204 12:09:57
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map) {
		return  tUserMapper.delete(map);
	}
	/**
     * @description:主页面导入功能
     * @param request
     * @return:Map<String, Object>
     * @author:zhao_qg
     * @date:
     */
	public Map<String, Object> batchOperate (HttpServletRequest request){
		LOGGER.info("批量添加用户信息", "", "批量添加用户信息开始");
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
		List<TUser> payRefImpTmpList = organizeData(dataMaps);
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
        LOGGER.info("#批量添加用户信息#批量导入添加成功#map:{}", map);
        return map;
	}
	/**
     * @description:读取Excel
     * @param dataMaps
     * @return:List<TUser>
     * @author:zhao_qg
     * @date:
     */
	public Map<String, Object> fileValid(HttpServletRequest request, String[] fields, String[] columnName,int[] sizeLimit, 
			List<Map<String, Object>> reList, List<BnkRetPo> errors,List<Map<String, Object>> dataMaps, 
			Map<String, Object> map){
		//获取上传文件
		FileUtils fileUtils = new FileUtils();
		InputStream input = fileUtils.getUploadInputStream(request, map);
		if (input == null) {
            LOGGER.info("批量操作用户信息", "", "获取上传的文件流失败");
            map.put("success", false);
            map.put("msgCd", "MEC99999");
            map.put("msgInfo", map.get("msg"));
            return map;
        }
		//检查文件是否超出范围
		XSSFWorkbook xwb = ExcelUtils.checkUploadExcel(input, map);
		if (xwb == null) {
            LOGGER.info(LogUtils.genLogs(LogType.BAP, "批量操作用户信息", "", "上传的文件有问题"));
            map.put("success", false);
            map.put("msgCd", "MEC99999");
            map.put("msgInfo", map.get("msg"));
            return map;
        }
		//调用ExcelUtils.readExcelForTSesBinUseful方法，要考虑这个方法是否满足读取需要，如果不满足   则需要自己拷贝并修改读取方法
		ExcelUtils.readExcelForTSesBinUseful(xwb, fields, columnName, sizeLimit, reList, map, errors, dataMaps);
		if (map.get("success").equals("false")) {
            LOGGER.info(LogUtils.genLogs(LogType.BAP, "批量操作用户信息", "", "上传的文件有问题"));
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
     * @return:List<TUser>
     * @author:zhao_qg
     * @date:
     */
	public List<TUser> organizeData(List<Map<String, Object>> dataMaps){
		//返回list集合数据
		List<TUser> tUserList = new ArrayList<TUser>();
		for(int i=0;i<dataMaps.size();i++){
			Map<String,Object> dataMap = dataMaps.get(i);
			//在此处手动添加要提取的值放入list中
			//可以在次数对数据特定处理
			TUser po = new TUser();
			tUserList.add(po);
		}
		return tUserList;
	}
	
	/**
     * @description:导入之后导出错误信息
     * @param dataMaps
     * @return:List<TUser>
     * @author:zhao_qg
     * @date:
     */
	public File exportExcelFail (List<Map<String, Object>> erroList, String loginName) throws Exception{
		String excelTemplateID = "tUserFailExcel";
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
        String fileName = "tUser" + System.currentTimeMillis() + ".xls";
        File excelFile = excelExport.genExcel(filePath + fileName);
        return excelFile;
	}
	public HSSFWorkbook export(Map<String, Object> map) throws Exception{
        try {
            // 1.获取excel模版
            ExcelTemplateType excelTemplate = ExcelXmlModelFactory.getInstance().getExcelInfo("tUserExportExcel");
            // 2.创建excel工具对象
            ExcelExportUtil excelExport = new ExcelExportUtil(excelTemplate);
            // 3.根据模版创建HSSFWorkbook对象
            excelExport.createWorkBookByTemplate();
            // 参数map
            // 查询付款单总数
            int totalCount = this.findByConditionCount(map);
            // 分页读数据
            int BATCH_SIZE = 10000;
            // 页数
            int PAGE_COUNT = totalCount / BATCH_SIZE + 1;
            for (int p = 0; p < PAGE_COUNT; p++) {
                // 分页查询
                map.put("startRow", p * BATCH_SIZE);
                map.put("endRow", (p + 1) * BATCH_SIZE);
                List<Map<String, Object>> items = this.findByCondition(map);
                // 4.写数据
                excelExport.writeQueryResult(items);
            }
            // 返回内存中生成的HSSFWorkbook对象
            return excelExport.getHSSFWorkbook();
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        }
	}
}
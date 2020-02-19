package com.wutong.wsk.service;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wutong.wsk.domain.User;
import com.wutong.wsk.mapper.UserMapper;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import com.wutong.wsk.util.FileUtil;
import com.wutong.wsk.domain.ImportError;
import com.wutong.wsk.util.ExcelUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.wutong.wsk.util.UuidUtil;
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
 * @title  UserService
 * @author zhao_qg
 * @date   20200218 18:07:40
 */
 @Service
public class UserService {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private UserMapper userMapper;

	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200218 18:07:40
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map) {
		return  userMapper.findByCondition(map);
	}
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200218 18:07:40
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  userMapper.findByConditionCount(map);
	}
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200218 18:07:40
	 * @param paramVo
	 * @return
	 */
	public User getByKey(User paramVo) {
		return  userMapper.getByKey(paramVo);
	}

	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200218 18:07:40
	 * @param user
	 * @return
	 */
	public int update(User user) {
		return  userMapper.update(user);
	}
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date   20200218 18:07:40
	 * @param user
	 * @return
	 */
	public int insert(User user) {
		return  userMapper.insert(user);
	}
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200218 18:07:40
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map) {
		return  userMapper.delete(map);
	}
	/**
     * @description:主页面导入功能
     * @param request
     * @return:Map<String, Object>
     * @author:zhao_qg
     * @date:20200218 18:07:40
     */
	public Map<String, Object> batchOperate (HttpServletRequest request){
		LOGGER.info("批量添加用户信息", "", "批量添加用户信息开始");
		Map<String, Object> resultMap = new HashMap<String, Object>();//返回结果map
		//设置表头信息
		String[] fields = {"编号", "昵称", "真实姓名", "性别 1：男 2：女", "出生年月日 8位 yyyyMMdd", "电话号码", "邮箱", "身份证号", "部门编号", "状态 0：冻结 1 ：正常  2：删除'", "登录密码", "登录时间", "登录IP", "授权角色 0: 所有 ", "是否允许登录 1:允许 0;不允许", "密码输入错误次数", "密码最后修改时间", "创建人", "更新人", "更新日期", "更新时间", "创建日期", "创建时间"};
		//设置表头对应字段
		String [] columnName = {"userId", "name", "realName", "sex", "birthday", "telNo", "mail", "idNumber", "deptNo", "userSts", "loginPwd", "loginTime", "loginIp", "empowerRoles", "isAllowLogin", "pwdErrCunt", "lastUptPwdTime", "cteUserId", "uteUserId", "uteDt", "uteTm", "cteDt", "cteTm"};
		//字段对应的长度限制
		int [] sizeLimit = {10, 20, 100, 1, 8, 13, 30, 18, 10, 2, 255, 14, 20, 20, 1, 3, 14, 0, 0, 8, 6, 8, 6};
        List<Map<String, Object>> readDataList = new ArrayList<Map<String, Object>>();//创建一个存放读取Excel内容的list
        resultMap.put("msgCd", "FILE0000");
        this.fileValid(request, fields, columnName, sizeLimit, readDataList, resultMap);
        resultMap.put("successCount", 0);
        if (!resultMap.get("msgCd").equals("FILE0000") || !Lists.newArrayList(resultMap.get("errorList")).isEmpty()) {
            return resultMap;
        }
        //遍历读取数据
        List<User> insertList = organizeData(readDataList);
        List<User> subList;
        int insertCount = 1000;
        int result = 0;
        int insertSum = (readDataList.size() % insertCount == 0) ? (readDataList.size() / insertCount) : (readDataList.size() / insertCount + 1);
        for (int i = 0; i < insertSum; i++) {
            subList = ExcelUtils.getChildList(i, insertSum, insertCount, insertList);
            result = i;
            LOGGER.info("批量添加用户信息", "", "批量添加用户信息结束");
            result = result + userMapper.insertBatch(subList);
        }
        resultMap.put("msgInfo", "导入成功");
        resultMap.put("successCount", result);
        LOGGER.info("#批量添加用户信息#批量导入添加成功#map:{}", resultMap);
        return resultMap;
    }

    /**
     * @description:读取Excel
     * @param request
     * @return:List<TUser>
     * @author:zhao_qg
     * @date:20200218 18:07:40
     */
    public Map<String, Object> fileValid(HttpServletRequest request, String[] fields, String[] columnName, int[] sizeLimit, List<Map<String, Object>> readDataList,
                                         Map<String, Object> resultMap) {
        //获取上传文件
        FileUtil fileUtil = new FileUtil();
        InputStream input = fileUtil.getUploadInputStream(request, resultMap);
        if (input == null) {
            LOGGER.info("批量操作用户信息", "", "获取上传的文件流失败");
            resultMap.put("msgCd", "FILE9901");
            resultMap.put("msgInfo", resultMap.get("msg"));
            return resultMap;
        }
        //检查文件是否超出范围
        XSSFWorkbook xwb = ExcelUtils.checkUploadExcel(input, resultMap);
        if (xwb == null) {
            LOGGER.info("批量操作用户信息", "", "上传的文件有问题");
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
     * @return:List<User>
     * @author:zhao_qg
     * @date:20200218 18:07:40
     */
	public List<User> organizeData(List<Map<String, Object>> dataMaps){
		//返回list集合数据
		List<User> userList = new ArrayList<User>();
		for(int i=0;i<dataMaps.size();i++){
			Map<String,Object> dataMap = dataMaps.get(i);
			User po = new User();
            po.setUserId(String.valueOf(dataMap.get("userId")));
            po.setName(String.valueOf(dataMap.get("name")));
            po.setRealName(String.valueOf(dataMap.get("realName")));
            po.setSex(String.valueOf(dataMap.get("sex")));
            po.setBirthday(String.valueOf(dataMap.get("birthday")));
            po.setTelNo(String.valueOf(dataMap.get("telNo")));
            po.setMail(String.valueOf(dataMap.get("mail")));
            po.setIdNumber(String.valueOf(dataMap.get("idNumber")));
            po.setDeptNo(String.valueOf(dataMap.get("deptNo")));
            po.setUserSts(String.valueOf(dataMap.get("userSts")));
            po.setLoginPwd(String.valueOf(dataMap.get("loginPwd")));
            po.setLoginTime(String.valueOf(dataMap.get("loginTime")));
            po.setLoginIp(String.valueOf(dataMap.get("loginIp")));
            po.setEmpowerRoles(String.valueOf(dataMap.get("empowerRoles")));
            po.setIsAllowLogin(String.valueOf(dataMap.get("isAllowLogin")));
            po.setPwdErrCunt(String.valueOf(dataMap.get("pwdErrCunt")));
            po.setLastUptPwdTime(String.valueOf(dataMap.get("lastUptPwdTime")));
            po.setCteUserId(String.valueOf(dataMap.get("cteUserId")));
            po.setUteUserId(String.valueOf(dataMap.get("uteUserId")));
            po.setUteDt(String.valueOf(dataMap.get("uteDt")));
            po.setUteTm(String.valueOf(dataMap.get("uteTm")));
            po.setCteDt(String.valueOf(dataMap.get("cteDt")));
            po.setCteTm(String.valueOf(dataMap.get("cteTm")));
        userList.add(po);
		}
		return userList;
	}
	
	/**
     * @description:导入之后导出错误信息
     * @param erroList
     * @param loginName
     * @return:List<User>
     * @author:zhao_qg
     * @date:20200218 18:07:40
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
	/**
	 * 导出
	 * @param paramMap
	 * @return SXSSFWorkbook
	 * @throws Exception
     * @date:20200218 18:07:40
	 */
	public SXSSFWorkbook export(Map<String, Object> paramMap) throws Exception{
        int count = findByConditionCount(paramMap);
        int pageSize = 10000; //每次查询10000条
        List<Map<String, Object>> infoList;
        String[] tableName = {"编号","昵称","真实姓名","性别 1：男 2：女","出生年月日 8位 yyyyMMdd","电话号码","邮箱","身份证号","部门编号","状态 0：冻结 1 ：正常  2：删除'","登录密码","登录时间","登录IP","授权角色 0: 所有 ","是否允许登录 1:允许 0;不允许","密码输入错误次数","密码最后修改时间","创建人","更新人","更新日期","更新时间","创建日期","创建时间"};
        String[] tableValue = {"userId","name","realName","sex","birthday","telNo","mail","idNumber","deptNo","userSts","loginPwd","loginTime","loginIp","empowerRoles","isAllowLogin","pwdErrCunt","lastUptPwdTime","cteUserId","uteUserId","uteDt","uteTm","cteDt","cteTm"};
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
}
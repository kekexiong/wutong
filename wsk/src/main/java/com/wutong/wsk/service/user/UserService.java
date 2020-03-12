package com.wutong.wsk.service.user;
import com.wutong.wsk.domain.user.User;
import com.wutong.wsk.mapper.user.UserMapper;
import com.wutong.wsk.domain.ImportError;
import com.wutong.wsk.util.DateUtil;
import com.wutong.wsk.util.ExcelModle;
import com.wutong.wsk.util.ExcelUtils;
import com.wutong.wsk.util.LoginUtils;
import com.wutong.wsk.util.ObjectUtils;
import com.wutong.wsk.service.system.DicCodeUtils;
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
 * @title  UserService
 * @author zhao_qg
 * @date   20200311 21:17:04
 */
 @Service
public class UserService {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private UserMapper userMapper;

	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200311 21:17:04
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map) {
		return  userMapper.findByCondition(map);
	}
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200311 21:17:04
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  userMapper.findByConditionCount(map);
	}
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200311 21:17:04
	 * @param paramVo
	 * @return
	 */
	public User getByKey(User paramVo) {
		return  userMapper.getByKey(paramVo);
	}

	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200311 21:17:04
	 * @param user
	 * @return
	 */
	public int update(User user) {
            user.setUteUserNo(LoginUtils.getLoginName());
                user.setUteDt(DateUtil.getDate());
		return  userMapper.update(user);
	}
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date   20200311 21:17:04
	 * @param user
	 * @return
	 */
	public int insert(User user) {
            user.setCteUserNo(LoginUtils.getLoginName());
                user.setCteDt(DateUtil.getDate());
		return  userMapper.insert(user);
	}
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200311 21:17:04
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
     * @date:20200311 21:17:04
     */
	public Map<String, Object> batchOperate (HttpServletRequest request){
		LOGGER.info("批量添加用户信息", "", "批量添加用户信息开始");
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
        List<User> insertList = organizeData(readDataList);
        List<User> subList;
        int insertCount = 1000;
        int result = 0;
        int insertSum = (readDataList.size() % insertCount == 0) ? (readDataList.size() / insertCount) : (readDataList.size() / insertCount + 1);
        for (int i = 0; i < insertSum; i++) {
            subList = ObjectUtils.getChildList(i, insertSum, insertCount, insertList);
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
     * 配置导入模板
     * @return
     */
    private List<ExcelModle> getExcelModles() {
        List<ExcelModle> excelModleList = new ArrayList<>();
        excelModleList.add(new ExcelModle("用户ID", "userId", "String", 10, false));
        excelModleList.add(new ExcelModle("昵称", "userName", "String", 20, false));
        excelModleList.add(new ExcelModle("真实姓名", "realName", "String", 100, false));
        excelModleList.add(new ExcelModle("性别", "sex", "String", 1, false, "USER-SEX"));
        excelModleList.add(new ExcelModle("出生年月日", "birthday", "Date", 20, false));
        excelModleList.add(new ExcelModle("电话号码", "telNo", "String", 13, false));
        excelModleList.add(new ExcelModle("邮箱", "mail", "String", 30, false));
        excelModleList.add(new ExcelModle("身份证号", "idNumber", "String", 18, true));
        excelModleList.add(new ExcelModle("部门编号", "deptNo", "String", 10, true));
        excelModleList.add(new ExcelModle("状态", "userSts", "String", 2, true, "USER-USER_STS"));
        excelModleList.add(new ExcelModle("登录密码", "loginPwd", "String", 255, false));
        excelModleList.add(new ExcelModle("登录时间", "loginTime", "String", 14, true));
        excelModleList.add(new ExcelModle("登录IP", "loginIp", "String", 20, true));
        excelModleList.add(new ExcelModle("授权角色", "empowerRoles", "String", 20, true));
        excelModleList.add(new ExcelModle("是否允许登录", "isAllowLogin", "String", 1, false, "USER-IS_ALLOW_LOGIN"));
        excelModleList.add(new ExcelModle("密码错误次数", "pwdErrCunt", "String", 3, true));
        excelModleList.add(new ExcelModle("密码修改时间", "lastUptPwdTime", "Date", 20, true));
        return excelModleList;
    }

	/**
     * @description:读取Excel之后，保存数据
     * @param dataMaps
     * @return:List<User>
     * @author:zhao_qg
     * @date:20200311 21:17:04
     */
	public List<User> organizeData(List<Map<String, Object>> dataMaps){
		//返回list集合数据
		List<User> userList = new ArrayList<User>();
		for(int i=0;i<dataMaps.size();i++){
			Map<String,Object> dataMap = dataMaps.get(i);
			User po = new User();
            po.setUserId(String.valueOf(dataMap.get("userId")));
            po.setUserName(String.valueOf(dataMap.get("userName")));
            po.setRealName(String.valueOf(dataMap.get("realName")));
            po.setSex(String.valueOf(dataMap.get("sex")));
            po.setBirthday(DateUtil.getDate(String.valueOf(dataMap.get("birthday")), "yyyy-MM-dd"));
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
            po.setLastUptPwdTime(DateUtil.getDate(String.valueOf(dataMap.get("lastUptPwdTime")), "yyyy-MM-dd HH:mm:ss"));
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
     * @date:20200311 21:17:04
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
	/**
	 * 导出
	 * @param paramMap
	 * @return SXSSFWorkbook
	 * @throws Exception
     * @date:20200311 21:17:04
	 */
	public SXSSFWorkbook export(Map<String, Object> paramMap) throws Exception{
        int count = findByConditionCount(paramMap);
        int pageSize = 10000; //每次查询10000条
        List<Map<String, Object>> infoList;
        String[] tableName = {"用户ID","昵称","真实姓名","性别","出生年月日","电话号码","邮箱","身份证号","部门编号","状态","登录密码","登录时间","登录IP","授权角色","是否允许登录","密码错误次数","密码修改时间"};
        String[] tableValue = {"userId","userName","realName","sex","birthday","telNo","mail","idNumber","deptNo","userSts","loginPwd","loginTime","loginIp","empowerRoles","isAllowLogin","pwdErrCunt","lastUptPwdTime"};
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
                    content.put("sex", DicCodeUtils.DIC_CODE_MAP.get("USER-SEX" + content.get("sex")));
                    content.put("userSts", DicCodeUtils.DIC_CODE_MAP.get("USER-USER_STS" + content.get("userSts")));
                    content.put("isAllowLogin", DicCodeUtils.DIC_CODE_MAP.get("USER-IS_ALLOW_LOGIN" + content.get("isAllowLogin")));
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
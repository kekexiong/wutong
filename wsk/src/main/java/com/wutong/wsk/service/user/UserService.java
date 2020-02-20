package com.wutong.wsk.service.user;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wutong.wsk.domain.user.User;
import com.wutong.wsk.mapper.user.UserMapper;
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
import com.wutong.wsk.util.DateUtil;
import com.wutong.wsk.util.LoginUtils;
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
 * @date   20200220 19:07:15
 */
 @Service
public class UserService {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private UserMapper userMapper;

	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200220 19:07:15
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map) {
		return  userMapper.findByCondition(map);
	}
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200220 19:07:15
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  userMapper.findByConditionCount(map);
	}
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200220 19:07:15
	 * @param paramVo
	 * @return
	 */
	public User getByKey(User paramVo) {
		return  userMapper.getByKey(paramVo);
	}

	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200220 19:07:15
	 * @param user
	 * @return
	 */
	public int update(User user) {
        user.setUteUserNo(LoginUtils.getLoginName());
        user.setUteDt(DateUtil.getCurDT());
        user.setUteDt(DateUtil.getCurTM());
		return  userMapper.update(user);
	}
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date   20200220 19:07:15
	 * @param user
	 * @return
	 */
	public int insert(User user) {
                user.setCteUserNo(LoginUtils.getLoginName());
                user.setCteDt(DateUtil.getCurDT());
                user.setCteDt(DateUtil.getCurTM());
		return  userMapper.insert(user);
	}
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200220 19:07:15
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map) {
		return  userMapper.delete(map);
	}
	/**
	 * 导出
	 * @param paramMap
	 * @return SXSSFWorkbook
	 * @throws Exception
     * @date:20200220 19:07:15
	 */
	public SXSSFWorkbook export(Map<String, Object> paramMap) throws Exception{
        int count = findByConditionCount(paramMap);
        int pageSize = 10000; //每次查询10000条
        List<Map<String, Object>> infoList;
        String[] tableName = {"用户ID","昵称","真实姓名","性别","出生年月日","电话号码","邮箱","身份证号","部门编号","状态","登录密码","登录时间","登录IP","授权角色","是否允许登录","密码输入错误次数","密码最后修改时间","创建人","更新人","更新日期","更新时间","创建日期","创建时间"};
        String[] tableValue = {"userId","userName","realName","sex","birthday","telNo","mail","idNumber","deptNo","userSts","loginPwd","loginTime","loginIp","empowerRoles","isAllowLogin","pwdErrCunt","lastUptPwdTime","cteUserNo","uteUserNo","uteDt","uteTm","cteDt","cteTm"};
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

	/**
	 * 根据昵称查询密码
	 * @param paramVo
	 * @return
	 */
	public User getByName(User paramVo) {
		return  userMapper.getByName(paramVo);
	}
}
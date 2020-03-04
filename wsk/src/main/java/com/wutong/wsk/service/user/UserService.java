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
import com.wutong.wsk.service.system.DicCodeUtils;
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
 * @date   20200304 16:30:35
 */
 @Service
public class UserService {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserService.class);
	
	@Autowired
	private UserMapper userMapper;

	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200304 16:30:35
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map) {
		return  userMapper.findByCondition(map);
	}
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200304 16:30:35
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  userMapper.findByConditionCount(map);
	}
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200304 16:30:35
	 * @param paramVo
	 * @return
	 */
	public User getByKey(User paramVo) {
		return  userMapper.getByKey(paramVo);
	}

	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200304 16:30:35
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
 	 * @date   20200304 16:30:35
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
 	 * @date   20200304 16:30:35
	 * @param map
	 * @return
	 */
	public int delete(Map
<String,Object> map) {
		return  userMapper.delete(map);
	}
}
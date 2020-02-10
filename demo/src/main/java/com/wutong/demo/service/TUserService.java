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

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @title  TUserService
 * @author zhao_qg
 * @date   20200209 21:35:09
 */
 @Service
public class TUserService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TUserService.class);
	
	@Autowired
	private TUserMapper tUserMapper;
	
	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200209 21:35:09
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map) {
		return  tUserMapper.findByCondition(map);
	}
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200209 21:35:09
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  tUserMapper.findByConditionCount(map);
	}
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200209 21:35:09
	 * @param paramVo
	 * @return
	 */
	public TUser getByKey(TUser paramVo) {
		return  tUserMapper.getByKey(paramVo);
	}
	
	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200209 21:35:09
	 * @param tUser
	 * @return
	 */
	public int update(TUser tUser) {
		return  tUserMapper.update(tUser);
	}
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date   20200209 21:35:09
	 * @param tUser
	 * @return
	 */
	public int insert(TUser tUser) {
		return  tUserMapper.insert(tUser);
	}
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200209 21:35:09
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map) {
		return  tUserMapper.delete(map);
	}
}
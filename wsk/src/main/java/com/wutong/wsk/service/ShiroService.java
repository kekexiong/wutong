package com.wutong.wsk.service;

import com.alibaba.fastjson.JSONArray;
import com.wutong.wsk.domain.TBapSysUser;
import com.wutong.wsk.mapper.TBapSysMenuMapper;
import com.wutong.wsk.mapper.TBapSysRoleMapper;
import com.wutong.wsk.mapper.TBapSysUserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * 
 * @author SKS
 *
 */
@Service
public class ShiroService {
	
	static final Logger logger = LoggerFactory.getLogger(ShiroService.class);
	@Autowired
	private TBapSysMenuMapper tBapSysMenuMapper;
	
	@Autowired
	private TBapSysUserMapper tBapSysUserMapper;
    
	public TBapSysUser queryTBapSysUser(Map<String,String> map){
		return  tBapSysUserMapper.queryTBapSysUser(map);
	}
	
	public JSONArray getMenuList(String str){
		return tBapSysUserMapper.getMenuList(str);
	}

	public  JSONArray 	queryTBapSysMenu (Map<String,String> map){
		return tBapSysMenuMapper.queryTBapSysMenu(map);
	}
}

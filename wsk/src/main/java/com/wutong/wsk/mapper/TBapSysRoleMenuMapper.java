package com.wutong.wsk.mapper;


import com.alibaba.fastjson.JSONArray;
import com.wutong.wsk.domain.TBapSysRoleMenu;

import java.util.Map;

public interface TBapSysRoleMenuMapper {
	public  void  addTBapSysRoleMenu(Map<String, String> map);

	public  void  updateTBapSysRoleMenu(Map<String, String> map);

	public  void  deleteTBapSysRoleMenu(Map<String, String> map);

	public TBapSysRoleMenu queryTBapSysRoleMenu(Map<String, String> map);

	public  Integer  countTBapSysRoleMenu(Map<String, String> map);

	public JSONArray queryAllTBapSysRoleMenu(Map<String, String> map);
	

}
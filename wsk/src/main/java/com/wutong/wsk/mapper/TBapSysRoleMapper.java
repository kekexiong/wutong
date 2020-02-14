package com.wutong.wsk.mapper;


import com.alibaba.fastjson.JSONArray;
import com.wutong.wsk.domain.TBapSysRole;

import java.util.List;
import java.util.Map;

public interface TBapSysRoleMapper {
	public  void  addTBapSysRole(Map<String, String> map);

	public  void  updateTBapSysRole(Map<String, String> map);

	public  void  deleteTBapSysRole(Map<String, String> map);

	public TBapSysRole queryTBapSysRole(Map<String, String> map);

	public  Integer  countTBapSysRole(Map<String, String> map);

	public List<TBapSysRole> findRole(Map map);

	public JSONArray getChildsByRoleId(Map<String, String> map);

}
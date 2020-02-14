package com.wutong.wsk.mapper;



import com.alibaba.fastjson.JSONArray;

import java.util.Map;

public interface TBapSysMenuMapper {
	public  void  addTBapSysMenu(Map<String, String> map);

	public  void  updateTBapSysMenu(Map<String, String> map);

	public  void  deleteTBapSysMenu(Map<String, String> map);

	public JSONArray queryTBapSysMenu(Map<String, String> map);

	public  Integer  countTBapSysMenu(Map<String, String> map);

	public JSONArray getChildsByMenuId(Map<String, String> map);

	public JSONArray findAllTBapSysMenu(Map<String, String> map); 

}
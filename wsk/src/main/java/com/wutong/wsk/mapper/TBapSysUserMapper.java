package com.wutong.wsk.mapper;

import com.alibaba.fastjson.JSONArray;
import com.wutong.wsk.domain.TBapSysUser;

import java.util.List;
import java.util.Map;

public interface TBapSysUserMapper {
	public  void  addTBapSysUser(Map<String, String> map);

	public  void  updateTBapSysUser(Map<String, String> map);

	public  void  deleteTBapSysUser(Map<String, String> map);

	public TBapSysUser queryTBapSysUser(Map<String, String> map);

	public  Integer  countTBapSysUser(Map<String, String> map);

	public JSONArray findTBapSysUser(Map reqmap);

	public JSONArray getMenuList(String userId);
	
	/**
	 * @description:获取T+N自动付款执行过程中断失败原因；用于首页弹出提示
	 * @return:List<Map<String,Object>>
	 * @author:wen_jf@suixingpay.com
	 * @date:2017年4月18日
	 */
	public List<Map<String,Object>> getSesAutoPayBatList();
	
	public  TBapSysUser queryEmpNmByLoginId(String loginId); 

}
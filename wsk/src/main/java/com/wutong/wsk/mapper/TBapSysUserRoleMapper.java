package com.wutong.wsk.mapper;



import com.wutong.wsk.domain.TBapSysUserRole;

import java.util.Map;

public interface TBapSysUserRoleMapper {
	public  void  addTBapSysUserRole(Map<String, String> map);

	public  void  updateTBapSysUserRole(Map<String, String> map);

	public  void  deleteTBapSysUserRole(Map<String, String> map);

	public TBapSysUserRole queryTBapSysUserRole(Map<String, String> map);

	public  Integer  countTBapSysUserRole(Map<String, String> map);

}
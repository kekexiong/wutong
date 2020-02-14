package com.wutong.wsk.domain;



public class TBapSysRoleMenu { 

	private	String	uuid;	
	private	String	roleId;	
	private	String	menuId;	
	private	String	orgId;	
	private	String	dtCte;	
	private	String	tmCte;	
	public	String	getUuid(){
		return uuid;
	}

	public	String	setUuid(String	uuid){
		return	this.uuid	  = uuid;
	}

	public	String	getRoleId(){
		return roleId;
	}

	public	String	setRoleId(String	roleId){
		return	this.roleId	  = roleId;
	}

	public	String	getMenuId(){
		return menuId;
	}

	public	String	setMenuId(String	menuId){
		return	this.menuId	  = menuId;
	}

	public	String	getOrgId(){
		return orgId;
	}

	public	String	setOrgId(String	orgId){
		return	this.orgId	  = orgId;
	}

	public	String	getDtCte(){
		return dtCte;
	}

	public	String	setDtCte(String	dtCte){
		return	this.dtCte	  = dtCte;
	}

	public	String	getTmCte(){
		return tmCte;
	}

	public	String	setTmCte(String	tmCte){
		return	this.tmCte	  = tmCte;
	}
}
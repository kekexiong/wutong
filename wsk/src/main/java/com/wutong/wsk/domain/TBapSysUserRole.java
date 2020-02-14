package com.wutong.wsk.domain;



public class TBapSysUserRole { 

	private	String	uuid;	
	private	String	userId;	
	private	String	roleId;	
	private	String	orgId;	
	private	String	dtCte;	
	private	String	tmCte;	
	public	String	getUuid(){
		return uuid;
	}

	public	String	setUuid(String	uuid){
		return	this.uuid	  = uuid;
	}

	public	String	getUserId(){
		return userId;
	}

	public	String	setUserId(String	userId){
		return	this.userId	  = userId;
	}

	public	String	getRoleId(){
		return roleId;
	}

	public	String	setRoleId(String	roleId){
		return	this.roleId	  = roleId;
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
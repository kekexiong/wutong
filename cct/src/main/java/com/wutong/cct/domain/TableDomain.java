package com.wutong.cct.domain;

import java.util.List;

public class TableDomain {
	private String tableName;// 表
	private String tableNote;// 表注释
	private String  tableSchema; //数据库
	private String  dbType; //数据库类型
	private String businessName;// 业务名称
	private String classPackage; // java类Base包
	private String busPackage; // 业务包
	private String controllerPackage;// 生成包
	private String domainPackage;// 生成包
	private String mapperPackage;// 生成包
	private String servicePackage;// 生成包
	private String mapperXmlPackage;// 生成包
	private String excelXmlPackage;// 生成包
	private String basePath;// 生产文件根目录
	private String jspPackage;// 生成包
	private String classNameD;// 大写
	private String classNameX;// 小写
	private TableItem primaryKey;// 表主键
	private List<TableItem> tableCarrays;// 字段集合
	private List<TableItem> updateCarrays;// 更新集合
	private List<TableItem> insertCarrays;// 插入集合
	private List<TableItem> exprotCarrays;// 导出集合
	private String classAuthor;// 作者
	private String classTime;// 日期
	private String reviewAuthor;// 作者
	private String reviewDate;// 日期
	private String editType;// 编辑器类型
	private List<String> domainImportPackageList;
	private String stringCarrayNames1;
	private String stringCarrayNames2;
	private String stringCarrayNames3;
	private String stringCarrayNames4;
	private String stringCarrayNames5;
	private String stringCarrayNames6;
	private String stringCarrayNames7;// 分页开始
	private String stringCarrayNames8;// 分页结束
	private String specific = "#"; // 特殊符号
	private String specific2 = "$"; // 特殊符号
	private String dbUser; // 数据用户
	private String isAdd; // 曾
	private String isDetele; // 删
	private String isQuery; // 查
	private String isUpdate; // 改
	private String isExport;//是否显示导出按钮
	private String isImport;//是否显示导入按钮
	private String isOperation;//是否显示操作链接

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getTableNote() {
		return tableNote;
	}

	public void setTableNote(String tableNote) {
		this.tableNote = tableNote;
	}

	public String getControllerPackage() {
		return controllerPackage;
	}

	public void setControllerPackage(String controllerPackage) {
		this.controllerPackage = controllerPackage;
	}

	public String getDomainPackage() {
		return domainPackage;
	}

	public void setDomainPackage(String domainPackage) {
		this.domainPackage = domainPackage;
	}

	public String getMapperPackage() {
		return mapperPackage;
	}

	public void setMapperPackage(String mapperPackage) {
		this.mapperPackage = mapperPackage;
	}

	public String getMapperXmlPackage() {
		return mapperXmlPackage;
	}

	public void setMapperXmlPackage(String mapperXmlPackage) {
		this.mapperXmlPackage = mapperXmlPackage;
	}

	public String getJspPackage() {
		return jspPackage;
	}

	public void setJspPackage(String jspPackage) {
		this.jspPackage = jspPackage;
	}

	public List<TableItem> getTableCarrays() {
		return tableCarrays;
	}

	public void setTableCarrays(List<TableItem> tableCarrays) {
		this.tableCarrays = tableCarrays;
	}

	public String getClassNameD() {
		return classNameD;
	}

	public void setClassNameD(String classNameD) {
		this.classNameD = classNameD;
	}

	public String getClassNameX() {
		return classNameX;
	}

	public void setClassNameX(String classNameX) {
		this.classNameX = classNameX;
	}

	public String getClassAuthor() {
		return classAuthor;
	}

	public void setClassAuthor(String classAuthor) {
		this.classAuthor = classAuthor;
	}

	public String getClassTime() {
		return classTime;
	}

	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}

	public List<String> getDomainImportPackageList() {
		return domainImportPackageList;
	}

	public void setDomainImportPackageList(List<String> domainImportPackageList) {
		this.domainImportPackageList = domainImportPackageList;
	}

	public String getStringCarrayNames1() {
		return stringCarrayNames1;
	}

	public void setStringCarrayNames1(String stringCarrayNames1) {
		this.stringCarrayNames1 = stringCarrayNames1;
	}

	public String getStringCarrayNames2() {
		return stringCarrayNames2;
	}

	public void setStringCarrayNames2(String stringCarrayNames2) {
		this.stringCarrayNames2 = stringCarrayNames2;
	}

	public String getStringCarrayNames3() {
		return stringCarrayNames3;
	}

	public void setStringCarrayNames3(String stringCarrayNames3) {
		this.stringCarrayNames3 = stringCarrayNames3;
	}

	public String getStringCarrayNames4() {
		return stringCarrayNames4;
	}

	public void setStringCarrayNames4(String stringCarrayNames4) {
		this.stringCarrayNames4 = stringCarrayNames4;
	}

	public String getStringCarrayNames5() {
		return stringCarrayNames5;
	}

	public void setStringCarrayNames5(String stringCarrayNames5) {
		this.stringCarrayNames5 = stringCarrayNames5;
	}

	public String getStringCarrayNames6() {
		return stringCarrayNames6;
	}

	public void setStringCarrayNames6(String stringCarrayNames6) {
		this.stringCarrayNames6 = stringCarrayNames6;
	}

	public String getStringCarrayNames7() {
		return stringCarrayNames7;
	}

	public void setStringCarrayNames7(String stringCarrayNames7) {
		this.stringCarrayNames7 = stringCarrayNames7;
	}

	public String getStringCarrayNames8() {
		return stringCarrayNames8;
	}

	public void setStringCarrayNames8(String stringCarrayNames8) {
		this.stringCarrayNames8 = stringCarrayNames8;
	}

	public String getSpecific() {
		return specific;
	}

	public void setSpecific(String specific) {
		this.specific = specific;
	}

	public String getDbUser() {
		return dbUser;
	}

	public void setDbUser(String dbUser) {
		this.dbUser = dbUser;
	}

	public String getBasePath() {
		return basePath;
	}

	public void setBasePath(String basePath) {
		this.basePath = basePath;
	}

	public String getServicePackage() {
		return servicePackage;
	}

	public void setServicePackage(String servicePackage) {
		this.servicePackage = servicePackage;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getReviewAuthor() {
		return reviewAuthor;
	}

	public void setReviewAuthor(String reviewAuthor) {
		this.reviewAuthor = reviewAuthor;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getEditType() {
		return editType;
	}

	public void setEditType(String editType) {
		this.editType = editType;
	}

	public String getIsAdd() {
		return isAdd;
	}

	public void setIsAdd(String isAdd) {
		this.isAdd = isAdd;
	}

	public String getIsDetele() {
		return isDetele;
	}

	public void setIsDetele(String isDetele) {
		this.isDetele = isDetele;
	}

	public String getIsQuery() {
		return isQuery;
	}

	public void setIsQuery(String isQuery) {
		this.isQuery = isQuery;
	}

	public String getIsUpdate() {
		return isUpdate;
	}

	public void setIsUpdate(String isUpdate) {
		this.isUpdate = isUpdate;
	}

	public String getIsImport() {
		return isImport;
	}

	public void setIsImport(String isImport) {
		this.isImport = isImport;
	}

	public String getIsExport() {
		return isExport;
	}

	public void setIsExport(String isExport) {
		this.isExport = isExport;
	}

	public String getIsOperation() {
		return isOperation;
	}

	public void setIsOperation(String isOperation) {
		this.isOperation = isOperation;
	}

	public String getClassPackage() {
		return classPackage;
	}

	public void setClassPackage(String classPackage) {
		this.classPackage = classPackage;
	}

	public List<TableItem> getUpdateCarrays() {
		return updateCarrays;
	}

	public void setUpdateCarrays(List<TableItem> updateCarrays) {
		this.updateCarrays = updateCarrays;
	}

	public List<TableItem> getInsertCarrays() {
		return insertCarrays;
	}

	public void setInsertCarrays(List<TableItem> insertCarrays) {
		this.insertCarrays = insertCarrays;
	}

	public List<TableItem> getExprotCarrays() {
		return exprotCarrays;
	}

	public void setExprotCarrays(List<TableItem> exprotCarrays) {
		this.exprotCarrays = exprotCarrays;
	}

	public String getExcelXmlPackage() {
		return excelXmlPackage;
	}

	public void setExcelXmlPackage(String excelXmlPackage) {
		this.excelXmlPackage = excelXmlPackage;
	}

	public String getBusPackage() {
		return busPackage;
	}

	public void setBusPackage(String busPackage) {
		this.busPackage = busPackage;
	}

	public String getTableSchema() {
		return tableSchema;
	}

	public void setTableSchema(String tableSchema) {
		this.tableSchema = tableSchema;
	}

	public String getDbType() {
		return dbType;
	}

	public void setDbType(String dbType) {
		this.dbType = dbType;
	}

	public TableItem getPrimaryKey() {
		return primaryKey;
	}

	public void setPrimaryKey(TableItem primaryKey) {
		this.primaryKey = primaryKey;
	}

	public String getSpecific2() {
		return specific2;
	}

	public void setSpecific2(String specific2) {
		this.specific2 = specific2;
	}
}

<?xml version="1.0" encoding="UTF-8"?>
<excelTemplateList xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
				   xsi:noNamespaceSchemaLocation="../excel_xsd/excel-template.xsd">
	<!-- 导入错误信息导出 -->
	<excelTemplate>
		<excelId>${classNameX}FailExcel</excelId>
        <excelName>${businessName}信息批量错误信息</excelName>
        <excelFileName></excelFileName><!-- 按照不设置模板方式导出 -->
        <excelHead headRowIndex="1">          
          <excelColList excelColIndex="0"  excelColId="bnkCd" excelColName="主账号" excelColWidth="3000"/>
          <excelColList excelColIndex="1"  excelColId="failReason" excelColName="错误原因" excelColWidth="3000"/>
        </excelHead>
	</excelTemplate>
	<!-- 主页面导出功能 -->
	<excelTemplate>
		<excelId>${classNameX}ExportExcel</excelId>
        <excelName>${businessName}信息</excelName>
        <excelFileName></excelFileName><!-- 按照不设置模板导出 -->
        <excelHead headRowIndex="1">
        	<#list exprotCarrays as tableCarray>
        		<excelColList excelColIndex="${tableCarray_index}" excelColId="${tableCarray.columnNameX}" excelColName="<#if tableCarray.comments??>${tableCarray.comments}</#if>"  excelColWidth="3000"/>
        	</#list>
        </excelHead>
	</excelTemplate>
</excelTemplateList>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自动代码生成页面</title>
<jsp:include page="common.jsp" flush="true"></jsp:include>
</head>
<body>

<div class="easyui-window" title="自动代码生成页面" style="width:1200px;height:600px" 
      data-options="iconCls:'icon-save',modal:true">

<table  id="ab"  class="addtable">
    <tr>
		<th style="width: 100px">业务名称:</th>
		<td style="width: 300px"><input class="easyui-validatebox" type="text" name="serviceName" id='serviceName'
			data-options="required:true" size="40" value='test'/></td>
	</tr>
	<tr>
		<th style="width: 100px">java类包:</th>
		<td style="width: 300px"><input class="easyui-validatebox" type="text" name="classPackage" id='classPackage'
			data-options="required:true" size="40" value='test'/></td>
	</tr>
	<tr>
		<th style="width: 100px">类名:</th>
		<td style="width: 300px"><input class="easyui-validatebox" type="text" name="className" id='className'
			data-options="required:true" size="40" value='test'/></td>
	</tr>
</table>
<table id="dg" class="easyui-datagrid" title="属性列表" style="width:1200px;height:auto"
		data-options="
			iconCls: 'icon-edit',
			singleSelect: true,
			toolbar: '#tb',
			url: '',
			method: 'get',
			onClickRow: onClickRow,
			rownumbers: true">
	<thead>
		<tr>
			<th data-options="field:'name',width:100,align:'left',editor:{type:'textbox',options:{required:true}}">Name</th>
			<th data-options="field:'type',width:100,
					formatter:function(value,row){
					var propertyData=typeData
					    for (var i = 0; i < propertyData.length; i++) {
					        if (propertyData[i].id == value) {  
					            return propertyData[i].name 
					        }  
					   }      return value; 
					},
					editor:{
						type:'combobox',
						options:{
							valueField:'id',
							textField:'name',
							method:'get',
							data:typeData,
							required:true
						}
					}">类型</th>
			<th data-options="field:'length',width:80,align:'left',editor:{type:'numberbox',options:{required:true}}">长度</th>
			<th data-options="field:'unitcost',width:80,align:'left',editor:{type:'numberbox',options:{required:true}}">小数</th>
			<th data-options="field:'isPrimaryKey',width:60,align:'center',editor:{type:'checkbox',options:{on:'√',off:''}}">设为主键</th>
			<th data-options="field:'isNull',width:60,align:'center',editor:{type:'checkbox',options:{on:'√',off:''}}">Nullable</th>
			<th data-options="field:'comment',width:180,align:'left',editor:{type:'textbox',options:{required:true,multiline:true}}">备注</th>
			<th data-options="field:'queryType',width:100,
					formatter:function(value,row){
					var propertyData=queryTypeData
					    for (var i = 0; i < propertyData.length; i++) {
					        if (propertyData[i].id == value) {  
					            return propertyData[i].name 
					        }  
					   }      return value; 
					},
					editor:{
						type:'combobox',
						options:{
							valueField:'id',
							textField:'name',
							method:'get',
							data:queryTypeData
						}
					}">是否检索条件</th>
			<th data-options="field:'queryRule',width:100,
					formatter:function(value,row){
					var propertyData=selectRuleData
					    for (var i = 0; i < propertyData.length; i++) {
					        if (propertyData[i].id == value) {  
					            return propertyData[i].name 
					        }  
					   }      return value; 
					},
					editor:{
						type:'combobox',
						options:{
							valueField:'id',
							textField:'name',
							method:'get',
							data:selectRuleData
						}
					}">检索条件类型	</th>
		</tr>
	</thead>
</table>
<div id="tb" style="height:auto">
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">增加</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">删除</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">取消</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">提交</a>
	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="getChanges()">生成代码</a>
</div>
</div>		
<script type="text/javascript">
	var editIndex = undefined;
	function endEditing(){
		if (editIndex == undefined){return true}
		if ($('#dg').datagrid('validateRow', editIndex)){
			//var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'selectRule'});
			//var name = $(ed.target).combobox('getText');
			//$('#dg').datagrid('getRows')[editIndex]['name'] = name;
			$('#dg').datagrid('endEdit', editIndex);
			editIndex = undefined;
			return true;
		} else {
			return false;
		}
	}
	function onClickRow(index){
		if (editIndex != index){
			if (endEditing()){
				$('#dg').datagrid('selectRow', index)
						.datagrid('beginEdit', index);
				editIndex = index;
			} else {
				$('#dg').datagrid('selectRow', editIndex);
			}
		}
	}
	function append(){
		if (endEditing()){
			$('#dg').datagrid('appendRow',{status:'P'});
			editIndex = $('#dg').datagrid('getRows').length-1;
			$('#dg').datagrid('selectRow', editIndex)
					.datagrid('beginEdit', editIndex);
		}
	}
	function removeit(){
		if (editIndex == undefined){return}
		$('#dg').datagrid('cancelEdit', editIndex)
				.datagrid('deleteRow', editIndex);
		editIndex = undefined;
	}
	function accept(){
			if (endEditing()){
				$('#dg').datagrid('endEdit', editIndex);
			}
		}
		function reject(){
			$('#dg').datagrid('rejectChanges');
			editIndex = undefined;
		}
		function getChanges(){
			//表单校验
			if(!$('#ab').form('validate')){
				return false ;		//当表单验证不通过的时候 必须要return false 
			}
			if(!$('#dg').form('validate')){
				return false ;		//当表单验证不通过的时候 必须要return false 
			}
			var rows = $('#dg').datagrid('getChanges');
			
			/*  var updateRows = $('#dg').datagrid('getChanges','updated');//获取修改的行
			 alert(updateRows);
	         var insertRows = $('#dg').datagrid('getChanges', "inserted");//获取添加的行
	         alert(insertRows);
	         var deleteRows = $('#dg').datagrid('getChanges','deleted');//获取删除的行
	         alert(deleteRows); */
	         var rowsData  = $('#dg').datagrid("getRows"); 
			if (rowsData == null || typeof (rowsData[0]) == "undefined") {
				$.messager.alert("信息", "没有可生成代码！", "error");
				return;
			}
			var serviceName=$("#serviceName").val();
			var classPackage=$("#classPackage").val();
			var className=$("#className").val();
			$.ajax({
				url : "${pageContext.request.contextPath}/code/insert",
				type : "POST",
				async : false,
				data : {
					"serviceName" : serviceName,
					"classPackage" : classPackage,
					"className" : className,
					"rowsData" : JSON.stringify(rowsData)
				},
				success : function(rtdata) {
					if (rtdata.MSG != "" && typeof (rtdata.MSG) != "undefined") {//后台处理异常
						$.messager.alert("信息", rtdata.MSG, "error");
						return;
					}
					
					loadLog(rtdata.jobNum)
					$.messager.alert("信息", "提交成功", "success");
				},
				error : function() {
					$.messager.alert("信息", "程序出现未知异常！", "error");
				}
			});
		}
		
		var typeData=[{"id":"01", "name":"String"},{"id":"02", "name":"Integer"},
		              {"id":"03", "name":"Date"},{"id":"04", "name":"BigDecimal"},
		              {"id":"05", "name":"text"},{"id":"06", "name":"Long"},
		              {"id":"07", "name":"Float"}];
		var selectRuleData=[{"id":"01", "name":"可模糊查询"},{"id":"02", "name":"日期单个查询"},
		              {"id":"03", "name":"日期区间查询"}];
		var queryTypeData=[{"id":"01", "name":"是"},{"id":"02", "name":"否"},
				              {"id":"03", "name":"做查询用"}];
	</script>
	</body>
</html>
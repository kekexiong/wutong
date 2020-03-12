<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自动代码生成页面2</title>
<jsp:include page="common.jsp" flush="true"></jsp:include>
</head>
<body>

	<div style="margin:20px 0;"></div>
	<!-- <div class="easyui-window" title="自动代码生成页面" style="width:1200px;height:600px" 
      data-options="iconCls:'icon-save',modal:true"> -->

<table  id="ab"  class="addtable">
    <tr>
		<th style="width: 100px">业务名称:</th>
		<td style="width: 200px"><input class="easyui-validatebox" type="text" name="serviceName" id='serviceName'
			data-options="required:true" size="30" value='test'/></td>
		<th style="width: 100px">java类包:</th>
		<td style="width: 200px"><input class="easyui-validatebox" type="text" name="classPackage" id='classPackage'
			data-options="required:true" size="30" value='test'/></td>
	</tr>
	<tr>
		<th style="width: 100px">类名:</th>
		<td style="width: 200px"><input class="easyui-validatebox" type="text" name="className" id='className'
			data-options="required:true" size="30" value='test'/></td>
		<th style="width: 100px">表名:</th>
		<td style="width: 200px"><input class="easyui-validatebox" type="text" name="tableName" id='tableName'
			data-options="required:true" size="30" value='test'/></td>
	</tr>
	<tr>
		<th style="width: 100px">表注释:</th>
		<td style="width: 200px"><input class="easyui-validatebox" type="text" name="tableComments" id='tableComments'
			data-options="required:true" size="30" value='test'/></td>
		<th style="width: 100px">作者:</th>
		<td style="width: 200px"><input class="easyui-validatebox" type="text" name="classAuthor" id='classAuthor'
			data-options="required:true" size="30" value='test'/></td>
	</tr>
	<tr>
		<th style="width: 100px">数据库名:</th>
		<td>
			<input class="easyui-validatebox" type="text" name="dbUser" id='dbUser'
			data-options="required:true" size="30" value='test'/></td>
		</td>
	</tr>
	<tr>
		<th style="width: 100px">是否新增:</th>
		<td style="width: 200px">
			<span class="radioSpan">
                <input type="radio" name="isAdd" value="00" >否</input>
                <input type="radio" name="isAdd" value="01" checked="true">是</input>
          	</span>
		</td>
		<th style="width: 100px">是否删除:</th>
		<td style="width: 200px">
			<span class="radioSpan">
                <input type="radio" name="isDetele" value="00" >否</input>
                <input type="radio" name="isDetele" value="01" checked="true">是</input>
          	</span>
		</td>
		<th style="width: 100px">是否查询:</th>
		<td style="width: 200px">
			 <span class="radioSpan">
                <input type="radio" name="isQuery" value="00" >否</input>
                <input type="radio" name="isQuery" value="01" checked="true">是</input>
          </span>
		</td>
		<th style="width: 100px">是否更新:</th>
		<td style="width: 200px">
		   <span class="radioSpan">
                <input type="radio" name="isUpdate" value="00" >否</input>
                <input type="radio" name="isUpdate" value="01" checked="true">是</input>
          </span>
		</td>
	</tr>
	<tr>
	<th style="width: 100px">是否导出:</th>
	
		<td style="width: 200px">
		 <span class="radioSpan">
                <input type="radio" name="isExport" value="00" checked="true">否</input>
                <input type="radio" name="isExport" value="01" >是</input>
          </span>
		</td>
		<th style="width: 100px">是否导入:</th>
		<td style="width: 200px">
			<span class="radioSpan">
                <input type="radio" name="isImport" value="00" checked="true">否</input>
                <input type="radio" name="isImport" value="01" >是</input>
          </span>
		</td>
		<th style="width: 100px">操作链接:</th>
		<td style="width: 200px">
		<span class="radioSpan">
                <input type="radio" name="isOperation" value="00" >否</input>
                <input type="radio" name="isOperation" value="01" checked="true">是</input>
          </span>
		</td>
	</tr>
	<tr>
	<th style="width: 100px">测试URL:</th>
		<td style="width: 200px">
			 <a href="" target="_blank" id = "testUrl">测试链接</a>
		</td>
	</tr>
</table>

	<table id="dg" class="easyui-datagrid" title="Row Editing in DataGrid" style="width:auto;height:auto"
			data-options="
				iconCls: 'icon-edit',
				singleSelect: true,
				toolbar: '#tb',
				url: '../code/queryTable',
				method: 'get',
				onClickRow: onClickRow
			">
		<thead>
			<tr>
				<th data-options="field:'columnId',width:80">ID</th>
				<th data-options="field:'columnName',width:100,editor:'textbox'">字段</th>
				<th data-options="field:'isPrimaryKey',width:60,align:'center',editor:{type:'checkbox',options:{on:'√',off:''}}">设为主键</th>
				<th data-options="field:'dataType',width:100,editor:'textbox'">类型</th>
				<th data-options="field:'comments',width:200,editor:'textbox'">注释</th>
				<th data-options="field:'nullable',width:50,editor:'textbox'">为空</th>
				<th data-options="field:'dataLength',width:60,editor:'numberbox'">长度</th>
				<th data-options="field:'dataPrecision',width:70,editor:'numberbox'">数字长度</th>
				<th data-options="field:'dataScale',width:50,editor:'numberbox'">小数点</th>
                <th data-options="field:'validatorType',width:100,
					formatter:function(value,row){
					var propertyData=validatorTypeData
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
							data:validatorTypeData
						}
					}">校验类型</th>
				<th data-options="field:'queryType',width:100,align:'center',editor:{type:'checkbox',options:{on:'√',off:''}}">检索条件</th>
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
					}">检索类型</th>
			<th data-options="field:'queryShow',width:100,align:'center',editor:{type:'checkbox',options:{on:'√',off:''}}">列表字段</th>
			<th data-options="field:'queryAdd',width:100,align:'center',editor:{type:'checkbox',options:{on:'√',off:''}}">添加(修改)字段</th>
			<th data-options="field:'queryView',width:100,align:'center',editor:{type:'checkbox',options:{on:'√',off:''}}">详情字段</th>
			<th data-options="field:'queryExport',width:100,align:'center',editor:{type:'checkbox',options:{on:'√',off:''}}">导出字段</th>
			<th data-options="field:'queryImport',width:100,align:'center',editor:{type:'checkbox',options:{on:'√',off:''}}">导入字段</th>
			</tr>
			
		</thead>
	</table>
 
	<div id="tb" style="height:auto">
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">添加</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="removeit()">删除</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">保存</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">撤销</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="getChanges()">提交</a>
	</div>
	
	<script type="text/javascript">
		var editIndex = undefined;
		function endEditing(){
			if (editIndex == undefined){return true}
			if ($('#dg').datagrid('validateRow', editIndex)){
				var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
			/* 	var productname = $(ed.target).combobox('getText');
				$('#dg').datagrid('getRows')[editIndex]['productname'] = productname; */
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
				$('#dg').datagrid('acceptChanges');
			}
		}
		function reject(){
			$('#dg').datagrid('rejectChanges');
			editIndex = undefined;
		}
		function getChanges(){
			var rows = $('#dg').datagrid('getRows');
			var serviceName=$("#serviceName").val();
			var classPackage=$("#classPackage").val();
			var className=$("#className").val();
			var tableName=$("#tableName").val();
			var tableComments=$("#tableComments").val();
			var classAuthor=$("#classAuthor").val();
			var dbUser=$("#dbUser").val();
			var isQuery = $("input[name='isQuery']:checked").val();
			var isAdd = $("input[name='isAdd']:checked").val();
			var isDetele = $("input[name='isDetele']:checked").val();
			var isUpdate = $("input[name='isUpdate']:checked").val();
			var isImport = $("input[name='isImport']:checked").val();
			var isExport = $("input[name='isExport']:checked").val();
			var isOperation =$("input[name='isOperation']:checked").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/code/saveTable",
				type:"POST",
				async:false,
				data : {
						"serviceName" : serviceName,
						"classPackage" : classPackage,
						"className" : className,
						"tableName" : tableName,
						"tableComments" : tableComments,
						"classAuthor":classAuthor,
						"dbUser":dbUser,
						"isQuery":isQuery,
						"isAdd":isAdd,
						"isDetele":isDetele,
						"isUpdate":isUpdate,
						"isExport":isExport,
						"isImport":isImport,
						"isOperation":isOperation,
						"list" :JSON.stringify(rows),
						},
				success : function(rtdata) {
					//请求完成，隐藏加载遮罩
					$("#good_mod_body").hideLoading();
					
					var status = rtdata.status;
					var msg = rtdata.MSG;
					var temp = "";
					if (status == "FAIL") {//后台校验未通过
						$.each(msg, function(i, n) {
							temp += ((i + 1) + "、" + n + "</br>")
						});
						$.messager.alert("信息", temp, "info");
						$(".panel-tool-close").css("display","none");
					} else if (status == "SUCEESS") {
						$.messager.alert("信息", msg, "info", function() {
							location.replace("${pageContext.request.contextPath}/goods/inpoolgoodslistmain");//修改成功，商品列表
						});
						$(".panel-tool-close").css("display","none");
					}
				},
				error : function() {
					//请求完成，隐藏加载遮罩
					$("#good_mod_body").hideLoading();
					
					$.messager.alert("信息", "程序出现未知异常，修改商品失败！", "error");
					$(".panel-tool-close").css("display","none");
				}
			});
		}
		
		
		$(function (){
			//提交请求
			$.ajax({
				url:"${pageContext.request.contextPath}/code/innt",
				type:"POST",
				async:false,
				dataType:"json",
				success : function(rtdata) {
					$("#serviceName").val(rtdata.businessName);
					$("#classAuthor").val(rtdata.classAuthor);
					$("#tableName").val(rtdata.tableName);
					$("#classPackage").val(rtdata.classPackage);
					$("#dbUser").val(rtdata.dbUser);
					document.getElementById("testUrl").href='http://localhost:8080/cct/jsp/'+rtdata.classNameD+'.jsp';
				},
				error : function() {
				}
			});
		})
		
		var typeData=[{"id":"01", "name":"String"},{"id":"02", "name":"Integer"},
            {"id":"03", "name":"Date"},{"id":"04", "name":"BigDecimal"},
            {"id":"05", "name":"text"},{"id":"06", "name":"Long"},
            {"id":"07", "name":"Float"}];
var selectRuleData=[{"id":"02", "name":"日期区间"},
					{"id":"03", "name":"输入框"},
					{"id":"04", "name":"下拉选择框"},
            		{"id":"05", "name":"自定义下拉选择框"},
					{"id":"06", "name":"日期输入框"},
					{"id":"07", "name":"模糊查询"}];
var queryTypeData=[{"id":"01", "name":"是"},{"id":"02", "name":"否"}];
var isPrimaryKeyData=[{"id":"PRI", "name":"是"},{"id":"", "name":"否"}];
var selectShowData=[{"id":"01", "name":"是"},{"id":"02", "name":"否"}];
var selectAddData=[{"id":"01", "name":"是"},{"id":"02", "name":"否"}];
var selectViewData=[{"id":"01", "name":"是"},{"id":"02", "name":"否"}];
var selectExportData=[{"id":"01", "name":"是"},{"id":"02", "name":"否"}];
var validatorTypeData= [{"id":"01", "name":"数字"},
            			{"id":"02", "name":"金额"},
            			{"id":"03", "name":"日期YMD"},
            			{"id":"04", "name":"日期时间YMDHMS"},
            			{"id":"05", "name":"电话"},
            			{"id":"06", "name":"邮箱"}];
	</script>
</body>
</html>
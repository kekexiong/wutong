<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh-hans">
<!--<![endif]-->

<head>
<meta charset="utf-8" />
<title>收单管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=320, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="../common/resource.jsp" flush="true" />

</head>

<!-- <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md"> -->
<body class="iframe-body">

	<!-- BEGIN HEADER -->
	<jsp:include page="../common/header.jsp" flush="true" />
	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->
	<div class="clearfix"></div>
	<div class="page-container">
		<!-- BEGIN MENU -->
		<%-- <jsp:include page="../common/menu.jsp" flush="true" /> --%>
		<!-- END MENU -->

		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<!-- 主体-->
			<!-- <div class="page-content"> -->
			<div class="">
				<!-- 右边开始 -->
				<div class="row">
					<div class="col-md-12">
						<div class="portlet light bordered scaffold-list">
							<!-- 查询信息 -->
							<div class="portlet-body form">
								<form action="<%=request.getContextPath()%>/mec/queryData" class="form-horizontal" id="queryMecPanel_Form">
									<div class="row norow">
										<#list tableCarrays as tableCarray>
											<#if (tableCarray.queryType??) && tableCarray.queryType == "01">
												<#if (tableCarray.queryRule??) && tableCarray.queryRule == "03">
													<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
														<div class="form-group">
															<label for="span-medium-2"
																class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
															<div class="col-md-8 paddingnone">
																<input name="${tableCarray.columnNameX}"
																	id="${tableCarray.columnName}" class="form-control"
																	placeholder="${tableCarray.comments}">
															</div>
														</div>
													</div>
												</#if> 
												<#if (tableCarray.queryRule??) && tableCarray.queryRule == "02">
													<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
															<div class="col-md-8 paddingnone">
																<div class="input-group input-daterange">
																	<input type="text" class="form-control col-md-3"
																		name="${tableCarray.columnNameX}beginDt"
																		id="${tableCarray.columnName}_beginDt"> <span
																		class="input-group-addon"> <i
																		class="fa fa-exchange"></i>
																	</span> <input type="text" class="form-control"
																		name="${tableCarray.columnNameX}endDt"
																		id="${tableCarray.columnName}_endDt">
																</div>
															</div>
														</div>
													</div>
												</#if> 
												<#if (tableCarray.queryRule??) && tableCarray.queryRule== "01">
													<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
														<div class="form-group">
															<label for="span-medium-2"
																class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
															<div class="col-md-8 paddingnone">
																<input name="${tableCarray.columnNameX}"
																	id="${tableCarray.columnName}_MNO" class="form-control"
																	placeholder="${tableCarray.comments}">
															</div>
														</div>
													</div>
												</#if> 
												<#if (tableCarray.queryRule??) && (tableCarray.queryRule == "04" || tableCarray.queryRule == "05")>
													<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
															<div class="col-md-8 paddingnone">
																<select name="${tableCarray.columnNameX}"
																	id="${tableCarray.columnName}"
																	class="bs-select form-control" data-show-subtext="true">
																</select>
															</div>
														</div>
													</div>
												</#if>
												<#if (tableCarray.queryRule??) && tableCarray.queryRule == "06"><!-- 时间输入框 -->
													<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
														<div class="form-group">
															<label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
															<div class="col-md-8 paddingnone">
																<div class="input-group input-daterange">
																	<input type="text" class="form-control col-md-3"
																		name="${tableCarray.columnNameX}" id="${tableCarray.columnName}">
																</div>
															</div>
														</div>
													</div>
												</#if> 
											</#if>
										</#list>
									</div>
									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-offset-1 col-md-11">
														<button type="button" id="query_btn" class="btn btn-success">
															<i class="fa fa-search"></i> 查询
														</button>
														<button type="button" id="reset_btn" class="btn red">
															<i class="fa fa-refresh"></i> 重置
														</button>
														<#if isAdd == "01">
														<button type="button" id="add_btn" class="btn btn-info"> 
															<i class="fa fa-plus"></i> 添加
														</button>
														</#if>
														<#if isUpdate == "01">
														<button type="button" id="edit_btn" class="btn tn btn btn-primary"> 
															<i class="fa fa-edit"></i> 修改
														</button>
														</#if>
														<#if isDetele == "01">
														<button type="button" id="dele_btn" class="btn tn btn btn-primary"> 
															<i class="fa fa-trash-o fa-lg"></i> 删除
														</button>
														</#if>
														<#if isExport == "01">
															<button type="button" id="isExport_btn" class="btn tn btn btn-primary"> 
																<i class="fa fa-download"></i> 导出
															</button>
														</#if>
														<#if isImport == "01">
															<button type="button" id="download_template_btn" class="btn btn btn-primary">
															 <i class="fa fa-download"></i>下载模板
															</button>
														</#if>
														<#if isImport == "01">
															<button type="button" id="isImport_btn" class="btn tn btn btn-primary"> 
																<i class="fa fa-upload"></i> 导入
															</button>
														</#if>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>


						</div>
						<div class="clearfix"></div>
						<div class="portlet light bordered scaffold-list">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-search font-blue"></i> <span
										class="caption-subject font-blue bold uppercase">${businessName}信息列表</span>
								</div>
								<div class="tools">
									<a href="" class="fullscreen" data-original-title="全屏" title=""></a>
								</div>
							</div>
							<div class="portlet-body wheel">
								<div>
									<table
										class="table table-striped table-bordered table-hover table-checkable order-column"
										id="queryMecGrid">
										<thead>
											<tr>
												<th><input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" /></th> 
													<th class="nowrap">序号</th>
													<#list tableCarrays as tableCarray>
														<#if (tableCarray.queryShow??) && tableCarray.queryShow == "01" && tableCarray.isAddColumnName != "3">
															<th class="nowrap">${tableCarray.comments}</th> 
														</#if>
													</#list>
													<#if isOperation == "01">
														<th class="nowrap">操作</th> 
													</#if>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 分页开始 -->
							<div class="row no-margin" id="pagination-bar">
								<div class="col-sm-12 left no-padding">
									<div class="inline fl">
										记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span
											id="toalPage"></span>页 每页显示:
									</div>
									<div class="inline fl">
										<select id="limit" class=" form-control "
											onchange="onChange4PageSize(this)">
											<option value="10">10</option>
											<option value="20" selected="selected">20</option>
											<option value="30">30</option>
											<option value="50">50</option>
											<option value="80">80</option>
											<option value="100">100</option>
										</select>
									</div>
									<div class="inline fl">条</div>

								<div class="col-sm-6 pull-right no-padding">
									<div id="pagination"
										class="dataTables_paginate paging_simple_numbers clearfix pull-right">
										<nobr>
											<ul class="pagination no-padding" style="float: left">
												<li class="prev "><a href="javascript:;"
													onclick="javascript:pageing(1)"> 首页</a></li>
												<li class="prev "><a href="javascript:;"
													onclick="javascript:pageing('pro')"> 上一页</a></li>
												<li class="next "><a href="javascript:;"
													onclick="javascript:pageing('next')">下一页</a></li>
												<li class="next "><a href="javascript:;"
													onclick="javascript:pageing('last')">末页</a></li>
											</ul>
											<div class="input-group pull-right col-sm-2"
												style="float: left;">
												<input min="1" class="form-control p"
													style="height: 31px; width: 80px;" type="number"> <a
													href="javascript:;" class="input-group-addon"
													onclick="javascript:pageing($('.p').val())"><i
													class="fa fa-mail-forward brown"></i></a>
											</div>
										</nobr>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!----------------------------------- 添加(修改)功能弹出页面（获取输入值的输入框后缀统一增加_SHOW标识符） ------------------------------------------>
		<div class="modal fade" id="addOrUpdateWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="700px" data-height="300px">
	        <div class="modal-header">
	           <button type="button" class="close" 
	              data-dismiss="modal" aria-hidden="true">
	                 &times;
	           </button>
	           <h4 class="modal-title" id="addOrUpdateWin_title"></h4>
	        </div>
	        <div class="modal-body">
	           <div class="portlet-body form">
	               <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="addOrUpdateform">
	                   <div class="form-body">
	                       <div class="row norow">
	                       	<input type="hidden" value = "" id = "hiddenType"/>
	                       	<input type="hidden" value = "" id = "hiddenUUid"/>
	                           <#list tableCarrays as tableCarray>
	                           		<#if (tableCarray.queryAdd??) && (tableCarray.queryAdd == "01")>
	                           			<#if (tableCarray.queryRule??) && tableCarray.queryRule == "01"><!-- 商编输入 -->
		                           			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
													<div class="col-md-8 paddingnone">
														<input name="${tableCarray.columnNameX}" id="${tableCarray.columnName}_MNO_SHOW" 
															class="form-control" placeholder="${tableCarray.comments}">
													</div>
												</div>
											</div>
	                           			</#if>
	                           			<#if (tableCarray.queryRule??) && tableCarray.queryRule == "02"><!-- 时间区间值输入 -->
		                           			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
													<div class="col-md-8 paddingnone">
														<div class="input-group input-daterange">
															<input type="text" class="form-control col-md-3"
																name="${tableCarray.columnNameX}beginDt"
																id="${tableCarray.columnName}_beginDt_SHOW"> <span
																class="input-group-addon"> <i
																class="fa fa-exchange"></i>
															</span> <input type="text" class="form-control"
																name="${tableCarray.columnNameX}endDt"
																id="${tableCarray.columnName}_endDt_SHOW">
														</div>
													</div>
												</div>
											</div>
	                           			</#if>
	                           			<#if (tableCarray.queryRule)?? && tableCarray.queryRule == "03"><!-- 普通输入框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
												<div class="col-md-8 paddingnone">
													<input name="${tableCarray.columnNameX}"
														id="${tableCarray.columnName}_SHOW" class="form-control"
														placeholder="${tableCarray.comments}">
												</div>
											</div>
										</div>
	                           		</#if>
	                           		<#if (tableCarray.queryRule)?? && (tableCarray.queryRule == "04" || tableCarray.queryRule == "05")><!-- 下拉框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
												<div class="col-md-8 paddingnone">
													<select name="${tableCarray.columnNameX}"
														id="${tableCarray.columnName}_SHOW"
														class="bs-select form-control" data-show-subtext="true">
													</select>
												</div>
											</div>
										</div>
									</#if>
									<#if (tableCarray.queryRule)?? && tableCarray.queryRule == "06"><!-- 时间输入框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
												<div class="col-md-8 paddingnone">
													<div class="input-group input-daterange">
														<input type="text" class="form-control col-md-3"
															name="${tableCarray.columnNameX}"
															id="${tableCarray.columnName}_SHOW">
													</div>
												</div>
											</div>
										</div>
									</#if>
									</#if>
	                           </#list>
	                           <div class="clearfix"></div>
	                       </div>
	                   </div>
	                   <div class="form-actions">
	                       <div class="row">
	                           <div class="col-md-12">
	                               <div class="row">
	                                   <div class="col-md-12" style="text-align:center;">
	                                       <button type="button" id="addform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 提交</button>
	                                       <button type="button" id="addform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
	                                   </div>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </form>
	           </div>
	        </div>
    	</div>
    	<!-- ---------------------------------------详情页面展示(获取输入值的输入框后缀统一增加_VIEW标识符)------------------------------------------------------------ -->
		<#if isOperation == "01">
			<div class="modal fade" id="viewWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="700px" data-height="300px">
		        <div class="modal-header">
		           <button type="button" class="close" 
		              data-dismiss="modal" aria-hidden="true">
		                 &times;
		           </button>
		           <h4 class="modal-title" >${businessName}详情信息</h4>
		        </div>
		        <div class="modal-body">
		           <div class="portlet-body form">
		               <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="">
		                   <div class="form-body">
		                       <div class="row norow">
		                           <#list tableCarrays as tableCarray>
		                           		<#if (tableCarray.queryView??) && (tableCarray.queryView == "01")>
		                           			<#if (tableCarray.queryRule??) && tableCarray.queryRule == "01"><!-- 商编输入 -->
			                           			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
													<div class="form-group">
														<label for="span-medium-2"
															class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
														<div class="col-md-8 paddingnone">
															<input name="${tableCarray.columnNameX}" id="${tableCarray.columnName}_MNO_VIEW" 
																disabled="disabled"
																class="form-control" placeholder="${tableCarray.comments}">
														</div>
													</div>
												</div>
		                           			</#if>
		                           			<#if (tableCarray.queryRule??) && tableCarray.queryRule == "02"><!-- 时间区间值输入 -->
			                           			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
													<div class="form-group">
														<label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
														<div class="col-md-8 paddingnone">
															<div class="input-group input-daterange">
																<input type="text" class="form-control col-md-3"
																	disabled="disabled"
																	name="${tableCarray.columnNameX}beginDt"
																	id="${tableCarray.columnName}_beginDt_VIEW"> <span
																	class="input-group-addon"> <i
																	class="fa fa-exchange"></i>
																</span> <input type="text" class="form-control" disabled="disabled"
																	name="${tableCarray.columnNameX}endDt"
																	id="${tableCarray.columnName}_endDt_VIEW">
															</div>
														</div>
													</div>
												</div>
		                           			</#if>
		                           			<#if (tableCarray.queryRule??) && tableCarray.queryRule == "06"><!-- 时间值输入 -->
			                           			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
													<div class="form-group">
														<label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
														<div class="col-md-8 paddingnone">
															<div class="input-group input-daterange">
																<input type="text" class="form-control col-md-3"
																	disabled="disabled"
																	name="${tableCarray.columnNameX}"
																	id="${tableCarray.columnName}_VIEW"> 
															</div>
														</div>
													</div>
												</div>
		                           			</#if>
		                           			<#if (tableCarray.queryRule)?? && tableCarray.queryRule == "03"><!-- 普通输入框 -->
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
												<div class="form-group">
													<label for="span-medium-2"
														class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
													<div class="col-md-8 paddingnone">
														<input name="${tableCarray.columnNameX}"
															id="${tableCarray.columnName}_VIEW" class="form-control" disabled="disabled"
															placeholder="${tableCarray.comments}">
													</div>
												</div>
											</div>
		                           		</#if>
		                           		<#if (tableCarray.queryRule)?? && (tableCarray.queryRule == "04" ||tableCarray.queryRule == "05")><!-- 下拉框 -->
											<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
												<div class="form-group">
													<label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
													<div class="col-md-8 paddingnone">
														<select name="${tableCarray.columnNameX}"
															id="${tableCarray.columnName}_VIEW"
															class="bs-select form-control" data-show-subtext="true">
														</select>
													</div>
												</div>
											</div>
										</#if>
										</#if>
		                           </#list>
		                           <div class="clearfix"></div>
		                       </div>
		                   </div>
		                   <div class="form-actions">
		                       <div class="row">
		                           <div class="col-md-12">
		                               <div class="row">
		                                   <div class="col-md-12" style="text-align:center;">
		                                       <button type="button" id="openform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
		                                   </div>
		                               </div>
		                           </div>
		                       </div>
		                   </div>
		               </form>
		           </div>
		        </div>
	    	</div>
		</#if>
		<#if isImport == "01">
		<!-- ---------------------------------------------导出弹出页面----------------------------------------------------- -->
		<div class="modal fade" id="importOpenWin" tabindex="-1"
				role="dialog" data-backdrop="static" data-width="650px"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="Select_title">文件</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<div class="form-body">
							<div class="row norow">
								<div class="panel panel-primary">
									<form action="<%=request.getContextPath()%>/"
										class="form-horizontal" id="importOpenWinform"
										enctype="multipart/form-data">
										<div class="panel-body">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<div class="form-group">
													<label class="control-label col-md-3 text-right">请选择文件:</label>
													<div class="col-md-8 paddingnone">
														<input id="importFile" name="file" type="file"
															class="file"> <input type="hidden" id="type"
															name="type">
													</div>
												</div>
											</div>
											<div class="form-actions">
												<div class="row">
													<div class="col-md-12">
														<div class="row">
															<div class="col-md-12" style="text-align: center;">
																<button type="button" id="importOpenform_save_btn"
																	class="btn btn-success">
																	<i class="fa fa-save"></i> 确认
																</button>
																<button type="button" id="importOpenform_cancel_btn"
																	class="btn red">
																	<i class="fa fa-refresh"></i> 关闭
																</button>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="clearfix"></div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ----------------------------------------导入结果弹出框-------------------------------------------------- -->
			<div class="modal fade" id="ResultWin" tabindex="-1" role="dialog"
				data-backdrop="static" data-height="500px" data-width="750px"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="Resulttitle">批量导入操作结果</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<div class="form-body">
							<div class="row norow">
								<div class="panel panel-primary">
									<div class="row norow">
										<div class="panel panel-primary">
											<div class="panel-heading">
												<h4 class="panel-title" id="importResult"></h4>
											</div>
											<input type="hidden" name="errorCount" id="errorCount"
												value="" />
											<div class="portlet-body wheel">
												<table
													class="table table-striped table-bordered table-hover table-checkable order-column"
													id="importResultPanel">
													<thead style="font-size: 2px">
														<tr>
															<th>序号</th>
															<th>主账号</th>
															<th>错误原因</th>
														</tr>
													</thead>
													<tbody>
													</tbody>
												</table>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-12" style="text-align: center;">
														<button type="button" id="errorImExcel" class="btn red">
															<i class="fa fa-share"></i> 导出excel
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</#if>
		<#if isExport == "01">
		<!-- -----------------------------------------导出弹出页面--------------------------------------------------------------- -->
		<div class="modal fade" id="exportExcelWin" tabindex="-1"
				role="dialog" data-backdrop="static" aria-labelledby="myModalLabel"
				aria-hidden="true">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="">导出EXCEL</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<form action="<%=request.getContextPath()%>/"
							class="form-horizontal" id="exportform">
							<div class="form-body">
								<div class="row norow">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<input name="innerExcelType" class="col-md-6 text-right"
												id="innerExcelType">
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="form-actions">
								<div class="row">
									<div class="col-md-12">
										<div class="row">
											<div class="col-md-12" style="text-align: center;">
												<button type="button" id="exportform_save_btn"
													class="btn btn-success">
													<i class="fa fa-save"></i> 确认
												</button>
												<button type="button" id="exportform_cancel_btn"
													class="btn red">
													<i class="fa fa-share"></i> 取消
												</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</#if>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" flush="true" />

	<script type="text/javascript">
		//分页功能
		//分页默认隐藏
		$("#pagination-bar").hide();
		//每页多少条
		var limit = 0;
		//当前页
		var page = 1;
		//起始条
		var start = 0;
		//总页数
		var toalPage;
		//数据列表缓存
		var tableData;
	
		var importLimit = 0;
	
		var importPage = 1;
	
		var importStart = 0;
	
		var importTotalPage;
	
		function pageing(opp) {
			$(window.document).scrollTop(0, 500);
			limit = $("#limit  option:selected").text();
	
			if (opp == 'pro') {
				if (page > 1) {
					page = page - 1;
					start = (page - 1) * limit;
				} else {
					bootbox.alert('已经是第一页');
					return;
				}
			} else if (opp == 'next') {
				if (page == toalPage) {
					bootbox.alert('已经是最后一页');
					return;
				}
				page = page + 1;
				start = (page - 1) * limit;
			} else if (opp == 'last') {
				if (page == toalPage) {
					bootbox.alert('已经是最后一页');
					return;
				}
				page = $("#toalPage").text();
				if (page > toalPage) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				} else if (page < 1) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				}
	
				start = (page - 1) * limit;
			} else {
				if (page == 1 && opp == 1) {
					bootbox.alert('已经是第一页');
					return;
				}
				page = opp * 1;
				if (page > toalPage) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				} else if (page < 1) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				}
	
				start = (page - 1) * limit;
			}
			$('#queryMecGrid > tbody').empty();
			reloadGrid();
		}
		//全选列表数据
	    function checkAll(checked) {
	    	$("#queryMecGrid tbody :checkbox").prop('checked', checked);
	    }
		function onChange4PageSize(select) {
	    	limit = select.value;
	    	reloadGrid();
	    }
		//初始化页面功能
		$(function(){
			<!---------------------在此手动设置按钮的权限------------------------------->
			//if (!hasPermission(PERMISSSIONCONST.SES1002)) {$("#").hide();}
			<!---------------------在此手动初始化页面表单审核状态数据源---------------------->
			<!--getComboStore系统表生成下拉框    参数说明1：传入值，用于下拉框回显，2下拉夸ID，3传入key值，4传入FALSE或者TRUE用于下拉框可选或者可读状态，FALSE下拉框可以不是disabled，TRUE是disabled状态-->
			<!--getCustomStore自定义下拉框    参数说明1：传入值，用于下拉框回显，2下拉夸ID，3传入FALSE或者TRUE用于下拉框可选或者可读状态，FALSE下拉框可以不是disabled，TRUE是disabled状态-->
			<!--如果不需要回显第一个参数传入""，如果不需要设定disabled属性传入FALSE-->
			<#list tableCarrays as tableCarray>
				<#if (tableCarray.queryRule??) && tableCarray.queryRule == "04">
					<#if (tableCarray.queryType??) && tableCarray.queryType == "01"><!--列表下拉框-->
						getComboStore("","${tableCarray.columnName}", "${tableCarray.columnName}","");
					</#if>
					<#if tableCarray.queryAdd?? && tableCarray.queryAdd == "01"><!--添加获取修改下拉框-->
						getComboStore("","${tableCarray.columnName}_SHOW", "${tableCarray.columnName}","");
					</#if>
				</#if>
				<#if (tableCarray.queryRule??) && tableCarray.queryRule == "05">
					<#if (tableCarray.queryType??) && tableCarray.queryType == "01"><!--列表下拉框-->
						get${tableCarray.columnNameD}("","${tableCarray.columnName}","");
					</#if>
					<#if tableCarray.queryAdd?? && tableCarray.queryAdd == "01">
						get${tableCarray.columnNameD}("","${tableCarray.columnName}_SHOW","");
					</#if>
				</#if>
			</#list>
			//初始化输入框时间默认值方法	
			initDefaultDate();
	    	//重置按钮
			$("#reset_btn").on('click', function() {
				$("#queryMecPanel_Form")[0].reset();
				$("#queryMecPanel_Form .bs-select").selectpicker('val','');
				initDefaultDate();
			});
	    	//查询按钮
			$("#query_btn").on('click', function() {
				page = 1;
				reloadGrid();
			});
			//添加按钮
			$("#add_btn").on('click', function() {
				//清空记录
				$("#addOrUpdateform")[0].reset();
				$("#addOrUpdateform .bs-select").selectpicker('val','');
				document.getElementById("hiddenType").value = "1";
				var title = document.getElementById("addOrUpdateWin_title");
				title.innerHTML = "${businessName}添加信息";
				addOrUpdate("add","");
			});
			//修改按钮
			$("#edit_btn").on('click', function() {
				var selectRocords = $("#queryMecGrid tbody input:checked");
	    		if (selectRocords.length != 1) {
	    			bootbox.alert("请选择一条数据");
	    			return;
	    		} else {
	    			var index = $(selectRocords[0]).attr("rownum");
	    			record = tableData.items[index];
	    		}
	    		document.getElementById("hiddenType").value = "2";
				var title = document.getElementById("addOrUpdateWin_title");
				title.innerHTML = "${businessName}修改信息";
	    		addOrUpdate("update",record);
			});
	    	//添加保存按钮
	    	var param = {};
			$("#addform_save_btn").off('click').on('click', function() {
				<#list tableCarrays as tableCarray>
					<#if (tableCarray.queryAdd??) && tableCarray.queryAdd == "01">
						<#if (tableCarray.queryRule??) && tableCarray.queryRule == "02">
							param.${tableCarray.columnNameX}beginDt = $("#${tableCarray.columnName}_beginDt_SHOW").val().replace('/', '').replace('/', '');
							param.${tableCarray.columnNameX}endDt = $("#${tableCarray.columnName}_endDt_SHOW").val().replace('/', '').replace('/', '');
						</#if>
						<#if (tableCarray.queryRule??) && (tableCarray.queryRule == "03" || tableCarray.queryRule == "04" || tableCarray.queryRule == "05")>
							param.${tableCarray.columnNameX} = $("#${tableCarray.columnName}_SHOW").val();
						</#if>
						<#if (tableCarray.queryRule??) && tableCarray.queryRule == "01">
							param.${tableCarray.columnNameX} = $("#${tableCarray.columnName}_MNO_SHOW").val().replace(/^\s+|\s+$/g, "");
						</#if>
					</#if>
				</#list>
				var hiddenType = $("#hiddenType").val();
				var url = "";
				if("1" == hiddenType){
					url = baseURL + "/${urlPackage}/${classNameX}/save";
				}else if ("2" == hiddenType){
					url = baseURL + "/${urlPackage}/${classNameX}/update";
					param.uuid = $("#hiddenUUid").val();
				}else{
					url = "";
				}
				$.ajax({
					type: "POST",
					url: url,
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					data: param,
					dataType: "json",
					success:function(data){
						if(data.timeout){
		            		ajaxTimeout();
		                }
						bootbox.alert(data.msg);
						$("#addOrUpdateWin").modal('hide');
						reloadGrid();
					},
					error:function(){
						
					}
				});
			});
			//弹出页面取消按钮（添加/修改）
			$("#addform_cancel_btn").on('click',function(){
				$("#addOrUpdateWin").modal('hide');
			});
	    	//删除按钮
			$("#dele_btn").on('click', function() {
				var selectRocords = $("#queryMecGrid tbody input:checked");
				var uuids = "";
				if(selectRocords.length <= 0){
					bootbox.alert(CONST.TIP001);
	    			return;
				}else{
					for(i=0; i < selectRocords.length; i++){
						var index = $(selectRocords[i]).attr("rownum");
	        			record = tableData.items[index];
	        			<#list tableCarrays as tableCarray>
	        				<#if (tableCarray.isPrimaryKey??) && tableCarray.isPrimaryKey == "√">
	        					uuids += record.${tableCarray.columnNameX}+",";
	        				</#if>
	        			</#list>
					}
					uuids = uuids.substring(0, uuids.lastIndexOf(","));
					bootbox.confirm("选择了"+selectRocords.length+"条, 确认删除?", function(truthBeTold){
						if(truthBeTold){
		    				 $.ajax({
		     	                type: "POST",
		     	                url: baseURL + "/${urlPackage}/${classNameX}/deleteByUuid",
		     	                data:{
		     	                	uuids:uuids
		     	                },
		     	               contentType: "application/x-www-form-urlencoded;charset=utf-8",
		     	                dataType: "json",
		     	                success: function(data) {
		            	if(data.timeout){
		            		ajaxTimeout();
		                }
		     	                	if (data.success) {
		     	                		bootbox.alert("操作成功!");
		     	                		reloadGrid();
		     	                	}else{
		     	                		bootbox.alert("操作失败！ "+data.msg);
		     	                	}
		     	    			},
		     	                	
		     	         
		     	                error: function(error) {
		     	                	bootbox.alert("操作失败!");
		     	                }
		     		    });
		    			}else{
		    				return;
		    			}
					});
				}
			});
		});
		//添加或者修改方法
		function addOrUpdate(type,record){
			if("add" == type){
				$("#addOrUpdateWin").modal('show');
			}else if("update" == type){
				var param = {};
				<#list tableCarrays as tableCarray>
					<#if (tableCarray.isPrimaryKey??) && tableCarray.isPrimaryKey == "√">
						param.${tableCarray.columnNameX} = record.${tableCarray.columnNameX};
					</#if>
				</#list>
				$.ajax({
					type : "POST",
					url : baseURL + "/${urlPackage}/${classNameX}/getDetail",
					data :param,
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					dataType : "json",
					success:function(data){
					<!--修改页面展示字段-->
					<#list tableCarrays as tableCarray>
						<#if (tableCarray.queryAdd??) && tableCarray.queryAdd == "01"&&
						(tableCarray.queryRule=="01"||tableCarray.queryRule=="02"||tableCarray.queryRule=="03"||tableCarray.queryRule=="04" ||tableCarray.queryRule=="05")>
							<#if (tableCarray.queryRule??) && tableCarray.queryRule == "04">
								getComboStore(data.data.${tableCarray.columnNameX},"${tableCarray.columnName}_SHOW", "${tableCarray.columnName}",false);
							<#elseif (tableCarray.queryRule??) && tableCarray.queryRule == "05">
								get${tableCarray.columnNameD}(data.data.${tableCarray.columnNameX},"${tableCarray.columnName}_SHOW",false);
							<#else>
								document.getElementById('${tableCarray.columnName}_SHOW').value=data.data.${tableCarray.columnNameX};
							</#if>
						</#if>
					</#list>
					document.getElementById('hiddenUUid').value=data.data.uuid;
					$("#addOrUpdateWin").modal('show');
					},
					error:function(){
						alert("操作失败，请重新操作！")
					}
				});
			}else{
				bootbox.alert("操作错误，请重新操作！");
    			return;
			}
		}
		//下拉框码表中加载数据(使用系统表)
		function getComboStore(value,element,type_code,isdisabled) {
	    	$.ajax({
	            type: "GET",
	            url: baseURL+"/code/query/typ/" + type_code,
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function(data) {
	            	if(data.timeout){
	            		ajaxTimeout();
	                }
	                $("#" + element).empty();
	                $("#" + element).append($("<option></option>").val("").text("全部"));
	                $.each(data, function(index, obj) {
	                	$("#" + element).append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
	                });
	              	//更新内容刷新到相应的位置
	                $("#" + element).selectpicker('render');
	                $("#" + element).selectpicker('refresh');
	                $("#" + element).selectpicker('val', value);
	                if(isdisabled){
	                	$("#" + element).attr('disabled', true);
	                }
	            },
	            error: function(error) {
	            }
	        });
	    }
		<#list tableCarrays as tableCarray>
			<#if (tableCarray.queryRule??) && tableCarray.queryRule == "05">
		function get${tableCarray.columnNameD}(value,element,isdisabled){
			<!--请在此处实现自定义下拉框选项-->
			$.ajax({
	            type: "GET",
	            url: baseURL+"/${urlPackage}/${classNameX}/get${tableCarray.columnNameD}",
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function(data) {
	            	if(data.timeout){
	            		ajaxTimeout();
	                }
	                $("#" + element).empty();
	                $("#" + element).append($("<option></option>").val("").text("全部"));
	                $.each(data, function(index, obj) {
	                	$("#" + element).append($("<option></option>").val(obj.${tableCarray.columnNameX}_Code).text(obj.${tableCarray.columnNameX}_Name));
	                });
	              	//更新内容刷新到相应的位置
	                $("#" + element).selectpicker('render');
	                $("#" + element).selectpicker('refresh');
	                $("#" + element).selectpicker('val', value);
	                if(isdisabled){
	                	$("#" + element).attr('disabled', true);
	                }
	            },
	            error: function(error) {
	            }
	        });
		}
		</#if>
	</#list> 
		function initDefaultDate(){
	    	var myDate = new Date();
	    	var tempMonth;
	    	if(myDate.getMonth()<9){
	    		tempMonth = '0'+ (myDate.getMonth() + 1);
	    	}else{
	    		tempMonth = myDate.getMonth() + 1;
	    	}
	    	var tempDay;
	    	if(myDate.getDate()<=9){
	    		tempDay = '0'+ myDate.getDate();
	    	}else{
	    		tempDay = myDate.getDate();
	    	}
	    	var dateString = myDate.getFullYear()+"/"+tempMonth+"/"+tempDay;
	    		<#list tableCarrays as tableCarray>
	    			<#if (tableCarray.queryRule)?? && tableCarray.queryRule == "02">
		    			$("#${tableCarray.columnName}_beginDt").datepicker('setStartDate', null);
		    			$("#${tableCarray.columnName}_endDt").datepicker('setEndDate', null);
		    			$("#${tableCarray.columnName}_beginDt").datepicker('update', dateString);
		    			$("#${tableCarray.columnName}_endDt").datepicker('update', dateString);
	    			</#if>
	    			<#if (tableCarray.queryRule)?? && tableCarray.queryRule == "06">
	    				$("#${tableCarray.columnName}").datepicker('setStartDate', null);
	    				$("#${tableCarray.columnName}").datepicker('update', dateString);
	    			</#if>
	    		</#list>
	    }
		
		
		var queryInner_Path = baseURL + "/${urlPackage}/${classNameX}/query";
		//实现查询按钮方法
		function reloadGrid(){
			$('#queryMecGrid > tbody').empty();
	    	if(limit==0) {
	    		//默认20条
	    		limit=$("#limit").val();
	    	}
	    	start=(page-1)*limit;
	    	<#list tableCarrays as tableCarray>
				<#if (tableCarray.queryRule)?? && (tableCarray.queryRule == "02"|| tableCarray.queryRule =="06")>
	    			var beginDt = $("#${tableCarray.columnName}_beginDt").val();
	    			var endDt = $("#${tableCarray.columnName}_endDt").val();
	    			if(daysBetween(beginDt, endDt) > 30){
	    	            bootbox.alert("起止时间的最大间隔为1个月");
	    	            return;
	    	        }
    			</#if>
			</#list>
			
			//获取筛选条件输入值
			var param = {page:page,start:start,limit:limit};
			<#list tableCarrays as tableCarray>
				<#if (tableCarray.queryType)?? && tableCarray.queryType == "01">
					<#if tableCarray.queryRule?? && tableCarray.queryRule == "02">
						param.${tableCarray.columnNameX}beginDt = $("#${tableCarray.columnName}_beginDt").val().replace('/', '').replace('/', '');
						param.${tableCarray.columnNameX}endDt = $("#${tableCarray.columnName}_endDt").val().replace('/', '').replace('/', '');
					</#if>
					<#if (tableCarray.queryRule)?? && (tableCarray.queryRule == "03" || tableCarray.queryRule == "04"
							|| tableCarray.queryRule == "05" || tableCarray.queryRule == "06")>
						param.${tableCarray.columnNameX} = $("#${tableCarray.columnName}").val();
					</#if>
					<#if (tableCarray.queryRule)?? && tableCarray.queryRule == "01">
						param.${tableCarray.columnNameX} = $("#${tableCarray.columnName}_MNO").val().replace(/^\s+|\s+$/g, "");
					</#if>
				</#if>
			</#list>
			App.blockUI({target:"body",boxed:!0,message:"查询中，请稍后...",zIndex:12000});
			$.ajax({
				type: "POST",
				url: queryInner_Path,
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				data: param,
				dataType: "json",
				success:function(data){
					if(data.timeout){
	            		ajaxTimeout();
	                }
					toalPage=Math.ceil(data.totalCount/limit);
					$("#itemCount").text(data.totalCount);
					$("#nowpage").text(page);
					$("#toalPage").text(toalPage);
					if (toalPage < 2) {
	    				$("#pagination").hide();
	    			} else {
	    				$("#pagination").show();
	    			}
					tableData = $.extend(true, {}, data);
    			    $("#queryMecGrid").DataTable().clear().draw();
    			    $.each(data.items,function(index,obj){
    			    	var trData = [];
    			    	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
    			    	trData.push(start + index + 1);
    			    	<#list tableCarrays as tableCarray>
    			    		<#if tableCarray.queryShow?? && tableCarray.queryShow == "01" && tableCarray.isAddColumnName != "3">
    			    			trData.push(obj.${tableCarray.columnNameX});
    			    		</#if>
    			    	</#list>
    			    	<#if isOperation == "01">
    			    		trData.push("<a href='javascript:void(0)'  onclick=view('"+obj.uuid+"')><i class='fa fa-search-plus'></i>查看</a>");
    			    	</#if>
    			    	for(i=0; i < trData.length; i++){
    			    		if(trData[i] == undefined){
    			    			trData[i] = ''; 
    			    		}
    			    	}
                       	$("#queryMecGrid").DataTable().row.add(trData).draw();
    			    });
    			    $("#queryMecGrid").DataTable().order([1, 'asc']).draw();
    			    $("#pagination-bar").show();
    			    if (page == 1) {
                    	//first page
                    	$("#pagination .prev a").css({'color':'gray','cursor':'not-allowed'});
                    } else {
                    	$("#pagination .prev a").css({'color':'#23527c','cursor':'pointer'});
                    }
                    if (page == toalPage) {
                    	// last page
                    	$("#pagination .next a").css({'color':'gray','cursor':'not-allowed'});
                    } else {
                    	$("#pagination .next a").css({'color':'#23527c','cursor':'pointer'});
                    }
                  	//动态设置iframe高度
                    //var currentTabId = $("#tab-bar", parent.document).children('li.active').children('a').attr('href').replace('#tab_','');
                    //setIframeHeight($('#frame_'+currentTabId,parent.document)[0]);
				},
				error:function(error){
					
				}
			});
			
		}
		//验证时间间隔方法
		function daysBetween(DateOne,DateTwo)  
	    {   
	        var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ('/'));  
	        var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ('/')+1);  
	        var OneYear = DateOne.substring(0,DateOne.indexOf ('/'));  
	      
	        var TwoMonth = DateTwo.substring(5,DateTwo.lastIndexOf ('/'));  
	        var TwoDay = DateTwo.substring(DateTwo.length,DateTwo.lastIndexOf ('/')+1);  
	        var TwoYear = DateTwo.substring(0,DateTwo.indexOf ('/'));  
	      
	        var cha=((Date.parse(OneMonth+'/'+OneDay+'/'+OneYear)- Date.parse(TwoMonth+'/'+TwoDay+'/'+TwoYear))/86400000);   
	        return Math.abs(cha);  
	    }
		<#if isOperation == "01">
		<!--操作链接点击事件-->
		function view(uuid){
			var param = {};
			param.uuid = uuid;
			$.ajax({
				type : "POST",
				url : baseURL + "/${urlPackage}/${classNameX}/getDetail",
				data :param,
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				dataType : "json",
				success:function(data){
					<#list tableCarrays as tableCarray>
						<#if (tableCarray.queryView??) && tableCarray.queryView == "01" &&
						(tableCarray.queryRule=="01"||tableCarray.queryRule=="02"||tableCarray.queryRule=="03"||tableCarray.queryRule=="04" ||tableCarray.queryRule=="05")>
						<#if (tableCarray.queryRule??) && tableCarray.queryRule == "04">
							getComboStore(data.data.${tableCarray.columnNameX},"${tableCarray.columnName}_VIEW", "${tableCarray.columnName}",true);
						<#elseif (tableCarray.queryRule??) && tableCarray.queryRule == "05">
							get${tableCarray.columnNameD}(data.data.${tableCarray.columnNameX},"${tableCarray.columnName}_VIEW",true);
						<#else>
							document.getElementById('${tableCarray.columnName}_VIEW').value=data.data.${tableCarray.columnNameX};
						</#if>
						</#if>
					</#list>
					$("#viewWin").modal('show');
					
				},
				error:function(){
					alert("操作失败，请重新操作！")
				}
			});
		}
		//弹出页面取消按钮（详情）
		$("#openform_cancel_btn").on('click',function(){
			$("#viewWin").modal('hide');
		});
		</#if>
		<#if isImport == "01">
		//导入按钮
		$("#isImport_btn").on('click', function(){
			importOpen();
		});
		function importOpen(){
			$("#importOpenWinform")[0].reset();
			$("#importOpenWin").modal("show");
		}
		//导入弹出页面取消按钮
		$("#importOpenform_cancel_btn").on('click', function(){
			$("#importOpenWin").modal('hide');
		});
		//导入弹出页面确定按钮
		$("#importOpenform_save_btn").on('click', function(){
			var file=$("#importFile").val();
			if(file != null && $.trim(file) != ''){
				if (file.lastIndexOf('.') != -1) {
					var index = file.lastIndexOf(".");
					var ext = file.substring(index + 1, file.length);
					if(ext =="xlsx"){
						App.blockUI({target:"body",boxed:!0,message:"导入中，请稍后...",zIndex:12000});
						$("#importOpenWinform").ajaxSubmit({
			                type: 'post',
						    url : baseURL +'/${urlPackage}/${classNameX}/importExcel',
						    dataType: "json",
			                success: function(data){
			                	if (data.msgCd == 'MEC00000') {
									var type = $("#type").val();
									$('#importResultPanel > tbody').empty();
									var successCount = data.successCount;
									var failureCount = data.failureCount;
									$("#ResultWin").modal('show');
									if(data.errors == null){
										$("#errorCount").val("1");
									}
									if(data.hasError == true) {
										$("#importResult").html(getInfo(successCount,failureCount,"条，失败信息及原因如下："));
										$.each(data.errors, function(index, obj) {
						                	var tr = $("<tr></tr>").append($("<td></td>").text(index + 1));
						                	tr.append($("<td></td>").text(obj.bnkCd));
						                	tr.append($("<td></td>").text(obj.failReason));
						                	$("#importResultPanel > tbody").append(tr);
						                });
									}else{
										$("#importResult").html(getInfo(successCount,failureCount,"条，失败信息及原因如下："));
									}
								}else{
									bootbox.alert("导入文件错误，原因："+data.msgInfo);
								}
			                	reloadGrid();
								$("#importOpenWin").modal('hide');
			                },  
			                error: function(data){  
			                    bootbox.alert( "导入失败..."+data.msgInfo);  
			                }  
			            });
						
					}else{
						bootbox.alert("文件格式不正确，请使用07版的excel!");
						return false;
					}
					
				}else{
					bootbox.alert("文件格式不正确，请使用07版的excel!");
					return false;
				}
			}else{
				bootbox.alert("文件格式不正确，请使用07版的excel!");
				return false;
			}
		});
		function getInfo(successCount,failureCount,msg) {
			var info = "<font>本次批量导入操作共成功" +successCount + "条，失败" + failureCount + msg;
	    	return info;
	    }
		//导入完毕之后弹出结果页面点击导入Excel按钮
		$("#errorImExcel").off('click').on('click', function() {
	    	var errorCount = $("#errorCount").val();
	    	if(errorCount == '1'){
	    		bootbox.alert("没数据要导出！");
	    		return;
	    	}
			window.open(baseURL + "/${urlPackage}/${classNameX}/getFailExport");
			$("#errorImExcel").modal('hide');
		});
		</#if>
		<#if isExport == "01">
		//下载模板按钮
		$("#download_template_btn").on('click', function() {
			window.open(baseURL +'/${urlPackage}/${classNameX}/downloadTemplate');
		});
		
		//导出按钮
		$("#isExport_btn").on('click', function() {
			var totalCount = $("#itemCount").text();
			if(totalCount==0){
				bootbox.alert("没有数据可以导出，请筛选数据!");
				return ;
			}
			$("#exportExcelWin").modal('show');
			$("#innerExcelType").val("总共"+totalCount+"条数据， 确定导出? ")
			$("#innerExcelType").attr("disabled", "disabled");
			$("#exportform_save_btn").off('click').on('click', function() {
				window.open(baseURL +"/${urlPackage}/${classNameX}/export");
				$("#exportExcelWin").modal('hide');
			});
			$("#exportform_cancel_btn").off('click').on('click', function() {
				$("#exportExcelWin").modal('hide');
			});
		});
		</#if>
	</script>

</body>

</html>

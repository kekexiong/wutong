<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en" class="ie8 no-js">
<html lang="en" class="ie9 no-js">
<html lang="zh-hans">
<head>
    <meta charset="utf-8" />
    <title>梧桐管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=320, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <jsp:include page="common/resource.jsp" flush="true"/>
</head>
<body class="iframe-body">
<jsp:include page="common/header.jsp" flush="true"/>
<div class="clearfix"> </div>
<div class="page-container">
    <%-- <jsp:include page="../common/menu.jsp" flush="true"/> --%>
    <div class="page-content-wrapper">
        <div class="">
        <!-- 右边开始 -->
        <div class="row">
            <div class="col-md-12">
                <div class="portlet light bordered scaffold-list">
                    <!-- 查询信息 -->
                    <div class="portlet-body form">
                        <form action="" class="form-horizontal" id="queryForm">
                            <div class="row norow">
                    <#list tableCarrays as tableCarray>
                        <#if (tableCarray.queryType??) && tableCarray.queryType == "01">
                            <#if (tableCarray.queryRule??) && tableCarray.queryRule == "03">
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="${tableCarray.columnNameX}" id="${tableCarray.columnName}" class="form-control" placeholder="${tableCarray.comments}">
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
                                                <input type="text" class="form-control col-md-3" name="${tableCarray.columnNameX}Start" id="${tableCarray.columnName}_Start">
                                                <span class="input-group-addon"> <i class="fa fa-exchange"></i></span>
                                                <input type="text" class="form-control" name="${tableCarray.columnNameX}End" id="${tableCarray.columnName}_End">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                            <#if (tableCarray.queryRule??) && (tableCarray.queryRule == "04" || tableCarray.queryRule == "05")>
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="${tableCarray.columnNameX}" id="${tableCarray.columnName}" class="bs-select form-control" data-show-subtext="true">
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                            <#if (tableCarray.queryRule??) && tableCarray.queryRule == "06">
                                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
                                        <div class="col-md-8 paddingnone">
                                            <div class="input-group input-daterange">
                                                <input type="text" class="form-control col-md-3" name="${tableCarray.columnNameX}" id="${tableCarray.columnName}">
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
                            <i class="fa fa-search font-blue"></i>
                            <span class="caption-subject font-blue bold uppercase">${businessName}信息列表</span>
                        </div>
                        <div class="tools">
                            <a href="" class="fullscreen" data-original-title="全屏" title=""></a>
                        </div>
                    </div>
                    <div class="portlet-body wheel">
                        <div>
                            <table  class="table table-striped table-bordered table-hover table-checkable order-column" id="queryMecGrid">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" /></th>
                                    <th class="nowrap">序号</th>
                            <#list tableCarrays as tableCarray>
                                <#if (tableCarray.queryShow??) && tableCarray.queryShow == "01" && tableCarray.isAddColumnName != "1">
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
                    <jsp:include page="common/page/pagination.jsp" flush="true"/>
                </div>
            </div>
        </div>
    </div>
    <!----------------------------------- 添加(修改)功能弹出页面（获取输入值的输入框后缀统一增加_SHOW标识符） ------------------------------------------>
    <div class="modal fade" id="addOrUpdateWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="800px" data-height="600px">
        <div class="modal-header">
            <button type="button" class="close"
                    data-dismiss="modal" aria-hidden="true">&times;
            </button>
            <h4 class="modal-title" id="addOrUpdateWin_title"></h4>
        </div>
        <div class="modal-body">
            <div class="portlet-body form">
                <form action="" class="form-horizontal" id="addOrUpdateform">
                    <div class="form-body">
                        <div class="row norow">
                            <input type="hidden" value = "" id = "hiddenType"/>
                            <input type="hidden" value = "" id = "hiddenKey"/>
                       <#list tableCarrays as tableCarray>
                           <#if (tableCarray.queryAdd??) && (tableCarray.queryAdd == "01")>
                               <#if (tableCarray.queryRule)?? && tableCarray.queryRule == "03">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="${tableCarray.columnNameX}" id="${tableCarray.columnName}_EDIT" class="form-control" placeholder="${tableCarray.comments}">
                                        </div>
                                    </div>
                                </div>
                               </#if>
                               <#if (tableCarray.queryRule)?? && (tableCarray.queryRule == "04" || tableCarray.queryRule == "05")>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="${tableCarray.columnNameX}" id="${tableCarray.columnName}_EDIT" class="bs-select form-control" data-show-subtext="true"> </select>
                                        </div>
                                    </div>
                                </div>
                               </#if>
                                <#if (tableCarray.queryRule)?? && (tableCarray.queryRule == "06" || tableCarray.queryRule == "02")>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
                                        <div class="col-md-8 paddingnone">
                                            <div class="input-group input-daterange">
                                                <input type="text" class="form-control col-md-3" name="${tableCarray.columnNameX}" id="${tableCarray.columnName}_EDIT">
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
        <div class="modal fade" id="viewWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="800px" data-height="600px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
                <h4 class="modal-title" >${businessName}详情信息</h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body form">
                    <form action="" class="form-horizontal" id="">
                        <div class="form-body">
                            <div class="row norow">
                       <#list tableCarrays as tableCarray>
                           <#if (tableCarray.queryView??) && (tableCarray.queryView == "01")>
                               <#if (tableCarray.queryRule??) && (tableCarray.queryRule == "02" || tableCarray.queryRule == "06")>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
                                        <div class="col-md-8 paddingnone">
                                            <div class="input-group input-daterange">
                                                <input type="text" class="form-control col-md-3" disabled="disabled" name="${tableCarray.columnNameX}" id="${tableCarray.columnName}_VIEW">
                                            </div>
                                        </div>
                                    </div>
                               </div>
                               </#if>
                               <#if (tableCarray.queryRule)?? && tableCarray.queryRule == "03">
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="${tableCarray.columnNameX}" id="${tableCarray.columnName}_VIEW" class="form-control" disabled="disabled" placeholder="${tableCarray.comments}">
                                        </div>
                                    </div>
                               </div>
                               </#if>
                               <#if (tableCarray.queryRule)?? && (tableCarray.queryRule == "04" ||tableCarray.queryRule == "05")>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">${tableCarray.comments}:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="${tableCarray.columnNameX}" id="${tableCarray.columnName}_VIEW" class="bs-select form-control" data-show-subtext="true">
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
                                            <button type="button" id="openform_cancel_btn" class="btn red"> <i class="fa fa-remove"></i> 关闭</button>
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
    <!-- ---------------------------------------------导入弹出页面----------------------------------------------------- -->
    <jsp:include page="common/page/fileupload.jsp" flush="true"/>
    </#if>
    <#if isExport == "01">
    <!-- -----------------------------------------导出弹出页面--------------------------------------------------------------- -->
    <div class="modal fade" id="exportExcelWin" tabindex="-1" role="dialog" data-backdrop="static" data-height="200px" data-width="500px" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="">导出EXCEL</h4>
        </div>
        <div class="modal-body">
            <div class="portlet-body form">
                <form action="" class="form-horizontal" id="exportform">
                    <div class="form-body">
                        <div class="row norow">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="form-group">
                                    <input name="innerExcelType" class="col-md-12 text-center" id="innerExcelType">
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
                                        <button type="button" id="exportform_save_btn" class="btn btn-success">
                                            <i class="fa fa-save"></i> 确认
                                        </button>
                                        <button type="button" id="exportform_cancel_btn" class="btn red">
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

<jsp:include page="common/footer.jsp" flush="true" />
<script type="text/javascript">
    //初始化页面功能
    $(function(){
        //if (!hasPermission(PERMISSSIONCONST.SES1002)) {$("#").hide();}
    <#list tableCarrays as tableCarray>
        <#if (tableCarray.queryRule??) && tableCarray.queryRule == "04">
            <#if (tableCarray.queryType??) && tableCarray.queryType == "01">
        getComboStore("","${tableCarray.columnName}", "${tableName}-${tableCarray.columnName}","");
            </#if>
            <#if tableCarray.queryAdd?? && tableCarray.queryAdd == "01">
        getComboStore("","${tableCarray.columnName}_EDIT", "${tableName}-${tableCarray.columnName}","");
            </#if>
        </#if>
        <#if (tableCarray.queryRule??) && tableCarray.queryRule == "05">
            <#if (tableCarray.queryType??) && tableCarray.queryType == "01">
        get${tableCarray.columnNameD}("","${tableName}-${tableCarray.columnName}","");
            </#if>
            <#if tableCarray.queryAdd?? && tableCarray.queryAdd == "01">
        get${tableCarray.columnNameD}("","${tableName}-${tableCarray.columnName}_SHOW","");
            </#if>
        </#if>
    </#list>
        //初始化输入框时间默认值方法
        initDefaultDate();
        //重置按钮
        $("#reset_btn").on('click', function() {
            $("#queryForm")[0].reset();
            $("#queryForm .bs-select").selectpicker('val','');
            $("#queryForm").data('bootstrapValidator').destroy();
            $('#queryForm').data('bootstrapValidator', null);
            queryFormValidator();
            initDefaultDate();
        });
        queryFormValidator();
        //查询按钮
        $("#query_btn").on('click', function() {
            $('#queryForm').data('bootstrapValidator').validate();
            if(!$('#queryForm').data('bootstrapValidator').isValid()){
                return ;
            }
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
            $('#addOrUpdateform').data('bootstrapValidator').validate();
            if (!$('#addOrUpdateform').data('bootstrapValidator').isValid()) {
                return;
            }
<#list tableCarrays as tableCarray>
    <#if (tableCarray.queryAdd??) && tableCarray.queryAdd == "01">
        <#if (tableCarray.dataType)?? && tableCarray.dataType == "Date">
            if ($("#${tableCarray.columnName}_EDIT").val() != undefined && $("#${tableCarray.columnName}_EDIT").val() != "") {
                param.${tableCarray.columnNameX} = $("#${tableCarray.columnName}_EDIT").val().replace("-", "/").replace("-", "/");
            }
        </#if>
        <#if (tableCarray.queryRule??) && (tableCarray.queryRule == "03" || tableCarray.queryRule == "04" || tableCarray.queryRule == "05")>
            param.${tableCarray.columnNameX} = $("#${tableCarray.columnName}_EDIT").val();
        </#if>
    </#if>
</#list>
            var hiddenType = $("#hiddenType").val();
            var url = "";
            if ("1" == hiddenType) {
                url = baseURL + "/${busPackage}/${classNameX}/save";
            } else if ("2" == hiddenType) {
                url = baseURL + "/${busPackage}/${classNameX}/update";
                param.${primaryKey.columnNameX} = $("#hiddenKey").val();
            } else {
                url = "";
            }
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                data: param,
                dataType: "json",
                success: function (data) {
                    if (data.timeout) {
                        ajaxTimeout();
                    }
                    bootbox.alert(data.msg);
                    $("#addOrUpdateWin").modal('hide');
                    reloadGrid();
                },
                error: function () {

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
            var keys = "";
            if(selectRocords.length <= 0){
                bootbox.alert(CONST.TIP001);
                return;
            }else{
                for(i=0; i < selectRocords.length; i++){
                    var index = $(selectRocords[i]).attr("rownum");
                    record = tableData.items[index];
                    keys += record.${primaryKey.columnNameX}+",";
                }
                keys = keys.substring(0, keys.lastIndexOf(","));
                bootbox.confirm("选择了"+selectRocords.length+"条, 确认删除?", function(truthBeTold){
                    if(truthBeTold){
                        $.ajax({
                            type: "POST",
                            url: baseURL + "/${busPackage}/${classNameX}/deleteByKey",
                            data:{
                                keys:keys
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
        addOrUpdateFormValidator();
        $("#addOrUpdateform").data('bootstrapValidator').destroy();
        $('#addOrUpdateform').data('bootstrapValidator', null);
        addOrUpdateFormValidator();
        if ("add" == type) {
    <#list tableCarrays as tableCarray>
        <#if (tableCarray.queryAdd??) && tableCarray.queryAdd == "01">
            <#if tableCarray.isPrimaryKey == "√">
            document.getElementById('${tableCarray.columnName}_EDIT').readOnly = false;
            </#if>
        </#if>
    </#list>
            $("#addOrUpdateWin").modal('show');
        } else if ("update" == type) {
            var param = {};
            <#list tableCarrays as tableCarray>
                <#if (tableCarray.isPrimaryKey??) && (tableCarray.isPrimaryKey == "√")>
                param.${tableCarray.columnNameX} = record.${tableCarray.columnNameX};
                </#if>
            </#list>
            $.ajax({
                type : "POST",
                url : baseURL + "/${busPackage}/${classNameX}/getDetail",
                data :param,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                dataType : "json",
                success:function(data){
                    <!--修改页面展示字段-->
        <#list tableCarrays as tableCarray>
            <#if (tableCarray.queryAdd??) && tableCarray.queryAdd == "01">
                <#if tableCarray.queryRule == "04">
                    getComboStore(data.data.${tableCarray.columnNameX},"${tableCarray.columnName}_EDIT", "${tableName}-${tableCarray.columnName}", false);
                <#elseif (tableCarray.queryRule??) && tableCarray.queryRule == "05">
                    get${tableCarray.columnNameD}(data.data.${tableCarray.columnNameX}, "${tableCarray.columnName}_EDIT", false);
                <#elseif tableCarray.isPrimaryKey == "√">
                    document.getElementById('${tableCarray.columnName}_EDIT').value=data.data.${tableCarray.columnNameX};
                    if ("update" == type) {
                        document.getElementById('${tableCarray.columnName}_EDIT').readOnly = true;
                    }
                <#elseif (tableCarray.validatorType??) && tableCarray.validatorType == "03">
                    document.getElementById('${tableCarray.columnName}_EDIT').value=fromatDate(data.data.${tableCarray.columnNameX}, "yyyy-MM-dd");
                <#elseif (tableCarray.validatorType??) && tableCarray.validatorType == "04">
                    document.getElementById('${tableCarray.columnName}_EDIT').value=fromatDate(data.data.${tableCarray.columnNameX}, "yyyy-MM-dd hh:mm:ss");
                <#else>
                    document.getElementById('${tableCarray.columnName}_EDIT').value=data.data.${tableCarray.columnNameX};
                </#if>
            </#if>
        </#list>
                    document.getElementById('hiddenKey').value=data.data.${primaryKey.columnNameX};
                    $("#addOrUpdateWin").modal('show');
                },
                error: function(){
                    alert("操作失败，请重新操作！")
                }
            });
        } else{
            bootbox.alert("操作错误，请重新操作！");
            return;
        }
    }
    $('#addOrUpdateWin').on('hidden.bs.modal', function() {
        $("#addOrUpdateform").data('bootstrapValidator').destroy();
        $('#addOrUpdateform').data('bootstrapValidator', null);
    });
    <#list tableCarrays as tableCarray>
    <#if (tableCarray.queryRule??) && tableCarray.queryRule == "05">
    function get${tableCarray.columnNameD}(value, element, isdisabled) {
        <!--请在此处实现自定义下拉框选项-->
        $.ajax({
            type: "GET",
            url: baseURL + "/${busPackage}/${classNameX}/get${tableCarray.columnNameD}",
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (data) {
                if (data.timeout) {
                    ajaxTimeout();
                }
                $("#" + element).empty();
                $("#" + element).append($("<option></option>").val("").text("全部"));
                $.each(data, function (index, obj) {
                    $("#" + element).append($("<option></option>").val(obj.${tableCarray.columnNameX}_Code).text(obj.${tableCarray.columnNameX}_Name));
                });
                //更新内容刷新到相应的位置
                $("#" + element).selectpicker('render');
                $("#" + element).selectpicker('refresh');
                $("#" + element).selectpicker('val', value);
                if (isdisabled) {
                    $("#" + element).attr('disabled', true);
                }
            },
            error: function (error) {
            }
        });
    }
    </#if>
    </#list>
    // 初始化查询日期
    function initDefaultDate() {
<#list tableCarrays as tableCarray>
    <#if (tableCarray.queryRule)?? && tableCarray.queryRule == "02" && tableCarray.queryType == "01">
        $("#${tableCarray.columnName}_Start").datepicker('update', new Date(new Date().setMonth(new Date().getMonth() - 1)).Format('yyyy-MM-dd'));
        $("#${tableCarray.columnName}_End").datepicker('update', new Date().Format('yyyy-MM-dd'));
    </#if>
    <#if (tableCarray.queryRule)?? && tableCarray.queryRule == "06" && tableCarray.queryType == "01">
        $("#${tableCarray.columnName}").datepicker('update', new Date().Format('yyyy-MM-dd'));
    </#if>
</#list>
    }

    //实现查询按钮方法
    function reloadGrid(){
        $('#queryMecGrid > tbody').empty();
        if(limit==0) {
            //默认20条
            limit=$("#limit").val();
        }
        start=(page-1)*limit;
<#list tableCarrays as tableCarray>
    <#if (tableCarray.queryRule)?? && (tableCarray.queryRule == "02")>
        var Start = $("#${tableCarray.columnName}_Start").val();
        var End = $("#${tableCarray.columnName}_End").val();
        if(daysBetween(Start, End) > 30){
            bootbox.alert("起止时间的最大间隔为1个月");
            return;
        }
    </#if>
</#list>
        //获取筛选条件输入值
        var param = {page: page, start: start, limit: limit};
<#list tableCarrays as tableCarray>
    <#if (tableCarray.queryType)?? && tableCarray.queryType == "01">
        <#if tableCarray.queryRule?? && tableCarray.queryRule == "02">
            param.${tableCarray.columnNameX}Start = $("#${tableCarray.columnName}_Start").val().replace("-", "/").replace("-", "/");
            param.${tableCarray.columnNameX}End = $("#${tableCarray.columnName}_End").val().replace("-", "/").replace("-", "/");
        </#if>
        <#if (tableCarray.queryRule)?? && (tableCarray.queryRule == "03" || tableCarray.queryRule == "04"
        || tableCarray.queryRule == "05" || tableCarray.queryRule == "06")>
            <#if (tableCarray.dataType)?? && tableCarray.dataType == "Date">
            if($("#${tableCarray.columnName}").val() != undefined && $("#${tableCarray.columnName}").val() != "") {
            param.${tableCarray.columnNameX} = $("#${tableCarray.columnName}").val().replace("-", "/").replace("-", "/");
            }
            <#else>
            param.${tableCarray.columnNameX} = $("#${tableCarray.columnName}").val();
            </#if>
        </#if>
        <#if (tableCarray.queryRule)?? && tableCarray.queryRule == "01">
            param.${tableCarray.columnNameX} = $("#${tableCarray.columnName}_MNO").val().replace(/^\s+|\s+$/g, "");
        </#if>
    </#if>
</#list>
        App.blockUI({target:"body",boxed:!0,message:"查询中，请稍后...",zIndex:12000});
        $.ajax({
            type: "POST",
            url: baseURL + "/${busPackage}/${classNameX}/query",
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
                    <#if tableCarray.queryShow?? && tableCarray.queryShow == "01" && tableCarray.isAddColumnName != "1">
                        <#if tableCarray.validatorType?? && tableCarray.validatorType == "03" >
                        trData.push(fromatDate(obj.${tableCarray.columnNameX}, "yyyy-MM-dd"));
                        <#elseif tableCarray.validatorType?? && tableCarray.validatorType == "04" >
                        trData.push(fromatDate(obj.${tableCarray.columnNameX}, "yyyy-MM-dd hh:mm:ss"));
                        <#else>
                            <#if tableCarray.queryRule == "04">
                        trData.push(getCodeName("${tableName}-${tableCarray.columnName}", obj.${tableCarray.columnNameX}));
                            </#if>
                            <#if tableCarray.queryRule != "04">
                        trData.push(obj.${tableCarray.columnNameX});
                            </#if>
                        </#if>
                    </#if>
                </#list>
                    <#if isOperation == "01">
                        trData.push("<a href='javascript:void(0)'  onclick=view('"+JSON.stringify(obj)+"')><i class='fa fa-search-plus'></i>查看</a>");
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
            },
            error:function(error){

            }
        });
    }
    <#if isOperation == "01">
    <!--操作链接点击事件-->
    function view(info){
        var param = {};
        var obj= JSON.parse(info);
         <#list tableCarrays as tableCarray>
             <#if tableCarray.isPrimaryKey?? && tableCarray.isPrimaryKey == "√">
         param.${tableCarray.columnNameX} = obj.${tableCarray.columnNameX};
             </#if>
         </#list>
        $.ajax({
            type : "POST",
            url : baseURL + "/${busPackage}/${classNameX}/getDetail",
            data :param,
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            dataType : "json",
            success:function(data){
                <#list tableCarrays as tableCarray>
                    <#if (tableCarray.queryView??) && tableCarray.queryView == "01">
                        <#if (tableCarray.queryRule??) && tableCarray.queryRule == "04">
                        getComboStore(data.data.${tableCarray.columnNameX},"${tableCarray.columnName}_VIEW", "${tableName}-${tableCarray.columnName}",true);
                        <#elseif (tableCarray.queryRule??) && tableCarray.queryRule == "05">
                        get${tableCarray.columnNameD}(data.data.${tableCarray.columnNameX},"${tableCarray.columnName}_VIEW",true);
                        <#elseif  (tableCarray.validatorType??) && tableCarray.validatorType == "03">
                        document.getElementById('${tableCarray.columnName}_VIEW').value=fromatDate(data.data.${tableCarray.columnNameX}, "yyyy-MM-dd");
                        <#elseif  (tableCarray.validatorType??) && tableCarray.validatorType == "04">
                        document.getElementById('${tableCarray.columnName}_VIEW').value=fromatDate(data.data.${tableCarray.columnNameX}, "yyyy-MM-dd hh:mm:ss");
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
    $("#importOpenform_save_btn").on('click', function () {
        var file = $("#importFile").val();
        if (file == null || $.trim(file) == '') {
            bootbox.alert("请选择导入文件!");
            return false;
        }
        App.blockUI({target: "body", boxed: !0, message: "导入中，请稍后...", zIndex: 12000});
        $("#importOpenWinform").ajaxSubmit({
            type: 'post',
            url: baseURL + '/${busPackage}/${classNameX}/importExcel',
            dataType: "json",
            success: function (data) {
                $('#importResultPanel > tbody').empty();
                $("#ResultWin").modal('show');
                if (data.errorList == null) {
                    $("#errorCount").val("1");
                }
                if(data.failureCount>0){
                    $("#importResult").html("<font>本次导入共成功" + data.successCount + "条，失败" + data.failureCount + "条，失败信息及原因如下：");
                    $.each(data.errorList, function (index, obj) {
                        var tr = $("<tr></tr>").append($("<td></td>").text(index + 1));
                        tr.append($("<td></td>").text(obj.position));
                        tr.append($("<td></td>").text(obj.importValue));
                        tr.append($("<td></td>").text(obj.failCode));
                        tr.append($("<td></td>").text(obj.failReason));
                        $("#importResultPanel > tbody").append(tr);
                    });
                }else{
                    $("#importResult").html("<font>本次导入全部成功共" + data.successCount + "条");
                }
                $("#importOpenWin").modal('hide');
                reloadGrid();
            },
            error: function (data) {
                bootbox.alert("导入失败..." + data.msgInfo);
            }
        });
    });
    function getInfo(successCount, failureCount, msg) {
        var info = "<font>本次批量导入操作共成功" + successCount + "条，失败" + failureCount + msg;
        return info;
    }
    //导入完毕之后弹出结果页面点击导入Excel按钮
    $("#errorImExcel").off('click').on('click', function () {
        var errorCount = $("#errorCount").val();
        if (errorCount == '1') {
            bootbox.alert("没数据要导出！");
            return;
        }
        window.open(baseURL + "/${busPackage}/${classNameX}/getFailExport");
        $("#errorImExcel").modal('hide');
    });
    </#if>
    <#if isExport == "01">
    //下载模板按钮
    $("#download_template_btn").on('click', function () {
        window.open(baseURL + '/${busPackage}/${classNameX}/downloadTemplate');
    });

    //导出按钮
    $("#isExport_btn").on('click', function () {
        var totalCount = $("#itemCount").text();
        if (totalCount == 0) {
            bootbox.alert("没有数据可以导出，请筛选数据!");
            return;
        }
        $("#exportExcelWin").modal('show');
        $("#innerExcelType").val("总共" + totalCount + "条数据， 确定导出? ")
        $("#innerExcelType").attr("disabled", "disabled");
        $("#exportform_save_btn").off('click').on('click', function () {
            window.open(baseURL + "/${busPackage}/${classNameX}/export");
            $("#exportExcelWin").modal('hide');
        });
        $("#exportform_cancel_btn").off('click').on('click', function () {
            $("#exportExcelWin").modal('hide');
        });
    });
    </#if>
    function addOrUpdateFormValidator() {
        $('#addOrUpdateform').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            message: 'This value is not valid',
            fields: {
     <#list tableCarrays as tableCarray>
         <#if (tableCarray.queryAdd??) && (tableCarray.queryAdd == "01")>
                ${tableCarray.columnNameX}: {
                    message: '${tableCarray.comments}验证失败',
                    validators: {
                    <#if (tableCarray.nullable??) && (tableCarray.nullable == "NO")>
                        notEmpty: {message: '${tableCarray.comments}不能为空'},
                    </#if>
                    <#if tableCarray.dataType == "int">
                        digits: {message: '请输入正确的数字！'},//整数
                        lessThan: {
                            value : ${tableCarray.dataLength},
                            message : '最大输入${tableCarray.dataLength}'
                    }
                    <#elseif tableCarray.dataType == "BigDecimal">
                         regexp: { //正则表达式
                            regexp: "^(([1-9]{1}\d*)|(0{1}))(\.\d{2})$",
                            message: '用户名只能包含大写、小写、数字和下划线'
                        },
                         lessThan: {
                             value : ${tableCarray.dataLength},
                             message : '最大输入${tableCarray.dataLength}'
                         }
                    <#elseif tableCarray.dataType == "Date" && (tableCarray.validatorType??) && tableCarray.validatorType == "03">
                         date: {
                             format: 'YYYY-MM-DD',
                             message: '日期无效'
                         }
                    <#elseif (tableCarray.validatorType??) && tableCarray.validatorType == "05">
                         regexp: {
                             regexp: /^1\d{10}$/,
                             message: '手机号格式错误'
                         }
                    <#elseif (tableCarray.validatorType??) && tableCarray.validatorType == "06">
                         emailAddress : {
                             message : '请输入正确的邮件地址'
                         }
                    <#else>
                        stringLength: {
                            max: ${tableCarray.dataLength},
                            message: '${tableCarray.comments}长度超出范围，应在${tableCarray.dataLength}之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                </#if>
                    }
                 },
         </#if>
     </#list>
            }
        }).on('success.form.bv', function (e) {//点击提交之后
                e.preventDefault();
                var $form = $(e.target);
                var bv = $form.data('bootstrapValidator');
                // Use Ajax to submit form data 提交至form标签中的action，result自定义
                $.post($form.attr('action'), $form.serialize(), function (result) {
                    //恢复submit按钮disable状态。
                    $('#addOrUpdateform').bootstrapValidator('disableSubmitButtons', false);
                    //do something...
                });
            });
    };

    function queryFormValidator() {
        $('#queryForm').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            message: 'This value is not valid',
            fields: {
    <#list tableCarrays as tableCarray>
        <#if (tableCarray.queryType??) && (tableCarray.queryType == "01")>
            <#if (tableCarray.queryRule??) && tableCarray.queryRule == "02">
                ${tableCarray.columnNameX}Start: {
                    message: '${tableCarray.comments}开始验证失败',
                    trigger: "change",
                    validators: {
                        notEmpty: {
                            message: '请选择开始时间'
                        },
                        date: {
                            format: 'YYYY-MM-DD',
                            message: '日期无效'
                        }
                    }
                 },
                ${tableCarray.columnNameX}End: {
                    message: '${tableCarray.comments}结束验证失败',
                    trigger: "change",
                    validators: {
                        notEmpty: {
                            message: '请选择结束时间'
                        },
                        date: {
                            format: 'YYYY-MM-DD',
                            message: '日期无效'
                        },
                        callback: {
                            message: '开始时间必须小于结束时间',
                            callback: function (value, validator, $field) {
                                var other = validator.getFieldElements('${tableCarray.columnNameX}Start').val();//获得另一个的值

                                var start = new Date(other.replace("-", "/").replace("-", "/"));
                                var end = new Date(value.replace("-", "/").replace("-", "/"));

                                if (start <= end) {
                                    return true;
                                }
                                return false;
                            }
                        }
                    }
                },
        <#else >
                ${tableCarray.columnNameX}: {
                    message: '${tableCarray.comments}验证失败',
                    validators: {
                    <#if tableCarray.dataType == "int">
                         digits: {message: '请输入正确的数字！'},//整数
                         lessThan: {
                         value : ${tableCarray.dataLength},
                         message : '最大输入${tableCarray.dataLength}'
                     }//整数
                    <#elseif tableCarray.dataType == "BigDecimal">
                         regexp: { //正则表达式
                                regexp: ^(([1-9]{1}\d*)|(0{1}))(\.\d{2})$,
                                message: '用户名只能包含大写、小写、数字和下划线'
                            },
                         lessThan: {
                                value : ${tableCarray.dataLength},
                                message : '最大输入${tableCarray.dataLength}'
                            }
                    <#elseif tableCarray.dataType == "Date" && tableCarray.validatorType == "03">
                         date: {
                             format: 'YYYY-MM-DD',
                             message: '日期无效'
                         }
                    <#elseif (tableCarray.validatorType??) && tableCarray.validatorType == "05">
                         regexp: {
                             regexp: /^1\d{10}$/,
                             message: '手机号格式错误'
                         }
                    <#elseif (tableCarray.validatorType??) && tableCarray.validatorType == "06">
                         emailAddress : {
                             message : '请输入正确的邮件地址'
                         }
                    <#else>
                         stringLength: {
                             max: ${tableCarray.dataLength},
                             message: '${tableCarray.comments}长度超出范围，应在${tableCarray.dataLength}之内！'
                         },
                         callback: {
                             message: '不允许有空格！',
                             callback: function (value, validator) {
                                 return hasBlankSpace(value);
                             }
                         }
                    </#if>
                    }
                },
            </#if>
        </#if>
    </#list>
            }
        }).on('success.form.bv', function (e) {//点击提交之后
                e.preventDefault();
                var $form = $(e.target);
                var bv = $form.data('bootstrapValidator');
                $.post($form.attr('action'), $form.serialize(), function (result) {
                    $('#queryForm').bootstrapValidator('disableSubmitButtons', false);
                    //do something...
                });
            });
    };
</script>
</body>
</html>

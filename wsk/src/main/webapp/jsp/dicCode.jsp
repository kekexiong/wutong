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
    <title>梧桐管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=320, initial-scale=1" name="viewport" />
    <meta content="" name="description" />
    <meta content="" name="author" />
    <jsp:include page="common/resource.jsp" flush="true"/>
</head>

<!-- <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md"> -->
<body class="iframe-body">

<!-- BEGIN HEADER -->
<jsp:include page="common/header.jsp" flush="true"/>
<!-- END HEADER -->

<!-- BEGIN CONTAINER -->
<div class="clearfix"> </div>
<div class="page-container">

    <!-- BEGIN MENU -->
    <%-- <jsp:include page="../common/menu.jsp" flush="true"/> --%>
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
                                                                            <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">字典KEY:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="codeKey" id="CODE_KEY" class="form-control" placeholder="字典KEY">
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">值:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="codeValue" id="CODE_VALUE" class="form-control" placeholder="值">
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">名称:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="codeName" id="CODE_NAME" class="form-control" placeholder="名称">
                                                    </div>
                                                </div>
                                            </div>
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
                                                <button type="button" id="add_btn" class="btn btn-info">
                                                    <i class="fa fa-plus"></i> 添加
                                                </button>
                                                <button type="button" id="edit_btn" class="btn tn btn btn-primary">
                                                    <i class="fa fa-edit"></i> 修改
                                                </button>
                                                <button type="button" id="dele_btn" class="btn tn btn btn-primary">
                                                    <i class="fa fa-trash-o fa-lg"></i> 删除
                                                </button>
                                                    <button type="button" id="isExport_btn" class="btn tn btn btn-primary">
                                                        <i class="fa fa-download"></i> 导出
                                                    </button>
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
                            <span class="caption-subject font-blue bold uppercase">菜单信息列表</span>
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
                                                    <th class="nowrap">字典KEY</th>
                                                    <th class="nowrap">值</th>
                                                    <th class="nowrap">名称</th>
                                                    <th class="nowrap">更新人</th>
                                                    <th class="nowrap">更新日期</th>
                                                    <th class="nowrap">创建人</th>
                                                    <th class="nowrap">创建日期</th>
                                                <th class="nowrap">操作</th>
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
                                记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span id="toalPage"></span>页 每页显示:
                            </div>
                            <div class="inline fl">
                                <select id="limit" class="form-control" onchange="onChange4PageSize(this)">
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
                                <div id="pagination" class="dataTables_paginate paging_simple_numbers clearfix pull-right">
                                    <nobr>
                                        <ul class="pagination no-padding" style="float: left">
                                            <li class="prev "><a href="javascript:;" onclick="javascript:pageing(1)"> 首页</a></li>
                                            <li class="prev "><a href="javascript:;" onclick="javascript:pageing('pro')"> 上一页</a></li>
                                            <li class="next "><a href="javascript:;" onclick="javascript:pageing('next')">下一页</a></li>
                                            <li class="next "><a href="javascript:;" onclick="javascript:pageing('last')">末页</a></li>
                                        </ul>
                                        <div class="input-group pull-right col-sm-2"  style="float: left;">
                                            <input min="1" class="form-control p" style="height: 31px; width: 80px;" type="number">
                                            <a href="javascript:;" class="input-group-addon" onclick="javascript:pageing($('.p').val())">
                                                <i class="fa fa-mail-forward brown"></i></a>
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
    <div class="modal fade" id="addOrUpdateWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="700px" data-height="450px">
        <div class="modal-header">
            <button type="button" class="close"
                    data-dismiss="modal" aria-hidden="true">&times;
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
                                                                                                         <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">字典KEY:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="codeKey" id="CODE_KEY_SHOW" class="form-control" placeholder="字典KEY">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                                               <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">值:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="codeValue" id="CODE_VALUE_SHOW" class="form-control" placeholder="值">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                                               <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">名称:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="codeName" id="CODE_NAME_SHOW" class="form-control" placeholder="名称">
                                        </div>
                                    </div>
                                </div>
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
    <div class="modal fade" id="viewWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="700px" data-height="450px">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
            <h4 class="modal-title" >菜单详情信息</h4>
        </div>
        <div class="modal-body">
            <div class="portlet-body form">
                <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="">
                    <div class="form-body">
                        <div class="row norow">
                                                                                                                                                            <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">字典KEY:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="codeKey" id="CODE_KEY_VIEW" class="form-control" disabled="disabled" placeholder="字典KEY">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">值:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="codeValue" id="CODE_VALUE_VIEW" class="form-control" disabled="disabled" placeholder="值">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">名称:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="codeName" id="CODE_NAME_VIEW" class="form-control" disabled="disabled" placeholder="名称">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">更新人:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="uteUserNo" id="UTE_USER_NO_VIEW" class="form-control" disabled="disabled" placeholder="更新人">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">更新日期:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="uteDt" id="UTE_DT_VIEW" class="form-control" disabled="disabled" placeholder="更新日期">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">创建人:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="cteUserNo" id="CTE_USER_NO_VIEW" class="form-control" disabled="disabled" placeholder="创建人">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">创建日期:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="cteDt" id="CTE_DT_VIEW" class="form-control" disabled="disabled" placeholder="创建日期">
                                            </div>
                                        </div>
                                    </div>
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
<!-- -----------------------------------------导出弹出页面--------------------------------------------------------------- -->
<div class="modal fade" id="exportExcelWin" tabindex="-1" role="dialog" data-backdrop="static" data-height="200px" data-width="500px" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="">导出EXCEL</h4>
    </div>
    <div class="modal-body">
        <div class="portlet-body form">
            <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="exportform">
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
</div>
</div>

<jsp:include page="common/footer.jsp" flush="true" />

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
            title.innerHTML = "菜单添加信息";
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
            title.innerHTML = "菜单修改信息";
            addOrUpdate("update",record);
        });
        //添加保存按钮
        var param = {};
        $("#addform_save_btn").off('click').on('click', function() {
                            param.codeKey = $("#CODE_KEY_SHOW").val();
                            param.codeValue = $("#CODE_VALUE_SHOW").val();
                            param.codeName = $("#CODE_NAME_SHOW").val();
            var hiddenType = $("#hiddenType").val();
            var url = "";
            if("1" == hiddenType){
                url = baseURL + "/system/dicCode/save";
            }else if ("2" == hiddenType){
                url = baseURL + "/system/dicCode/update";
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
                                uuids += record.uuid+",";
                }
                uuids = uuids.substring(0, uuids.lastIndexOf(","));
                bootbox.confirm("选择了"+selectRocords.length+"条, 确认删除?", function(truthBeTold){
                    if(truthBeTold){
                        $.ajax({
                            type: "POST",
                            url: baseURL + "/system/dicCode/deleteByUuid",
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
                        param.uuid = record.uuid;
            $.ajax({
                type : "POST",
                url : baseURL + "/system/dicCode/getDetail",
                data :param,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                dataType : "json",
                success:function(data){
                    <!--修改页面展示字段-->
                                document.getElementById('CODE_KEY_SHOW').value=data.data.codeKey;
                                document.getElementById('CODE_VALUE_SHOW').value=data.data.codeValue;
                                document.getElementById('CODE_NAME_SHOW').value=data.data.codeName;
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
    function getComboStore(codeValue,element,codeKey,isdisabled) {
        var param = {page:1,start:0,limit:1000};
        param.codeKey = codeKey;
        param.codeValue = codeValue;
        $.ajax({
            type: "POST",
            url: baseURL+"/wsk/dicCode/query",
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            data: param,
            dataType: "json",
            success: function(data) {
                if(data.timeout){
                    ajaxTimeout();
                }
                $("#" + element).empty();
                $("#" + element).append($("<option></option>").val("").text("全部"));
                $.each(data.items, function(index, obj) {
                    $("#" + element).append($("<option></option>").val(obj.codeValue).text(obj.codeName));
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
    }


    var queryInner_Path = baseURL + "/system/dicCode/query";
    //实现查询按钮方法
    function reloadGrid(){
        $('#queryMecGrid > tbody').empty();
        if(limit==0) {
            //默认20条
            limit=$("#limit").val();
        }
        start=(page-1)*limit;

        //获取筛选条件输入值
        var param = {page:page,start:start,limit:limit};
                        param.codeKey = $("#CODE_KEY").val();
                        param.codeValue = $("#CODE_VALUE").val();
                        param.codeName = $("#CODE_NAME").val();
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
                                trData.push(obj.codeKey);
                                trData.push(obj.codeValue);
                                trData.push(obj.codeName);
                                trData.push(obj.uteUserNo);
                                trData.push(obj.uteDt);
                                trData.push(obj.cteUserNo);
                                trData.push(obj.cteDt);
                            trData.push("<a href='javascript:void(0)'  onclick=view('"+obj.uuid+"')><i class='fa fa-search-plus'></i>查看</a>");
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
        <!--操作链接点击事件-->
        function view(uuid){
            var param = {};
            param.uuid = uuid;
            $.ajax({
                type : "POST",
                url : baseURL + "/system/dicCode/getDetail",
                data :param,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                dataType : "json",
                success:function(data){
                            document.getElementById('CODE_KEY_VIEW').value=data.data.codeKey;
                            document.getElementById('CODE_VALUE_VIEW').value=data.data.codeValue;
                            document.getElementById('CODE_NAME_VIEW').value=data.data.codeName;
                            document.getElementById('UTE_USER_NO_VIEW').value=data.data.uteUserNo;
                            document.getElementById('UTE_DT_VIEW').value=data.data.uteDt;
                            document.getElementById('CTE_USER_NO_VIEW').value=data.data.cteUserNo;
                            document.getElementById('CTE_DT_VIEW').value=data.data.cteDt;
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
        //下载模板按钮
        $("#download_template_btn").on('click', function() {
            window.open(baseURL +'/system/dicCode/downloadTemplate');
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
                window.open(baseURL +"/system/dicCode/export");
                $("#exportExcelWin").modal('hide');
            });
            $("#exportform_cancel_btn").off('click').on('click', function() {
                $("#exportExcelWin").modal('hide');
            });
        });
</script>

</body>

</html>

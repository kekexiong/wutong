<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="resource.jsp" flush="true" />
<jsp:include page="common/resource2.jsp" flush="true" />

<body>
<jsp:include page="head.jsp" flush="true" />
<jsp:include page="menu.jsp" flush="true" />
<div id="page-wrapper" >
    <div id="page-inner">
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
                                                    <label class="control-label col-md-4 text-right">名字:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="name" id="name" class="form-control" placeholder="名字">
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">年龄:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="age" id="age" class="form-control" placeholder="年龄">
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">电话:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="tel" id="tel" class="form-control" placeholder="电话">
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
                                                    <button type="button" id="download_template_btn" class="btn btn btn-primary">
                                                        <i class="fa fa-download"></i>下载模板
                                                    </button>
                                                    <button type="button" id="isImport_btn" class="btn tn btn btn-primary">
                                                        <i class="fa fa-upload"></i> 导入
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
                            <span class="caption-subject font-blue bold uppercase">用户信息列表</span>
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
                                                    <th class="nowrap">名字</th>
                                                    <th class="nowrap">年龄</th>
                                                    <th class="nowrap">电话</th>
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
                                                                                                         <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">名字:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="name" id="name_SHOW" class="form-control" placeholder="名字">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                                               <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">年龄:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="age" id="age_SHOW" class="form-control" placeholder="年龄">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                                               <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">电话:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="tel" id="tel_SHOW" class="form-control" placeholder="电话">
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
    <div class="modal fade" id="viewWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="700px" data-height="300px">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
            <h4 class="modal-title" >用户详情信息</h4>
        </div>
        <div class="modal-body">
            <div class="portlet-body form">
                <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="">
                    <div class="form-body">
                        <div class="row norow">
                                                                                                                                                            <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">名字:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="name" id="name_VIEW" class="form-control" disabled="disabled" placeholder="名字">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">年龄:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="age" id="age_VIEW" class="form-control" disabled="disabled" placeholder="年龄">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">电话:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="tel" id="tel_VIEW" class="form-control" disabled="disabled" placeholder="电话">
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
<!-- ---------------------------------------------导出弹出页面----------------------------------------------------- -->
<div class="modal fade" id="importOpenWin" tabindex="-1"
     role="dialog" data-backdrop="static" data-width="650px"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="Select_title">文件</h4>
    </div>
    <div class="modal-body">
        <div class="portlet-body form">
            <div class="form-body">
                <div class="row norow">
                    <div class="panel panel-primary">
                        <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="importOpenWinform" enctype="multipart/form-data">
                            <div class="panel-body">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-3 text-right">请选择文件:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input id="importFile" name="file" type="file" class="file"> <input type="hidden" id="type" name="type">
                                        </div>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="row">
                                                <div class="col-md-12" style="text-align: center;">
                                                    <button type="button" id="importOpenform_save_btn" class="btn btn-success">
                                                        <i class="fa fa-save"></i> 确认
                                                    </button>
                                                    <button type="button" id="importOpenform_cancel_btn" class="btn red">
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
    <div class="modal fade" id="ResultWin" tabindex="-1" role="dialog" data-backdrop="static" data-height="500px" data-width="750px" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
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
                                    <input type="hidden" name="errorCount" id="errorCount" value="" />
                                    <div class="portlet-body wheel">
                                        <table class="table table-striped table-bordered table-hover table-checkable order-column" id="importResultPanel">
                                            <thead style="font-size: 2px">
                                            <tr>
                                                <th>序号</th>
                                                <th>错误位置</th>
                                                <th>导入值</th>
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
<!-- -----------------------------------------导出弹出页面--------------------------------------------------------------- -->
<div class="modal fade" id="exportExcelWin" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                <input name="innerExcelType" class="col-md-6 text-right" id="innerExcelType">
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
            title.innerHTML = "用户添加信息";
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
            title.innerHTML = "用户修改信息";
            addOrUpdate("update",record);
        });
        //添加保存按钮
        var param = {};
        $("#addform_save_btn").off('click').on('click', function() {
                            param.name = $("#name_SHOW").val();
                            param.age = $("#age_SHOW").val();
                            param.tel = $("#tel_SHOW").val();
            var hiddenType = $("#hiddenType").val();
            var url = "";
            if("1" == hiddenType){
                url = baseURL + "/demo/tUser/save";
            }else if ("2" == hiddenType){
                url = baseURL + "/demo/tUser/update";
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
                            url: baseURL + "/demo/tUser/deleteByUuid",
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
                url : baseURL + "/demo/tUser/getDetail",
                data :param,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                dataType : "json",
                success:function(data){
                    <!--修改页面展示字段-->
                                document.getElementById('name_SHOW').value=data.data.name;
                                document.getElementById('age_SHOW').value=data.data.age;
                                document.getElementById('tel_SHOW').value=data.data.tel;
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


    var queryInner_Path = baseURL + "/demo/tUser/query";
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
                        param.name = $("#name").val();
                        param.age = $("#age").val();
                        param.tel = $("#tel").val();
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
                                trData.push(obj.name);
                                trData.push(obj.age);
                                trData.push(obj.tel);
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
                url : baseURL + "/demo/tUser/getDetail",
                data :param,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                dataType : "json",
                success:function(data){
                            document.getElementById('name_VIEW').value=data.data.name;
                            document.getElementById('age_VIEW').value=data.data.age;
                            document.getElementById('tel_VIEW').value=data.data.tel;
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
                            url : baseURL +'/demo/tUser/importExcel',
                            dataType: "json",
                            success: function(data){
                                if (data.msgCd == 'FILE0000') {
                                    var type = $("#type").val();
                                    $('#importResultPanel > tbody').empty();
                                    var successCount = data.successCount;
                                    var failureCount = data.failureCount;
                                    $("#ResultWin").modal('show');
                                    if(data.errorList == null){
                                        $("#errorCount").val("1");
                                    }
                                    if(data.hasError == true) {
                                        $("#importResult").html(getInfo(successCount,failureCount,"条，失败信息及原因如下："));
                                        $.each(data.errorList, function(index, obj) {
                                            var tr = $("<tr></tr>").append($("<td></td>").text(index + 1));
                                            tr.append($("<td></td>").text(obj.position));
                                            tr.append($("<td></td>").text(obj.importValue));
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
            window.open(baseURL + "/demo/tUser/getFailExport");
            $("#errorImExcel").modal('hide');
        });
        //下载模板按钮
        $("#download_template_btn").on('click', function() {
            window.open(baseURL +'/demo/tUser/downloadTemplate');
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
                window.open(baseURL +"/demo/tUser/export");
                $("#exportExcelWin").modal('hide');
            });
            $("#exportform_cancel_btn").off('click').on('click', function() {
                $("#exportExcelWin").modal('hide');
            });
        });
</script>

</body>

</html>

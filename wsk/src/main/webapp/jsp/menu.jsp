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
                                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">菜单ID:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="menuId" id="MENU_ID" class="form-control" placeholder="菜单ID">
                                        </div>
                                    </div>
                                </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">菜单名称:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="menuName" id="MENU_NAME" class="form-control" placeholder="菜单名称">
                                        </div>
                                    </div>
                                </div>
                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">父节点:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="parentId" id="PARENT_ID" class="form-control" placeholder="父节点">
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
                                                    <th class="nowrap">菜单ID</th>
                                                    <th class="nowrap">菜单名称</th>
                                                    <th class="nowrap">父节点</th>
                                                    <th class="nowrap">目录类型</th>
                                                    <th class="nowrap">排序</th>
                                                    <th class="nowrap">图标</th>
                                                    <th class="nowrap">是否显示</th>
                                                    <th class="nowrap">状态</th>
                                                    <th class="nowrap">备注</th>
                                                    <th class="nowrap">更新人</th>
                                                    <th class="nowrap">更新时间</th>
                                                    <th class="nowrap">创建人</th>
                                                    <th class="nowrap">创建时间</th>
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
                                            <a href="javascript:;" class="input-group-addon" onclick="javascript:pageing($('.p').val())"><i class="fa fa-mail-forward brown"></i></a>
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
                <form action="" class="form-horizontal" id="addOrUpdateform">
                    <div class="form-body">
                        <div class="row norow">
                            <input type="hidden" value = "" id = "hiddenType"/>
                            <input type="hidden" value = "" id = "hiddenKey"/>
                                                              <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">菜单ID:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="menuId" id="MENU_ID_SHOW" class="form-control" placeholder="菜单ID">
                                        </div>
                                    </div>
                                </div>
                                                                                                                             <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">菜单名称:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="menuName" id="MENU_NAME_SHOW" class="form-control" placeholder="菜单名称">
                                        </div>
                                    </div>
                                </div>
                                                                                                                             <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">父节点:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="parentId" id="PARENT_ID_SHOW" class="form-control" placeholder="父节点">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                            <!-- 下拉框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">目录类型:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="type" id="TYPE_SHOW" class="bs-select form-control" data-show-subtext="true"> </select>
                                        </div>
                                    </div>
                                </div>
                                                                                              <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">排序:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="sort" id="SORT_SHOW" class="form-control" placeholder="排序">
                                        </div>
                                    </div>
                                </div>
                                                                                                                             <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">图标:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="icon" id="ICON_SHOW" class="form-control" placeholder="图标">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                            <!-- 下拉框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">是否显示:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="isShow" id="IS_SHOW_SHOW" class="bs-select form-control" data-show-subtext="true"> </select>
                                        </div>
                                    </div>
                                </div>
                                                                                                                             <!-- 下拉框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">状态:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="sts" id="STS_SHOW" class="bs-select form-control" data-show-subtext="true"> </select>
                                        </div>
                                    </div>
                                </div>
                                                                                              <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">备注:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="remarks" id="REMARKS_SHOW" class="form-control" placeholder="备注">
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
</div>
</div>

<jsp:include page="common/footer.jsp" flush="true" />
<script type="text/javascript">
    //分页功能
    //分页默认隐藏
    $("#pagination-bar").hide();
    var limit = 0; //每页多少条
    var page = 1;//当前页
    var start = 0;//起始条
    var toalPage;//总页数
    var tableData; //数据列表缓存
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
        //if (!hasPermission(PERMISSSIONCONST.SES1002)) {$("#").hide();}
    <!--getComboStore系统表生成下拉框    参数说明1：传入值，用于下拉框回显，2下拉夸ID，3传入key值，4传入FALSE或者TRUE用于下拉框可选或者可读状态，FALSE下拉框可以不是disabled，TRUE是disabled状态-->
    <!--getCustomStore自定义下拉框    参数说明1：传入值，用于下拉框回显，2下拉夸ID，3传入FALSE或者TRUE用于下拉框可选或者可读状态，FALSE下拉框可以不是disabled，TRUE是disabled状态-->
    <!--如果不需要回显第一个参数传入""，如果不需要设定disabled属性传入FALSE-->
                        <!--添加获取修改下拉框-->
        getComboStore("","TYPE_SHOW", "MENU-TYPE","");
                        <!--添加获取修改下拉框-->
        getComboStore("","IS_SHOW_SHOW", "MENU-IS_SHOW","");
                        <!--添加获取修改下拉框-->
        getComboStore("","STS_SHOW", "MENU-STS","");
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
            $('#addOrUpdateform').data('bootstrapValidator').validate();
            if(!$('#addOrUpdateform').data('bootstrapValidator').isValid()){
                return ;
            }
            param.menuId = $("#MENU_ID_SHOW").val();
            param.menuName = $("#MENU_NAME_SHOW").val();
            param.parentId = $("#PARENT_ID_SHOW").val();
            param.type = $("#TYPE_SHOW").val();
            param.sort = $("#SORT_SHOW").val();
            param.icon = $("#ICON_SHOW").val();
            param.isShow = $("#IS_SHOW_SHOW").val();
            param.sts = $("#STS_SHOW").val();
            param.remarks = $("#REMARKS_SHOW").val();
            var hiddenType = $("#hiddenType").val();
            var url = "";
            if("1" == hiddenType){
                url = baseURL + "/system/menu/save";
            }else if ("2" == hiddenType){
                url = baseURL + "/system/menu/update";
                param.menuId = $("#hiddenKey").val();
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
            var keys = "";
            if(selectRocords.length <= 0){
                bootbox.alert(CONST.TIP001);
                return;
            }else{
                for(i=0; i < selectRocords.length; i++){
                    var index = $(selectRocords[i]).attr("rownum");
                    record = tableData.items[index];
                    keys += record.menuId+",";
                }
                keys = keys.substring(0, keys.lastIndexOf(","));
                bootbox.confirm("选择了"+selectRocords.length+"条, 确认删除?", function(truthBeTold){
                    if(truthBeTold){
                        $.ajax({
                            type: "POST",
                            url: baseURL + "/system/menu/deleteByKey",
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
        if("add" == type){
            document.getElementById('MENU_ID_SHOW').readOnly = false;
            $("#addOrUpdateWin").modal('show');
        }else if("update" == type){
            var param = {};
             param.menuId = record.menuId;
            $.ajax({
                type : "POST",
                url : baseURL + "/system/menu/getDetail",
                data :param,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                dataType : "json",
                success:function(data){
                    <!--修改页面展示字段-->
                                document.getElementById('MENU_ID_SHOW').value=data.data.menuId;
                                if("update" == type){
                                    document.getElementById('MENU_ID_SHOW').readOnly = true;
                                 }
                                document.getElementById('MENU_NAME_SHOW').value=data.data.menuName;
                                document.getElementById('PARENT_ID_SHOW').value=data.data.parentId;
                                getComboStore(data.data.type,"TYPE_SHOW", "MENU-TYPE",false);
                                document.getElementById('SORT_SHOW').value=data.data.sort;
                                document.getElementById('ICON_SHOW').value=data.data.icon;
                                getComboStore(data.data.isShow,"IS_SHOW_SHOW", "MENU-IS_SHOW",false);
                                getComboStore(data.data.sts,"STS_SHOW", "MENU-STS",false);
                                document.getElementById('REMARKS_SHOW').value=data.data.remarks;
                                document.getElementById('hiddenKey').value=data.data.menuId;
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
    $('#addOrUpdateWin').on('hidden.bs.modal', function() {
        $("#addOrUpdateform").data('bootstrapValidator').destroy();
        $('#addOrUpdateform').data('bootstrapValidator', null);
    });
    //下拉框码表中加载数据(使用系统表)
    function getComboStore(codeValue,element,codeKey,isdisabled) {
        var param = {};
        param.codeKey = codeKey;
        //param.codeValue = codeValue;
        $.ajax({
            type: "POST",
            url: baseURL+"/getDicCode",
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
                $("#" + element).selectpicker('val', codeValue);
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


    var queryInner_Path = baseURL + "/system/menu/query";
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
                        param.menuId = $("#MENU_ID").val();
                        param.menuName = $("#MENU_NAME").val();
                        param.parentId = $("#PARENT_ID").val();
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
                        trData.push(obj.menuId);
                        trData.push(obj.menuName);
                        trData.push(obj.parentId);
                        trData.push(getCodeName("MENU-TYPE", obj.type));
                        trData.push(obj.sort);
                        trData.push(obj.icon);
                        trData.push(getCodeName("MENU-IS_SHOW", obj.isShow));
                        trData.push(getCodeName("MENU-STS", obj.sts));
                        trData.push(obj.remarks);
                        trData.push(obj.uteUserNo);
                        trData.push(fromatDateYMDHMS(obj.uteDt));
                        trData.push(obj.cteUserNo);
                        trData.push(fromatDateYMDHMS(obj.cteDt));
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
        //下载模板按钮
        $("#download_template_btn").on('click', function() {
            window.open(baseURL +'/system/menu/downloadTemplate');
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
                window.open(baseURL +"/system/menu/export");
                $("#exportExcelWin").modal('hide');
            });
            $("#exportform_cancel_btn").off('click').on('click', function() {
                $("#exportExcelWin").modal('hide');
            });
        });
    function addOrUpdateFormValidator(){
        $('#addOrUpdateform').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            message: 'This value is not valid',
            fields: {
             menuId: {
                message: '菜单ID验证失败',
                validators: {
                     notEmpty: {message: '菜单ID不能为空'},
                     stringLength: {
                         max: 9,
                         message: '菜单ID长度超出范围，应在9之内！'
                     },
                     callback: {
                         message: '不允许有空格！',
                                 callback: function (value, validator) {
                             res = true;
                             var val= value.replace(/^\s+|\s+$/g, '')
                             if (value!=val) {
                                 res = false
                             }
                             return res;
                         }
                     }
                     }
                    },
             menuName: {
                message: '菜单名称验证失败',
                validators: {
                     notEmpty: {message: '菜单名称不能为空'},
                     stringLength: {
                         max: 20,
                         message: '菜单名称长度超出范围，应在20之内！'
                     },
                     callback: {
                         message: '不允许有空格！',
                                 callback: function (value, validator) {
                             res = true;
                             var val= value.replace(/^\s+|\s+$/g, '')
                             if (value!=val) {
                                 res = false
                             }
                             return res;
                         }
                     }
                     }
                    },
             parentId: {
                message: '父节点验证失败',
                validators: {
                     notEmpty: {message: '父节点不能为空'},
                     stringLength: {
                         max: 9,
                         message: '父节点长度超出范围，应在9之内！'
                     },
                     callback: {
                         message: '不允许有空格！',
                                 callback: function (value, validator) {
                             res = true;
                             var val= value.replace(/^\s+|\s+$/g, '')
                             if (value!=val) {
                                 res = false
                             }
                             return res;
                         }
                     }
                     }
                    },
             type: {
                message: '目录类型验证失败',
                validators: {
                     notEmpty: {message: '目录类型不能为空'},
                     stringLength: {
                         max: 4,
                         message: '目录类型长度超出范围，应在4之内！'
                     },
                     callback: {
                         message: '不允许有空格！',
                                 callback: function (value, validator) {
                             res = true;
                             var val= value.replace(/^\s+|\s+$/g, '')
                             if (value!=val) {
                                 res = false
                             }
                             return res;
                         }
                     }
                     }
                    },
             sort: {
                message: '排序验证失败',
                validators: {
                     notEmpty: {message: '排序不能为空'},
                     digits: {message: '请输入正确的数字！'},//整数
                     lessThan: {
                        value : 99,
                        message : '最大输入99'
                    }
                     }
                    },
             icon: {
                message: '图标验证失败',
                validators: {
                     stringLength: {
                         max: 255,
                         message: '图标长度超出范围，应在255之内！'
                     },
                     callback: {
                         message: '不允许有空格！',
                                 callback: function (value, validator) {
                             res = true;
                             var val= value.replace(/^\s+|\s+$/g, '')
                             if (value!=val) {
                                 res = false
                             }
                             return res;
                         }
                     }
                     }
                    },
             isShow: {
                message: '是否显示验证失败',
                validators: {
                     notEmpty: {message: '是否显示不能为空'},
                     stringLength: {
                         max: 1,
                         message: '是否显示长度超出范围，应在1之内！'
                     },
                     callback: {
                         message: '不允许有空格！',
                                 callback: function (value, validator) {
                             res = true;
                             var val= value.replace(/^\s+|\s+$/g, '')
                             if (value!=val) {
                                 res = false
                             }
                             return res;
                         }
                     }
                     }
                    },
             sts: {
                message: '状态验证失败',
                validators: {
                     notEmpty: {message: '状态不能为空'},
                     stringLength: {
                         max: 1,
                         message: '状态长度超出范围，应在1之内！'
                     },
                     callback: {
                         message: '不允许有空格！',
                                 callback: function (value, validator) {
                             res = true;
                             var val= value.replace(/^\s+|\s+$/g, '')
                             if (value!=val) {
                                 res = false
                             }
                             return res;
                         }
                     }
                     }
                    },
             remarks: {
                message: '备注验证失败',
                validators: {
                     stringLength: {
                         max: 50,
                         message: '备注长度超出范围，应在50之内！'
                     },
                     callback: {
                         message: '不允许有空格！',
                                 callback: function (value, validator) {
                             res = true;
                             var val= value.replace(/^\s+|\s+$/g, '')
                             if (value!=val) {
                                 res = false
                             }
                             return res;
                         }
                     }
                     }
                    },
            }
        }).on('success.form.bv', function(e) {//点击提交之后
                    e.preventDefault();
                    var $form = $(e.target);
                    var bv = $form.data('bootstrapValidator');
                    // Use Ajax to submit form data 提交至form标签中的action，result自定义
                    $.post($form.attr('action'), $form.serialize(), function(result) {
                        //恢复submit按钮disable状态。
                        $('#addOrUpdateform').bootstrapValidator('disableSubmitButtons', false);
                        //do something...
                    });
                });
    };
    function queryFormValidator(){
        $('#queryForm').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            message: 'This value is not valid',
            fields: {
             menuId: {
             message: '菜单ID验证失败',
                     validators: {
                 stringLength: {
                     max: 9,
                     message: '菜单ID长度超出范围，应在9之内！'
                 },
                 callback: {
                     message: '填入值收尾含有空格！',
                             callback: function (value, validator) {
                         res = true;
                         var val= value.replace(/^\s+|\s+$/g, '')
                         if (value!=val) {
                             res = false
                         }
                         return res;
                     }
                 }
             }
         },
             menuName: {
             message: '菜单名称验证失败',
                     validators: {
                 stringLength: {
                     max: 20,
                     message: '菜单名称长度超出范围，应在20之内！'
                 },
                 callback: {
                     message: '填入值收尾含有空格！',
                             callback: function (value, validator) {
                         res = true;
                         var val= value.replace(/^\s+|\s+$/g, '')
                         if (value!=val) {
                             res = false
                         }
                         return res;
                     }
                 }
             }
         },
             parentId: {
             message: '父节点验证失败',
                     validators: {
                 stringLength: {
                     max: 9,
                     message: '父节点长度超出范围，应在9之内！'
                 },
                 callback: {
                     message: '填入值收尾含有空格！',
                             callback: function (value, validator) {
                         res = true;
                         var val= value.replace(/^\s+|\s+$/g, '')
                         if (value!=val) {
                             res = false
                         }
                         return res;
                     }
                 }
             }
         },
    }
    }).on('success.form.bv', function(e) {//点击提交之后
            e.preventDefault();
            var $form = $(e.target);
            var bv = $form.data('bootstrapValidator');
            $.post($form.attr('action'), $form.serialize(), function(result) {
                $('#queryForm').bootstrapValidator('disableSubmitButtons', false);
                //do something...
            });
        });
    };
</script>

</body>

</html>

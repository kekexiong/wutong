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
                            <span class="caption-subject font-blue bold uppercase">系统字典信息列表</span>
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
                                                    <th class="nowrap">状态</th>
                                                    <th class="nowrap">更新人</th>
                                                    <th class="nowrap">更新日期</th>
                                                    <th class="nowrap">创建人</th>
                                                    <th class="nowrap">创建日期</th>
                                </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- 分页开始 -->
                    <!-- 分页开始 -->
                    <jsp:include page="common/page/pagination.jsp" flush="true"/>
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
                                                                                                                             <!-- 下拉框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">状态:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="codeSts" id="CODE_STS_SHOW" class="bs-select form-control" data-show-subtext="true"> </select>
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
        getComboStore("","CODE_STS_SHOW", "DIC_CODE-CODE_STS","");
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
            title.innerHTML = "系统字典添加信息";
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
            title.innerHTML = "系统字典修改信息";
            addOrUpdate("update",record);
        });
        //添加保存按钮
        var param = {};
        $("#addform_save_btn").off('click').on('click', function() {
            $('#addOrUpdateform').data('bootstrapValidator').validate();
            if(!$('#addOrUpdateform').data('bootstrapValidator').isValid()){
                return ;
            }
            param.codeKey = $("#CODE_KEY_SHOW").val();
            param.codeValue = $("#CODE_VALUE_SHOW").val();
            param.codeName = $("#CODE_NAME_SHOW").val();
            param.codeSts = $("#CODE_STS_SHOW").val();
            var hiddenType = $("#hiddenType").val();
            var url = "";
            if("1" == hiddenType){
                url = baseURL + "/system/dicCode/save";
            }else if ("2" == hiddenType){
                url = baseURL + "/system/dicCode/update";
                param.uuid = $("#hiddenKey").val();
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
                    keys += record.uuid+",";
                }
                keys = keys.substring(0, keys.lastIndexOf(","));
                bootbox.confirm("选择了"+selectRocords.length+"条, 确认删除?", function(truthBeTold){
                    if(truthBeTold){
                        $.ajax({
                            type: "POST",
                            url: baseURL + "/system/dicCode/deleteByKey",
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
                                getComboStore(data.data.codeSts,"CODE_STS_SHOW", "DIC_CODE-CODE_STS",false);
                                document.getElementById('hiddenKey').value=data.data.uuid;
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
                        $("#UTE_DT").datepicker('setStartDate', null);
                        $("#UTE_DT").datepicker('update', dateString);
                        $("#CTE_DT").datepicker('setStartDate', null);
                        $("#CTE_DT").datepicker('update', dateString);
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
                        trData.push(getCodeName("DIC_CODE-CODE_STS", obj.codeSts));
                        trData.push(obj.uteUserNo);
                        trData.push(fromatDate(obj.uteDt, "yyyy/MM/dd hh:mm:ss"));
                        trData.push(obj.cteUserNo);
                        trData.push(fromatDate(obj.cteDt, "yyyy/MM/dd hh:mm:ss"));
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
    function addOrUpdateFormValidator(){
        $('#addOrUpdateform').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            message: 'This value is not valid',
            fields: {
             codeKey: {
                message: '字典KEY验证失败',
                validators: {
                     notEmpty: {message: '字典KEY不能为空'},
                     stringLength: {
                         max: 20,
                         message: '字典KEY长度超出范围，应在20之内！'
                     },
                     callback: {
                         message: '不允许有空格！',
                                 callback: function (value, validator) {
                                        return hasBlankSpace(value);
                                     }
                     }
                }
            },
             codeValue: {
                message: '值验证失败',
                validators: {
                     notEmpty: {message: '值不能为空'},
                     stringLength: {
                         max: 20,
                         message: '值长度超出范围，应在20之内！'
                     },
                     callback: {
                         message: '不允许有空格！',
                                 callback: function (value, validator) {
                                        return hasBlankSpace(value);
                                     }
                     }
                }
            },
             codeName: {
                message: '名称验证失败',
                validators: {
                     notEmpty: {message: '名称不能为空'},
                     stringLength: {
                         max: 50,
                         message: '名称长度超出范围，应在50之内！'
                     },
                     callback: {
                         message: '不允许有空格！',
                                 callback: function (value, validator) {
                                        return hasBlankSpace(value);
                                     }
                     }
                }
            },
             codeSts: {
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
                                        return hasBlankSpace(value);
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


    // 验证是否包含空格
    function hasBlankSpace(value) {
        var val= value.replace(/^\s+|\s+$/g, '')
        if (value!=val) {
            return false
        }
        return true;
    }

        function queryFormValidator(){
            $('#queryForm').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            message: 'This value is not valid',
            fields: {
             codeKey: {
                message: '字典KEY验证失败',
                     validators: {
                         stringLength: {
                             max: 20,
                             message: '字典KEY长度超出范围，应在20之内！'
                         },
                         callback: {
                             message: '填入值首尾含有空格！',
                                     callback: function (value, validator) {
                                                return hasBlankSpace(value);
                                     }
                         }
                    }
                },
             codeValue: {
                message: '值验证失败',
                     validators: {
                         stringLength: {
                             max: 20,
                             message: '值长度超出范围，应在20之内！'
                         },
                         callback: {
                             message: '填入值首尾含有空格！',
                                     callback: function (value, validator) {
                                                return hasBlankSpace(value);
                                     }
                         }
                    }
                },
             codeName: {
                message: '名称验证失败',
                     validators: {
                         stringLength: {
                             max: 50,
                             message: '名称长度超出范围，应在50之内！'
                         },
                         callback: {
                             message: '填入值首尾含有空格！',
                                     callback: function (value, validator) {
                                                return hasBlankSpace(value);
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

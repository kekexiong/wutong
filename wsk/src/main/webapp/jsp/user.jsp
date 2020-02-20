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
                                                    <label class="control-label col-md-4 text-right">用户ID:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="userId" id="USER_ID" class="form-control" placeholder="用户ID">
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">昵称:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="userName" id="USER_NAME" class="form-control" placeholder="昵称">
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">真实姓名:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="realName" id="REAL_NAME" class="form-control" placeholder="真实姓名">
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">出生年月日:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <div class="input-group input-daterange">
                                                            <input type="text" class="form-control col-md-3" name="birthdaybeginDt" id="BIRTHDAY_beginDt">
                                                            <span class="input-group-addon"> <i class="fa fa-exchange"></i></span>
                                                            <input type="text" class="form-control" name="birthdayendDt" id="BIRTHDAY_endDt">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">电话号码:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="telNo" id="TEL_NO" class="form-control" placeholder="电话号码">
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">邮箱:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="mail" id="MAIL" class="form-control" placeholder="邮箱">
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">身份证号:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="idNumber" id="ID_NUMBER" class="form-control" placeholder="身份证号">
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">部门编号:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <input name="deptNo" id="DEPT_NO" class="form-control" placeholder="部门编号">
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">状态:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <select name="userSts" id="USER_STS" class="bs-select form-control" data-show-subtext="true">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                                                                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 text-right">授权角色:</label>
                                                    <div class="col-md-8 paddingnone">
                                                        <select name="empowerRoles" id="EMPOWER_ROLES" class="bs-select form-control" data-show-subtext="true">
                                                        </select>
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
                                                    <th class="nowrap">用户ID</th>
                                                    <th class="nowrap">昵称</th>
                                                    <th class="nowrap">真实姓名</th>
                                                    <th class="nowrap">性别</th>
                                                    <th class="nowrap">出生年月日</th>
                                                    <th class="nowrap">电话号码</th>
                                                    <th class="nowrap">邮箱</th>
                                                    <th class="nowrap">身份证号</th>
                                                    <th class="nowrap">部门编号</th>
                                                    <th class="nowrap">状态</th>
                                                    <th class="nowrap">登录密码</th>
                                                    <th class="nowrap">登录时间</th>
                                                    <th class="nowrap">登录IP</th>
                                                    <th class="nowrap">授权角色</th>
                                                    <th class="nowrap">是否允许登录</th>
                                                    <th class="nowrap">密码输入错误次数</th>
                                                    <th class="nowrap">密码最后修改时间</th>
                                                    <th class="nowrap">创建人</th>
                                                    <th class="nowrap">更新人</th>
                                                    <th class="nowrap">更新日期</th>
                                                    <th class="nowrap">更新时间</th>
                                                    <th class="nowrap">创建日期</th>
                                                    <th class="nowrap">创建时间</th>
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
                                        <label class="control-label col-md-4 text-right">用户ID:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="userId" id="USER_ID_SHOW" class="form-control" placeholder="用户ID">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                                               <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">昵称:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="userName" id="USER_NAME_SHOW" class="form-control" placeholder="昵称">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                                               <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">真实姓名:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="realName" id="REAL_NAME_SHOW" class="form-control" placeholder="真实姓名">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                                                                                  <!-- 下拉框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">性别:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="sex" id="SEX_SHOW" class="bs-select form-control" data-show-subtext="true"> </select>
                                        </div>
                                    </div>
                                </div>
                                                                                                         <!-- 时间区间值输入 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">出生年月日:</label>
                                            <div class="col-md-8 paddingnone">
                                                <div class="input-group input-daterange">
                                                    <input type="text" class="form-control col-md-3" name="birthdaybeginDt" id="BIRTHDAY_beginDt_SHOW">
                                                    <span class="input-group-addon"> <i class="fa fa-exchange"></i></span>
                                                    <input type="text" class="form-control" name="birthdayendDt" id="BIRTHDAY_endDt_SHOW">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                                  <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">电话号码:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="telNo" id="TEL_NO_SHOW" class="form-control" placeholder="电话号码">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                                               <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">邮箱:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="mail" id="MAIL_SHOW" class="form-control" placeholder="邮箱">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                                               <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">身份证号:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="idNumber" id="ID_NUMBER_SHOW" class="form-control" placeholder="身份证号">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                                               <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">部门编号:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="deptNo" id="DEPT_NO_SHOW" class="form-control" placeholder="部门编号">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                                                                                  <!-- 下拉框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">状态:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="userSts" id="USER_STS_SHOW" class="bs-select form-control" data-show-subtext="true"> </select>
                                        </div>
                                    </div>
                                </div>
                                                                                                                                            <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">登录密码:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="loginPwd" id="LOGIN_PWD_SHOW" class="form-control" placeholder="登录密码">
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
                                            <label class="control-label col-md-4 text-right">用户ID:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="userId" id="USER_ID_VIEW" class="form-control" disabled="disabled" placeholder="用户ID">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">昵称:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="userName" id="USER_NAME_VIEW" class="form-control" disabled="disabled" placeholder="昵称">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">真实姓名:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="realName" id="REAL_NAME_VIEW" class="form-control" disabled="disabled" placeholder="真实姓名">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                                                          <!-- 下拉框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">性别:</label>
                                            <div class="col-md-8 paddingnone">
                                                <select name="sex" id="SEX_VIEW" class="bs-select form-control" data-show-subtext="true">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                                                              <!-- 时间区间值输入 -->
                                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                            <div class="form-group">
                                                <label class="control-label col-md-4 text-right">出生年月日:</label>
                                                <div class="col-md-8 paddingnone">
                                                    <div class="input-group input-daterange">
                                                        <input type="text" class="form-control col-md-3" disabled="disabled" name="birthdaybeginDt" id="BIRTHDAY_beginDt_VIEW">
                                                        <span class="input-group-addon"> <iclass="fa fa-exchange"></i> </span>
                                                        <input type="text" class="form-control" disabled="disabled" name="birthdayendDt" id="BIRTHDAY_endDt_VIEW">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                                                                                                                                                                                                                                                                 <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">电话号码:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="telNo" id="TEL_NO_VIEW" class="form-control" disabled="disabled" placeholder="电话号码">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">邮箱:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="mail" id="MAIL_VIEW" class="form-control" disabled="disabled" placeholder="邮箱">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">身份证号:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="idNumber" id="ID_NUMBER_VIEW" class="form-control" disabled="disabled" placeholder="身份证号">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">部门编号:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="deptNo" id="DEPT_NO_VIEW" class="form-control" disabled="disabled" placeholder="部门编号">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                                                          <!-- 下拉框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">状态:</label>
                                            <div class="col-md-8 paddingnone">
                                                <select name="userSts" id="USER_STS_VIEW" class="bs-select form-control" data-show-subtext="true">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                            <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">登录密码:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="loginPwd" id="LOGIN_PWD_VIEW" class="form-control" disabled="disabled" placeholder="登录密码">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">登录时间:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="loginTime" id="LOGIN_TIME_VIEW" class="form-control" disabled="disabled" placeholder="登录时间">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">登录IP:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="loginIp" id="LOGIN_IP_VIEW" class="form-control" disabled="disabled" placeholder="登录IP">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                                                          <!-- 下拉框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">授权角色:</label>
                                            <div class="col-md-8 paddingnone">
                                                <select name="empowerRoles" id="EMPOWER_ROLES_VIEW" class="bs-select form-control" data-show-subtext="true">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 下拉框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">是否允许登录:</label>
                                            <div class="col-md-8 paddingnone">
                                                <select name="isAllowLogin" id="IS_ALLOW_LOGIN_VIEW" class="bs-select form-control" data-show-subtext="true">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                            <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">密码输入错误次数:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="pwdErrCunt" id="PWD_ERR_CUNT_VIEW" class="form-control" disabled="disabled" placeholder="密码输入错误次数">
                                            </div>
                                        </div>
                                    </div>
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">密码最后修改时间:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="lastUptPwdTime" id="LAST_UPT_PWD_TIME_VIEW" class="form-control" disabled="disabled" placeholder="密码最后修改时间">
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
                                            <label class="control-label col-md-4 text-right">更新时间:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="uteTm" id="UTE_TM_VIEW" class="form-control" disabled="disabled" placeholder="更新时间">
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
                                                                                                                                                                                                   <!-- 普通输入框 -->
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="form-group">
                                            <label class="control-label col-md-4 text-right">创建时间:</label>
                                            <div class="col-md-8 paddingnone">
                                                <input name="cteTm" id="CTE_TM_VIEW" class="form-control" disabled="disabled" placeholder="创建时间">
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
                                        <!--添加获取修改下拉框-->
                        getComboStore("","SEX_SHOW", "USER-SEX","");
                    <!--列表下拉框-->
                        getComboStore("","USER_STS", "USER-USER_STS","");
                    <!--添加获取修改下拉框-->
                        getComboStore("","USER_STS_SHOW", "USER-USER_STS","");
                    <!--列表下拉框-->
                        getComboStore("","EMPOWER_ROLES", "USER-EMPOWER_ROLES","");
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
                            param.userId = $("#USER_ID_SHOW").val();
                            param.userName = $("#USER_NAME_SHOW").val();
                            param.realName = $("#REAL_NAME_SHOW").val();
                            param.sex = $("#SEX_SHOW").val();
                            param.birthdaybeginDt = $("#BIRTHDAY_beginDt_SHOW").val().replace('/', '').replace('/', '');
                            param.birthdayendDt = $("#BIRTHDAY_endDt_SHOW").val().replace('/', '').replace('/', '');
                            param.telNo = $("#TEL_NO_SHOW").val();
                            param.mail = $("#MAIL_SHOW").val();
                            param.idNumber = $("#ID_NUMBER_SHOW").val();
                            param.deptNo = $("#DEPT_NO_SHOW").val();
                            param.userSts = $("#USER_STS_SHOW").val();
                            param.loginPwd = $("#LOGIN_PWD_SHOW").val();
            var hiddenType = $("#hiddenType").val();
            var url = "";
            if("1" == hiddenType){
                url = baseURL + "/user/user/save";
            }else if ("2" == hiddenType){
                url = baseURL + "/user/user/update";
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
                                uuids += record.userId+",";
                }
                uuids = uuids.substring(0, uuids.lastIndexOf(","));
                bootbox.confirm("选择了"+selectRocords.length+"条, 确认删除?", function(truthBeTold){
                    if(truthBeTold){
                        $.ajax({
                            type: "POST",
                            url: baseURL + "/user/user/deleteByUuid",
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
                        param.userId = record.userId;
            $.ajax({
                type : "POST",
                url : baseURL + "/user/user/getDetail",
                data :param,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                dataType : "json",
                success:function(data){
                    <!--修改页面展示字段-->
                                document.getElementById('USER_ID_SHOW').value=data.data.userId;
                                document.getElementById('USER_NAME_SHOW').value=data.data.userName;
                                document.getElementById('REAL_NAME_SHOW').value=data.data.realName;
                                getComboStore(data.data.sex,"SEX_SHOW", "SEX",false);
                                document.getElementById('BIRTHDAY_SHOW').value=data.data.birthday;
                                document.getElementById('TEL_NO_SHOW').value=data.data.telNo;
                                document.getElementById('MAIL_SHOW').value=data.data.mail;
                                document.getElementById('ID_NUMBER_SHOW').value=data.data.idNumber;
                                document.getElementById('DEPT_NO_SHOW').value=data.data.deptNo;
                                getComboStore(data.data.userSts,"USER_STS_SHOW", "USER_STS",false);
                                document.getElementById('LOGIN_PWD_SHOW').value=data.data.loginPwd;
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
            url: baseURL+"/system/dicCode/query",
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
                        $("#BIRTHDAY_beginDt").datepicker('setStartDate', null);
                        $("#BIRTHDAY_endDt").datepicker('setEndDate', null);
                        $("#BIRTHDAY_beginDt").datepicker('update', dateString);
                        $("#BIRTHDAY_endDt").datepicker('update', dateString);
    }


    var queryInner_Path = baseURL + "/user/user/query";
    //实现查询按钮方法
    function reloadGrid(){
        $('#queryMecGrid > tbody').empty();
        if(limit==0) {
            //默认20条
            limit=$("#limit").val();
        }
        start=(page-1)*limit;
                    var beginDt = $("#BIRTHDAY_beginDt").val();
                    var endDt = $("#BIRTHDAY_endDt").val();
                    if(daysBetween(beginDt, endDt) > 30){
                        bootbox.alert("起止时间的最大间隔为1个月");
                        return;
                    }

        //获取筛选条件输入值
        var param = {page:page,start:start,limit:limit};
                        param.userId = $("#USER_ID").val();
                        param.userName = $("#USER_NAME").val();
                        param.realName = $("#REAL_NAME").val();
                        param.birthdaybeginDt = $("#BIRTHDAY_beginDt").val().replace('/', '').replace('/', '');
                        param.birthdayendDt = $("#BIRTHDAY_endDt").val().replace('/', '').replace('/', '');
                        param.telNo = $("#TEL_NO").val();
                        param.mail = $("#MAIL").val();
                        param.idNumber = $("#ID_NUMBER").val();
                        param.deptNo = $("#DEPT_NO").val();
                        param.userSts = $("#USER_STS").val();
                        param.empowerRoles = $("#EMPOWER_ROLES").val();
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
                                trData.push(obj.userId);
                                trData.push(obj.userName);
                                trData.push(obj.realName);
                                trData.push(obj.sex);
                                trData.push(obj.birthday);
                                trData.push(obj.telNo);
                                trData.push(obj.mail);
                                trData.push(obj.idNumber);
                                trData.push(obj.deptNo);
                                trData.push(obj.userSts);
                                trData.push(obj.loginPwd);
                                trData.push(obj.loginTime);
                                trData.push(obj.loginIp);
                                trData.push(obj.empowerRoles);
                                trData.push(obj.isAllowLogin);
                                trData.push(obj.pwdErrCunt);
                                trData.push(obj.lastUptPwdTime);
                                trData.push(obj.cteUserNo);
                                trData.push(obj.uteUserNo);
                                trData.push(obj.uteDt);
                                trData.push(obj.uteTm);
                                trData.push(obj.cteDt);
                                trData.push(obj.cteTm);
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
                url : baseURL + "/user/user/getDetail",
                data :param,
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                dataType : "json",
                success:function(data){
                            document.getElementById('USER_ID_VIEW').value=data.data.userId;
                            document.getElementById('USER_NAME_VIEW').value=data.data.userName;
                            document.getElementById('REAL_NAME_VIEW').value=data.data.realName;
                            getComboStore(data.data.sex,"SEX_VIEW", "SEX",true);
                            document.getElementById('BIRTHDAY_VIEW').value=data.data.birthday;
                            document.getElementById('TEL_NO_VIEW').value=data.data.telNo;
                            document.getElementById('MAIL_VIEW').value=data.data.mail;
                            document.getElementById('ID_NUMBER_VIEW').value=data.data.idNumber;
                            document.getElementById('DEPT_NO_VIEW').value=data.data.deptNo;
                            getComboStore(data.data.userSts,"USER_STS_VIEW", "USER_STS",true);
                            document.getElementById('LOGIN_PWD_VIEW').value=data.data.loginPwd;
                            document.getElementById('LOGIN_TIME_VIEW').value=data.data.loginTime;
                            document.getElementById('LOGIN_IP_VIEW').value=data.data.loginIp;
                            getComboStore(data.data.empowerRoles,"EMPOWER_ROLES_VIEW", "EMPOWER_ROLES",true);
                            getComboStore(data.data.isAllowLogin,"IS_ALLOW_LOGIN_VIEW", "IS_ALLOW_LOGIN",true);
                            document.getElementById('PWD_ERR_CUNT_VIEW').value=data.data.pwdErrCunt;
                            document.getElementById('LAST_UPT_PWD_TIME_VIEW').value=data.data.lastUptPwdTime;
                            document.getElementById('CTE_USER_NO_VIEW').value=data.data.cteUserNo;
                            document.getElementById('UTE_USER_NO_VIEW').value=data.data.uteUserNo;
                            document.getElementById('UTE_DT_VIEW').value=data.data.uteDt;
                            document.getElementById('UTE_TM_VIEW').value=data.data.uteTm;
                            document.getElementById('CTE_DT_VIEW').value=data.data.cteDt;
                            document.getElementById('CTE_TM_VIEW').value=data.data.cteTm;
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
            window.open(baseURL +'/user/user/downloadTemplate');
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
                window.open(baseURL +"/user/user/export");
                $("#exportExcelWin").modal('hide');
            });
            $("#exportform_cancel_btn").off('click').on('click', function() {
                $("#exportExcelWin").modal('hide');
            });
        });
</script>

</body>

</html>

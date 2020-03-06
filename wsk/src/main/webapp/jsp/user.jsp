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
                                        <label class="control-label col-md-4 text-right">性别:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="sex" id="SEX" class="bs-select form-control" data-show-subtext="true">
                                            </select>
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
                                                    <th class="nowrap">密码错误次数</th>
                                                    <th class="nowrap">密码修改时间</th>
                                                    <th class="nowrap">创建人</th>
                                                    <th class="nowrap">更新人</th>
                                                    <th class="nowrap">更新日期</th>
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
                                                                                                                              <!-- 时间输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">出生年月日:</label>
                                        <div class="col-md-8 paddingnone">
                                            <div class="input-group input-daterange">
                                                <input type="text" class="form-control col-md-3" name="birthday" id="BIRTHDAY_SHOW">
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
                                                                                              <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">登录时间:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="loginTime" id="LOGIN_TIME_SHOW" class="form-control" placeholder="登录时间">
                                        </div>
                                    </div>
                                </div>
                                                                                              <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">登录IP:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="loginIp" id="LOGIN_IP_SHOW" class="form-control" placeholder="登录IP">
                                        </div>
                                    </div>
                                </div>
                                                                                              <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">授权角色:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="empowerRoles" id="EMPOWER_ROLES_SHOW" class="form-control" placeholder="授权角色">
                                        </div>
                                    </div>
                                </div>
                                                                                                                             <!-- 下拉框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">是否允许登录:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="isAllowLogin" id="IS_ALLOW_LOGIN_SHOW" class="bs-select form-control" data-show-subtext="true"> </select>
                                        </div>
                                    </div>
                                </div>
                                                               <!-- 普通输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">密码错误次数:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="pwdErrCunt" id="PWD_ERR_CUNT_SHOW" class="form-control" placeholder="密码错误次数">
                                        </div>
                                    </div>
                                </div>
                                                                                                                                                             <!-- 时间输入框 -->
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">密码修改时间:</label>
                                        <div class="col-md-8 paddingnone">
                                            <div class="input-group input-daterange">
                                                <input type="text" class="form-control col-md-3" name="lastUptPwdTime" id="LAST_UPT_PWD_TIME_SHOW">
                                            </div>
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
        <div class="modal fade" id="viewWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="800px" data-height="600px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times; </button>
                <h4 class="modal-title" >用户详情信息</h4>
            </div>
            <div class="modal-body">
                <div class="portlet-body form">
                    <form action="" class="form-horizontal" id="">
                        <div class="form-body">
                            <div class="row norow">
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">用户ID:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="userId" id="USER_ID_VIEW" class="form-control" disabled="disabled" placeholder="用户ID">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">昵称:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="userName" id="USER_NAME_VIEW" class="form-control" disabled="disabled" placeholder="昵称">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">真实姓名:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="realName" id="REAL_NAME_VIEW" class="form-control" disabled="disabled" placeholder="真实姓名">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">性别:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="sex" id="SEX_VIEW" class="bs-select form-control" data-show-subtext="true">
                                            </select>
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">出生年月日:</label>
                                        <div class="col-md-8 paddingnone">
                                            <div class="input-group input-daterange">
                                                <input type="text" class="form-control col-md-3" disabled="disabled" name="birthday" id="BIRTHDAY_VIEW">
                                            </div>
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">电话号码:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="telNo" id="TEL_NO_VIEW" class="form-control" disabled="disabled" placeholder="电话号码">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">邮箱:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="mail" id="MAIL_VIEW" class="form-control" disabled="disabled" placeholder="邮箱">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">身份证号:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="idNumber" id="ID_NUMBER_VIEW" class="form-control" disabled="disabled" placeholder="身份证号">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">部门编号:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="deptNo" id="DEPT_NO_VIEW" class="form-control" disabled="disabled" placeholder="部门编号">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">状态:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="userSts" id="USER_STS_VIEW" class="bs-select form-control" data-show-subtext="true">
                                            </select>
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">登录密码:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="loginPwd" id="LOGIN_PWD_VIEW" class="form-control" disabled="disabled" placeholder="登录密码">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">登录时间:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="loginTime" id="LOGIN_TIME_VIEW" class="form-control" disabled="disabled" placeholder="登录时间">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">登录IP:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="loginIp" id="LOGIN_IP_VIEW" class="form-control" disabled="disabled" placeholder="登录IP">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">授权角色:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="empowerRoles" id="EMPOWER_ROLES_VIEW" class="form-control" disabled="disabled" placeholder="授权角色">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">是否允许登录:</label>
                                        <div class="col-md-8 paddingnone">
                                            <select name="isAllowLogin" id="IS_ALLOW_LOGIN_VIEW" class="bs-select form-control" data-show-subtext="true">
                                            </select>
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">密码错误次数:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="pwdErrCunt" id="PWD_ERR_CUNT_VIEW" class="form-control" disabled="disabled" placeholder="密码错误次数">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">密码修改时间:</label>
                                        <div class="col-md-8 paddingnone">
                                            <div class="input-group input-daterange">
                                                <input type="text" class="form-control col-md-3" disabled="disabled" name="lastUptPwdTime" id="LAST_UPT_PWD_TIME_VIEW">
                                            </div>
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">创建人:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="cteUserNo" id="CTE_USER_NO_VIEW" class="form-control" disabled="disabled" placeholder="创建人">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">更新人:</label>
                                        <div class="col-md-8 paddingnone">
                                            <input name="uteUserNo" id="UTE_USER_NO_VIEW" class="form-control" disabled="disabled" placeholder="更新人">
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">更新日期:</label>
                                        <div class="col-md-8 paddingnone">
                                            <div class="input-group input-daterange">
                                                <input type="text" class="form-control col-md-3" disabled="disabled" name="uteDt" id="UTE_DT_VIEW">
                                            </div>
                                        </div>
                                    </div>
                               </div>
                               <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <div class="form-group">
                                        <label class="control-label col-md-4 text-right">创建日期:</label>
                                        <div class="col-md-8 paddingnone">
                                            <div class="input-group input-daterange">
                                                <input type="text" class="form-control col-md-3" disabled="disabled" name="cteDt" id="CTE_DT_VIEW">
                                            </div>
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
        getComboStore("","SEX", "USER-SEX","");
        getComboStore("","SEX_SHOW", "USER-SEX","");
        getComboStore("","USER_STS_SHOW", "USER-USER_STS","");
        getComboStore("","IS_ALLOW_LOGIN_SHOW", "USER-IS_ALLOW_LOGIN","");
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
            $('#addOrUpdateform').data('bootstrapValidator').validate();
            if(!$('#addOrUpdateform').data('bootstrapValidator').isValid()){
                return ;
            }
            param.userId = $("#USER_ID_SHOW").val();
            param.userName = $("#USER_NAME_SHOW").val();
            param.realName = $("#REAL_NAME_SHOW").val();
            param.sex = $("#SEX_SHOW").val();
            if($("#BIRTHDAY").val() != undefined && $("#BIRTHDAY").val() != "") {
                param.birthday = $("#BIRTHDAY_SHOW").val();
            }
            param.telNo = $("#TEL_NO_SHOW").val();
            param.mail = $("#MAIL_SHOW").val();
            param.idNumber = $("#ID_NUMBER_SHOW").val();
            param.deptNo = $("#DEPT_NO_SHOW").val();
            param.userSts = $("#USER_STS_SHOW").val();
            param.loginPwd = $("#LOGIN_PWD_SHOW").val();
            param.loginTime = $("#LOGIN_TIME_SHOW").val();
            param.loginIp = $("#LOGIN_IP_SHOW").val();
            param.empowerRoles = $("#EMPOWER_ROLES_SHOW").val();
            param.isAllowLogin = $("#IS_ALLOW_LOGIN_SHOW").val();
            param.pwdErrCunt = $("#PWD_ERR_CUNT_SHOW").val();
            if($("#LAST_UPT_PWD_TIME").val() != undefined && $("#LAST_UPT_PWD_TIME").val() != "") {
                param.lastUptPwdTime = $("#LAST_UPT_PWD_TIME_SHOW").val();
            }
            var hiddenType = $("#hiddenType").val();
            var url = "";
            if("1" == hiddenType){
                url = baseURL + "/user/user/save";
            }else if ("2" == hiddenType){
                url = baseURL + "/user/user/update";
                param.userId = $("#hiddenKey").val();
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
                    keys += record.userId+",";
                }
                keys = keys.substring(0, keys.lastIndexOf(","));
                bootbox.confirm("选择了"+selectRocords.length+"条, 确认删除?", function(truthBeTold){
                    if(truthBeTold){
                        $.ajax({
                            type: "POST",
                            url: baseURL + "/user/user/deleteByKey",
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
            document.getElementById('USER_ID_SHOW').readOnly = false;
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
                                if("update" == type){
                                    document.getElementById('USER_ID_SHOW').readOnly = true;
                                 }
                                document.getElementById('USER_NAME_SHOW').value=data.data.userName;
                                document.getElementById('REAL_NAME_SHOW').value=data.data.realName;
                                getComboStore(data.data.sex,"SEX_SHOW", "USER-SEX",false);
                                document.getElementById('BIRTHDAY_SHOW').value=fromatDate(data.data.birthday, "yyyy/MM/dd");
                                document.getElementById('TEL_NO_SHOW').value=data.data.telNo;
                                document.getElementById('MAIL_SHOW').value=data.data.mail;
                                document.getElementById('ID_NUMBER_SHOW').value=data.data.idNumber;
                                document.getElementById('DEPT_NO_SHOW').value=data.data.deptNo;
                                getComboStore(data.data.userSts,"USER_STS_SHOW", "USER-USER_STS",false);
                                document.getElementById('LOGIN_PWD_SHOW').value=data.data.loginPwd;
                                document.getElementById('LOGIN_TIME_SHOW').value=data.data.loginTime;
                                document.getElementById('LOGIN_IP_SHOW').value=data.data.loginIp;
                                document.getElementById('EMPOWER_ROLES_SHOW').value=data.data.empowerRoles;
                                getComboStore(data.data.isAllowLogin,"IS_ALLOW_LOGIN_SHOW", "USER-IS_ALLOW_LOGIN",false);
                                document.getElementById('PWD_ERR_CUNT_SHOW').value=data.data.pwdErrCunt;
                                document.getElementById('LAST_UPT_PWD_TIME_SHOW').value=fromatDate(data.data.lastUptPwdTime, "yyyy/MM/dd hh:mm:ss");
                                document.getElementById('hiddenKey').value=data.data.userId;
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
                        $("#BIRTHDAY_beginDt").datepicker('setStartDate', null);
                        $("#BIRTHDAY_endDt").datepicker('setEndDate', null);
                        $("#BIRTHDAY_beginDt").datepicker('update', dateString);
                        $("#BIRTHDAY_endDt").datepicker('update', dateString);
                        $("#LAST_UPT_PWD_TIME").datepicker('setStartDate', null);
                        $("#LAST_UPT_PWD_TIME").datepicker('update', dateString);
                        $("#UTE_DT").datepicker('setStartDate', null);
                        $("#UTE_DT").datepicker('update', dateString);
                        $("#CTE_DT").datepicker('setStartDate', null);
                        $("#CTE_DT").datepicker('update', dateString);
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
            param.sex = $("#SEX").val();
            param.birthdayBeginDt = $("#BIRTHDAY_beginDt").val();
            param.birthdayEndDt = $("#BIRTHDAY_endDt").val();
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
                        trData.push(getCodeName("USER-SEX", obj.sex));
                        trData.push(fromatDate(obj.birthday, "yyyy/MM/dd"));
                        trData.push(obj.telNo);
                        trData.push(obj.mail);
                        trData.push(obj.idNumber);
                        trData.push(obj.deptNo);
                        trData.push(getCodeName("USER-USER_STS", obj.userSts));
                        trData.push(obj.loginPwd);
                        trData.push(obj.loginTime);
                        trData.push(obj.loginIp);
                        trData.push(obj.empowerRoles);
                        trData.push(getCodeName("USER-IS_ALLOW_LOGIN", obj.isAllowLogin));
                        trData.push(obj.pwdErrCunt);
                        trData.push(fromatDate(obj.lastUptPwdTime, "yyyy/MM/dd hh:mm:ss"));
                        trData.push(obj.cteUserNo);
                        trData.push(obj.uteUserNo);
                        trData.push(fromatDate(obj.uteDt, "yyyy/MM/dd hh:mm:ss"));
                        trData.push(fromatDate(obj.cteDt, "yyyy/MM/dd hh:mm:ss"));
                        trData.push("<a href='javascript:void(0)'  onclick=view('"+JSON.stringify(obj)+"')><i class='fa fa-search-plus'></i>查看</a>");
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
    <!--操作链接点击事件-->
    function view(info){
        var param = {};
        var obj= JSON.parse(info);
         param.userId = obj.userId;
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
                        getComboStore(data.data.sex,"SEX_VIEW", "USER-SEX",true);
                        document.getElementById('BIRTHDAY_VIEW').value=fromatDate(data.data.birthday, "yyyy/MM/dd");
                        document.getElementById('TEL_NO_VIEW').value=data.data.telNo;
                        document.getElementById('MAIL_VIEW').value=data.data.mail;
                        document.getElementById('ID_NUMBER_VIEW').value=data.data.idNumber;
                        document.getElementById('DEPT_NO_VIEW').value=data.data.deptNo;
                        getComboStore(data.data.userSts,"USER_STS_VIEW", "USER-USER_STS",true);
                        document.getElementById('LOGIN_PWD_VIEW').value=data.data.loginPwd;
                        document.getElementById('LOGIN_TIME_VIEW').value=data.data.loginTime;
                        document.getElementById('LOGIN_IP_VIEW').value=data.data.loginIp;
                        document.getElementById('EMPOWER_ROLES_VIEW').value=data.data.empowerRoles;
                        getComboStore(data.data.isAllowLogin,"IS_ALLOW_LOGIN_VIEW", "USER-IS_ALLOW_LOGIN",true);
                        document.getElementById('PWD_ERR_CUNT_VIEW').value=data.data.pwdErrCunt;
                        document.getElementById('LAST_UPT_PWD_TIME_VIEW').value=fromatDate(data.data.lastUptPwdTime, "yyyy/MM/dd hh:mm:ss");
                        document.getElementById('CTE_USER_NO_VIEW').value=data.data.cteUserNo;
                        document.getElementById('UTE_USER_NO_VIEW').value=data.data.uteUserNo;
                        document.getElementById('UTE_DT_VIEW').value=fromatDate(data.data.uteDt, "yyyy/MM/dd hh:mm:ss");
                        document.getElementById('CTE_DT_VIEW').value=fromatDate(data.data.cteDt, "yyyy/MM/dd hh:mm:ss");
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
    function addOrUpdateFormValidator() {
        $('#addOrUpdateform').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            message: 'This value is not valid',
            fields: {
                userId: {
                    message: '用户ID验证失败',
                    validators: {
                        notEmpty: {message: '用户ID不能为空'},
                        stringLength: {
                            max: 10,
                            message: '用户ID长度超出范围，应在10之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                userName: {
                    message: '昵称验证失败',
                    validators: {
                        notEmpty: {message: '昵称不能为空'},
                        stringLength: {
                            max: 20,
                            message: '昵称长度超出范围，应在20之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                realName: {
                    message: '真实姓名验证失败',
                    validators: {
                        notEmpty: {message: '真实姓名不能为空'},
                        stringLength: {
                            max: 100,
                            message: '真实姓名长度超出范围，应在100之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                sex: {
                    message: '性别验证失败',
                    validators: {
                        notEmpty: {message: '性别不能为空'},
                        stringLength: {
                            max: 1,
                            message: '性别长度超出范围，应在1之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                birthday: {
                    message: '出生年月日验证失败',
                    validators: {
                        notEmpty: {message: '出生年月日不能为空'},
                         date: {
                             format: 'YYYY/MM/DD',
                             message: '日期无效'
                         }
                    }
                 },
                telNo: {
                    message: '电话号码验证失败',
                    validators: {
                        notEmpty: {message: '电话号码不能为空'},
                         regexp: {
                             regexp: /^1\d{10}$/,
                             message: '手机号格式错误'
                         }
                    }
                 },
                mail: {
                    message: '邮箱验证失败',
                    validators: {
                        notEmpty: {message: '邮箱不能为空'},
                         emailAddress : {
                             message : '请输入正确的邮件地址'
                         }
                    }
                 },
                idNumber: {
                    message: '身份证号验证失败',
                    validators: {
                        stringLength: {
                            max: 18,
                            message: '身份证号长度超出范围，应在18之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                deptNo: {
                    message: '部门编号验证失败',
                    validators: {
                        stringLength: {
                            max: 10,
                            message: '部门编号长度超出范围，应在10之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                userSts: {
                    message: '状态验证失败',
                    validators: {
                        stringLength: {
                            max: 2,
                            message: '状态长度超出范围，应在2之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                loginPwd: {
                    message: '登录密码验证失败',
                    validators: {
                        notEmpty: {message: '登录密码不能为空'},
                        stringLength: {
                            max: 255,
                            message: '登录密码长度超出范围，应在255之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                loginTime: {
                    message: '登录时间验证失败',
                    validators: {
                        stringLength: {
                            max: 14,
                            message: '登录时间长度超出范围，应在14之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                loginIp: {
                    message: '登录IP验证失败',
                    validators: {
                        stringLength: {
                            max: 20,
                            message: '登录IP长度超出范围，应在20之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                empowerRoles: {
                    message: '授权角色验证失败',
                    validators: {
                        stringLength: {
                            max: 20,
                            message: '授权角色长度超出范围，应在20之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                isAllowLogin: {
                    message: '是否允许登录验证失败',
                    validators: {
                        notEmpty: {message: '是否允许登录不能为空'},
                        stringLength: {
                            max: 1,
                            message: '是否允许登录长度超出范围，应在1之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                pwdErrCunt: {
                    message: '密码错误次数验证失败',
                    validators: {
                        stringLength: {
                            max: 3,
                            message: '密码错误次数长度超出范围，应在3之内！'
                        },
                        callback: {
                            message: '不允许有空格！',
                            callback: function (value, validator) {
                                return hasBlankSpace(value);
                            }
                        }
                    }
                 },
                lastUptPwdTime: {
                    message: '密码修改时间验证失败',
                    validators: {
                        stringLength: {
                            max: 20,
                            message: '密码修改时间长度超出范围，应在20之内！'
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


    // 验证是否包含空格
    function hasBlankSpace(value) {
        var val= value.replace(/^\s+|\s+$/g, '')
        if (value!=val) {
            return false
        }
        return true;
    }

    function queryFormValidator() {
        $('#queryForm').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            message: 'This value is not valid',
            fields: {
                userId: {
                    message: '用户ID验证失败',
                    validators: {
                         stringLength: {
                             max: 10,
                             message: '用户ID长度超出范围，应在10之内！'
                         },
                         callback: {
                             message: '不允许有空格！',
                             callback: function (value, validator) {
                                 return hasBlankSpace(value);
                             }
                         }
                    }
                },
                userName: {
                    message: '昵称验证失败',
                    validators: {
                         stringLength: {
                             max: 20,
                             message: '昵称长度超出范围，应在20之内！'
                         },
                         callback: {
                             message: '不允许有空格！',
                             callback: function (value, validator) {
                                 return hasBlankSpace(value);
                             }
                         }
                    }
                },
                realName: {
                    message: '真实姓名验证失败',
                    validators: {
                         stringLength: {
                             max: 100,
                             message: '真实姓名长度超出范围，应在100之内！'
                         },
                         callback: {
                             message: '不允许有空格！',
                             callback: function (value, validator) {
                                 return hasBlankSpace(value);
                             }
                         }
                    }
                },
                sex: {
                    message: '性别验证失败',
                    validators: {
                         stringLength: {
                             max: 1,
                             message: '性别长度超出范围，应在1之内！'
                         },
                         callback: {
                             message: '不允许有空格！',
                             callback: function (value, validator) {
                                 return hasBlankSpace(value);
                             }
                         }
                    }
                },
                birthday: {
                    message: '出生年月日验证失败',
                    validators: {
                         date: {
                             format: 'YYYY/MM/DD',
                             message: '日期无效'
                         }
                    }
                },
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

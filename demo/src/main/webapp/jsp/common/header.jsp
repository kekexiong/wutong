<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<script type="text/javascript">
	var baseURL = "<%=request.getContextPath()%>";
	// if (window == top) {
	// 	//子页面应该在iframe中打开，如果在top window打开则跳转到login页面
	// 	top.location.href = baseURL;
	// }
</script>
<div class="page-header navbar navbar-fixed-top">
    <!-- BEGIN HEADER INNEoR -->
    <div class="page-header-inner">
        <!-- BEGIN LOGO -->
        <div class="page-logo">
            <a href="index.html"> <img src="<%=request.getContextPath()%>/images/header.png" alt="logo" class="logo-default" /> </a>
            <div class="menu-toggler sidebar-toggler"> </div>
        </div>
        <!-- END LOGO -->
        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
        <div class="top-menu">
            <ul class="nav navbar-nav pull-right">
                <!-- 开始通知下拉 -->
                <!-- 用户下拉 -->
                <li class="dropdown dropdown-user">
                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> <img alt="" class="img-circle" src="<%=request.getContextPath()%>/takin_theme/assets/layouts/layout/img/avatar3_small.jpg" /> <span class="username username-hide-on-mobile"> 管理员 </span> <i class="fa fa-angle-down"></i> </a>
                    <ul class="dropdown-menu dropdown-menu-default">
                        <!-- <li>
                            <a href="page_user_profile_1.html"> <i class="fa fa-pencil"></i> 修改密码 </a>
                        </li> -->
                        <li class="divider"> </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/logout.jsp"> <i class="fa fa-paper-plane"></i> 退出 </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
        
    </div>
</div>
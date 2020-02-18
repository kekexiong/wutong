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

<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md page-sidebar-fixed">

    <!-- BEGIN HEADER -->
    <jsp:include page="common/IndexHeader.jsp" flush="true"/>
    <div class="page-header navbar navbar-fixed-top">
	    <!-- BEGIN HEADER INNEoR -->
	    <div class="page-header-inner">
	        <!-- BEGIN LOGO -->
	        <div class="page-logo">
				<%--<a href="<%=request.getContextPath()%>/index.jsp">
                    <img src="<%=request.getContextPath()%>/images/header.png" alt="logo" class="logo-default" />
				</a>--%>
				<h4 class="navbar-text font-white logo-default">梧桐管理系统</h4>
	            <div class="menu-toggler sidebar-toggler"><span></span> </div>
	        </div>
	        <!-- END LOGO -->
	        <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"><span></span> </a>
	        <div class="top-menu">
	            <ul class="nav navbar-nav pull-right">
	                <!-- 开始通知下拉 -->
	                <!-- 用户下拉 -->
	                <li class="dropdown dropdown-user">
	                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> 
	                    	<span class="username username-hide-on-mobile" id="login_username"><i class="fa fa-user fa-fw"></i>用户</span>
							<i class="fa fa-angle-down"></i>
	                    </a>
	                    <ul class="dropdown-menu dropdown-menu-default">
	                        <!-- <li>
	                            <a href="page_user_profile_1.html"> <i class="fa fa-pencil"></i> 修改密码 </a>
	                        </li>
	                        <li class="divider"> </li>-->
	                        <li>
	                            <a href="<%=request.getContextPath()%>/logout.jsp"><i class="fa fa-paper-plane"></i>退出 </a>
	                        </li>
	                    </ul>
	                </li>
	            </ul>
	        </div>
	        
	    </div>
	</div>
    <!-- END HEADER -->
    
    <!-- BEGIN CONTAINER -->
    <div class="clearfix"> </div>
    <div class="page-container">

    	<!-- BEGIN MENU -->
        <jsp:include page="common/menu.jsp" flush="true"/>
        <!-- END MENU -->
        
        <!-- BEGIN CONTENT -->
        <jsp:include page="common/home.jsp" flush="true"/>
        <!-- END CONTENT -->
    </div>
    <!-- END CONTAINER -->
    
    <!-- BEGIN FOOTER -->
    <jsp:include page="common/footer.jsp" flush="true"/>
	<div class="page-footer">
		<div class="page-footer-inner"> 2016 &copy; 版权所有</div>
		<div class="scroll-to-top" style="display: none;">
			<i class="icon-arrow-up"></i>
		</div>
	</div>
</div>
    <!-- END FOOTER -->
    
</body>

</html>

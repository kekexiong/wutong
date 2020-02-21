<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.wutong.wsk.util.*"%>
<%@ page import="com.wutong.wsk.domain.SystemAuthorizingRealm.Principal"%>
<%
Principal principal=null;
String name=principal!=null?principal.getName():"";
String orgId=principal!=null?principal.getOrgId():"";
String orgName=principal!=null?principal.getOrgName():"";
String departMentId=principal!=null?principal.getDepartMentId():"";
String deptName=principal!=null?principal.getDeptName():"";

%>
<script type="text/javascript" src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jsp/common/js/permisssionConstant.js"></script>
<script type="text/javascript">
	var baseURL = "<%=request.getContextPath()%>";
	var sinfo = {
		'userName' : '<%=name%>',
		'orgId': '<%=orgId%>',
		'orgName': '<%=orgName%>',
		'departMentId': '<%=departMentId%>',
		'deptName': '<%=deptName%>',
		'acls':'<%=request.getSession().getAttribute("permissionList")%>'
	};
	
	function logout(){
		bootbox.confirm("确定退出系统吗?",function(tf) {
			if(tf){
				window.location.href = baseURL + '/logout.jsp';
			}
		});
	}

	/**
	 * 判断当前用户是否具有当前应用模块的操作权限
	 * modelId 当前应用模块代码
	 */
	function hasPermission(modelId) {
         var flag = false;
		var rocs = JSON.parse(sinfo.acls);
		if (rocs) {
			for (var i = 0; i < rocs.length; i++) {				 
		         if(PERMISSSIONCONST.AIS915==modelId){
		        	 //console.log(rocs[i].permission);
		         }
				if (modelId == rocs[i].permission) {
					flag = true;
					break;
				} else {
					flag = false;
				}
			}
		}
		return flag; 
	}
</script>

<script type="text/javascript">
	/**
	 * ajax异步请求时，如果session超时，则跳转到登录页面
	 */
	$( document ).ajaxComplete(function( event, xhr, settings ) {
		var result = xhr.responseText;
        if(result.timeout){
        	bootbox.alert("会话超时，系统将自动跳转到登录页面！", function() {
        		window.location.href = baseURL + '/login.jsp';
        	});
        }
	});
</script>
<%-- 
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
</div> --%>
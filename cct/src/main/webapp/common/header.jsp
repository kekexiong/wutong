<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
String name="admin";
String orgId="100000";
String orgName="";
String departMentId="";
String deptName="";

%>
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
	
	

	
</script>

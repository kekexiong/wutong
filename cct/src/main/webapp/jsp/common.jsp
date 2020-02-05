<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 清客户端缓存 start-->
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<!-- 清户端缓存 end-->

<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.1/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.1/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../jquery-easyui-1.5.1/demo/demo.css">
<!--link rel="stylesheet" type="text/css" href="../css/table.css"-->
<script type="text/javascript" src="../jquery-easyui-1.5.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
<!-- 清服务器缓存 start-->
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	response.flushBuffer();
%>
<!-- 清服务器缓存 end-->
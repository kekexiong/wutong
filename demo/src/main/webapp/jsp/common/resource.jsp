<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	
<!-- 主css -->
<link href="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/takin_theme/assets/global/css/components-md.min.css" rel="stylesheet" id="style_components" type="text/css" />
<!-- table -->
<%-- <link href="<%=request.getContextPath()%>/takin_theme/assets/global/css/plugins-md.min.css" rel="stylesheet" type="text/css" /> --%>
<!--添加的 font -->
<link href="<%=request.getContextPath()%>common/css/font-awesome.css" rel="stylesheet" type="text/css" />
<!-- 主题 -->
<link href="<%=request.getContextPath()%>/takin_theme/assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/takin_theme/assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
<!-- 页面插件 -->
<link href="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>common/css/bootstrapValidator.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css" />
<!-- tree -->
<link href="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jstree/dist/themes/default/style.min.css" rel="stylesheet" type="text/css" />

<!-- 上传插件 -->
<link href="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" type="text/css" />
<!-- 修改样式css-hack.css last-->
<include file="<%=request.getContextPath()%>css/css-hack.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/respond.min.js"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->

<!-- BEGIN CORE PLUGINS -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/fancybox/source/jquery.fancybox.pack.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/pages/scripts/components-select2.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
<!-- table js -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/pages/scripts/table-datatables-managed.min.js" type="text/javascript"></script>
<!-- table js end-->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
<!-- 上传插件 -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery-file-upload/js/jquery.iframe-transport.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jquery-file-upload/js/jquery.fileupload.js" type="text/javascript"></script>
<!-- 下拉 -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/pages/scripts/components-bootstrap-select.min.js" type="text/javascript"></script>
<!-- jstree -->
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/jstree/dist/jstree.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/takin_theme/assets/pages/scripts/ui-tree.min.js" type="text/javascript"></script>
<!-- 表格组件 -->
<script src="<%=request.getContextPath()%>common/js/datatables.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>common/js/bootstrapValidator.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>common/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>common/js/jquery.form.js" type="text/javascript"></script>

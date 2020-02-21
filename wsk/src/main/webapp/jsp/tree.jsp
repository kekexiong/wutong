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
        <!-- 右边开始 -->
        <div class="">
            <!-- BEGIN PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light bordered">
                        <div class="portlet-title">
                            <div class="caption">
                                <i class="icon-bubble font-green-sharp"></i>
                                <span class="caption-subject font-green-sharp uppercase">分配权限</span>
                            </div>
                        </div>
                        <div class="portlet-body">
                            <div id="tree" class="tree-demo"> </div>
                            <div style="text-align:center;margin-top: 10px">
                                <button type="button" id="save_btn" class="btn btn-success" ><i
                                        class="fa fa-save"></i> 提交</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="common/footer.jsp" flush="true" />
    <script>
        // 使用 jsTree
        $('#tree').data('jstree', false).empty().jstree({
            core: {
                themes: {
                    responsive: false
                },
                check_callback: true,
                data: {
                    url: function(e) {
                        return "ajax_demo.json"
                    },
                    data: function(e) {
                        return {
                            'id' : e.id
                        }
                    }
                },
                expand_selected_onload: true
            },
            plugins: ["wholerow", "types","checkbox"]
        });
        $('#save_btn').on('click', function () {
            var ref = $('#tree').jstree(true),
                sel = ref.get_selected(true);  // get_selected() 不加true返回的是被选中的id
            if(!sel.length) { console.log("最少有一个权限"); return false; }
            var str = $("#tree").jstree(true).get_json();  //获取整棵树的json数据
            str = JSON.stringify(str);
            console.log("整棵树json数据:  "+ str);
        });

    </script>
</body>

</html>

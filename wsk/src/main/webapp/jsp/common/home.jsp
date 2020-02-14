<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}
/* pop */
#pop{background:#fff;width:410px;border:1px solid #e0e0e0;font-size:12px;position:fixed;right:10px;bottom:10px;}
#popHead{top:-22px;line-height:22px;background:#f6f0f3;border-bottom:1px solid #e0e0e0;position:relative;font-size:12px;padding:0 0 0 10px;}
#popHead h2{font-size:14px;color:#666;line-height:32px;height:32px;}
#popHead #popClose{position:absolute;right:10px;top:1px;}
#popHead a#popClose:hover{color:#f00;cursor:pointer;}
#popContent{padding:5px 10px;}
#popTitle a{line-height:24px;font-size:14px;font-family:'微软雅黑';color:#333;font-weight:bold;text-decoration:none;}
#popTitle a:hover{color:#f60;}
#popIntro{text-indent:24px;line-height:160%;margin:5px 0;color:#666;}
#popMore{text-align:right;border-top:1px dotted #ccc;line-height:24px;margin:8px 0 0 0;}
#popMore a{color:#f60;}
#popMore a:hover{color:#f00;}
</style>
<script src="<%=request.getContextPath()%>/takin_theme/assets/global/plugins/yanue.pop.js" type="text/javascript"></script>
<div class="page-content-wrapper" style="margin-top:-20px;">
    <!-- 主体-->
    <div class="page-content">
    	<div class="row">
        	<div class="col-md-12">
        		<ul class="nav nav-tabs" id="tab-bar">
                    <li class="active">
                        <a href="#tab_0" data-href="tab_0" data-toggle="tab"> 主页面 </a>
                    </li>
                </ul>
                <div class="tab-content" id="tab-content">
                    <div class="tab-pane fade active in" id="tab_0">
                        <!-- <div class="page-bar">
				            <ul class="page-breadcrumb">
				                <li> <i class="fa fa-home"></i>
				                    <a href="index.html">主界面</a>
				                </li>
				            </ul>
				        </div> -->
				        <div class="row out-margin-top">
				            <div class="col-lg-4 col-md-4">
				                <div class="portlet light bordered scaffold-list index-height">
				                    <div class="portlet-title">
				                        <div class="caption">
				                            <i class="fa fa-file-text-o font-blue"></i>
				                            <span class="caption-subject font-blue bold uppercase">新闻</span>
				                        </div>
				                    </div>
				                    <div class="portlet-body">
				                        <table class="table table-striped table-bordered table-hover table-checkable order-column table-scrollablewidth" id="sampletable">
				                            <thead>
				                                <tr>
				                                    <th> </th>
				                                    <th> 标题 </th>
				                                    <th> </th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            </tbody>
				                        </table>
				                    </div>
				                </div>
				                <div class="portlet light padding-btn scaffold-create">
				                    <div class="portlet-body">
				                        <div class="row">
				                            <div class="col-md-12 text-center">
				                                <div class="row">
				                                    <button type="button" class="btn btn-info btn-sm "><i class="fa fa-list-alt"></i> 详情</button>
				                                    <button type="button" class="btn red btn-sm"><i class="fa fa-mail-forward"></i> 更多</button>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
				            <!-- 公告 -->
				            <div class="col-lg-4 col-md-4">
				                <div class="portlet light bordered scaffold-list index-height">
				                    <div class="portlet-title">
				                        <div class="caption">
				                            <i class="fa fa-volume-up font-blue"></i>
				                            <span class="caption-subject font-blue bold uppercase">公告</span>
				                        </div>
				                    </div>
				                    <div class="portlet-body">
				                        <table class="table table-striped table-bordered table-hover table-checkable order-column table-scrollablewidth" id="sampletable">
				                            <thead>
				                                <tr>
				                                    <th> </th>
				                                    <th> 标题 </th>
				                                    <th> </th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            </tbody>
				                        </table>
				                    </div>
				                </div>
				                <div class="portlet light padding-btn scaffold-create">
				                    <div class="portlet-body">
				                        <div class="row">
				                            <div class="col-md-12 text-center">
				                                <div class="row">
				                                    <button type="button" class="btn btn-info btn-sm "><i class="fa fa-list-alt"></i> 详情</button>
				                                    <button type="button" class="btn red btn-sm"><i class="fa fa-mail-forward"></i> 更多</button>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
				            <!-- 信息文档 -->
				            <div class="col-lg-4 col-md-4">
				                <div class="portlet light bordered scaffold-list index-height">
				                    <div class="portlet-title">
				                        <div class="caption">
				                            <i class="fa fa-list-alt font-blue"></i>
				                            <span class="caption-subject font-blue bold uppercase">信息文档</span>
				                        </div>
				                    </div>
				                    <div class="portlet-body">
				                        <table class="table table-striped table-bordered table-hover table-checkable order-column table-scrollablewidth" id="sampletable">
				                            <thead>
				                                <tr>
				                                    <th> </th>
				                                    <th> 标题 </th>
				                                    <th> </th>
				                                </tr>
				                            </thead>
				                            <tbody>
				                            </tbody>
				                        </table>
				                    </div>
				                </div>
				                <div class="portlet light padding-btn scaffold-create">
				                    <div class="portlet-body">
				                        <div class="row">
				                            <div class="col-md-12 text-center">
				                                <div class="row">
				                                    <button type="button" class="btn btn-info btn-sm "><i class="fa fa-list-alt"></i> 详情</button>
				                                    <button type="button" class="btn red btn-sm"><i class="fa fa-mail-forward"></i> 更多</button>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </div>
				        <div id="pop" style="display:none;">
							<div id="popHead"> <a id="popClose" title="关闭">关闭</a>
								<h2>警报提示</h2>
							</div>
							<div id="popContent">
								<dl>
									<dt id="popTitle">
									<span>尊敬的结算大神您好：以下是T+N自动付款失败信息，请您查看<br/><br/></span>
									<span id = "text"></span>
									</dt>
								</dl>
							</div>
						</div>
                    </div>
                </div>
        	</div>
       	</div>
        
    </div>
    <!-- END CONTENT BODY -->
</div>
<!-- END CONTENT -->

<script type="text/javascript" >
var pageLengthMenu = [[5, 10, 20, -1], [5, 10, 20, "ALL"]];
var limit = 5;
$(function() {
	if (!hasPermission(PERMISSSIONCONST.POPUP0001)) {
		$("#pop").hide();
	} else {
		window.onload = function() {
			var pop = new Pop("", "", "");
			$.ajax({
				type : "post",
				async : false,
				url : baseURL + "/login/getSesAutoPayBatList",
				dataType : "json",
				success : function(data) {
					if (data.items == null || data.items == "") {
						$("#pop").hide();
					} else {
						$.each(data.items, function(index, obj) {
							var trData = [];
							trData.push("批次号：" + "<span style = 'color:red'>"+obj.audBno+"</span>"+ "&nbsp;&nbsp;&nbsp;");
							trData.push("失败原因：" + "<span style = 'color:red'>"+obj.rmk+"</span>");
							$("#text").append(trData[0],trData[1] + "<br/>");
						});
					}
				},
				error : function() {

				}
			});
		}
		/* setTimeout(function() {
			document.getElementById("pop").style.display = "none";
		}, 20000); */
	}
});
</script>
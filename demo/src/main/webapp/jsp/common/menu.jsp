<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<style type="text/css">
    ul.li a { float: left; }
    ul.nav li button.close {
        margin: -37px 6px;78u
    }
</style>
<script type="text/javascript">
//在新标签页打开页面
function openTab(link, href, title) {
	//var acls =  $.session.get('permissionList');
	//if (!acls || acls=='' || acls=='null') {
	if (false) {
		bootbox.confirm('会话可能超时，是否重新登录？',function(proceed) {
			if(proceed){
				top.window.location.href = 'login.jsp';
			}
		});
	} else {
		var menuID = $(link).attr("menuID");
		/*所点击菜单的上级菜单样式渲染*/
		$("#menuRoot .nav-item.active").removeClass('active');
		$("#menuRoot span.selected").removeClass('selected').addClass('arrow');
		if (menuID != 0) {
			var subMenu = $(link).parents('li[level=1]');
			var a = subMenu.children('a:first');
			subMenu.addClass('active');
			a.children('.arrow').removeClass('arrow').addClass('selected');
		}
		
		/*该菜单已经打开，切换到对应的tab页*/
		var oTab = $("a[data-href='tab_"+menuID+"']")[0];
		var oContent = $("#tab-content div[id='tab_"+menuID+"']")[0];
		if (oTab && oContent) {
			$(oTab).parent().addClass("active");
			$(oContent).addClass("active in");
			$("#tab-bar").find("a[data-href!='tab_"+menuID+"']").each(function(index,a) {
				$(a).parent().removeClass("active");
			});
			$("#tab-content").children().each(function(index,div) {
				if ($(div).attr("id") != "tab_" + menuID) {
					$(div).removeClass("active in");
				}
			});
			return;
		}
		/*打开新tab*/
		var a = $("<a href=\"#tab_"+menuID+"\" data-href=\"tab_"+menuID+"\" data-toggle=\"tab\"> "+title+" </a>");
		if (menuID == '030202') {
			//切换到付款审批页面时，执行查询方法一次
			a = $("<a href=\"#tab_"+menuID+"\" data-href=\"tab_"+menuID+"\" data-toggle=\"tab\" onclick=\"refreshPayCheck();\"> "+title+" </a>");
		}
		var close_button = $("<button type=\"button\" class=\"close\" data-dismiss=\"alert\"></button>");
		$(close_button).on("click", function(e){
		    // FIXME check weather needs show others.
		    var switchTab = $(this).parent().prev().find('a');
		    switchTab.click();
		    $("#"+switchTab.attr("data-href")).addClass("active in");
		    $("#"+$(this).prev().attr("data-href")).remove();
		    $(this).parent().remove();
		    //$($("#tab-bar li a")[0]).click();
		    //$($("#tab-bar li")[0]).addClass('active');
		    //$("#tab_0").addClass("active in");
		});
		var tab_li = $('<li class="active"></li>').append(a).append(close_button);
		$("#tab-bar").append(tab_li);
		$("#tab-bar").find("a[data-href!='tab_"+menuID+"']").each(function(index,a) {
			$(a).parent().removeClass("active");
		});
		var div = $("<div class=\"tab-pane fade active in\" id=\"tab_"+menuID+"\" style=\"-webkit-overflow-scrolling: touch; overflow-y: scroll\"><iframe id='frame_"+menuID+"' frameborder='no' scrolling='no' onload='setIframeHeight(this);' class=\"col-sm-12 no-border no-padding\" src=''></iframe></div>");
		div.find("iframe").attr("src",href);
		div.find("iframe").height($(window).height() *2);
		$("#tab-content").append(div);
		$("#tab-content").children().each(function(index,div) {
			if ($(div).attr("id") != "tab_" + menuID) {
				$(div).removeClass("active in");
			}
		});
	}
	
}
	
function refreshPayCheck() {
	for (var i=0;i<window.frames.length; i++) {
		var frameWin = window.frames[i].window;
		var frameId = frameWin.frameElement && frameWin.frameElement.id || '';
		if (frameId == 'frame_030202') {
			frameWin.reloadGrid();
			break;
		}
	}
}

</script>
<div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">
        <ul class="page-sidebar-menu page-header-fixed" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200" style="padding-top: 20px" id="menuRoot">
            <li class="sidebar-toggler-wrapper hide">
                <div class="sidebar-toggler"> </div>
            </li>
            <li class="nav-item start">
                <a href="javascript:;" menuID="0" onclick="openTab(this,'<%=request.getContextPath()%>/index.jsp', '主页面')" class="nav-link nav-toggle"> <i class="fa fa-home"></i> <span class="title">首页</span> </a>
            </li>
        </ul>
    </div>
</div>
<script>
String.prototype.endWith=function(s){
  if(s==null||s==""||this.length==0||s.length>this.length)
     return false;
  if(this.substring(this.length-s.length)==s)
     return true;
  else
     return false;
  return true;
}

String.prototype.startWith=function(s){
 if(s==null||s==""||this.length==0||s.length>this.length)
  return false;
 if(this.substr(0,s.length)==s)
    return true;
 else
    return false;
 return true;
}
var pageLocation = document.location.href;
$('.nav-item').each(function(index,item){
	var href = $($(this).children('a')[0]).prop('href');
	if (pageLocation.endWith(href)) {
		//$(this).parent().parent().children('a:first').trigger('click');
		var sub_menu = $(this).parent();
		sub_menu.show();
		var nav_item = $(sub_menu).parent();
		nav_item.addClass('open');
		var parent_sub_menu = nav_item.parent('.sub-menu');
		if (parent_sub_menu) {
			parent_sub_menu.show();
			var parent_nav_item = $(parent_sub_menu).parent();
			parent_nav_item.addClass('open');
		}
		return false;
	}
});

/*初始化菜单权限start*/
//渲染一级菜单
function renderMenuLevel1(title,menuId) {
	var li,a,ul;
	li = $('<li class="nav-item" level="1"></li>');
	a = $('<a href="javascript:;" class="nav-link nav-toggle"> <i class="fa fa-joomla"></i> <span class="title">'+title+'</span> <span class="arrow"></span> </a>');
	ul = $('<ul class="sub-menu" id="'+menuId+'"></ul>');
	li.append(a);
	li.append(ul);
	$('#menuRoot').append(li);
}
//渲染二级菜单组（有子菜单）
function renderMenuGroupLevel2(parentId,menuId,title) {
	var li,a,ul;
	li = $('<li class="nav-item" level="2"></li>');
	a = $('<a href="#" class="nav-link nav-link nav-toggle"> <span class="title">'+title+'</span> <span class="arrow"></span> </a>');
	ul = $('<ul class="sub-menu" id="'+menuId+'"></ul>');
	li.append(a);
	li.append(ul);
	$('#'+parentId).append(li);
}
//渲染二级菜单（叶子节点无子菜单）
function renderMenuLeafLevel2(parentId,menuId,title,path) {
	var li,a,span;
	li = $('<li class="nav-item"></li>');
	a = $('<a href="javascript:;" menuID="'+menuId+'" onclick="openTab(this,\'<%=request.getContextPath()%>/webPage'+path+'\', \''+title+'\')" class="nav-link"></a>');
	span = $('<span class="title">'+title+'</span>');
	li.append(a);
	a.append(span);
	$('#'+parentId).append(li);
}
//渲染三级菜单（叶子节点无子菜单）
function renderMenuLeafLevel3(parentId,menuId,title,path) {
	var li,a,span;
	li = $('<li class="nav-item"></li>');
	a = $('<a href="javascript:;" menuID="'+menuId+'" onclick="openTab(this,\'<%=request.getContextPath()%>/webPage'+path+'\', \''+title+'\')" class="nav-link">'+title+'</a>');
	li.append(a);
	$('#'+parentId).append(li);
}
/*---------------------------------------------用户体系------------------------------------------------------*/
if(true){
	renderMenuLevel1('用户体系','menuUsr');
    renderMenuLeafLevel2('menuUsr','010101','内部用户管理','/usr/QueryInnerPanel.jsp');
	renderMenuLeafLevel2('menuUsr','010201','商户信息查询','/usr/QueryMecPanel.jsp');
    renderMenuLeafLevel3('menuAms_tiaozhang','020501','调账类型管理','/ams/AmsAdjustTypePanel.jsp');

/*初始化菜单权限end*/
</script>

﻿﻿﻿﻿﻿<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
if(hasPermission(PERMISSSIONCONST.USR003)
	||hasPermission(PERMISSSIONCONST.USR004)
	||hasPermission(PERMISSSIONCONST.USR020)
	||hasPermission(PERMISSSIONCONST.USR013)
	||hasPermission(PERMISSSIONCONST.USR010)
	||hasPermission(PERMISSSIONCONST.USR014)
	||hasPermission(PERMISSSIONCONST.USR019)
	||hasPermission(PERMISSSIONCONST.USR024)
	||hasPermission(PERMISSSIONCONST.USR029)
	||hasPermission(PERMISSSIONCONST.BASEINFO001)
	||hasPermission(PERMISSSIONCONST.BASEINFO004)
	||hasPermission(PERMISSSIONCONST.BASEINFO011)
	||hasPermission(PERMISSSIONCONST.USR40)
	||hasPermission(PERMISSSIONCONST.USR045)
	||hasPermission(PERMISSSIONCONST.USR046)
	||hasPermission(PERMISSSIONCONST.USR047)
											){
	
	renderMenuLevel1('用户体系','menuUsr');
	
	if(hasPermission(PERMISSSIONCONST.USR003)){
		renderMenuLeafLevel2('menuUsr','010101','内部用户管理','/usr/QueryInnerPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR004)){
		renderMenuLeafLevel2('menuUsr','010201','商户信息查询','/usr/QueryMecPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR020)){
		renderMenuLeafLevel2('menuUsr','010301','商户终端信息查询','/usr/QueryMecTifPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR013)){
		renderMenuLeafLevel2('menuUsr','010401','用户身份认证检查条件','/usr/authRePanelManager.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR010)){
		renderMenuLeafLevel2('menuUsr','010501','商户费率信息查询','/usr/QueryMecRatePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR014)){
		renderMenuLeafLevel2('menuUsr','010601','商户注销','/usr/MecLogoffPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR019)){
		renderMenuLeafLevel2('menuUsr','010701','商户开关查询','/usr/MecFunSwPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR024)){
		renderMenuLeafLevel2('menuUsr','010801','合作伙伴查询其拓展商户','/usr/MecPartnerPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR029)){
		renderMenuLeafLevel2('menuUsr','010901','商户信息变更维护','/usr/MecInfoUpdateManagePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.BASEINFO001)){
		renderMenuLeafLevel2('menuUsr','011001','行业大类维护','/base/BankInfoManagePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.BASEINFO004)){
		renderMenuLeafLevel2('menuUsr','011101','地域码维护','/base/CupCodeInfoManagePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.BASEINFO011)){
		renderMenuLeafLevel2('menuUsr','011201','短信发送','/base/SendMsgContentPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR40)){
		renderMenuLeafLevel2('menuUsr','011301','手刷商户经营地址查询','/usr/SS2OperAddrPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR045)){
		renderMenuLeafLevel2('menuUsr','011401','双免商户信息查询','/usr/MecNoPtsSignPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR046)){
		renderMenuLeafLevel2('menuUsr','011501','钱包用户信息查询','/cams/QueryCamsUserPerson.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.USR047)){
		renderMenuLeafLevel2('menuUsr','011501','银联小微商户注册','/usr/MecRegisterUnionpayPanel.jsp');
	}
}
/*---------------------------------------------账户系统------------------------------------------------------*/
if(hasPermission(PERMISSSIONCONST.AMS101)
	||hasPermission(PERMISSSIONCONST.AMS103)
	||hasPermission(PERMISSSIONCONST.AMS102)
	||hasPermission(PERMISSSIONCONST.AMS105)
	||hasPermission(PERMISSSIONCONST.AMS651)
	||hasPermission(PERMISSSIONCONST.AMS630)
	||hasPermission(PERMISSSIONCONST.AMS660)
	||hasPermission(PERMISSSIONCONST.AMS641)
	||hasPermission(PERMISSSIONCONST.AMS671)
	||hasPermission(PERMISSSIONCONST.AMS6710)
	||hasPermission(PERMISSSIONCONST.AMS6720)
	||hasPermission(PERMISSSIONCONST.AMS6810)
	||hasPermission(PERMISSSIONCONST.AMS6820)
	||hasPermission(PERMISSSIONCONST.AMS000)
	||hasPermission(PERMISSSIONCONST.AMS6900)
	||hasPermission(PERMISSSIONCONST.AMS6910)
	||hasPermission(PERMISSSIONCONST.AMS6920)
	||hasPermission(PERMISSSIONCONST.AMS6930)
	){
	
	renderMenuLevel1('账户系统','menuAms');
	
	if(hasPermission(PERMISSSIONCONST.AMS101)){
		renderMenuLeafLevel2('menuAms','020101','账户查询','/ams/AmsAccQryPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.AMS103)){
		renderMenuLeafLevel2('menuAms','020201','账户收支明细查询','/ams/AmsAccFinancialsQryPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.AMS102)){
		renderMenuLeafLevel2('menuAms','020301','冻结解冻明细查询','/ams/AmsBlkQryPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.AMS105)){
		renderMenuLeafLevel2('menuAms','020401','账户状态变更历史','/ams/AmsStsModifyQryPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.AMS651)||
		hasPermission(PERMISSSIONCONST.AMS631)||
		hasPermission(PERMISSSIONCONST.AMS641)||
		hasPermission(PERMISSSIONCONST.AMS661)||
		hasPermission(PERMISSSIONCONST.AMS671)||
		hasPermission(PERMISSSIONCONST.AMS6710)||
		hasPermission(PERMISSSIONCONST.AMS6720)
		){
		renderMenuGroupLevel2('menuAms','menuAms_tiaozhang','调账');
		
		if(hasPermission(PERMISSSIONCONST.AMS651)){
			renderMenuLeafLevel3('menuAms_tiaozhang','020501','调账类型管理','/ams/AmsAdjustTypePanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.AMS630)){
			renderMenuLeafLevel3('menuAms_tiaozhang','020502','手工调账','/ams/AmsManualAdjustPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.AMS660)){
			renderMenuLeafLevel3('menuAms_tiaozhang','020503','批量调账','/ams/AmsBatchAdjustPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.AMS641)){
			renderMenuLeafLevel3('menuAms_tiaozhang','020504','调账复核','/ams/AmsAdjustCheckPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.AMS671)){
			renderMenuLeafLevel3('menuAms_tiaozhang','020505','调账查询','/ams/AmsAdjustQryPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.AMS6710)){
			renderMenuLeafLevel3('menuAms_tiaozhang','020506','自主即时T+1结算','/ams/AutoInTimePayPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.AMS6720)){
			renderMenuLeafLevel3('menuAms_tiaozhang','020507','自动即时T+1结算','/ams/AutoImmeT1SesPanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.AMS6810)||
		hasPermission(PERMISSSIONCONST.AMS6820)
		){
		renderMenuGroupLevel2('menuAms','menuAms_koukuan','扣款业务');
		
		if(hasPermission(PERMISSSIONCONST.AMS6810)){
			renderMenuLeafLevel3('menuAms_koukuan','020601','子交易类型维护','/ams/DeductTypePanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.AMS6820)){
			renderMenuLeafLevel3('menuAms_koukuan','020602','扣款业务处理','/ams/DeductPanel.jsp');
		}
	}
	//业务收款
	if(hasPermission(PERMISSSIONCONST.AMS6900)||
		hasPermission(PERMISSSIONCONST.AMS6910)||
		hasPermission(PERMISSSIONCONST.AMS6920)||
		hasPermission(PERMISSSIONCONST.AMS6930)
		){
		renderMenuGroupLevel2('menuAms','menuAms_moneyCollect','入款业务');
		
		if(hasPermission(PERMISSSIONCONST.AMS6910)){
			renderMenuLeafLevel3('menuAms_moneyCollect','020701','子交易类型维护','/ams/monyCollectTypeManager.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.AMS6920)){
			renderMenuLeafLevel3('menuAms_moneyCollect','020702','入款业务处理--导入','/ams/moneyCollectImport.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.AMS6930)){
			renderMenuLeafLevel3('menuAms_moneyCollect','020703','入款业务处理—执行','/ams/moneyCollectExecution.jsp');
		}
	}
}
/*---------------------------------------------结算系统------------------------------------------------------*/
if(hasPermission(PERMISSSIONCONST.SES100)
	||hasPermission(PERMISSSIONCONST.SES26000)
	||hasPermission(PERMISSSIONCONST.SES300)
	||hasPermission(PERMISSSIONCONST.SES400)
	||hasPermission(PERMISSSIONCONST.SES0027)
	||hasPermission(PERMISSSIONCONST.SES500)
	||hasPermission(PERMISSSIONCONST.SES600)
	||hasPermission(PERMISSSIONCONST.SES700)
	||hasPermission(PERMISSSIONCONST.SES800)
	
	||hasPermission(PERMISSSIONCONST.SES1000)
	||hasPermission(PERMISSSIONCONST.SES1100)
	||hasPermission(PERMISSSIONCONST.SES1300)
	||hasPermission(PERMISSSIONCONST.SES0014)
	||hasPermission(PERMISSSIONCONST.SES1500)
	||hasPermission(PERMISSSIONCONST.SES1600)
	||hasPermission(PERMISSSIONCONST.SES1700)
	||hasPermission(PERMISSSIONCONST.SES0020)
	||hasPermission(PERMISSSIONCONST.SES0019)
	||hasPermission(PERMISSSIONCONST.SES0021)
	||hasPermission(PERMISSSIONCONST.SES3001)
	||hasPermission(PERMISSSIONCONST.SES3101)
	||hasPermission(PERMISSSIONCONST.SES3200)
	||hasPermission(PERMISSSIONCONST.SES2204)
	||hasPermission(PERMISSSIONCONST.SES2205)
	||hasPermission(PERMISSSIONCONST.SES2300)
	||hasPermission(PERMISSSIONCONST.SES2310)
	||hasPermission(PERMISSSIONCONST.SES2560)
	
	||hasPermission(PERMISSSIONCONST.SES2400)
	||hasPermission(PERMISSSIONCONST.SES2401)
	||hasPermission(PERMISSSIONCONST.SES2410)

	||hasPermission(PERMISSSIONCONST.SES2500)
	||hasPermission(PERMISSSIONCONST.SES2510)
	||hasPermission(PERMISSSIONCONST.SES2520)
	||hasPermission(PERMISSSIONCONST.SES2500)
	||hasPermission(PERMISSSIONCONST.SES2530)
	||hasPermission(PERMISSSIONCONST.SES2540)
	||hasPermission(PERMISSSIONCONST.SES2550)	
	
	||hasPermission(PERMISSSIONCONST.SES2600)
	||hasPermission(PERMISSSIONCONST.SES2601)
	||hasPermission(PERMISSSIONCONST.SES2603)
	||hasPermission(PERMISSSIONCONST.SES2607)
	
	||hasPermission(PERMISSSIONCONST.SES2800)
	||hasPermission(PERMISSSIONCONST.SES2810)
	||hasPermission(PERMISSSIONCONST.SES2820)
	||hasPermission(PERMISSSIONCONST.SES2808)
	||hasPermission(PERMISSSIONCONST.SES2840)
	
	||hasPermission(PERMISSSIONCONST.SES2900)
	||hasPermission(PERMISSSIONCONST.SES2901)
	||hasPermission(PERMISSSIONCONST.SES2200)
	||hasPermission(PERMISSSIONCONST.SES2210)
	||hasPermission(PERMISSSIONCONST.SES2201)
	||hasPermission(PERMISSSIONCONST.SES2202)
	||hasPermission(PERMISSSIONCONST.SES2203)
	
	||hasPermission(PERMISSSIONCONST.SES2581)
	||hasPermission(PERMISSSIONCONST.SES2582)
	||hasPermission(PERMISSSIONCONST.SES2586)
	
	||hasPermission(PERMISSSIONCONST.SES200400)
	||hasPermission(PERMISSSIONCONST.SES200401)
	||hasPermission(PERMISSSIONCONST.SES200402)
	||hasPermission(PERMISSSIONCONST.SES200403)
	||hasPermission(PERMISSSIONCONST.SES200500)
	||hasPermission(PERMISSSIONCONST.SES200501)
	||hasPermission(PERMISSSIONCONST.SES200502)
	||hasPermission(PERMISSSIONCONST.SES200503)
	||hasPermission(PERMISSSIONCONST.SES200504)
	||hasPermission(PERMISSSIONCONST.SES200505)
											){
	
	renderMenuLevel1('结算系统','menuSes');
	
	if(hasPermission(PERMISSSIONCONST.SES100)){
		renderMenuLeafLevel2('menuSes','030101','结算记录查询','/ses/SetOrdPanel.jsp');
	}
	
	if(hasPermission(PERMISSSIONCONST.SES26000)
		||hasPermission(PERMISSSIONCONST.SES300)
		||hasPermission(PERMISSSIONCONST.SES400)
		||hasPermission(PERMISSSIONCONST.SES0027)
		||hasPermission(PERMISSSIONCONST.SES500)
		||hasPermission(PERMISSSIONCONST.SES600)
		||hasPermission(PERMISSSIONCONST.SES700)
		||hasPermission(PERMISSSIONCONST.SES800)
		||hasPermission(PERMISSSIONCONST.SES900)
			
												){
		renderMenuGroupLevel2('menuSes','menuSes_fukuan','付款');
		
		if(hasPermission(PERMISSSIONCONST.SES300)){
			renderMenuLeafLevel3('menuSes_fukuan','030201','付款申请','/ses/PayApplyPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES400)){
			renderMenuLeafLevel3('menuSes_fukuan','030202','付款审批','/ses/PayCheckPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES0027)){
			renderMenuLeafLevel3('menuSes_fukuan','030203','付款进度','/ses/PayProcessPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES500)){
			renderMenuLeafLevel3('menuSes_fukuan','030204','付款单查询','/ses/PayQueryPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES600)){
			renderMenuLeafLevel3('menuSes_fukuan','030205','付款操作','/ses/PayOptPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES700)){
			renderMenuLeafLevel3('menuSes_fukuan','030206','网银付款状态维护','/ses/OlPayStsMtPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES800)){
			renderMenuLeafLevel3('menuSes_fukuan','030207','付款失败数据处理','/ses/PayFailDataPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES900)){
			renderMenuLeafLevel3('menuSes_fukuan','030208','付款拆批管理','/ses/PayChannelCpManagerPanel.jsp');
		}
	}
	
	if(hasPermission(PERMISSSIONCONST.SES1000)){
		renderMenuLeafLevel2('menuSes','030301','批量退票','/ses/RefundBatchPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES1100)){
		renderMenuLeafLevel2('menuSes','030401','用户退票','/ses/PayRefundPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES1300)){
		renderMenuLeafLevel2('menuSes','030501','付款属性维护','/ses/PayPropertyPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES0014)){
		renderMenuLeafLevel2('menuSes','030601','卡状态类别维护','/ses/BnkCardStsTypPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES1500)){
		renderMenuLeafLevel2('menuSes','030701','付款标记管理','/ses/PayMarkMagPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES1600)){
		renderMenuLeafLevel2('menuSes','030801','银行卡状态维护','/ses/BnkStsMtPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES1700)){
		renderMenuLeafLevel2('menuSes','030901','银行卡信息维护','/ses/BnkInfoMtPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES0020)){
		renderMenuLeafLevel2('menuSes','031001','付款通道管理','/ses/PayChannelInfoPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES0019)){
		renderMenuLeafLevel2('menuSes','031101','付款通道黑名单管理','/ses/PayChannelBlackListPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES200400)||hasPermission(PERMISSSIONCONST.SES200401)
		||hasPermission(PERMISSSIONCONST.SES200402)||hasPermission(PERMISSSIONCONST.SES200403)){
		renderMenuLeafLevel2('menuSes','033401','钱包银行卡状态及信息维护','/ses/WalletBankInfoMtPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES200500)||hasPermission(PERMISSSIONCONST.SES200501)
		||hasPermission(PERMISSSIONCONST.SES200502)||hasPermission(PERMISSSIONCONST.SES200503)
		||hasPermission(PERMISSSIONCONST.SES200504)||hasPermission(PERMISSSIONCONST.SES200505)){
		renderMenuLeafLevel2('menuSes','033301','钱包付款通道黑名单管理','/ses/WalletBlacklistPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES0021)){
		renderMenuLeafLevel2('menuSes','031201','保底路由规则管理','/ses/PayChannelBreakRoutePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES3001)){
		renderMenuLeafLevel2('menuSes','031301','商户付款记录查询','/ses/MecOrderManagePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES3101)){
		renderMenuLeafLevel2('menuSes','031401','商户付款手续费设置','/ses/MecOrderSetFeePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES3200)){
		renderMenuLeafLevel2('menuSes','031501','冲正透支管理','/ses/AcOdManagePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES2204)){
		renderMenuLeafLevel2('menuSes','031601','厦门民生实时代付余额查询','/ses/XMCMBCQuBalancePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES2205)){
		renderMenuLeafLevel2('menuSes','031602','付款通道余额查询','/ses/PayChanQuBalancePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES2300)){
		renderMenuLeafLevel2('menuSes','031701','银联代付限额管理','/ses/CupQuota.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES2310)){
		renderMenuLeafLevel2('menuSes','031703','银联代付地方银联限额设置','/ses/CupChanProvPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES2560)){
		renderMenuLeafLevel2('menuSes','032201','大额付款拆单设置','/ses/payChannelSplitPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.SES2400)
		||hasPermission(PERMISSSIONCONST.SES2401)
		||hasPermission(PERMISSSIONCONST.SES2410)
												){
		renderMenuGroupLevel2('menuSes','menuSes_jsjcsj','结算基础数据');
		
		if(hasPermission(PERMISSSIONCONST.SES2401)){
			renderMenuLeafLevel3('menuSes_jsjcsj','031701','银行行别信息管理','/ses/BnkInfoManager.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2410)){
			renderMenuLeafLevel3('menuSes_jsjcsj','031702','联行行号信息管理','/ses/BnkLinkInfoManager.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.SES2500)
		||hasPermission(PERMISSSIONCONST.SES2510)
		||hasPermission(PERMISSSIONCONST.SES2520)
		||hasPermission(PERMISSSIONCONST.SES2500)
		||hasPermission(PERMISSSIONCONST.SES2530)
		||hasPermission(PERMISSSIONCONST.SES2540)
		||hasPermission(PERMISSSIONCONST.SES2550)
				
												){
		renderMenuGroupLevel2('menuSes','menuSes_jsbb','结算报表');
		
		if(hasPermission(PERMISSSIONCONST.SES2510)){
			renderMenuLeafLevel3('menuSes_jsbb','031801','合作银行信息维护','/ses/CoopBankInfoMaintain.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2520)){
			renderMenuLeafLevel3('menuSes_jsbb','031802','银行流水核对','/ses/BankStmtCheckPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2530)){
			renderMenuLeafLevel3('menuSes_jsbb','031803','银行流水汇总','/ses/BankTransSumPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2540)){
			renderMenuLeafLevel3('menuSes_jsbb','031804','资金日报','/ses/CapitalReportPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2550)){
			renderMenuLeafLevel3('menuSes_jsbb','031805','现金日报','/ses/CashReportPanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.SES2600)
		||hasPermission(PERMISSSIONCONST.SES2601)
		||hasPermission(PERMISSSIONCONST.SES2603)
		||hasPermission(PERMISSSIONCONST.SES2607)
												){
		renderMenuGroupLevel2('menuSes','menuSes_fkms','付款模式管理');
		
		if(hasPermission(PERMISSSIONCONST.SES2601)){
			renderMenuLeafLevel3('menuSes_fkms','031901','结算业务类型付款模式管理','/ses/CkmStmBusTypMaPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2603)){
			renderMenuLeafLevel3('menuSes_fkms','031902','自动付款指令管理','/ses/CkmAutoPayOrderMaPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2607)){
			renderMenuLeafLevel3('menuSes_fkms','031903','指令付款批次信息查询','/ses/CkmOrderPayBatchQueryPanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.SES2800)
		||hasPermission(PERMISSSIONCONST.SES2810)
		||hasPermission(PERMISSSIONCONST.SES2820)
		||hasPermission(PERMISSSIONCONST.SES2808)
		||hasPermission(PERMISSSIONCONST.SES2840)
				
		){
		renderMenuGroupLevel2('menuSes','menuSes_zjdb','资金调拨');
		
		if(hasPermission(PERMISSSIONCONST.SES2810)){
			renderMenuLeafLevel3('menuSes_zjdb','032101','资金调拨参数配置','/ses/ZjdbConfigPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2820)){
			renderMenuLeafLevel3('menuSes_zjdb','032102','资金调拨指令管理','/ses/ZjdbInsMsgPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2808)){
			renderMenuLeafLevel3('menuSes_zjdb','032103','资金调拨计划管理','/ses/ZJDBPlanMsgPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2840)){
			renderMenuLeafLevel3('menuSes_zjdb','032104','资金调拨流水查询','/ses/ZjdbStmtQueryPanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.SES2900)
		||hasPermission(PERMISSSIONCONST.SES2901)
		||hasPermission(PERMISSSIONCONST.SES2200)
		||hasPermission(PERMISSSIONCONST.SES2210)
		||hasPermission(PERMISSSIONCONST.SES2201)
		||hasPermission(PERMISSSIONCONST.SES2202)
		||hasPermission(PERMISSSIONCONST.SES2203)			
												){
		renderMenuGroupLevel2('menuSes','menuSes_yhlsxz','银行流水下载');
		
		if(hasPermission(PERMISSSIONCONST.SES2901)){
			renderMenuLeafLevel3('menuSes_yhlsxz','032001','广发银行对账文件下载','/ses/CGBPayDetailTab.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2200)){
			renderMenuLeafLevel3('menuSes_yhlsxz','032002','建行账户明细文件下载','/ses/CCBPayDetailTab.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2210)){
			renderMenuLeafLevel3('menuSes_yhlsxz','032003','建行账户明细文件下载信息查询','/ses/CCBDownFileMsgTab.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2201)){
			renderMenuLeafLevel3('menuSes_yhlsxz','032004','深圳中信代付对账文件下载','/ses/SZECITICPayDetailTab.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2208)){
			renderMenuLeafLevel3('menuSes_yhlsxz','032007','平安代付对账文件下载','/ses/PingAnDownLoadPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2202)){
			renderMenuLeafLevel3('menuSes_yhlsxz','032006','工行明细文件下载','/ses/ICBCDetailDownLoadPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2203)){
			renderMenuLeafLevel3('menuSes_yhlsxz','032005','西安民生代付对账文件下载','/ses/XACMBCPayDetailTab.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2902)){
			renderMenuLeafLevel3('menuSes_yhlsxz','032008','南京民生银行对账文件下载','/ses/NjCmbcPayDetailTab.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.SES2581)
		||hasPermission(PERMISSSIONCONST.SES2582)
		||hasPermission(PERMISSSIONCONST.SES2586)
												){
		renderMenuGroupLevel2('menuSes','menuSes_fksbyj','付款失败预警');
		
		if(hasPermission(PERMISSSIONCONST.SES2582)){
			renderMenuLeafLevel3('menuSes_fksbyj','032101','短信接收人管理','/ses/SMRecipientPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SES2586)){
			renderMenuLeafLevel3('menuSes_fksbyj','032102','推送短信规则管理','/ses/SMRuleMagPanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.SES4100)
			||hasPermission(PERMISSSIONCONST.SES4110)
			||hasPermission(PERMISSSIONCONST.SES4120)
													){
			renderMenuGroupLevel2('menuSes','menuSes_zdbf','付款失败数据自动补付');
			
			if(hasPermission(PERMISSSIONCONST.SES4110)){
				renderMenuLeafLevel3('menuSes_zdbf','033101','银行返回信息维护','/ses/ZDBFBankMsgPanel.jsp');
			}
			if(hasPermission(PERMISSSIONCONST.SES4120)){
				renderMenuLeafLevel3('menuSes_zdbf','033102','付款类型维护','/ses/ZDBFSwitchPanel.jsp');
			}
		}
}
/*---------------------------------------------会计系统------------------------------------------------------*/
if(hasPermission(PERMISSSIONCONST.AIS900)
	||hasPermission(PERMISSSIONCONST.AIS904)
	||hasPermission(PERMISSSIONCONST.AIS906)
	||hasPermission(PERMISSSIONCONST.AIS908)
	||hasPermission(PERMISSSIONCONST.AIS913)
	||hasPermission(PERMISSSIONCONST.AIS914)
	||hasPermission(PERMISSSIONCONST.AIS915)
	||hasPermission(PERMISSSIONCONST.AIS906)){
	
	renderMenuLevel1('会计系统','menuAis');
	
	if(hasPermission(PERMISSSIONCONST.AIS900)){
		renderMenuLeafLevel2('menuAis','040101','科目管理','/ais/SbjPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.AIS904)){
		renderMenuLeafLevel2('menuAis','040102','科目历史余额查询','/ais/SbjHiBlPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.AIS906)){
		renderMenuLeafLevel2('menuAis','040103','科目余额明细查询','/ais/SbjBlDetailPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.AIS908)){
		renderMenuLeafLevel2('menuAis','040104','会计差错账处理','/ais/ActErrorPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.AIS913)){
		renderMenuLeafLevel2('menuAis','040105','借贷不平流水查询','/ais/RunUpActPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.AIS914)){
		renderMenuLeafLevel2('menuAis','040106','会计分录查询','/ais/GlDtlPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.AIS915)){
		renderMenuLeafLevel2('menuAis','040107','挂账流水信息处理','/ais/UpactHandlerPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.AIS906)){
		renderMenuLeafLevel2('menuAis','040108','科目明细台账','/ais/SbjBlSumByDayPanel.jsp');
	}
}
/*---------------------------------------------业务管理平台------------------------------------------------------*/
if(hasPermission(PERMISSSIONCONST.MSP001)
	||hasPermission(PERMISSSIONCONST.MSP023)
	||hasPermission(PERMISSSIONCONST.MSP029)
	||hasPermission(PERMISSSIONCONST.MSP004)
	||hasPermission(PERMISSSIONCONST.MSP009)
	||hasPermission(PERMISSSIONCONST.MSP022)
	||hasPermission(PERMISSSIONCONST.MSP442)
	||hasPermission(PERMISSSIONCONST.MSP451)
	||hasPermission(PERMISSSIONCONST.MSP461)
	||hasPermission(PERMISSSIONCONST.MSP470)
	||hasPermission(PERMISSSIONCONST.MSP035)){
	
	renderMenuLevel1('业务管理平台','menuMsp');
	
	if(hasPermission(PERMISSSIONCONST.MSP001)){
		renderMenuLeafLevel2('menuMsp','050101','资金归集订单查询','/msp/ccordPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MSP023)){
		renderMenuLeafLevel2('menuMsp','050102','维护费订单查询','/msp/QueryMtcFeeOrderPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MSP035)){
		renderMenuLeafLevel2('menuMsp','050107','维护费商户查询','/msp/QueryMtcFeeMecPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MSP029)){
		renderMenuLeafLevel2('menuMsp','050103','批量开通/关闭维护通','/msp/MspMtcSwBatchPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MSP004)){
		renderMenuLeafLevel2('menuMsp','050104','票据入库和分配','/msp/billPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MSP009)){
		renderMenuLeafLevel2('menuMsp','050105','票据管理','/msp/billMgePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MSP022)){
		renderMenuLeafLevel2('menuMsp','050106','发票管理','/msp/fpMgePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MSP442)
		||hasPermission(PERMISSSIONCONST.MSP451)
		||hasPermission(PERMISSSIONCONST.MSP461)){
		renderMenuGroupLevel2('menuMsp','menuMsp_szlt','收支两条线');
		
		if(hasPermission(PERMISSSIONCONST.MSP442)){
			renderMenuLeafLevel3('menuMsp_szlt','050201','商户清算费率管理','/msp/MspClrRatePanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.MSP451)){
			renderMenuLeafLevel3('menuMsp_szlt','050202','预存手续费','/msp/MspClrAccPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.MSP461)){
			renderMenuLeafLevel3('menuMsp_szlt','050203','收取手续费','/msp/MspClrFeePanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.MSP470)){
		renderMenuLeafLevel2('menuMsp','050301','1+N佣金管理','/msp/CommissionOrdPanel.jsp');
	}
}
/*---------------------------------------------手工业务系统------------------------------------------------------*/
if(hasPermission(PERMISSSIONCONST.MBS003)
	||hasPermission(PERMISSSIONCONST.MBS302)
	||hasPermission(PERMISSSIONCONST.MBS001)
	||hasPermission(PERMISSSIONCONST.MBS002)
	||hasPermission(PERMISSSIONCONST.MBS004)
	||hasPermission(PERMISSSIONCONST.MBS007)
	||hasPermission(PERMISSSIONCONST.MBS400)
	||hasPermission(PERMISSSIONCONST.MBS418)
	||hasPermission(PERMISSSIONCONST.MBS423)
	||hasPermission(PERMISSSIONCONST.MBS424)){
	
	renderMenuLevel1('手工业务系统','menuMbs2');
	
	if(hasPermission(PERMISSSIONCONST.MBS003)){
		renderMenuLeafLevel2('menuMbs2','060101','商户手工业务差错处理','/mbs2/MbsMerchErrProPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MBS302)){
		renderMenuLeafLevel2('menuMbs2','060201','手工业务差错处理查询','/mbs2/MbsMerchErrHisQryPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MBS001)){
		renderMenuLeafLevel2('menuMbs2','060301','商户手工业务申请','/mbs2/QueryMbsAppPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MBS002)){
		renderMenuLeafLevel2('menuMbs2','060401','商户手工业务查询','/mbs2/MbsMerchOrderQueryPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MBS004)){
		renderMenuLeafLevel2('menuMbs2','060501','商户手工业务处理','/mbs2/MbsMerchOrderProPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MBS007)){
		renderMenuLeafLevel2('menuMbs2','060601','银行订单处理','/mbs2/MbsBankOrderProPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MBS400)){
		renderMenuLeafLevel2('menuMbs2','060701','导入银行拒付订单','/mbs2/MbsBankRefuseImpPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MBS418)){
		renderMenuLeafLevel2('menuMbs2','060801','银行拒付处理','/mbs2/MbsBankRefuseProPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MBS423)){
		renderMenuLeafLevel2('menuMbs2','060901','追损处理','/mbs2/MbsBankZsPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.MBS424)){
		renderMenuLeafLevel2('menuMbs2','061001','追损处理明细','/mbs2/MbsBankZsOprIfPanel.jsp');
	}
}
/*---------------------------------------------线下交易系统------------------------------------------------------*/
if(hasPermission(PERMISSSIONCONST.PTS903)
	||hasPermission(PERMISSSIONCONST.PTS901)
	||hasPermission(PERMISSSIONCONST.PTS902)
	||hasPermission(PERMISSSIONCONST.PTS911)
	||hasPermission(PERMISSSIONCONST.PTS920)
	||hasPermission(PERMISSSIONCONST.PTS9500)){
	
	renderMenuLevel1('线下交易系统','menuPts');
	
	if(hasPermission(PERMISSSIONCONST.PTS903)){
		renderMenuLeafLevel2('menuPts','070101','POS交易信息浏览','/pts/TranDataPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.PTS901)){
		renderMenuLeafLevel2('menuPts','070201','卡BIN管理','/pts/BinManagePanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.PTS902)){
		renderMenuLeafLevel2('menuPts','070301','对账批次查询','/pts/PsmtckctPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.PTS911)){
		renderMenuLeafLevel2('menuPts','070401','对账差错处理','/pts/PsmtckerPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.PTS920)){
		renderMenuLeafLevel2('menuPts','070501','交易二次确认查询','/pts/SecondaryConfirmPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.PTS9500)){
		renderMenuLeafLevel2('menuPts','070601','分润交易信息浏览','/pts/CooperPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.PTS904)){
		renderMenuLeafLevel2('menuPts','070104','二维码交易信息浏览','/pts/QrTranDataPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.PTS929)){
		renderMenuLeafLevel2('menuPts','070801','MPOS跳码白名单','/pts/HfRediMnoListPanel.jsp');
	}
	
}
/*---------------------------------------------系统公共数据维护------------------------------------------------------*/
if(hasPermission(PERMISSSIONCONST.T702)
	||hasPermission(PERMISSSIONCONST.T705)
	||hasPermission(PERMISSSIONCONST.T705)){
	
	renderMenuLevel1('系统公共数据维护','menuSys');
	
	if(hasPermission(PERMISSSIONCONST.T702)){
		renderMenuLeafLevel2('menuSys','080101','系统用户角色管理','/sys/grantRoletosystermUser.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.T705)){
		renderMenuLeafLevel2('menuSys','080201','系统角色权限管理','/sys/grantMenutoRole.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.T705)){
		renderMenuLeafLevel2('menuSys','080301','系统角色管理','/sys/rolePanelManager.jsp');
	}
}
/*---------------------------------------------结算增值业务管理------------------------------------------------------*/
if(hasPermission(PERMISSSIONCONST.STM2300)
	||hasPermission(PERMISSSIONCONST.TZERO701)
	||hasPermission(PERMISSSIONCONST.TZERO501)
	||hasPermission(PERMISSSIONCONST.TZERO601)
	||hasPermission(PERMISSSIONCONST.TZER1110)
	
	||hasPermission(PERMISSSIONCONST.TZER2000)
	||hasPermission(PERMISSSIONCONST.TZERO801)
	||hasPermission(PERMISSSIONCONST.TZERO901)
	||hasPermission(PERMISSSIONCONST.TZERO951)
	||hasPermission(PERMISSSIONCONST.TZERO945)
	||hasPermission(PERMISSSIONCONST.TZERO981)
	||hasPermission(PERMISSSIONCONST.TZER2003)
	||hasPermission(PERMISSSIONCONST.TZER2001)
	||hasPermission(PERMISSSIONCONST.TZER8100)
	||hasPermission(PERMISSSIONCONST.TZERO8500)
	||hasPermission(PERMISSSIONCONST.TZER8600)
	||hasPermission(PERMISSSIONCONST.TZER8700)
	||hasPermission(PERMISSSIONCONST.TZER8800)
	
	||hasPermission(PERMISSSIONCONST.TZER1008)
	||hasPermission(PERMISSSIONCONST.TZER1009)
	||hasPermission(PERMISSSIONCONST.TZERO941)
	||hasPermission(PERMISSSIONCONST.TZER1004)
	||hasPermission(PERMISSSIONCONST.TZERO944)
	||hasPermission(PERMISSSIONCONST.TZER4000)
	
	||hasPermission(PERMISSSIONCONST.SDDZ0001)
	||hasPermission(PERMISSSIONCONST.TZER1007)
	||hasPermission(PERMISSSIONCONST.SDDZ0002)
	||hasPermission(PERMISSSIONCONST.SDDZ0005)
	||hasPermission(PERMISSSIONCONST.SDDZNOTICE001)
	||hasPermission(PERMISSSIONCONST.SDDZ0010)
	
	||hasPermission(PERMISSSIONCONST.DF0024)
	||hasPermission(PERMISSSIONCONST.DF0025)
	||hasPermission(PERMISSSIONCONST.DF0026)
	
	||hasPermission(PERMISSSIONCONST.ZFT1000)
	||hasPermission(PERMISSSIONCONST.ZFT100)
	||hasPermission(PERMISSSIONCONST.ZFT112)
	||hasPermission(PERMISSSIONCONST.ZFT100)
	||hasPermission(PERMISSSIONCONST.ZFT1001)
	||hasPermission(PERMISSSIONCONST.ZFT1002)
	||hasPermission(PERMISSSIONCONST.ZFT1003)
	
	||hasPermission(PERMISSSIONCONST.TZER8330)
	||hasPermission(PERMISSSIONCONST.TZER8300)	

	||hasPermission(PERMISSSIONCONST.TZER8400)	

	||hasPermission(PERMISSSIONCONST.POSMD000)
	||hasPermission(PERMISSSIONCONST.POSMD001)	
	||hasPermission(PERMISSSIONCONST.POSMD002)	
	||hasPermission(PERMISSSIONCONST.POSMD003)	
	||hasPermission(PERMISSSIONCONST.POSMD012)	
	||hasPermission(PERMISSSIONCONST.POSMD020)
	||hasPermission(PERMISSSIONCONST.POSMD030)
	||hasPermission(PERMISSSIONCONST.POSMD035)
	||hasPermission(PERMISSSIONCONST.ERRORLOG00)		

	||hasPermission(PERMISSSIONCONST.SETREF0000)
	||hasPermission(PERMISSSIONCONST.SETREF0100)

	
												){
	
	renderMenuLevel1('结算增值业务管理','menuTzero');
	if(hasPermission(PERMISSSIONCONST.TZERO502)){
		renderMenuLeafLevel2('menuTzero','090302','T0商户查询','/tZero/T0JRFMecQueryPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.TZERO503)){
		renderMenuLeafLevel2('menuTzero','090303','S0商户查询','/tZero/S0MdMecQueryPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.STM2300)){
		renderMenuLeafLevel2('menuTzero','090101','资金成本比例管理','/tZero/FcrMagPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.TZERO701)){
		renderMenuLeafLevel2('menuTzero','090401','非工作日属性管理','/tZero/SysWorkDayPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.TZERO501)){
		renderMenuLeafLevel2('menuTzero','090301','T+0商户查询','/tZero/MecTZeroStlQueryPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.TZERO601)){
		renderMenuLeafLevel2('menuTzero','090201','T+0结算记录查询','/tZero/MecTZeroSetQueryPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.TZER1110)){
		renderMenuGroupLevel2('menuTzero','menuTzero_syt','随意通');
		
		if(hasPermission(PERMISSSIONCONST.TZERO101)){
			renderMenuLeafLevel3('menuTzero_syt','090501','财务确认收/退款','/tZero/OrgTZeroChargeTaskPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZERO201)){
			renderMenuLeafLevel3('menuTzero_syt','090502','随意通代理商账户管理','/tZero/OrgTZeroAccountPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZERO301)){
			renderMenuLeafLevel3('menuTzero_syt','090503','随意通代理商业务信息查询','/tZero/OrgTZeroQueryPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZERO401)){
			renderMenuLeafLevel3('menuTzero_syt','090504','随意通代理商分润信息查询','/tZero/OrgTZeroProfitQueryPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZERO1100)){
			renderMenuLeafLevel3('menuTzero_syt','090505','随意通结算费率管理','/tZero/OrgTZeroRateManagerPanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.TZER2000)
		||hasPermission(PERMISSSIONCONST.TZERO801)
		||hasPermission(PERMISSSIONCONST.TZERO901)
		||hasPermission(PERMISSSIONCONST.TZERO951)
		||hasPermission(PERMISSSIONCONST.TZERO945)
		||hasPermission(PERMISSSIONCONST.TZERO981)
		||hasPermission(PERMISSSIONCONST.TZER2003)
		||hasPermission(PERMISSSIONCONST.TZER2001)
		||hasPermission(PERMISSSIONCONST.TZER8100)
		||hasPermission(PERMISSSIONCONST.TZERO8500)
		||hasPermission(PERMISSSIONCONST.TZER8600)
		||hasPermission(PERMISSSIONCONST.TZER8700)
		||hasPermission(PERMISSSIONCONST.TZER8800)
							
	
												){
		renderMenuGroupLevel2('menuTzero','menuTzero_d1','D+1');
		
		if(hasPermission(PERMISSSIONCONST.TZERO801)){
			renderMenuLeafLevel3('menuTzero_d1','090601','D+1代理商分润查询','/tZero/WorkDayOrgProfitPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZERO901)){
			renderMenuLeafLevel3('menuTzero_d1','090602','D+1商户业务状态查询','/tZero/SetWorkDayPropertyPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZERO951)){
			renderMenuLeafLevel3('menuTzero_d1','090603','D+1推送管理','/tZero/HandImportSearchPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZERO945)){
			renderMenuLeafLevel3('menuTzero_d1','090604','D+1批量开通/关闭','/tZero/MecTzeroAndDOneStlPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZERO981)){
			renderMenuLeafLevel3('menuTzero_d1','090605','D+1批量操作结果查询','/tZero/MecT0D1ManagementPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZER2003)){
			renderMenuLeafLevel3('menuTzero_d1','090606','D+1商户结算费率管理','/tZero/MecDOneAcRateQueryPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZER2001)){
			renderMenuLeafLevel3('menuTzero_d1','090607','D+1商户结算费率批量调整结果查询','/tZero/MecDOneAcRateBatchHisPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZER8100)){
			renderMenuLeafLevel3('menuTzero_d1','090608','D+1商户结算记录查询','/tZero/MecDOneSetOrdQueryPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZERO8500)){
			renderMenuLeafLevel3('menuTzero_d1','090609','D+1业务管理','/tZero/D1BusStmRulePanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZER8600)){
			renderMenuLeafLevel3('menuTzero_d1','090610','D+1商户默认免费额度管理','/tZero/DOneFreeLimitPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZER8700)){
			renderMenuLeafLevel3('menuTzero_d1','090611','D+1商户管理','/tZero/DOneMecMagPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZER8800)){
			renderMenuLeafLevel3('menuTzero_d1','090612','D+1商户查询','/tZero/DOneMecQueryPanel.jsp');
		}
		
	}
	if(hasPermission(PERMISSSIONCONST.TZER1008)
		||hasPermission(PERMISSSIONCONST.TZER1009)
		||hasPermission(PERMISSSIONCONST.TZERO941)
		||hasPermission(PERMISSSIONCONST.TZER1004)
		||hasPermission(PERMISSSIONCONST.TZERO944)
		||hasPermission(PERMISSSIONCONST.TZER4000)
		
		){
		renderMenuGroupLevel2('menuTzero','menuTzero_jrf','即日付');
		
		if(hasPermission(PERMISSSIONCONST.TZER1009)){
			renderMenuLeafLevel3('menuTzero_jrf','090701','即日付商户业务状态管理','/tZero/JRFStatusManagePanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZERO941)){
			renderMenuLeafLevel3('menuTzero_jrf','090702','即日付推送管理','/tZero/MecT0PushRuleManagementPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZER1004)){
			renderMenuLeafLevel3('menuTzero_jrf','090703','即日付商户业务限额调整','/tZero/TZeroStlLimitAdjustPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZERO944)){
			renderMenuLeafLevel3('menuTzero_jrf','090704','即日付渠道管理','/tZero/TZeroChannelManagementPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.TZER4000)){
			renderMenuLeafLevel3('menuTzero_jrf','090705','即日付业务规则管理','/tZero/TzeroJRFRateRulMaPanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.SDDZ0001)
	   ||hasPermission(PERMISSSIONCONST.TZER1007)
	   ||hasPermission(PERMISSSIONCONST.SDDZ0002)
	   ||hasPermission(PERMISSSIONCONST.SDDZ0005)
	   ||hasPermission(PERMISSSIONCONST.SDDZNOTICE001)
	   ||hasPermission(PERMISSSIONCONST.SDDZ0010)
												){
		renderMenuGroupLevel2('menuTzero','menuTzero_sddz','闪电到账');
		
		if(hasPermission(PERMISSSIONCONST.TZER1007)){
			renderMenuLeafLevel3('menuTzero_sddz','090801','闪电到账申请记录查询','/tZero/TradingRecordQueruPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SDDZ0002)){
			renderMenuLeafLevel3('menuTzero_sddz','090802','闪电到账商户业务状态管理','/tZero/SddzStatusManegePanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SDDZ0005)){
			renderMenuLeafLevel3('menuTzero_sddz','090803','闪电到账审核','/tZero/SddzAccountAuditingPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SDDZNOTICE001)){
			renderMenuLeafLevel3('menuTzero_sddz','090804','闪电到账公告管理','/tZero/NoticeManageQueryPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.SDDZ0010)){
			renderMenuLeafLevel3('menuTzero_sddz','090805','闪电到账业务管理','/tZero/SDDZBizManager.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.DF0024)
		||hasPermission(PERMISSSIONCONST.DF0025)
		||hasPermission(PERMISSSIONCONST.DF0026)
				
												){
		renderMenuGroupLevel2('menuTzero','menuTzero_daifu','代付业务');
		
		if(hasPermission(PERMISSSIONCONST.DF0025)){
			renderMenuLeafLevel3('menuTzero_daifu','090901','代付业务管理','/tZero/DfMecIfPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.DF0026)){
			renderMenuLeafLevel3('menuTzero_daifu','090902','代付订单查询','/ses/DfPayOrdPanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.ZFT1000)
			||hasPermission(PERMISSSIONCONST.ZFT100)
			||hasPermission(PERMISSSIONCONST.ZFT112)
			||hasPermission(PERMISSSIONCONST.ZFT100)
			||hasPermission(PERMISSSIONCONST.ZFT1001)
			||hasPermission(PERMISSSIONCONST.ZFT1002)
			||hasPermission(PERMISSSIONCONST.ZFT1003)
			
											){
		renderMenuGroupLevel2('menuTzero','menuTzero_zft','朝付通');
		
		if(hasPermission(PERMISSSIONCONST.ZFT100)){
			renderMenuLeafLevel3('menuTzero_zft','091001','VIP朝付通申请受理','/zft/zftApplyAuditPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.ZFT112)){
			renderMenuLeafLevel3('menuTzero_zft','091002','VIP朝付通申请记录查询','/zft/zftApplyAuditQueryPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.ZFT100)){
			renderMenuLeafLevel3('menuTzero_zft','091003','朝付通批量开通/关闭','/zft/zftBatchManagerPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.ZFT1001)){
			renderMenuLeafLevel3('menuTzero_zft','091004','朝付通手续费管理','/zft/zftMecCounterFeeManagerPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.ZFT1002)){
			renderMenuLeafLevel3('menuTzero_zft','091005','朝付通商户业务信息查询','/zft/zftMecFlgSituationPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.ZFT1003)){
			renderMenuLeafLevel3('menuTzero_zft','091006','朝付通操作流水查询','/zft/zftMecHisPanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.TZER8330)
		||hasPermission(PERMISSSIONCONST.TZER8300)
											){
		renderMenuGroupLevel2('menuTzero','menuTzero_shoushua','手刷业务');
		
		if(hasPermission(PERMISSSIONCONST.TZER8300)){
			renderMenuLeafLevel3('menuTzero_shoushua','091101','手刷结算手续费管理','/tZero/MobileSwipeRatePanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.TZER8400)){
		renderMenuLeafLevel2('menuTzero','091201','结算产品促销活动管理','/tZero/StmPromotionalPanel.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.POSMD000)
		||hasPermission(PERMISSSIONCONST.POSMD001)	
		||hasPermission(PERMISSSIONCONST.POSMD002)	
		||hasPermission(PERMISSSIONCONST.POSMD003)	
		||hasPermission(PERMISSSIONCONST.POSMD012)	
		||hasPermission(PERMISSSIONCONST.POSMD020)
		||hasPermission(PERMISSSIONCONST.POSMD030)
		||hasPermission(PERMISSSIONCONST.POSMD035)
		||hasPermission(PERMISSSIONCONST.ERRORLOG00)
	
												){
		renderMenuGroupLevel2('menuTzero','menuTzero_zdmd','自动秒到');
		
		if(hasPermission(PERMISSSIONCONST.POSMD001)){
			renderMenuLeafLevel3('menuTzero_zdmd','091301','自动秒到商户管理','/tZero/PosMdMecManagerPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.POSMD002)){
			renderMenuLeafLevel3('menuTzero_zdmd','091302','自动秒到商户查询','/tZero/PosMdMecQueryPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.POSMD003)){
			renderMenuLeafLevel3('menuTzero_zdmd','091303','自动秒到业务规则管理','/tZero/PosMdRulePanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.POSMD012)){
			renderMenuLeafLevel3('menuTzero_zdmd','091304','自动秒到开通规则管理','/tZero/PosMdOpenRulePanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.POSMD020)){
			renderMenuLeafLevel3('menuTzero_zdmd','091305','自动秒到商户规模管理','/tZero/PosMdMecNumMagPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.POSMD030)){
			renderMenuLeafLevel3('menuTzero_zdmd','091306','秒到等级规则管理','/tZero/PosMdLevelManagerPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.POSMD035)){
			renderMenuLeafLevel3('menuTzero_zdmd','091307','秒到结算人等级信息管理','/tZero/PosMdStmLevelMagPanel.jsp');
		}
		if(hasPermission(PERMISSSIONCONST.ERRORLOG00)){
			renderMenuLeafLevel3('menuTzero_zdmd','091308','结算异常记录查询','/tZero/SesErrorLogPanel.jsp');
		}
	}
	if(hasPermission(PERMISSSIONCONST.SETREF0000)
		||hasPermission(PERMISSSIONCONST.SETREF0100)
			
								){
		renderMenuGroupLevel2('menuTzero','menuTzero_jstf','结算退费管理');
		
		if(hasPermission(PERMISSSIONCONST.SETREF0100)){
			renderMenuLeafLevel3('menuTzero_jstf','091401','商户结算退费流水管理','/tZero/SetRefStmtMagPanel.jsp');
		}
	}
	
	if(hasPermission(PERMISSSIONCONST.VVMEC001)
			||hasPermission(PERMISSSIONCONST.VVMEC010)
			||hasPermission(PERMISSSIONCONST.TZER9000)){
			renderMenuGroupLevel2('menuTzero','menuTzero_vvMag','VV管理');
			
			if(hasPermission(PERMISSSIONCONST.VVMEC010)){
				renderMenuLeafLevel3('menuTzero_vvMag','091601','VV业务规则管理','/tZero/VvRuleMagPanel.jsp');
			}
			if(hasPermission(PERMISSSIONCONST.TZER9000)){
				renderMenuLeafLevel3('menuTzero_vvMag','091501','快速提现手续费管理','/tZero/MecVvRateManagerPanel.jsp');
			}
		}
}
/*---------------------------------------------POS功能相关管理------------------------------------------------------*/
if(hasPermission(PERMISSSIONCONST.POSINFO100)
	||hasPermission(PERMISSSIONCONST.POSINFO200)
	||hasPermission(PERMISSSIONCONST.POSINFO501)
	||hasPermission(PERMISSSIONCONST.POSINFO500)
	||hasPermission(PERMISSSIONCONST.POSINFO300)
	||hasPermission(PERMISSSIONCONST.POSINFO400)){
	
	renderMenuLevel1('POS功能相关管理','menuPos');
	
	if(hasPermission(PERMISSSIONCONST.POSINFO100)){
		renderMenuLeafLevel2('menuPos','100101','POS屏幕显示信息规则查询','/POSAlertConfig/POSAlertConfiguration.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.POSINFO200)){
		renderMenuLeafLevel2('menuPos','100201','商户POS屏幕提示信息规则查询','/POSAlertConfig/POSAlertQuery.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.POSINFO501)){
		renderMenuLeafLevel2('menuPos','100301','结算账户屏显规则查询','/POSAlertConfig/POSAlertSesQuery.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.POSINFO500)){
		renderMenuLeafLevel2('menuPos','100401','屏显历史查询','/POSAlertConfig/POSAlertHisQuery.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.POSINFO300)){
		renderMenuLeafLevel2('menuPos','100501','签购单持卡人联广告管理','/POSAlertConfig/POSAdIndex.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.POSINFO400)){
		renderMenuLeafLevel2('menuPos','100601','签购单商户联广告管理','/POSAlertConfig/POSAdMecIndex.jsp');
	}
}
/*---------------------------------------------清结算业务------------------------------------------------------*/
if(hasPermission(PERMISSSIONCONST.QJS0001)
	||hasPermission(PERMISSSIONCONST.QJS0002)
	||hasPermission(PERMISSSIONCONST.QJS0003)
	||hasPermission(PERMISSSIONCONST.QJS0004)){
	
	renderMenuLevel1('清结算业务','menuQjs');
	
	if(hasPermission(PERMISSSIONCONST.QJS0001)){
		renderMenuLeafLevel2('menuQjs','110101','导入报表数据','/qjs/qjsUpLoad.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.QJS0002)){
		renderMenuLeafLevel2('menuQjs','110201','清结算对账情况一览表','/qjs/qjsQjsReport.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.QJS0003)){
		renderMenuLeafLevel2('menuQjs','110301','平台与对账文件核对表','/qjs/qjsPadReport.jsp');
	}
	if(hasPermission(PERMISSSIONCONST.QJS0004)){
		renderMenuLeafLevel2('menuQjs','110401','财务入账报表科目维护','/qjs/qjsReportMaintain.jsp');
	}
}
/*---------------------------------------------备付金银行账户管理------------------------------------------------------*/
if(hasPermission(PERMISSSIONCONST.stockFund0001)){	
	renderMenuLevel1('备付金系统管理','menuStockFund');
	if(hasPermission(PERMISSSIONCONST.stockFund0001)){
		renderMenuLeafLevel2('menuStockFund','stockFund0001','备付金银行账户管理','/stockFund/bankAccountManager.jsp');
	}
}
/*初始化菜单权限end*/
</script>

﻿﻿﻿﻿﻿﻿var PERMISSSIONCONST = (function() {
	return {
		//用户体系
		USR000:"bap:usr",
		//内部用户管理
		USR001:"bap:usr:inneruser_add",//内部用户添加
		USR002:"bap:usr:inneruser_update",//内部用户修改
		USR003:"bap:usr:inneruser_view",//内部用户查询
		USR006:"bap:usr:inneruser_moreInfo",//内部用户详情
		USR007:"bap:usr:inneruser_exExcel",//内部用户导出excel
		//商户信息管理
		USR004:"bap:usr:mecIf_view",//商户信息管理的查询
		USR008:"bap:usr:mecIf_moreInfo",//商户信息管理的详情
		USR009:"bap:usr:mecExcel_exExcel",//商户信息管理的导出
		//用户身份认证前置检查条件的管理
		USR013:"bap:usr:checkCondition_view",//用户身份认证前置检查条件的查询
		//商户终端信息查询
		USR020:"bap:usr:mecIf_tif_view",
		//商户费率变更管理
		USR010:"bap:usr:mecRate_view",//商户费率变更查询
		USR011:"bap:usr:mecRate_moreInfo",//商户费率变更详情
		USR012:"bap:usr:mecAttr_Info",//商户内部归属
		//商户注销
		USR014:"bap:usr:mecNotLogoff_view",//商户注销查询
		USR015:"bap:usr:mecNotLogoff_mecLogoff",//商户注销
		//商户关联归属修改
		USR016:"bap:usr:mecAttr_view",//商户关联归属查询
		USR017:"bap:usr:mecAttr_updateBofore",//商户关联归属查修改之前  
		USR018:"bap:usr:mecAttr_update",//商户关联归属修改  
		USR022:"bap:usr:mecAttr_updateBatchBofore",//商户关联归属修改之前  
		USR023:"bap:usr:mecAttr_updateBatch",//商户关联归属修改  

		USR025:"bap:usr:mecAttr_update_mccBofore",//商户关联归属修改mcc之前
		USR026:"bap:usr:mecAttr_update_mcc",//商户关联归属修改mcc 
		//商户开关
		USR019:"bap:usr:mecFunSw_view",//商户开关查询 
		USR021:"bap:usr:mecFunSw_moreInfo",//商户开关详情

		USR024:"bap:usr:mecPartner_view",//合作伙伴查询其拓展商户

		USR027:"bap:usr:mecIf_view_batchMnos",//商户信息批量查询

		USR028:"bap:usr:mecExcel_batchMnos_exExcel",//商户信息批量查询结果导出

		USR029:'bap:usr:mecInfo_update_mana',//商户信息变更维护查询
		USR030:'bap:usr:mecInfo_update_mana_btn_download',//商户信息变更维护下载模板
		USR031:'bap:usr:mecInfo_update_mana_btn_importFile',//商户信息变更维护导入文件
		
		USR40:'bap:usr:ss2_manage:query',//手刷经营地址查询
		USR41:'bap:usr:ss2_manage:exExcel',//手刷经营地址查询导出

		USR045:"bap:usr:mecNoPtsSignIf_view",//商户信息管理的查询
		USR046:"bap:usr:mecCamsUsers",//钱包用户信息查询
		USR047:"bap:usr:mecRegisterUnion",//银联注册



		//账务系统
		AMS000:'bap:ams',
		AMS101:"ams:acc:query", 		  //冻结解冻明细查询-查询
		AMS102:"ams:blk:query", 		  //冻结解冻明细查询-查询
		AMS103:"ams:acc:FinancialQuery",  //账户收支明细查询-查询
		AMS104:"ams:acc:FinancialExport", //账户收支明细查询-导出
		AMS105:"ams:stsModify:query",     //账户状态变更历史-查询
		AMS630:"ams:manualAdjust",        //手工调账
		AMS631:"ams:manualAdjust:commit", //手工调账-提交
		AMS641:"ams:adjustCheck:query",   //调账复核--查询
		AMS642:"ams:adjustCheck:detail",   //调账复核--明细
		AMS651:"ams:adjustType:Query", //调账类型管理-查询
		AMS652:"ams:adjustType:Create",   //调账类型管理-新增
		AMS653:"ams:adjustType:Update",   //调账类型管理-修改
		AMS654:"ams:adjustType:Delete",   //调账类型管理-删除
		AMS660:"ams:batchAdjust",   //批量调账
		AMS661:"ams:batchAdjust:commit",   //批量调账-提交
		AMS662:"ams:batchAdjust:moduleUp",   //批量调账-模板下载
		AMS663:"ams:batchAdjust:batchImport",   //批量调账-导入
		AMS671:"ams:adjust:query",   //调账查询-查询
		AMS672:"ams:adjust:exportExcel",   //调账统计-导出
		AMS681:"ams:stat:query",   //调账统计-查询
		
		AMS6700:"bap:ams:setManual",   //手工即时结算
		AMS6710:"bap:ams:setManual:selfInTime",   //自主即时结算
		AMS6711:"bap:ams:setManual:selfInTime_query",   //自主即时结算(查询)
		AMS6712:"bap:ams:setManual:selfInTime_add",   //自主即时结算(添加)
		AMS6713:"bap:ams:setManual:selfInTime_delete",   //自主即时结算(删除)
		AMS6714:"bap:ams:setManual:selfInTime_detail",   //自主即时结算(详情)
		AMS6715:"bap:ams:setManual:selfInTime_check",   //自主即时结算(审批)
		AMS6716:"bap:ams:setManual:selfInTime_export",   //自主即时结算(导出)
		
		AMS6720:"bap:ams:setManual:autoInTime",   //自动即时结算
		AMS6721:"bap:ams:setManual:autoInTime_query",   //自动即时结算(查询)
		AMS6722:"bap:ams:setManual:autoInTime_import",   //自动即时结算(导入)
		AMS6723:"bap:ams:setManual:autoInTime_download",   //自动即时结算(下载)
		AMS6724:"bap:ams:setManual:autoInTime_delete",   //自动即时结算(删除)
		AMS6725:"bap:ams:setManual:autoInTime_detail",   //自动即时结算(详情)
		AMS6726:"bap:ams:setManual:autoInTime_export",   //自动即时结算(导出)
			
		AMS6800:"bap:ams:deduct",   //扣款业务
		AMS6810:"bap:ams:deduct_tranType_manager",   //子交易类型维护
		AMS6811:"bap:ams:deduct_tranType_manager_query",  //查询
		AMS6812:"bap:ams:deduct_tranType_manager_add",   //新增
		AMS6813:"bap:ams:deduct_tranType_manager_upt",   //修改
		AMS6820:"bap:ams:deduct_manager",   //扣款业务处理
		AMS6821:"bap:ams:deduct_manager_query",   //查询
		AMS6822:"bap:ams:deduct_manager_downloadTemplate",   //模板下载
		AMS6823:"bap:ams:deduct_manager_deduct",   //扣款
		AMS6824:"bap:ams:deduct_manager_export",   //导出
		
		AMS6900:"bap:ams:moneyCollect",   //入账业务
		AMS6910:"bap:ams:moneyCollect_tranTypeManager",   //子交易类型维护
		AMS6911:"bap:ams:moneyCollect_tranTypeManager_addTranSubType",  //新增
		AMS6912:"bap:ams:moneyCollect_tranTypeManager_updateTranSubType",   //修改
		AMS6913:"bap:ams:moneyCollect_tranTypeManager_addOperation",   //新增活动编码
		AMS6914:"bap:ams:moneyCollect_tranTypeManager_exportTranTypen",   //EXCEL导出
		AMS6920:"bap:ams:moneyCollect_collectManager",   //入账业务处理--导入
		AMS6921:"bap:ams:moneyCollect_collectManager_importOrder",   //入账
		AMS6922:"bap:ams:moneyCollect_collectManager_exportOrderInfo",   //EXCEL导出
		AMS6923:"bap:ams:moneyCollect_collectManager_downloadMCTemplate",   //模板下载
		AMS6930:"bap:ams:moneyCollect_processManager",   //执行业务处理
		AMS6931:"bap:ams:moneyCollect_processManager_execute",   //执行
		AMS6932:"bap:ams:moneyCollect_processManager_tOne",   //即时T+1
		AMS6933:"bap:ams:moneyCollect_processManager_cancel",   //撤销
		AMS6934:"bap:ams:moneyCollect_processManager_exportBatchInfo",   //EXCEL导出

		//交易路由
		TRS000:'bap:trs',
		TRS104:"bap:trs:gnr_query",
		TRS105:"bap:trs:gnr_add",
		TRS106:"bap:trs:gnr_update",
		TRS107:"bap:trs:gnr_detail",
		TRS108:"bap:trs:gnr_stop",
		TRS109:"bap:trs:gnr_destory",
		TRS110:"bap:trs:gnr_recheck",
		TRS111:"bap:trs:QuestionLog_download",
		//上游清算机构管理
		TRS121:"bap:trs:coif_add",
		TRS122:"bap:trs:coif_update",
		TRS123:"bap:trs:coif_detail",
		TRS124:"bap:trs:coif_query",
		//上游清算机构规则管理
		TRS126:"bap:trs:coifRul_add",
		TRS127:"bap:trs:coifRul_update",
		TRS128:"bap:trs:coifRul_detail",
		TRS129:"bap:trs:coifRul_query",
		//机构黑名单管理
		TRS131:"bap:trs:ideCoBlk_add",
		TRS132:"bap:trs:ideCoBlk_remove",
		TRS133:"bap:trs:ideCoBlk_addList",
		TRS134:"bap:trs:ideCoBlk_query",

		//商户身份管理
		TRS135:"bap:trs:ideif",
		TRS136:"bap:trs:ideif_add",
		TRS137:"bap:trs:ideif_query",
		TRS138:"bap:trs:ideif_batchAdd",
		TRS139:"bap:trs:ideif_exportIdeif",
		TRS140:"bap:trs:ideif_openIdeif",
		TRS141:"bap:trs:ideif_freezeIdeif",
		TRS142:"bap:trs:ideif_stopIdeif",
		TRS143:"bap:trs:ideif_detail",
		TRS144:"bap:trs:ideif_change",
		TRS145:"bap:trs:ideif_reset",

		//商户路由前身份浏览
		TRS151:"bap:routebeforebrowse",
		TRS152:"bap:routebeforebrowse:select",
		//商户路由前身份管理
		TRS153:"bap:routebefore",
		TRS154:"bap:routebefore:insert",
		TRS155:"bap:routebefore:assign",
		TRS156:"bap:routebefore:stop",
		TRS157:"bap:routebefore:export",
		TRS158:"bap:routebefore:select",
		//外部资源管理
		TRS159:"bap:trs:btn_orscIf",
		TRS160:"bap:trs:btn_orscIf_add",
		TRS161:"bap:trs:btn_orscIf_open",
		TRS162:"bap:trs:btn_orscIf_frze",
		TRS163:"bap:trs:btn_orscIf_stop",
		TRS164:"bap:trs:btn_orscIf_query",
		//商户-身份关联管理
		TRS165:"bap:trs:mecideif",
		TRS166:"bap:trs:mecideif_query",
		TRS167:"bap:trs:mecideif_manage",
		TRS168:"bap:trs:mecideif_relationExport",
		//外部资源获取
		TRS169:"bap:trs:btn_orsc_task",
		TRS170:"bap:trs:btn_orsc_task_refresh",
		TRS171:"bap:trs:btn_orsc_task_exportOrscTask",
		TRS172:"bap:trs:btn_orsc_task_download",
		TRS173:"bap:trs:btn_orsc_task_query",

		//身份外部资源管理
		TRS174:"bap:trs:btn_orsc_ide",
		TRS175:"bap:trs:btn_orsc_ide_refresh",
		TRS176:"bap:trs:btn_orsc_ide_exportOrscTask",
		TRS177:"bap:trs:btn_orsc_ide_query",

		//比例路由规则
		TRS180:"bap:trs:prRule",
		TRS181:"bap:trs:prRule_select",
		TRS182:"bap:trs:prRule_add",
		TRS183:"bap:trs:prRule_update",
		TRS184:"bap:trs:prRule_detail",
		TRS185:"bap:trs:prRule_start",
		TRS186:"bap:trs:prRule_stop",
		TRS187:"bap:trs:prRule_delete",
		//特殊路由规则
		TRS190:"bap:trs:spRule",
		TRS191:"bap:trs:spRule_select",
		TRS192:"bap:trs:spRule_add",
		TRS193:"bap:trs:spRule_update",
		TRS194:"bap:trs:spRule_detail",
		TRS195:"bap:trs:spRule_stop",
		TRS196:"bap:trs:spRule_delete",
		TRS197:"bap:trs:spRule_active",
		TRS198:"bap:trs:QuestionLog_download",


		//结算系统
		SES000:"bap:ses",
		//结算记录查询
		SES001:"bap:ses:setord",
		SES100:"bap:ses:setord_query",
		SES101:"bap:ses:setord_expo",
		SES102:"bap:ses:setord_detail",
		SES103:"bap:ses:setord_ccapy",
		SES104:"bap:ses:setord_dlpay",
		SES105:"bap:ses:setord_ccdlpay",
		SES106:"bap:ses:setord_getmoney",
		SES107:"bap:ses:setord_batchDelayedPay",
		SES108:"bap:ses:setord_batchCancelDelayedPay",
		SES109:"bap:ses:setord_batchCancelSetOrd",
		SES110:"bap:ses:setord_batchWithhold",
		SES111:"bap:ses:setord_batchPartCancel",
		
		SES26000:"bap:ses:pay",

		//付款申请
		SES003:"bap:ses:payapy",
		SES300:"bap:ses:pay_apy",
		SES301:"bap:ses:cancel_apy",
		SES302:"bap:ses:batpay_apy",
		SES303:"bap:ses:batcancel_apy",
		SES304:"bap:ses:payapy_query",
		SES305:"bap:ses:payapy_exp",
		SES306:"bap:ses:payapy_detail",
		//付款审批
		SES004:"bap:ses:payck",
		SES400:"bap:ses:payck_query",
		SES401:"bap:ses:payck_pass",
		SES402:"bap:ses:payck_notpass",
		SES403:"bap:ses:paybtck_pass",
		SES404:"bap:ses:paybtck_notpass",
		SES405:"bap:ses:payck_detail",
		//付款单查询
		SES005:"bap:ses:payord",
		SES500:"bap:ses:payord_query",
		SES501:"bap:ses:payord_reset",
		SES502:"bap:ses:payord_opt",
		SES503:"bap:ses:payord_detail",
		SES504:"bap:ses:payord_refund",
		SES505:"bap:ses:payord_updateSts",
		SES506:"bap:ses:payord_updateStsBat",
		//付款操作
		SES006:"bap:ses:payop",
		SES600:"bap:ses:payop_query",
		SES601:"bap:ses:payop_reset",
		SES602:"bap:ses:payop_bnkpay",
		SES603:"bap:ses:payop_olbkpay",
		SES604:"bap:ses:payop_batbnkpay",
		SES605:"bap:ses:payop_batolbkpay",
		SES606:"bap:ses:payop_cbpay",
		SES607:"bap:ses:payop_detail",
		SES608:"bap:ses:payop_chgChnel",
		SES609:"bap:ses:payop_chgChnels",
		SES610:"bap:ses:payop_cupSyncpay",
		SES611:"bap:ses:payop_cupBatSyncpay",
		SES612:"bap:ses:payop_chgChnelsImport",
		//网银付款状态维护
		SES007:"bap:ses:epsm",
		SES700:"bap:ses:epsm_query",
		SES701:"bap:ses:epsm_success",
		SES702:"bap:ses:epsm_exp",
		SES703:"bap:ses:epsm_detail",
		SES704:"bap:ses:epsm_fail",
		SES705:"bap:ses:epsm_opt",
		SES706:"bap:ses:epsm_opbat",

		//付款失败数据处理
		SES008:"bap:ses:pfdd",
		SES800:"bap:ses:pfdd_query",
		SES801:"bap:ses:pfdd_repay",
		SES802:"bap:ses:pfdd_olbkpay",
		SES803:"bap:ses:pfdd_surfald",
		
		//付款拆批管理
		SES900:"bap:ses:payCp",
		SES901:"bap:ses:payCp_query",
		SES902:"bap:ses:payCp_edit",
		
		//批量退票
		SES0010:"bap:ses:rfbt",
		SES1000:"bap:ses:rfbt_query",
		SES1001:"bap:ses:rfbt_download",
		SES1002:"bap:ses:rfbt_import",
		SES1003:"bap:ses:rfbt_export",
		SES1004:"bap:ses:rfbt_refund",
		SES1005:"bap:ses:rfbt_del",
		//用户退票
		SES0011:"bap:ses:rfur",
		SES1100:"bap:ses:rfur_query",
		SES1101:"bap:ses:rfur_reset",
		SES1102:"bap:ses:rfur_income",
		SES1103:"bap:ses:rfur_sxf",
		//结算属性维护
		SES0012:"bap:ses:stpt",
		SES1200:"bap:ses:stpt_query",
		SES1201:"bap:ses:stpt_export",
		SES1202:"bap:ses:stpt_spds",
		SES1203:"bap:ses:stpt_respds",
		//付款属性维护
		SES0013:"bap:ses:ppmt",
		SES1300:"bap:ses:ppmt_query",
		SES1301:"bap:ses:ppmt_export",
		SES1302:"bap:ses:ppmt_ugt",
		SES1303:"bap:ses:ppmt_merg",
		SES1304:"bap:ses:ppmt_week",
		//卡状态类别维护
		SES0014:"bap:ses:bcst",
		SES1400:"bap:ses:bcst_add",
		SES1401:"bap:ses:bcst_del",
		//付款标记管理
		SES0015:"bap:ses:pmkm",
		SES1500:"bap:ses:pmkm_query",
		SES1501:"bap:ses:pmkm_add",
		SES1502:"bap:ses:pmkm_update",
		SES1503:"bap:ses:pmkm_del",
		//银行卡状态维护
		SES0016:"bap:ses:bkst",
		SES1600:"bap:ses:bkst_query",
		SES1601:"bap:ses:bkst_export",
		SES1602:"bap:ses:bkst_upst",
		SES1603:"bap:ses:downBankCordStatusTemplate",
		SES1604:"bap:ses:importBankCordStatusExcel",
		//银行卡信息维护
		SES0017:"bap:ses:bkif",
		SES1700:"bap:ses:bkif_query",
		SES1701:"bap:ses:bkif_export",
		SES1702:"bap:ses:bkif_upif",
		SES1703:"bap:ses:downPayMarkTemplate",
		SES1704:"bap:ses:importUpdateExcel",
		//付款计划时间管理
		SES0018:"bap:ses:payChannelSchedule",
		SES1800:"bap:ses:payChannelSchedule_query",
		SES1801:"bap:ses:payChannelSchedule_insert",
		SES1802:"bap:ses:payChannelSchedule_update",
		SES1803:"bap:ses:payChannelSchedule_start",
		SES1804:"bap:ses:payChannelSchedule_stop",
		SES1805:"bap:ses:payChannelSchedule_delete",
		//付款路由黑名单管理
		SES0019:"bap:ses:payChannelBlackList",
		SES1900:"bap:ses:payChannelBlackList_query",
		SES1901:"bap:ses:payChannelBlackList_insert",
		SES1902:"bap:ses:payChannelBlackList_update",
		SES1903:"bap:ses:payChannelBlackList_delete",
		SES1904:"bap:ses:payChannelBlackList_download",
		SES1905:"bap:ses:payChannelBlackList_import",
		SES1906:"bap:ses:payChannelBlackList_deleteBat",

		//付款通道管理
		SES0020:"bap:ses:payChannelManage",
		SES2000:"bap:ses:payChannelManage_query",
		SES2001:"bap:ses:payChannelManage_insert",
		SES2002:"bap:ses:payChannelManage_update",
		SES2003:"bap:ses:payChannelManage_start",
		SES2004:"bap:ses:payChannelManage_stop",
		SES2005:"bap:ses:payChannelManage_delete",
		SES2006:"bap:ses:payChannelManage_approve",// 审核
		//保底路由管理
		SES0021:"bap:ses:payChannelBreakRoute",
		SES2100:"bap:ses:payChannelBreakRoute_update",

		//商户付款记录查询
		SES3000:"bap:ses:mecOrderManage",
		SES3001:"bap:ses:mecOrderManage_query",
		//商户付款记录查询
		SES3100:"bap:ses:mecOrderSetFee",
		SES3101:"bap:ses:mecOrderSetFee_setFee",

		//冲正透支管理
		SES3200:"bap:ses:acOdManage",
		SES3201:"bap:ses:acOdManage_query",

		//建行一点接入活期账户明细文件下载
		SES2200:"bap:ses:CCBPayDetailFile",
		//建行账户明细文件下载信息查询
		SES2210:"bap:ses:CCBDownFileMsg",
		//银联限额
		SES2300:"bap:ses:CupQuato",
		//深圳中信银联跨行代付对账文件下载
		SES2201:"bap:ses:SZECITICPayDetailFile",
		//平安银行代付对账文件下载
		SES2208:"bap:ses:PingAnPayDetailFile",
		//工行明细下载
		SES2202:"bap:ses:ICBCDetailDownLoadPanel",
		//西安民生代付对账文件下载
		SES2203:"bap:ses:XACMBCPayDetailFile",
		
		//银联代付地方银联限额设置
		SES2310:"bap:ses:CupChanProv",
		SES2311:"bap:ses:CupChanProv_query",
		SES2312:"bap:ses:CupChanProv_add",
		SES2313:"bap:ses:CupChanProv_update",
		SES2314:"bap:ses:CupChanProv_delete",
		
		//厦门民生实时代付账户余额查询
		SES2204:"bap:ses:XMCMBCQuBalance",
		SES22041:"bap:ses:XMCMBCQuBalance:look",
		SES22042:"bap:ses:XMCMBCQuBalance:query",
		
		//付款通道账户余额查询
		SES2205:"bap:ses:payChanQuBalance",
		SES22051:"bap:ses:payChanQuBalance:queryBl",
		
		//结算基础数据
		SES2400:"bap:ses:SBD",
		//银行行别信息管理
		SES2401:"bap:ses:SBD:bnkInfo",
		SES2402:"bap:ses:SBD:bnkInfo_query",
		SES2403:"bap:ses:SBD:bnkInfo_add",
		SES2404:"bap:ses:SBD:bnkInfo_update",
		SES2405:"bap:ses:SBD:bnkInfo_delete",
		SES2406:"bap:ses:SBD:bnkInfo_export",
		//联行行号信息管理
		SES2410:"bap:ses:SBD:bnkLinkInfo",
		SES2411:"bap:ses:SBD:bnkLinkInfo_query",
		SES2412:"bap:ses:SBD:bnkLinkInfo_add",
		SES2413:"bap:ses:SBD:bnkLinkInfo_update",
		SES2414:"bap:ses:SBD:bnkLinkInfo_delete",
		SES2415:"bap:ses:SBD:bnkLinkInfo_export",
		
		//结算报表
		SES2500:"bap:ses:report",
		//合作银行信息维护
		SES2510:"bap:ses:report:coopBankInfoMaintain",
		//合作银行信息维护---查询
		SES2511:"bap:ses:report:coopBankInfoMaintain_query",
		//合作银行信息维护---新增
		SES2512:"bap:ses:report:coopBankInfoMaintain_add",
		//合作银行信息维护---删除
		SES2513:"bap:ses:report:coopBankInfoMaintain_delete",
		//合作银行信息维护---导出
		SES2514:"bap:ses:report:coopBankInfoMaintain_export",
		//合作银行信息维护---修改
		SES2515:"bap:ses:report:coopBankInfoMaintain_update",
		
		//银行流水核对
		SES2520:"bap:ses:report:bankFlowCheck",
		//银行流水核对---查询
		SES2521:"bap:ses:report:bankFlowCheck_query",
		//银行流水核对---清空流水
		SES2522:"bap:ses:report:bankFlowCheck_clear",
		//银行流水核对---下载模板
		SES2523:"bap:ses:report:bankFlowCheck_download",
		//银行流水核对---流水批量导入
		SES2524:"bap:ses:report:bankFlowCheck_import",
		//银行流水核对---流水汇总
		SES2525:"bap:ses:report:bankFlowCheck_stmtSum",
		//银行流水核对---自动汇总
		SES2526:"bap:ses:report:bankFlowCheck_autoSum",
		//银行流水核对---核对
		SES2527:"bap:ses:report:bankFlowCheck_stmtCheck",
		//银行流水核对---银行流水异常导出
		SES2528:"bap:ses:report:bankFlowCheck_stmtExport",
		//银行流水核对---付款单异常导出
		SES2529:"bap:ses:report:bankFlowCheck_payOrdExport",
		
		//银行流水汇总
		SES2530:"bap:ses:report:bankFlowSum",
		//银行流水汇总--查询
		SES2531:"bap:ses:report:bankFlowSum_query",
		//银行流水汇总--导出
		SES2532:"bap:ses:report:bankFlowSum_export",
		//银行流水汇总--查看详情
		SES2533:"bap:ses:report:bankFlowSum_detail",
		//银行流水汇总--修改
		SES2534:"bap:ses:report:bankFlowSum_modify",
		//银行流水汇总--修改记录查询
		SES2535:"bap:ses:report:bankFlowSum_modifydetail",
		
		
		//资金报表
		SES2540:"bap:ses:report:capitalReport",
		//资金报表--查询
		SES2541:"bap:ses:report:capitalReport_query",
		//资金报表--导出
		SES2542:"bap:ses:report:capitalReport_export",
		
		//现金报表
		SES2550:"bap:ses:report:cashReport",
		//现金报表--查询
		SES2551:"bap:ses:report:cashReport_query",
		//现金报表--导出
		SES2552:"bap:ses:report:cashReport_export",
		
		
		SES2600:"bap:ses:ckm",//出款模式管理
		SES2601:"bap:ses:ckm:busTyp",//结算业务类型付款模式管理
		SES2602:"bap:ses:ckm:busTyp:update",//结算业务类型付款模式管理--修改风控
		
		SES2603:"bap:ses:ckm:autoPayOrder",//自动付款指令管理
		SES2604:"bap:ses:ckm:autoPayOrder:operateRCS",//自动付款指令管理--开启或者关闭
		SES2605:"bap:ses:ckm:autoPayOrder:operateJS",//结算业务类型付款模式管理--修改结算
		SES2606:"bap:ses:ckm:autoPayOrder:operateQS",//结算业务类型付款模式管理--修改清算
		
		SES2607:"bap:ses:ckm:orderPayBatchQuery",//指令付款批次信息查询
		
		
		SES0027:"bap:ses:payprocess",//付款进度
		SES2700:"bap:ses:payprocess_query",//付款进度查询
		
		
		SES2800:"bap:ses:zjdb",//资金调拨
		SES2810:"bap:ses:zjdbconfig",//资金调拨参数管理
		SES2811:"bap:ses:zjdbconfig_add",//新增
		SES2812:"bap:ses:zjdbconfig_update",//修改
		SES2813:"bap:ses:zjdbconfig_delete",//删除
		SES2814:"bap:ses:zjdbconfig_query",//查询/详情
		SES2820:"bap:ses:zjdb:insMsg",//资金调拨指令管理
		SES2825:"bap:ses:zjdb:insMsgYLBank",//资金调拨指令管理--银联资金到账
		SES2821:"bap:ses:zjdb:insMsg_sure",	//银联资金到账-确认按钮
		SES2822:"bap:ses:zjdb:insMsg_cancel",	//银联资金到账-取消确认
		
		SES2826:"bap:ses:zjdb:insMsgTNPay",//T+N付款申请完成
		SES2823:"bap:ses:zjdb:insMsg_sure2",	//T+N付款申请完成-确认按钮
		SES2824:"bap:ses:zjdb:insMsg_cancel2",	//T+N付款申请完成-取消确认
		
		SES2808:"bap:ses:zjdb:zjdbPlanMsgPanel",//资金调拨计划管理
		SES2881:"bap:ses:zjdb:zjdbPlanMsgPanel_aud1",//资金调拨计划管理一次审核
		SES2882:"bap:ses:zjdb:zjdbPlanMsgPanel_aud2",//资金调拨计划管理二次审核
		SES2883:"bap:ses:zjdb:zjdbPlanMsgPanel_audPass",//资金调拨计划管理审核通过
		SES2884:"bap:ses:zjdb:zjdbPlanMsgPanel_stopPlan",//资金调拨计划管理终止计划
		
		SES2840:"bap:ses:zjdb:stmtQuery",//资金调拨流水
		SES2841:"bap:ses:zjdb:stmtQuery_query",//资金调拨流水-查询按钮
		
		//大额拆单通道启用/关闭
		SES2560:"bap:ses:payChan:Split",
		SES2562:"bap:ses:payChan:Split_add",//新增
		SES2563:"bap:ses:payChan:Split_update",//修改
		SES2564:"bap:ses:payChan:Split_open",//启用
		SES2565:"bap:ses:payChan:Split_close",//关闭
		
		SES2900:"bap:ses:dzmx",//对账明细
		SES2901:"bap:ses:dzmx_cgbDetail",//广发对账明细
		SES2902:"bap:ses:dzmx_njCmbcDetail",//南京民生文件下载
		
		//付款失败预警
		SES2581:"bap:ses:payFail",
		SES2582:"bap:ses:payFail:SMRecipient",//短信接收人管理
		SES2583:"bap:ses:payFail:SMRecipient_add",//新增
		SES2584:"bap:ses:payFail:SMRecipient_upd",//修改
		SES2585:"bap:ses:payFail:SMRecipient_del",//删除
		SES2586:"bap:ses:payFail:SMRule",//推送短信规则管理
		SES2587:"bap:ses:payFail:SMRule_upd",//修改
		
		//付款失败数据自动补付
		SES4100:"bap:ses:zdbf",
		SES4110:"bap:ses:zdbf:bankMsgManage",//银行返回信息维护
		SES4111:"bap:ses:zdbf:bankMsgManage_add",//新增
		SES4112:"bap:ses:zdbf:msgManage_del",//删除
		SES4113:"bap:ses:zdbf:bankMsgManage_download",//下载模板
		SES4114:"bap:ses:zdbf:bankMsgManage_upload",//批量导入
		SES4115:"bap:ses:zdbf:bankMsgManage_select",//查询
		SES4120:"bap:ses:zdbf:payTypeManage",//付款类型维护
		SES4121:"bap:ses:zdbf:payTypeManage_open",//开启
		SES4122:"bap:ses:zdbf:payTypeManage_close",//关闭
		
		//钱包银行卡信息维护
		SES200400:"bap:ses:walletBankMt",
		SES200401:"bap:ses:walletBankMt_query",//查询
		SES200402:"bap:ses:walletBankMt_update",//修改
		SES200403:"bap:ses:walletBankMt_export",//导出

		//钱包-付款通道黑名单管理
		SES200500:"bap:ses:walletBlacklist",
		SES200501:"bap:ses:walletBlacklist_insert",//新增
		SES200502:"bap:ses:walletBlacklist_delete",//删除
		SES200503:"bap:ses:walletBlacklist_update",//修改
		SES200504:"bap:ses:walletBlacklist_query",//查询
		SES200505:"bap:ses:walletBlacklist_export",//导出
		SES200506:"bap:ses:walletBlacklist_import",//导入
		
		//会计系统
		AIS000:'bap:ais',
		AIS900:'bap:ais:sbj_query',
		AIS901:'bap:ais:sbj_add',
		AIS902:'bap:ais:sbj_edit',
		AIS903:'bap:ais:sbj_del',
		AIS904:'bap:ais:sbjhibl_query',
		AIS905:'bap:ais:sbjhibl_export',
		AIS906:'bap:ais:sbjbldetail_query',
		AIS907:'bap:ais:sbjbldetail_export',
		AIS908:'bap:ais:acterror_query',
		AIS909:'bap:ais:acterror_export',
		AIS910:'bap:ais:acterror_fillaccounts',
		AIS911:'bap:ais:acterror_bluntaccounts',
		AIS912:'bap:ais:acterror_adjustaccounts',
		AIS913:'bap:ais:runupact_query',
		AIS914:'bap:ais:gldtl_query',
		AIS915:'bap:ais:upact_query',
		AIS916:'bap:ais:upact_handler',
		AIS917:'bap:ais:sbj_export',
		AIS918:'bap:ais:acterror_cancel',



		//业务管理平台
		MSP000:'bap:msp',
		MSP001:"msp:cco:query",
		MSP002:"msp:bill:addBills",
		MSP003:"msp:bill:actBills",
		MSP004:"msp:bill:query",
		MSP005:"msp:bill:detail",
		MSP006:"msp:bill:update",
		MSP007:"msp:bill:reAddBill",
		MSP008:"msp:bill:billsCfm",
		MSP009:"msp:bill:crtBill",
		MSP010:"msp:bill:query",
		MSP011:"msp:bill:celCrtBill",
		MSP012:"msp:bill:refundCel",
		MSP013:"msp:bill:billsCel",
		MSP014:"msp:bill:exportExcelFile",
		MSP015:"msp:bill:getBamtCount",
		MSP016:"msp:receipt:downTemplate",
		MSP017:"msp:receipt:importExcel",
		MSP018:"msp:receipt:exportChecked",
		MSP019:"msp:receipt:exportExcelFile",
		MSP020:"msp:receipt:queryFeeTyps",
		MSP021:"msp:receipt:delete",
		MSP022:"msp:receipt:query",
		MSP023:'msp:mtcfee:query',
		MSP024:'msp:mtcfee:querybyords',
		MSP025:'msp:mtcfee:updatestate',
		MSP026:'msp:mtcfee:exportexcelfile',
		MSP027:'msp:fbfee:query',
		MSP028:'msp:bill:markPaymented',
		MSP029:'msp:mtcfee:batchSw',
		MSP030:'msp:mtcfee:batchSwQuery',
		MSP031:'msp:mtcfee:batchSwOpen',
		MSP032:'msp:mtcfee:batchSwClose',
		MSP033:'msp:mtcfee:batchSwDayOpen',
		MSP034:'msp:mtcfee:DayOpenTemplate',
		MSP035:'msp:mtcMec:query',
		
		//业务平台--商户费率管理
		MSP442:'msp:clrRate:query',
		MSP443:'msp:clrRate:add',
		MSP444:'msp:clrRate:update',
		MSP445:'msp:clrRate:delete',
		//业务平台--商户预存手续费
		MSP451:'msp:clrAcc:query',
		MSP452:'msp:clrAcc:psf',
		MSP453:'msp:clrAcc:bpsf',
		MSP454:'msp:clrAcc:export',
		MSP455:'msp:clrAcc:dtl',
		MSP456:'msp:clrAcc:dtlExport',
		MSP457:'msp:clrAcc:downTemplate',
		//业务平台--手续费收取
		MSP461:'msp:clrFee:query',
		MSP462:'msp:clrFee:export',
		MSP463:'msp:clrFee:kk',
		//业务平台--1+N佣金管理
		MSP470:'msp:commission',
		MSP471:'msp:commission:query',
		MSP472:'msp:commission:export',
		MSP473:'msp:commission:adjustAms',
		MSP474:'msp:commission:lineDeal',
		
		//手工业务系统
		MBS000:'bap:mbs',
		//手工业务差错处理
		MBS003:'bap:mbs:err',  //手工业务差错处理查询
		MBS310:'mbs:err:query',  //手工业务差错处理查询
		MBS311:'mbs:err:batHandle',  //手工业务差错处理查询
		MBS312:'mbs:err:singleHandle',  //手工业务差错处理查询
		MBS312:'mbs:err:export',  //手工业务差错处理导出
		//手工业务差错处理历史查询
		MBS302:'bap:mbs:errHis',//手工业务差错处理历史查询
		MBS320:'mbs:errHis:query',//手工业务差错处理历史查询
		MBS321:'mbs:errHis:export',//手工业务差错处理历史导出
		
		//商户手工业务申请
		MBS001:'bap:mbs:appOrg',
		MBS500:'mbs:appOrg:query',
		MBS501:'mbs:appOrg:appOpt',
		//商户手工业务查询
		MBS002:'bap:mbs:app',
		MBS502:'mbs:app:mbsQuery',
		MBS520:'mbs:app:mbsQueryExport',
		MBS503:'mbs:app:mbsOpt',
		//商户手工业务处理
		MBS004:'bap:mbs:pro',
		MBS504:'mbs:pro:mbsQuery',
		MBS505:'mbs:pro:mbsOpt',
		MBS506:'mbs:pro:exExcel',
		//银行手工业务处理
		MBS007:'bap:mbs:bankPro',
		MBS507:'mbs:bankPro:mbsBankQuery',
		MBS508:'mbs:bankPro:mbsBankOpt',
		MBS509:'mbs:bankPro:exExcel',
		//拒付关联原交易
		MBS400:'bap:mbs:rfAssOrg',
		MBS401:'mbs:rfAssOrg:query',//拒付关联原交易-筛选
		MBS402:'mbs:rfAssOrg:import',//拒付关联交易-导入
		MBS403:'mbs:rfAssOrg:export',//拒付关联交易-导出Excel
		MBS404:'mbs:rfAssOrg:tagRf',//拒付关联交易-标记为拒付
		MBS405:'mbs:rfAssOrg:assOrgTran',//拒付关联交易-关联原交易
		MBS406:'mbs:rfAssOrg:add',//拒付关联交易-新增
		MBS407:'mbs:rfAssOrg:modify',//拒付关联交易-修改
		MBS408:'mbs:rfAssOrg:delete',//拒付关联交易-删除
		MBS409:'mbs:rfAssOrg:downModle',//拒付关联交易-下载模板
		MBS415:'mbs:rfAssOrg:details',//拒付关联交易-查看详情

		//拒付处理
		MBS418:'bap:mbs:rfInfo',
		MBS410:'mbs:rfInfo:query',//拒付处理-查询
		MBS411:'mbs:rfInfo:export',//拒付处理-导出Excel
		MBS412:'mbs:rfInfo:rfPro',//拒付处理-拒付处理
		MBS413:'mbs:rfInfo:revoke',//拒付处理-撤销
		MBS414:'mbs:rfInfo:details',//拒付处理-查看详情
		
        //拒付处理明细
		MBS423:'bap:mbs:zsPro',
		MBS424:'bap:mbs:zsProDetail',
		MBS420:'mbs:rfInfoDetails:query',//拒付处理-查询
		MBS421:'mbs:rfInfoDetails:export',//拒付处理-导出Excel
		MBS422:'mbs:rfInfoDetails:details',//拒付处理-查看详情


		//交易系统
		PTS000:'bap:pts',
		PTS901:'bap:pts:bincardquery',
		PTS902:'bap:pts:psmtckctquery',
		PTS903:'bap:pts:trandataquery',//交易信息浏览查询
		PTS904:'bap:pts:trandataview',//交易信息浏览查询-查看
		PTS905:'bap:pts:trandatadetail',//交易信息浏览查询-明细
		PTS923:'bap:pts:trandataexport',//交易信息浏览查询-导出
		PTS922:'bap:pts:mecDiNmQuery',//交易信息浏览查询-电子签购单查询权限
		PTS906:'bap:pts:bincardupdate',//卡bin表更新
		PTS907:'bap:pts:bincarddelete',//卡bin表删除
		PTS921:'bap:pts:bincardselect',//卡bin表查询
		PTS924:'bap:pts:bincardadd',//卡bin表增加权限
		PTS908:'bap:pts:psmtckctview',//对账批次查询-查看
		PTS909:'bap:pts:psmtckctexport',//对账批次查询-导出
		PTS910:'bap:pts:psmtckctaccounting',//对账批次查询 - 记账
		PTS911:'bap:pts:psmtckerquery',//对账差错处理
		PTS912:'bap:pts:psmtckerexport',//对账差错处理 - 导出
		PTS913:'bap:pts:psmtckerdelete',//对账差错处理 - 删除
		PTS914:'bap:pts:psmtckerqk',//对账差错处理 - 请款申请
		PTS915:'bap:pts:psmtckertk',//对账差错处理 - 退款申请
		PTS916:'bap:pts:psmtckerjs',//对账差错处理 - 结算
		PTS917:'bap:pts:psmtckerkk',//对账差错处理 - 扣款
		PTS918:'bap:pts:psmtckerhx',//对账差错处理 - 核销
		PTS919:'bap:pts:psmtckercx',//对账差错处理 - 撤销
		PTS920:'bap:pts:secondarycfmflg',//交易二次确认查询
		PTS921:'bap:pts:psmtckerbatProcess',//对账差错处理 - 批量处理
		PTS929:'bap:pts:hfredimnolist',//mpos跳码白名单
		PTS9500:'bap:pts:cooperquery',//分润交易信息浏览查询
		PTS9501:'bap:pts:cooperview',//分润交易信息浏览查询-查看
		PTS9502:'bap:pts:cooperdetail',//分润交易信息浏览查询-明细
		PTS9503:'bap:pts:cooperexport',//分润交易信息浏览查询-导出





		//系统设置
		T702:"bap:gantroletouser:query",
		T703:"bap:gantroletouser:submit",
		T705:"bap:gantmenutorole:query",
		T706:"bap:gantmenutorole:submit",
		T708:"bap:rolemanager:query",
		T709:"bap:rolemanager:add",
		T710:"bap:rolemanager:update",
		T711:"bap:rolemanager:delete",

		//日志平台		
		LOG000:"bap:log",
		LOG100:"bap:log:logQuery",
		LOG101:"bap:log:logQuery:query",

		// 资金成本比例管理 add by ganjing 20150826
		STM2300:"bap:stm:fundCostRatioManagement",
		// 查询资金成本比例信息 add by ganjing 20150826
		STM2301:"bap:query:fundCostRatioManagement",
		// 下载资金成本比例信息模板 add by ganjing 20150826
		STM2302:"bap:download:fundCostRatioManagement",
		// 批量导入成本比例信息模板 add by ganjing 20150826
		STM2303:"bap:upload:fundCostRatioManagement",
		
		//T+0业务管理
		TZERO000:"bap:tZero",
		TZER1110:"bap:tZero:sytManage",//随意通管理
		//T0即日付商户查询
		TZERO502:"bap:tZero:JRFMecQuery",
		//S0秒到商户查询
		TZERO503:"bap:tZero:MDMecQuery",
		//财务确认收款
		TZERO100:"bap:tZero:finance",
		TZERO101:"bap:tZero:finance_query",
		TZERO102:"bap:tZero:finance_reset",
		TZERO103:"bap:tZero:finance_confirm",
		//合作商账户管理
		TZERO200:"bap:tZero:account",
		TZERO201:"bap:tZero:account_query",
		TZERO202:"bap:tZero:account_reset",
		TZERO203:"bap:tZero:account_refundPrcpAmt",
		TZERO204:"bap:tZero:account_refundRiskAmt",
		TZERO205:"bap:tZero:account_rechargeRiskAmt",
		//查询T+0合作商
		TZERO300:"bap:tZero:orgTZero",
		TZERO301:"bap:tZero:orgTZero_query",
		TZERO302:"bap:tZero:orgTZero_excel",
		//合作商T+0分润查询
		TZERO400:"bap:tZero:orgProfit",
		TZERO401:"bap:tZero:orgProfit_query",
		//T+0商户查询
		TZERO500:"bap:tZero:mecTZero",
		TZERO501:"bap:tZero:mecTZero_query",
		//商户T+0交易查询
		TZERO600:"bap:tZero:mecTZeroSet",
		TZERO601:"bap:tZero:mecTZeroSet_query",
		TZERO602:"bap:tZero:mecTZeroSet_excel",
		//非工作日属性管理
		TZERO700:"bap:tZero:sysWork",
		TZERO701:"bap:tZero:sysWork_query",
		TZERO702:"bap:tZero:sysWork_update",
		TZERO703:"bap:tZero:sysWork_updateBatch",
		TZERO704:"bap:tZero:sysWork_import",
		TZERO705:"bap:tZero:sysWork_excel",
		//非工作日结算合作商分润查询
		TZERO800:"bap:tZero:sysWorkOrgPro",
		TZERO801:"bap:tZero:sysWorkOrgPro_query",

		//非工作日结算属性管理
		TZERO900:"bap:tZero:sysWorkSet",
		TZERO901:"bap:tZero:sysWorkSet_query",
		TZERO902:"bap:tZero:sysWorkSet_pause",
		TZERO903:"bap:tZero:sysWorkSet_recover",
		TZERO904:"bap:tZero:sysWorkSet_excel",
		TZERO905:"bap:tZero:sysWorkSet_optHis",

		//随意通费率
		TZERO1100:"bap:tZero:orgTZeroRate",
		TZERO1101:"bap:tZero:orgTZeroRate_query",
		TZERO1102:"bap:tZero:orgTZeroRate_downLoad",
		TZERO1103:"bap:tZero:orgTZeroRate_batchOpt_workRate",
		TZERO1104:"bap:tZero:orgTZeroRate_batchOpt_nworkRate",
		TZERO1105:"bap:tZero:orgTZeroRate_editRate",
		TZERO1106:"bap:tZero:orgTZeroRate_queryOptLog",

		//D+1手动导入结果查询
		TZERO950:"bap:tZero:mecPushImport",
		TZERO951:"bap:tZero:mecPushImport_query",
		//POS自动推送规则
		TZERO960:"bap:tZero:posPushRule",
		TZERO961:"bap:tZero:posPushRule_update",
		//SMS自动推送规则
		TZERO970:"bap:tZero:smsPushRule",
		TZERO971:"bap:tZero:smsPushRule_update",
		//商户D+1批量结果查询
		TZERO980:"bap:tZero:mecT0D1Management",
		TZERO981:"bap:tZero:mecT0D1Management_query",
		
		//微信兑奖
		TZER8801:"bap:tZero:weChatReward",
		TZER8802:"bap:tZero:WeChatReward_query",
		TZER8803:"bap:tZero:WeChatReward_import",
		TZER8804:"bap:tZero:WeChatReward_export",
		
		//T+0推送规则管理
		TZERO940:"bap:tZero:mecT0PushRuleManagement",
		TZERO941:"bap:tZero:mecT0PushRuleManagement_query",//手动导入结果查询
		TZERO942:"bap:tZero:mecT0PushRuleManagement_SMSPOSpush",//手动导入POS/短信推送商户
//		TZERO943:"bap:tZero:mecT0PushRuleManagement_SMSpush",//手动导入短信推送商户
		TZERO944:"bap:tZero:mecT0ChannelManagement",//即日付渠道管理

		TZERO945:'bap:tZero:batchOpeD1_query',//批量开通/关闭d+1
		TZERO946:'bap:tZero:batchOpeD1_downLoadTemplate',//批量开通/关闭d+1导入模板
		TZERO947:'bap:tZero:batchOpeD1_importExcel_open',//批量开通/关闭d+1导入模板开通
		TZERO948:'bap:tZero:batchOpeD1_importExcel_close',//批量开通/关闭d+1导入模板关闭
		TZERO949:'bap:tZero:batchOpeD1_exportExcel',//批量开通/关闭d+1 结果导出



		//T+0及D+1结算管理
		TZER1000:"bap:tZero:mecTzero_and_DOne",
		TZER1001:"bap:tZero:mecTzero_and_DOne_download",//下载模板
		TZER1002:"bap:tZero:mecTzero_and_DOne_importFile_open",//批量导入开通
		TZER1003:"bap:tZero:mecTzero_and_DOne_importFile_close",//批量导入关闭


		TZER1004:"bap:tZero:mecTzeroStsOpe_query",//t+0结算限额调整
		TZER1005:"bap:tZero:mecTzeroStsOpe_high",//t+0结算限额调整提高
		TZER1006:"bap:tZero:mecTzeroStsOpe_low",//t+0结算限额调整提高
		
		TZER2000:"bap:tZero:dOneW",//D+1
		TZER2001:"bap:tZero:batchImport:dOneRate:query",//D+1商户结算费率批量调整结果查询
		TZER2002:"bap:tZero:batchImport:dOneRate:exportFailExcel",//D+1商户结算费率批量调整结果导出
		TZER2003:"bap:tZero:acRate:manage",//商户D+1结算费率管理
		TZER2004:"bap:tZero:acRate:manage:detailHIS",//商户D+1结算费率管理-下载模板
		TZER2005:"bap:tZero:acRate:manage:detailHIS",//商户D+1结算费率管理-查看日志
		TZER2006:"bap:tZero:acRate:manage:importExcel",//商户D+1结算费率管理-导入excel
		TZER2007:"bap:tZero:acRate:manage:updateRate",//商户D+1结算费率管理-修正
		
		TZER8330:"bap:tZero:MobileSwipe",//手刷业务
		TZER8300:"bap:tZero:MobileSwipeRate",//手刷结算手续费管理
		TZER8301:"bap:tZero:MobileSwipeRate_update",//手刷结算手续费管理--保存
		
		TZER8400:"bap:tZero:StmPromotional",//结算产品促销活动管理
		
		TZER8100:"bap:tZero:mecDOneSetOrd",//D+1商户结算记录查询
		TZER8101:"bap:tZero:mecDOneSetOrd_query",//D+1商户结算记录查询--查询
		TZER8102:"bap:tZero:mecDOneSetOrd_export",//D+1商户结算记录查询--导出
		

		TZERO8500:"bap:tZero:D1BusStmRulePanel",//D+1业务管理
		TZERO8501:"bap:tZero:D1BusStmRulePanel:save",//D+1业务管理-保存
		
		TZER8600:"bap:tZero:dOneOrgRule",//D+1所属分公司免费额度管理
		TZER8601:"bap:tZero:dOneOrgRule_query",//D+1所属分公司免费额度管理(查询)
		TZER8602:"bap:tZero:dOneOrgRule_export",//D+1所属分公司免费额度管理(导出)
		TZER8603:"bap:tZero:dOneOrgRule_update",//D+1所属分公司免费额度管理(修改额度)
		TZER8604:"bap:tZero:dOneOrgRule_optHis",//D+1所属分公司免费额度管理(操作记录查询)
		
		TZER8700:"bap:tZero:dOneMecMag",//D+1商户免费额度管理
		TZER8701:"bap:tZero:dOneMecMag_query",//D+1商户免费额度管理(查询)
		TZER8702:"bap:tZero:dOneMecMag_download",//D+1商户免费额度管理(下载模板)
		TZER8703:"bap:tZero:dOneMecMag_import",//D+1商户免费额度管理(批量导入)
		TZER8704:"bap:tZero:dOneMecMag_update",//D+1商户免费额度管理(修改)
		TZER8705:"bap:tZero:dOneMecMag_optHis",//D+1商户免费额度管理(操作记录)
		TZER8706:"bap:tZero:dOneMecMag_queryDOneBusStsOptHis",//!#D+1 查询D+1商户额度变更操作记录
		
		TZER8800:"bap:tZero:dOneMecQry",//D+1商户信息查询
		TZER8811:"bap:tZero:dOneMecQry_query",//D+1商户信息查询(查询)
		TZER8812:"bap:tZero:dOneMecQry_export",//D+1商户信息查询(导出)
		TZER8813:"bap:tZero:dOneMecQry_downloadD1BatchQueryTemplate",//!#D+1商户查询下载根据商编批量查询的模板文件
		TZER8814:"bap:tZero:dOneMecQry_validateBatchQueryByMnos",//!#D+1商户查询页面批量查询按钮

		//即日付签约费率管理
		TZER4000:"bap:tZero:jrfRateRul",
		TZER4001:"bap:tZero:jrfRateRul:save",//保存
		
		TZER9000:"bap:tZero:mecVvRateManager",
		TZER9001:"bap:tZero:mecVvRateManager_query",
		TZER9002:"bap:tZero:mecVvRateManager_batOpt",
		TZER9003:"bap:tZero:mecVvRateManager_operate",

		//POS屏幕信息
		POSINFO000:"bap:POSAlertConfig",
		//屏幕提示信息
		POSINFO100:"bap:POSAlertConfig:posAlertInfo_query",
		POSINFO101:"bap:POSAlertConfig:posAlertInfo_detail",
		POSINFO102:"bap:POSAlertConfig:posAlertInfo_add",
		POSINFO103:"bap:POSAlertConfig:posAlertInfo_update",
		POSINFO104:"bap:POSAlertConfig:posAlertInfo_start",
		POSINFO105:"bap:POSAlertConfig:posAlertInfo_pause",
		POSINFO106:"bap:POSAlertConfig:posAlertInfo_end",
		POSINFO107:"bap:POSAlertConfig:posAlertInfo_unBand",
		//屏幕信息查询
		POSINFO200:"bap:POSAlertConfig:posAlertQuery_query",
		POSINFO201:"bap:POSAlertConfig:posAlertQuery_unChain",
		//屏显历史查询
		POSINFO500:"bap:POSAlertConfig:posAlertHisQuery",
		//结算账户屏显规则查询
		POSINFO501:"bap:POSAlertConfig:posAlertSesQuery",
		//pos小票广告管理 → 签购单持卡人联广告管理
		POSINFO300:"bap:POSAlertConfig:posAd_query",
		//签购单商户联广告管理
		POSINFO400:"bap:POSAlertConfig:posAd_Mec_add",

		//公共信息维护
		BASEINFO000:'bap:base',
		BASEINFO001:'bap:base:bankInfo_query',//行业大类信息查询
		BASEINFO002:'bap:base:bankInfo_add',//行业大类添加
		BASEINFO003:'bap:base:bankInfo_update',//行业大类修改

		BASEINFO004:'bap:base:cupcodeInfo_query',//地域码查询
		BASEINFO005:'bap:base:cupcodeInfo_update',//地域码修改
		
		
		ZFT000:"bap:zft",
		ZFT100:"bap:zft:batchManager",
		ZFT101:"bap:zft:batchManager_query",
		ZFT102:"bap:zft:batchManager_importExcel_openNormal",
		ZFT103:"bap:zft:batchManager_importExcel_closeNormal",
		ZFT104:"bap:zft:batchManager_importExcel_openVip",
		ZFT105:"bap:zft:batchManager_importExcel_closeVip",
		ZFT106:"bap:zft:batchManager_exportExcel",
		ZFT107:"bap:zft:batchManager_downLoadTemplate",
		ZFT110:"bap:zft:applyAudit",
		ZFT111:"bap:zft:applyAuditBatchOpt",
		ZFT112:"bap:zft:applyAuditQuery",
		
		POSMD000:"bap:posmd",
		POSMD001:"bap:posmd_mecManager",
		POSMD002:"bap:posmd_mecManagerQuery",
		POSMD003:"bap:posmd_Rule",
		POSMD008:"bap:posmd_mecManager_query",
		POSMD009:"bap:posmd_mecManager_downloadTemplate",
		POSMD004:"bap:posmd_mecManager_openPosMd",
		POSMD005:"bap:posmd_mecManager_batchOpt",
		POSMD006:"bap:posmd_mecManager_oneOpt",
		POSMD043:"bap:posmd_mecManager_oneOpt_open",//单条动作(开通)
		POSMD044:"bap:posmd_mecManager_oneOpt_close",//单条动作(关闭)
		POSMD045:"bap:posmd_mecManager_oneOpt_updAmt",//单条动作(修改限额)
		POSMD046:"bap:posmd_mecManager_oneOpt_updLevel",//单条动作(修改等级)
		POSMD047:"bap:posmd_mecManager_oneOpt_updStatus",//单条动作(修改等级状态)
		
		POSMD007:"bap:posmd_mecManager_optHis",
		POSMD038:"bap:posmd_mecManager_detail",
		POSMD010:"bap:posmd_mecQueryImport",//秒到商户查询-导出按钮
		POSMD011:"bap:posmd_mecQuery_query",//秒到商户-查询按钮
		POSMD039:"bap:posmd_mecQuery_detail",//秒到商户-详情按钮
		
		POSMD012:"bap:posmd_openRule",//秒到开通规则
		POSMD013:"bap:posmd_openRule_save",//秒到开通规则-保存
		
		POSMD020:"bap:posmd_mecLimit",//秒到商户规模设置
		POSMD021:"bap:posmd_mecLimit_query",//秒到商户规模设置-查询
		POSMD022:"bap:posmd_mecLimit_Update",//秒到商户规模设置-修改
		POSMD023:"bap:posmd_mecLimit_export",//秒到商户规模设置-导出
		POSMD024:"bap:posmd_mecLimit_import",//秒到商户规模设置-批量导入修改
		POSMD025:"bap:posmd_mecLimit_optHis",//秒到商户规模设置-操作记录
		
		POSMD030:"bap:posmd_levelManager",//秒到等级规则管理
		POSMD031:"bap:posmd_levelManager_query",//秒到等级规则管理-查询
		POSMD032:"bap:posmd_levelManager_add",//秒到等级规则管理-添加
		POSMD033:"bap:posmd_levelManager_edit",//秒到等级规则管理-修改
		POSMD034:"bap:posmd_levelManager_delete",//秒到等级规则管理-删除		
		
		POSMD035:"bap:posmd_stmLevel",//秒到结算人等级信息管理
		POSMD036:"bap:posmd_stmLevel_query",//查询
		POSMD037:"bap:posmd_stmLevel_edit",//修改
		POSMD040:"bap:posmd_stmLevel_export",//导出
		POSMD041:"bap:posmd_stmLevel_mecDetail",//名下商户详情
		POSMD042:"bap:posmd_stmLevel_optHis",//操作记录
		ERRORLOG00:"bap:ses_errorlog",//结算异常记录查询
		
		VVMEC001:"bap:tzero:vvMag",//VV管理
		VVMEC010:"bap:tzero:vvRule",//VV业务规则管理
		VVMEC011:"bap:tzero:vvRuleSave",//VV业务规则管理(保存)
			
		BASEINFO011:'bap:base:msgInfo_query',//短信内容查询
		BASEINFO012:'bap:base:msgInfo_add',//短信内容添加

		BASEINFO013:'bap:base:msgInfo_downloadTemplate',//下载模板
		BASEINFO014:'bap:base:importExcelSmsSend',//批量导入下载模板

		BASEINFO015:'bap:base:ratInfo_downloadTemplate',//下载数据变更模板
		BASEINFO016:'bap:base:importExcelRatInfo',//批量导入下载模板
		
		//结算退费管理
		SETREF0000:"bap:setRefMag",
		SETREF0100:"bap:mecRefStmtMag",//商户结算退费流水管理
		SETREF0101:"bap:mecRefStmtMag_query",//查询
		SETREF0102:"bap:mecRefStmtMag_erro",//标记差错
		SETREF0103:"bap:mecRefStmtMag_complain",//标记投诉
		SETREF0104:"bap:mecRefStmtMag_cancel",//取消标记
		SETREF0105:"bap:mecRefStmtMag_updBat",//批量修改
		SETREF0106:"bap:mecRefStmtMag_queryBat",//批量查询
		SETREF0107:"bap:mecRefStmtMag_log",//操作记录
		SETREF0108:"bap:mecRefStmtMag_export",//导出excel
		
		//闪电到账管理
		TZER1007:"bap:ses:AppRecordQuery",//申请记录查询
		SDDZ0001:'bap:sddz',//闪电到账
		SDDZ0002:'bap:sddz:sddzStatusManage',//闪电到账状态管理
		SDDZ0003:'bap:sddz:sddzStatusManage:operate',//闪电到账状态管理
		SDDZ0004:'bap:sddz:sddzStatusManage:queryHis',//闪电到账状态管理
			
	    SDDZ0005:'bap:sddz:sddzAccountAudit',//闪电到账审核
	    SDDZ0006:'bap:sddz:sddzAccountAudit:detail',//闪电到账审核详情
	    SDDZ0007:'bap:sddz:sddzAccountAudit:detail:ok',//闪电到账审核详情通过
	    SDDZ0008:'bap:sddz:sddzAccountAudit:detail:refuse',//闪电到账审核详情拒绝
	    	
	    SDDZNOTICE001:'bap:notice:sddzNoticeQuery',//闪电到账公告管理   	
	    SDDZNOTICE002:"bap:notice:sddzNotice_Insert",//公告添加
	    SDDZNOTICE003:"bap:notice:sddzNotice_Update",//公告修改
	    SDDZNOTICE004:"bap:notice:sddzNotice_View",//公告查询详细
	    SDDZNOTICE005:"bap:notice:sddzNotice_Deploy",//公告发布
	    SDDZNOTICE006:"bap:notice:sddzNotice_Revoke",//公告发布
	    
	    SDDZ0010:'bap:sddz:sddzBiz',//闪电到账业务管理   
	  
		TZER1008:"bap:tZero:jrf",//即日付
		TZER1009:"bap:tZero:jrf:manage",//即日付状态管理
		TZER1010:"bap:tZero:jrf:manage:download",//即日付状态管理,excel下载
		TZER1011:"bap:tZero:jrf:manage:detailHIS",//即日付状态管理,操作流水
		TZER1012:"bap:tZero:jrf:manage:importExcel",//即日付状态管理,excel导入
		TZER1013:"bap:tZero:jrf:manage:openOrClose",//即日付状态管理,单个开通或者关闭
		TZER1014:"bap:tZero:jrf:manage:updateRate",//即日付状态管理,单个修改费率
		TZER1015:"bap:tZero:jrf:manage:rateHis",//即日付状态管理,费率修改流水
		TZER1016:"bap:tZero:jrf:manage:downRateTemplate",//即日付状态管理,费率修改模板下载
		TZER1017:"bap:tZero:jrf:manage:importRateExcel",//即日付状态管理,费率修改模板下载
		TZER1018:"bap:tZero:jrf:manage:downloadJRFBatchQueryTemplate",//!#即日付状态管理,下载即日付批量查询模板
		TZER1019:"bap:tZero:jrf:manage:validateBatchQueryByMnos",//!#即日付状态管理,即日付商户业务状态管理批量查询后下载
		//代付业务管理  zhou_mw
		DF0024:"bap:df",//代付业务
		
		DF0025:"bap:df:dfMecIf",//代付业务管理
		DF2501:"bap:df:dfMecIf_query",//代付业务管理 查询
		DF2502:"bap:df:dfMecIf_add",//代付业务管理 添加
		DF2503:"bap:df:dfMecIf_update",//代付业务管理 修改
		
		DF0026:"bap:df:dfPayOrd",//代付订单管理
		DF2601:"bap:df:dfPayOrd_query",//代付订单查询
		DF2602:"bap:df:dfPayOrd_export",//代付订单导出
		DF2603:"bap:df:dfPayOrd_detail",//代付订单详情


		//网页代付
		DF3001:"bap:df:payment",//网页代付充值订单管理
		DF3002:"bap:df:payment:query",//网页代付充值订单查询
		DF3003:"bap:df:payment:excel",//网页代付充值订单导出
		
		ZFT1000:"bap:zft:zftManage",//朝付通管理
		ZFT1001:"bap:zft:mecCounterFee",//朝付通手续费的设置与调整
		ZFT1002:"bap:zft:mecZftFlg",//商户朝付通开通情况查询
		ZFT1003:"bap:zft:his",//朝付通操作流水查询
		ZFT1004:"bap:zft:his:export",//朝付通操作流水查询导出
		
	    //清结算业务
	    QJS0000:"bap:qjs",
	    QJS0001:'bap:qjs:qjsUpLoad',//导入报表数据
	    QJS0002:'bap:qjs:qjsQjsReport',//清结算对账情况一览表
	    QJS0003:'bap:qjs:qjsPadReport',//平台与对账文件核对表
	    QJS0004:'bap:qjs:qjsReportMaintain', //财务入账报表科目维护页面   by王占京 
	    QJS0005:'bap:qjs:qjsReportMaintain:qe',//查询和导出
	    QJS0006:'bap:qjs:qjsReportMaintain:aed',//增删改	


	    //备付金系统管理
	    stockFund0000:"bap:stockFund",
	    stockFund0001:'bap:stockFund:bankAccount',//备付金银行账户管理
	    stockFund000101:'bap:stockFund:bankAccount_add',//新增
	    stockFund000102:'bap:stockFund:bankAccount_delete',//删除
	    stockFund000103:'bap:stockFund:bankAccount_update',//修改
	    stockFund000104:'bap:stockFund:bankAccount_updateUsageStatus', //修改使用状态
	    
	    //互动数据统计
	    IDD0000:"bap:idd",
	    IDD0001:"bap:idd:app:first",//首次登录App信息量
	    IDD0002:"bap:idd:app:every",//按日登录App信息量
	    IDD0003:"bap:idd:app:first:query",//每日查询按钮
	    IDD0004:"bap:idd:app:first:excelout",//每日Excel导出按钮
	    IDD0005:"bap:idd:app",//商户App登录量
	    IDD0006:"bap:idd:app:every:query",//每日查询按钮
	    IDD0007:"bap:idd:app:every:excelout",//每日Excel导出按钮
	    	
	    IDD1000:"BAP:IDD:APP:DOWNLOAD",//下载量
	    IDD1001:"BAP:IDD:APP:DOWNLOAD:QUERY",//下载量查询和导出
	    //yuanwu add	
	    IDD0008:"BAP:IDD:APP:WECUSE",//微信使用量
	    IDD0009:"BAP:IDD:APP:WECUSE:QUERY",//微信使用量查询按钮
	    IDD0010:"BAP:IDD:APP:WECUSE:EXCEL",//微信使用量导出按钮
	    
	    
	    //wang_zj1
	    IDD2000:"BAP:IDD:APP:USEAPP",//商户使用量查询
	    IDD2001:"BAP:IDD:APP:USEAPPQUERY",//商户使用量查询
	    IDD2002:"BAP:IDD:APP:USEAPPEXPORTEXCEL",//商户使用量导出
	    IDD2003:"BAP:IDD:APP:APPBINDING",//随行付商户服务绑定量页面
	    IDD2004:"BAP:IDD:APP:APPBINDINGQUERY",//随行付商户服务绑定量查询
	    IDD2005:"BAP:IDD:APP:APPBINDINGEXPORTEXCEL",//随行付商户服务绑定量导出
	    				 	    			
        //SONG_YM
		IDDM0008:"bap:idd:mss_queryMssAdClickStatistics",//商户每日点击广告量查询
	    IDDM0009:"bap:idd:mss_exportMssAdClickStatistics",//商户每日点击广告量导出
	    	
    	//微信消息管理
    	IDDM0010:"bap:idd:wechat_messageSending",//微信消息发送
    	IDDM0011:"bap:idd:wechat_groupMessageSending",//微信消息群发
    		
    	//微信消息导出
		IDDM3000:"bap:idd:APP:newpos",//新进件POS商户
		IDDM3001:"bap:idd:app:newpos:query",//新进件POS商户数据查询按钮
		IDDM3002:"bap:idd:app:newpos:excel"//新进件POS商户数据查询导出


	}
})();

package ${controllerPackage};
import java.util.*;
import ${domainPackage}.${classNameD};
import ${servicePackage}.${classNameD}Service;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.lemon.common.utils.DownloadFileUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import java.io.File;

/**
 * @description  ${businessName}控制层
 * @author ${classAuthor}
 * @date   ${classTime}
 */
@Controller
@RequestMapping("/${urlPackage}/${classNameX}")
public class ${classNameD}Controller extends BaseController {

    @Autowired
    private ${classNameD}Service ${classNameX}Service;
    static final Logger LOGGER = LoggerFactory.getLogger(${classNameD}Controller.class);
<#list tableCarrays as tableCarray>
    <#if (tableCarray.queryRule??) && tableCarray.queryRule == "05">
    /**
     * @description: 获取自定义下拉选数据
     * @return map
     * @author ${classAuthor}
     * @date ${classTime}
     */
    @RequestMapping(value ="/get${tableCarray.columnNameD}", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> get${tableCarray.columnNameD}(){
        String opNm = "${businessName}-获取字段";
        LOGGER.info(opNm, "--begin");
        List<Map<String, Object>> payTypeNames = null;
        try {
            //payTypeNames = tSesAutoPayCheckService.get${tableCarray.columnNameD}();
            LOGGER.info(opNm, "--获取参数成功！");
        } catch (Exception e) {
            LOGGER.error(opNm, "--end,异常",e);
        }
        LOGGER.info(opNm,"--end");
        return payTypeNames;
    }
    </#if>
</#list>
<#if isQuery == "01">
    
    /**
     * @description: 信息查询
     * @param session
     * @param start
     * @param limit
     * @param paramVo
     * @return map
     * @author ${classAuthor}
     * @date ${classTime}
     */
    @RequestMapping(value ="/query", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryCondition(HttpSession session,
            @RequestParam(value = "start", defaultValue = START) int start,
            @RequestParam(value = "limit", defaultValue = LIMIT) int limit,
            @ModelAttribute ${classNameD} paramVo) {
        String opNm = "${businessName}-查询";
            try {
                LOGGER.info(opNm, paramVo.toString(), "--begin");
                Map<String, Object> map = setParams(start, limit);
                map.put("${classNameX}", paramVo);
                session.setAttribute("queryMecTOneAcRateParam", map);
                List<Map<String, Object>> list = ${classNameX}Service.findByCondition(map);
                int count = ${classNameX}Service.findByConditionCount(map);
                LOGGER.info(opNm, count, "--end");
                return setResult(list, count);
            } catch (Exception e) {
                LOGGER.info(opNm, "--end,异常", e);
                return setFailure("查询失败");
            }
    }
</#if>
<#if isQuery == "01">
    
    /**
     * 根据主键取得详细
     * @param session
     * @param paramVo
     * @return map
     * @author ${classAuthor}
     * @date ${classTime}
     */
    @RequestMapping(value = "/getDetail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getByKey(HttpSession session, @ModelAttribute ${classNameD} paramVo) {
        String opNm = "${businessName}-详细";
            try {
                LOGGER.info(opNm, paramVo.toString(), "--begin");
    ${classNameD} detail= ${classNameX}Service.getByKey(paramVo);
                LOGGER.info(opNm,"--end");
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("data", detail);
                return map;
            } catch (Exception e) {
                LOGGER.error(opNm,"--end,异常",e);
                return super.setFailure("查询失败");
            }
    }
</#if>
<#if isAdd == "01">
    
    /**
     * 保存
     * @param ${classNameX}
     * @return map
     * @author ${classAuthor}
     * @date ${classTime}
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save( @ModelAttribute ${classNameD} ${classNameX}) {
        String opNm = "${businessName}-保存";
        try{
            LOGGER.info(opNm, ${classNameX}.toString(), "--begin");
    <#list insertCarrays as tableCarray>
        <#if tableCarray.columnNameD == "Uuid">
            ${classNameX}.set${tableCarray.columnNameD}(CreateUUID.GetRandomUUID());
        </#if>
        <#if tableCarray.columnNameD == "OpId">
            ${classNameX}.set${tableCarray.columnNameD}(SysUtils.getLoginName());
        </#if>
        <#if tableCarray.columnNameD == "OpDt">
            ${classNameX}.set${tableCarray.columnNameD}(DateUtils.getCurDT());
        </#if>
        <#if tableCarray.columnNameD == "OpTm">
            ${classNameX}.set${tableCarray.columnNameD}(DateUtils.getCurTM());
        </#if>
        <#if tableCarray.columnNameD == "CtId">
            ${classNameX}.set${tableCarray.columnNameD}(SysUtils.getLoginName());
        </#if>
        <#if tableCarray.columnNameD == "CtDt">
            ${classNameX}.set${tableCarray.columnNameD}(DateUtils.getCurDT());
        </#if>
        <#if tableCarray.columnNameD == "CtTm">
            ${classNameX}.set${tableCarray.columnNameD}(DateUtils.getCurTM());
        </#if>
    </#list>
            int num = ${classNameX}Service.insert(${classNameX});
            if(num>0){
                return super.setSuccess("保存成功!");
            }
            LOGGER.info(opNm, "--end");
            return super.setFailure("保存成功0条!");
            
        }catch(Exception e){
            LOGGER.error(opNm, "--end,异常", e);
            return super.setFailure("保存失败!");
        }
    }
</#if>
<#if isUpdate=="01">
    
    /**
     * 更新
     * @param ${classNameX}
     * @return map
     * @author ${classAuthor}
     * @date ${classTime}
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> udpate( @ModelAttribute ${classNameD} ${classNameX}) {
        String opNm = "${businessName}-更新";
        try{
    <#list updateCarrays as tableCarray>
        <#if tableCarray.columnNameD == "OpId">
                paramVo.set${tableCarray.columnNameD}(SysUtils.getLoginName());
        </#if>
        <#if tableCarray.columnNameD == "OpDt">
                paramVo.set${tableCarray.columnNameD}(DateUtils.getCurDT());
        </#if>
        <#if tableCarray.columnNameD == "OpTm">
                paramVo.set${tableCarray.columnNameD}(DateUtils.getCurTM());
        </#if>
    </#list>
            LOGGER.info(opNm, ${classNameX}.toString(), "--begin");
            int num = ${classNameX}Service.update(${classNameX});
            if(num>0){
                return super.setSuccess("更新成功!");
            }
            LOGGER.info(opNm, "--end");
            return super.setFailure("更新成功0条!");
        }catch(Exception e){
            LOGGER.error(opNm, "--end,异常", e);
            return super.setFailure("更新失败!");
        }
    }
</#if>
<#if isDetele=="01">

    /**
     * 根据主键删除
     * @param session
     * @param uuids
     * @return map
     * @author ${classAuthor}
     * @date ${classTime}
     */
    @RequestMapping(value = "/deleteByUuid", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteByUuid(HttpSession session, @RequestParam(value = "uuids") String uuids) {
        String opNm = "${businessName}-删除";
        if(uuids==null|| "".equals(uuids)){
            return super.setFailure("错误：付款单号参数为空");
        }
        // 参数map
        Map<String, Object> paramsMap = new HashMap<String, Object>();
        paramsMap.put("uuids", uuids.split(","));//付款单号数组
        try{
            LOGGER.info(opNm, uuids, "--begin");
            int num = ${classNameX}Service.delete(paramsMap);
            LOGGER.info(opNm, num, "--end");
            if(num>0){
                return super.setSuccess("删除成功!");
            }
            LOGGER.info(opNm, "--end");
            return super.setFailure("删除成功0条!");
            
        }catch(Exception e){
            LOGGER.error(opNm, "--end,异常", e);
            return super.setFailure("删除失败!");
        }
    }
</#if>
<#if isImport == "01" >
    
    /**
     * @description:下载导入模板
     * @param request
     * @param response
     * @return map
     * @author ${classAuthor}
     * @date ${classTime}
     */
    @RequestMapping(value = "/downloadTemplate")
    public void downloadBatchTemplate(HttpServletRequest request, HttpServletResponse response) {
        String opNm = "${businessName}-下载导入模板";
        LOGGER.info(opNm, "==开始");
        String    fileName = "${classNameX}Template.xlsx";
        try {
            LOGGER.info(opNm, fileName, "begin");
            String path = request.getSession().getServletContext().getRealPath("") + "/download/bap/" + fileName;
            File file = new File(path);
            downloadFile(file, response);
            LOGGER.info(opNm, fileName, "end");
        } catch (Exception e) {
            LOGGER.error(opNm, fileName, e);
        }
    }
    
    /**
     * @description:主页面导入功能
     * @param session
     * @param request
     * @return map
     * @author ${classAuthor}
     * @date ${classTime}
     */
    @RequestMapping(value = "importExcel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> ${classNameD}importExcel (HttpSession session, HttpServletRequest request){
        String opNm = "${businessName}-导入";
         LOGGER.info(opNm, "==开始");
        Map<String, Object> rsMap = null;
        try {
            rsMap = ${classNameX}Service.batchOperate(request);
            if (rsMap.get("errors") != null) {
                @SuppressWarnings("unchecked")
                List<BnkRetPo> errlist = (List<BnkRetPo>) rsMap.get("errors");
                session.setAttribute("errlist", errlist);
            }
            return rsMap;
        } catch (Exception e) {
            LOGGER.error(opNm, "异常原因是：", e);
            rsMap = new HashMap<String, Object>();
            rsMap.put("success", false);
            rsMap.put("msgInfo", "系统异常！");
            return rsMap;
        }
    }
    
    /**
     * @description:导出错误信息
     * @param session
     * @param response
     * @return void
     * @author ${classAuthor}
     * @date ${classTime}
     */
    @RequestMapping(value = "getFailExport", method = RequestMethod.GET)
    @ResponseBody
    public void getBnkBinFailExport(HttpSession session, HttpServletResponse response) {
        try{
            //从session中获取错误信息list
            @SuppressWarnings("unchecked")
            List<BnkRetPo> erroList = (List<BnkRetPo>) session.getAttribute("errlist");
            List<Map<String, Object>> inList = null;
            if(erroList.size()>0){inList = new ArrayList<Map<String, Object>>();
                for (int i = 0; i < erroList.size(); i++) {
                    Map<String, Object> map = new HashMap<String, Object>();
                    BnkRetPo po = erroList.get(i);
                    String bnkCd = po.getBnkCd();
                    String failReason = po.getFailReason();
                    map.put("bnkCd", bnkCd);
                    map.put("failReason", failReason);
                    inList.add(map);
                }
                File file = ${classNameX}Service.exportExcelFail(inList, SysUtils.getLoginName());
                downloadFile(file, response);
            }
        } catch (Exception e){
            LOGGER.error("验证失败结果导出异常，", e);
        }
    }
</#if>
<#if isExport == "01" >
    
    /**
     * @description:主页面导出功能
     * @param session
     * @param response
     * @return void
     * @author ${classAuthor}
     * @date ${classTime}
     */
    @RequestMapping(value = "/export", method = RequestMethod.GET)
    public void export(HttpSession session, HttpServletResponse response) {
        String opNm = "${businessName}信息管理-导出";
        @SuppressWarnings("unchecked")
        Map<String, Object> paraMap = (Map<String, Object>) session.getAttribute("queryMecTOneAcRateParam");
        HSSFWorkbook hSSFWorkbook;
        String fileName = null;
        try {
            hSSFWorkbook = ${classNameX}Service.export(paraMap);
            fileName = "${businessName}表信息" + System.currentTimeMillis() + ".xls";
            DownloadFileUtil.getInstance().downLoadExcel(hSSFWorkbook, fileName, response);
        } catch (Exception e) {
            LOGGER.error(opNm,"异常：", e);
        }
        LOGGER.info(opNm,"导出完毕","fileName=" + fileName);
    }
</#if>
}
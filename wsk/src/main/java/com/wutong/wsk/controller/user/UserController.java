package com.wutong.wsk.controller.user;
import java.util.*;
import com.wutong.wsk.domain.user.User;
import com.wutong.wsk.service.user.UserService;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.wutong.wsk.util.*;
import com.wutong.wsk.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import com.wutong.wsk.domain.ImportError;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;

/**
 * @description  用户控制层
 * @author zhao_qg
 * @date   20200311 21:17:04
 */
@Controller
@RequestMapping("/user/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;
    static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
    
    /**
     * @description: 信息查询
     * @param session
     * @param start
     * @param limit
     * @param paramVo
     * @return map
     * @author zhao_qg
     * @date 20200311 21:17:04
     */
    @RequestMapping(value ="/query", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryCondition(HttpSession session,
            @RequestParam(value = "start", defaultValue = START) int start,
            @RequestParam(value = "limit", defaultValue = LIMIT) int limit,
            @ModelAttribute User paramVo) {
        String opNm = "用户-查询";
            try {
                LOGGER.info(opNm, paramVo.toString(), "--begin");
                Map<String, Object> map = setParams(start, limit);
                map.put("user", paramVo);
                session.setAttribute("queryUserParam", map);
                List<Map<String, Object>> list = userService.findByCondition(map);
                int count = userService.findByConditionCount(map);
                LOGGER.info(opNm, count, "--end");
                return setResult(list, count);
            } catch (Exception e) {
                LOGGER.info(opNm, "--end,异常", e);
                return setFailure("查询失败");
            }
    }
    
    /**
     * 根据主键取得详细
     * @param session
     * @param paramVo
     * @return map
     * @author zhao_qg
     * @date 20200311 21:17:04
     */
    @RequestMapping(value = "/getDetail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getByKey(HttpSession session, @ModelAttribute User paramVo) {
        String opNm = "用户-详细";
            try {
                LOGGER.info(opNm, paramVo.toString(), "--begin");
    User detail= userService.getByKey(paramVo);
                LOGGER.info(opNm,"--end");
                Map<String, Object> map = new HashMap<String, Object>();
                map.put("data", detail);
                return map;
            } catch (Exception e) {
                LOGGER.error(opNm,"--end,异常",e);
                return super.setFailure("查询失败");
            }
    }
    
    /**
     * 保存
     * @param user
     * @return map
     * @author zhao_qg
     * @date 20200311 21:17:04
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save( @ModelAttribute User user) {
        String opNm = "用户-保存";
        try{
            LOGGER.info(opNm, user.toString(), "--begin");
            int num = userService.insert(user);
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
    
    /**
     * 更新
     * @param user
     * @return map
     * @author zhao_qg
     * @date 20200311 21:17:04
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> udpate( @ModelAttribute User user) {
        String opNm = "用户-更新";
        try{
            LOGGER.info(opNm, user.toString(), "--begin");
            int num = userService.update(user);
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

    /**
     * 根据主键删除
     * @param session
     * @param keys
     * @return map
     * @author zhao_qg
     * @date 20200311 21:17:04
     */
    @RequestMapping(value = "/deleteByKey", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteByKey(HttpSession session, @RequestParam(value = "keys") String keys) {
        String opNm = "用户-删除";
        if(keys==null|| "".equals(keys)){
            return super.setFailure("错误：主键参数为空");
        }
        // 参数map
        Map<String, Object> paramsMap = new HashMap<String, Object>();
        paramsMap.put("keys", keys.split(","));//主键组
        try{
            LOGGER.info(opNm, keys, "--begin");
            int num = userService.delete(paramsMap);
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
    
    /**
     * @description:下载导入模板
     * @param request
     * @param response
     * @return map
     * @author zhao_qg
     * @date 20200311 21:17:04
     */
    @RequestMapping(value = "/downloadTemplate")
    public void downloadBatchTemplate(HttpServletRequest request, HttpServletResponse response) {
        String opNm = "用户-下载导入模板";
        LOGGER.info(opNm, "==开始");
        String    fileName = "userTemplate.xlsx";
        try {
            LOGGER.info(opNm, fileName, "begin");
            String path = UserController.class.getResource("/").getPath()+ "/template/" + fileName;
            File file = new File(path);
            DownloadFileUtil.getInstance().downLoad(file, response);
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
     * @author zhao_qg
     * @date 20200311 21:17:04
     */
    @RequestMapping(value = "importExcel", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> UserimportExcel (HttpSession session, HttpServletRequest request){
        String opNm = "用户-导入";
         LOGGER.info(opNm, "==开始");
        Map<String, Object> rsMap = null;
        try {
            rsMap = userService.batchOperate(request);
            session.setAttribute("user+Errlist", rsMap.get("errorList"));
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
     * @author zhao_qg
     * @date 20200311 21:17:04
     */
    @RequestMapping(value = "getFailExport", method = RequestMethod.GET)
    @ResponseBody
    public void getBnkBinFailExport(HttpSession session, HttpServletResponse response) {
        try{
            //从session中获取错误信息list
            @SuppressWarnings("unchecked")
            List<ImportError> erroList = (List<ImportError>) session.getAttribute("user+Errlist");
            List<Map<String, Object>> inList = null;
            if(erroList.size()>0){inList = new ArrayList<Map<String, Object>>();
                for (int i = 0; i < erroList.size(); i++) {
                    Map<String, Object> map = new HashMap<String, Object>();
                    ImportError po = erroList.get(i);
                    map.put("position", po.getPosition());
                    map.put("importValue", po.getImportValue());
                    map.put("failCode", po.getFailCode());
                    map.put("failReason", po.getFailReason());
                    inList.add(map);
                }
                String fileName = "导入错误信息-" + DateUtil.getCurDTTM() + ".xlsx";
                SXSSFWorkbook swb = userService.exportExcelFail(inList, LoginUtils.getLoginName());
                DownloadFileUtil.getInstance().downLoadExcel(swb, fileName, response);
            }
        } catch (Exception e){
            LOGGER.error("验证失败结果导出异常，", e);
        }
    }
    
    /**
     * @description:主页面导出功能
     * @param session
     * @param response
     * @return void
     * @author zhao_qg
     * @date 20200311 21:17:04
     */
    @RequestMapping(value = "/export", method = RequestMethod.GET)
    public void export(HttpSession session, HttpServletResponse response) {
        String opNm = "用户信息管理-导出";
        String fileName = "用户" + DateUtil.getCurDTTM() + ".xlsx";
        Map<String, Object> paraMap = (Map<String, Object>) session.getAttribute("queryUserParam");
        long startTime = System.currentTimeMillis();
        Map<String, Object> paramsMap = (Map<String, Object>) session.getAttribute("queryParams");
        try {
            SXSSFWorkbook swb = userService.export(paraMap);
            DownloadFileUtil.getInstance().downLoadExcel(swb, fileName, response);
            LOGGER.info("导出收支明细--end" + DateUtil.getHaoShiTimeMsg(startTime));
        } catch (Exception e) {
            LOGGER.error("导出收支明细--exception", e);
        }
        LOGGER.info(opNm, "导出完毕", "fileName=" + fileName);
    }
}
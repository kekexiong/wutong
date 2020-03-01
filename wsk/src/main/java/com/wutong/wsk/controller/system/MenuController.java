package com.wutong.wsk.controller.system;
import java.util.*;
import com.wutong.wsk.domain.system.Menu;
import com.wutong.wsk.service.system.MenuService;
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
 * @description  菜单控制层
 * @author zhao_qg
 * @date   20200229 21:33:58
 */
@Controller
@RequestMapping("/system/menu")
public class MenuController extends BaseController {

    @Autowired
    private MenuService menuService;
    static final Logger LOGGER = LoggerFactory.getLogger(MenuController.class);
    
    /**
     * @description: 信息查询
     * @param session
     * @param start
     * @param limit
     * @param paramVo
     * @return map
     * @author zhao_qg
     * @date 20200229 21:33:58
     */
    @RequestMapping(value ="/query", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryCondition(HttpSession session,
            @RequestParam(value = "start", defaultValue = START) int start,
            @RequestParam(value = "limit", defaultValue = LIMIT) int limit,
            @ModelAttribute Menu paramVo) {
        String opNm = "菜单-查询";
            try {
                LOGGER.info(opNm, paramVo.toString(), "--begin");
                Map<String, Object> map = setParams(start, limit);
                map.put("menu", paramVo);
                session.setAttribute("queryMenuParam", map);
                List<Map<String, Object>> list = menuService.findByCondition(map);
                int count = menuService.findByConditionCount(map);
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
     * @date 20200229 21:33:58
     */
    @RequestMapping(value = "/getDetail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getByKey(HttpSession session, @ModelAttribute Menu paramVo) {
        String opNm = "菜单-详细";
            try {
                LOGGER.info(opNm, paramVo.toString(), "--begin");
    Menu detail= menuService.getByKey(paramVo);
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
     * @param menu
     * @return map
     * @author zhao_qg
     * @date 20200229 21:33:58
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save( @ModelAttribute Menu menu) {
        String opNm = "菜单-保存";
        try{
            LOGGER.info(opNm, menu.toString(), "--begin");
            int num = menuService.insert(menu);
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
     * @param menu
     * @return map
     * @author zhao_qg
     * @date 20200229 21:33:58
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> udpate( @ModelAttribute Menu menu) {
        String opNm = "菜单-更新";
        try{
            LOGGER.info(opNm, menu.toString(), "--begin");
            int num = menuService.update(menu);
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
     * @date 20200229 21:33:58
     */
    @RequestMapping(value = "/deleteByKey", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteByKey(HttpSession session, @RequestParam(value = "keys") String keys) {
        String opNm = "菜单-删除";
        if(keys==null|| "".equals(keys)){
            return super.setFailure("错误：主键参数为空");
        }
        // 参数map
        Map<String, Object> paramsMap = new HashMap<String, Object>();
        paramsMap.put("keys", keys.split(","));//主键组
        try{
            LOGGER.info(opNm, keys, "--begin");
            int num = menuService.delete(paramsMap);
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
     * @description:主页面导出功能
     * @param session
     * @param response
     * @return void
     * @author zhao_qg
     * @date 20200229 21:33:58
     */
    @RequestMapping(value = "/export", method = RequestMethod.GET)
    public void export(HttpSession session, HttpServletResponse response) {
        String opNm = "菜单信息管理-导出";
        String fileName = "菜单" + DateUtil.getCurDTTM() + ".xlsx";
        Map<String, Object> paraMap = (Map<String, Object>) session.getAttribute("queryMenuParam");
        long startTime = System.currentTimeMillis();
        Map<String, Object> paramsMap = (Map<String, Object>) session.getAttribute("queryParams");
        try {
            SXSSFWorkbook swb = menuService.export(paraMap);
            DownloadFileUtil.getInstance().downLoadExcel(swb, fileName, response);
            LOGGER.info("导出收支明细--end" + DateUtil.getHaoShiTimeMsg(startTime));
        } catch (Exception e) {
            LOGGER.error("导出收支明细--exception", e);
        }
        LOGGER.info(opNm, "导出完毕", "fileName=" + fileName);
    }
}
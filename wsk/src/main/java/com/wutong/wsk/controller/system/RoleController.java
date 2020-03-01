package com.wutong.wsk.controller.system;

import com.alibaba.fastjson.JSONObject;
import com.wutong.wsk.controller.BaseController;
import com.wutong.wsk.domain.system.Role;
import com.wutong.wsk.service.system.MenuService;
import com.wutong.wsk.service.system.RoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author zhao_qg
 * @description 菜单控制层
 * @date 20200228 18:40:05
 */
@Controller
@RequestMapping("/system/role")
public class RoleController extends BaseController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private MenuService menuService;
    static final Logger LOGGER = LoggerFactory.getLogger(RoleController.class);

    /**
     * @param session
     * @param start
     * @param limit
     * @param paramVo
     * @return map
     * @description: 信息查询
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    @RequestMapping(value = "/query", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryCondition(HttpSession session,
                                              @RequestParam(value = "start", defaultValue = START) int start,
                                              @RequestParam(value = "limit", defaultValue = LIMIT) int limit,
                                              @ModelAttribute Role paramVo) {
        String opNm = "菜单-查询";
        try {
            LOGGER.info(opNm, paramVo.toString(), "--begin");
            Map<String, Object> map = setParams(start, limit);
            map.put("role", paramVo);
            session.setAttribute("queryRoleParam", map);
            List<Map<String, Object>> list = roleService.findByCondition(map);
            int count = roleService.findByConditionCount(map);
            LOGGER.info(opNm, count, "--end");
            return setResult(list, count);
        } catch (Exception e) {
            LOGGER.info(opNm, "--end,异常", e);
            return setFailure("查询失败");
        }
    }

    /**
     * 根据主键取得详细
     *
     * @param session
     * @param paramVo
     * @return map
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    @RequestMapping(value = "/getDetail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getByKey(HttpSession session, @ModelAttribute Role paramVo) {
        String opNm = "菜单-详细";
        try {
            LOGGER.info(opNm, paramVo.toString(), "--begin");
            Role detail = roleService.getByKey(paramVo);
            LOGGER.info(opNm, "--end");
            List<Map<String, Object>> menus = roleService.getTreeData(detail.getScope());
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("data", detail);
            map.put("menu",JSONObject.toJSONString(menus));
            LOGGER.info(JSONObject.toJSONString(menus));
            return map;
        } catch (Exception e) {
            LOGGER.error(opNm, "--end,异常", e);
            return super.setFailure("查询失败");
        }
    }

    /**
     * 保存
     *
     * @param role
     * @return map
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save(@ModelAttribute Role role) {
        String opNm = "菜单-保存";
        try {
            LOGGER.info(opNm, role.toString(), "--begin");
            int num = roleService.insert(role);
            if (num > 0) {
                return super.setSuccess("保存成功!");
            }
            LOGGER.info(opNm, "--end");
            return super.setFailure("保存成功0条!");

        } catch (Exception e) {
            LOGGER.error(opNm, "--end,异常", e);
            return super.setFailure("保存失败!");
        }
    }

    /**
     * 更新
     *
     * @param role
     * @return map
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> udpate(@ModelAttribute Role role) {
        String opNm = "菜单-更新";
        try {
            LOGGER.info(opNm, role.toString(), "--begin");
            int num = roleService.update(role);
            if (num > 0) {
                return super.setSuccess("更新成功!");
            }
            LOGGER.info(opNm, "--end");
            return super.setFailure("更新成功0条!");
        } catch (Exception e) {
            LOGGER.error(opNm, "--end,异常", e);
            return super.setFailure("更新失败!");
        }
    }

    /**
     * 根据主键删除
     *
     * @param session
     * @param keys
     * @return map
     * @author zhao_qg
     * @date 20200228 18:40:05
     */
    @RequestMapping(value = "/deleteByKey", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteByKey(HttpSession session, @RequestParam(value = "keys") String keys) {
        String opNm = "菜单-删除";
        if (keys == null || "".equals(keys)) {
            return super.setFailure("错误：主键参数为空");
        }
        // 参数map
        Map<String, Object> paramsMap = new HashMap<String, Object>();
        paramsMap.put("keys", keys.split(","));//主键组
        try {
            LOGGER.info(opNm, keys, "--begin");
            int num = roleService.delete(paramsMap);
            LOGGER.info(opNm, num, "--end");
            if (num > 0) {
                return super.setSuccess("删除成功!");
            }
            LOGGER.info(opNm, "--end");
            return super.setFailure("删除成功0条!");

        } catch (Exception e) {
            LOGGER.error(opNm, "--end,异常", e);
            return super.setFailure("删除失败!");
        }
    }
}
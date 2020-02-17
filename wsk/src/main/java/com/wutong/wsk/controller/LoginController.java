package com.wutong.wsk.controller;

import com.wutong.wsk.domain.TUser;
import com.wutong.wsk.service.TUserService;
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
import java.util.List;
import java.util.Map;

/**
 * @author zhao_qg
 * @description 用户控制层
 * @date 20200215 18:48:36
 */
@Controller
public class LoginController extends BaseController {

    @Autowired
    private TUserService tUserService;
    static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    /**
     * @Title: 信息查询
     * @param session
     * @param paramVo
     * @return map

     * @author zhao_qg
     * @date 20200215 18:48:36
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryCondition(HttpSession session, @ModelAttribute TUser paramVo) {
        String opNm = "用户-查询";
        try {
            LOGGER.info(opNm, paramVo.toString(), "--begin");
//            Map<String, Object> map = setParams(0, 100);
//            map.put("tUser", paramVo);
//            session.setAttribute("queryTUserParam", map);
//            List<Map<String, Object>> list = tUserService.findByCondition(map);
//            int count = tUserService.findByConditionCount(map);
//            LOGGER.info(opNm, count, "--end");
            return setSuccess("登录成功");
        } catch (Exception e) {
            LOGGER.info(opNm, "--end,异常", e);
            return setFailure("查询失败");
        }
    }
}
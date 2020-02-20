package com.wutong.wsk.controller;


import com.wutong.wsk.domain.User;
import com.wutong.wsk.service.MailService;
import com.wutong.wsk.service.TUserService;
import com.wutong.wsk.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;

import javax.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;

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
    @Autowired
    private UserService userService;

    @Autowired
    MailService mailService;
    static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    /**
     * @param session
     * @param username
     * @return map
     * @Title: 信息查询
     * @author zhao_qg
     * @date 20200215 18:48:36
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryCondition(HttpSession session,
                                              @RequestParam(value = "username") String username,
                                              @RequestParam(value = "password") String password) {
        String opNm = "用户-查询";
        try {
            User u = new User();
            u.setUserName(username);
            User upwd = userService.getByName(u);
            if (decryptBasedDes(upwd.getLoginPwd()).equals(password)) {
                return setSuccess("登录成功");
            }
            //LOGGER.info(opNm, paramVo.toString(), "--begin");
//            Map<String, Object> map = setParams(0, 100);
//            map.put("tUser", paramVo);
//            session.setAttribute("queryTUserParam", map);
//            List<Map<String, Object>> list = tUserService.findByCondition(map);
//            int count = tUserService.findByConditionCount(map);
//            LOGGER.info(opNm, count, "--end");
            return setFailure("用户名或密码不正确");
        } catch (Exception e) {
            LOGGER.info(opNm, "--end,异常", e);
            return setFailure("查询失败");
        }

    }


    /**
     * DES的加密解密代码
     */
    private static final byte[] DES_KEY = {21, 1, -110, 82, -32, -85, -128, -65};

    @SuppressWarnings("restriction")
    public static String decryptBasedDes(String cryptData) {
        String decryptedData = null;
        try {
            // DES算法要求有一个可信任的随机数源
            SecureRandom sr = new SecureRandom();
            DESKeySpec deskey = new DESKeySpec(DES_KEY);
            // 创建一个密匙工厂，然后用它把DESKeySpec转换成一个SecretKey对象
            SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
            SecretKey key = keyFactory.generateSecret(deskey);
            // 解密对象
            Cipher cipher = Cipher.getInstance("DES");
            cipher.init(Cipher.DECRYPT_MODE, key, sr);
            // 把字符串进行解码，解码为为字节数组，并解密
            decryptedData = new String(cipher.doFinal(new sun.misc.BASE64Decoder().decodeBuffer(cryptData)));
        } catch (Exception e) {
            throw new RuntimeException("解密错误，错误信息：", e);
        }
        return decryptedData;
    }


    /**
     * @param session
     * @param username
     * @return map
     * @Title: 信息查询
     */
    @RequestMapping(value = "/retrieve", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> queryConditionRetrieve(HttpSession session,
                                                      @RequestParam(value = "username") String username,
                                                      @RequestParam(value = "mail") String mail) {
        String opNm = "用户-查询邮箱";
        try {
            User u = new User();
            u.setUserName(username);
            User user = userService.getByName(u);

            String pwd = decryptBasedDes(user.getLoginPwd());
            String subject = "找回密码";
            if (user.getMail().equals(mail)) {
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                String format = dateFormat.format(new Date());
                String content1 = "日期：" + format + "-你的密码是：" + pwd;
                mailService.sendMail(mail, subject, content1);
                return setSuccess("请到邮箱查看密码！");
            }
            return setFailure("用户名或邮箱不正确");
        } catch (Exception e) {
            LOGGER.info(opNm, "--end,异常", e);
            return setFailure("查询失败");
        }

    }

}
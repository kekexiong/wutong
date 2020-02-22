package com.wutong.wsk.controller.system;


import com.wutong.wsk.controller.BaseController;
import com.wutong.wsk.domain.system.DicCode;
import com.wutong.wsk.domain.user.User;
import com.wutong.wsk.service.system.DicCodeUtils;
import com.wutong.wsk.service.system.LoginValidService;
import com.wutong.wsk.service.system.MailService;
import com.wutong.wsk.util.RandomValidateCodeUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    private LoginValidService loginValidService;

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
    public Map<String, Object> queryCondition(HttpSession session, HttpServletRequest request, HttpServletResponse response,
                                              @RequestParam(value = "username") String username,
                                              @RequestParam(value = "password") String password,
                                              @RequestParam(value = "verifyInput") String verifyInput,
                                              @RequestParam(value = "remember") String remember) {
        String opNm = "用户-查询";
        try {
            if (username == "" || username == null || password == "" || password == null) {
                return setFailure("用户名或密码不能为空！");
            }
            if (verifyInput == "" || verifyInput == null) {
                return setFailure("请填写验证码！");
            }
            //验证码校验
            Boolean result = checkVerify(verifyInput, session);
            if (result == false) {
                return setFailure("验证码不正确，请重新输入！");
            }
            User u = new User();
            u.setUserName(username);
            User user = loginValidService.getByName(u);
            if (user == null) {
                return setFailure("该用户名不存在！");
            }
            //获取密码输入错误次数
            String pwdErrCunt = user.getPwdErrCunt();
            //注册用户时，表PWD_ERR_CUNT（密码输入错误次数）字段默认设为0
            if (pwdErrCunt.equals("null")) {
                return setFailure("该用户信息有误！");
            }
            Integer pwdErrCuntInt = Integer.valueOf(pwdErrCunt);
            if (!(user.getUserSts().equals("1")) || !(user.getIsAllowLogin().equals("1"))) {
                return setFailure("该用户无权限登录！");
            }
            if (pwdErrCuntInt >= 3) {
                int count = 3 - pwdErrCuntInt;
                return setFailure("密码输入错误三次，可以选择找回密码！");
            }

            if (decryptBasedDes(user.getLoginPwd()).equals(password)) {
                //获取当前的日期
                Date date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                String createdate = sdf.format(date);
                //获取登录用户ip
                String ip = getIpAddress(request);
                u.setLoginIp(ip);
                u.setUserId(user.getUserId());
                u.setLoginTime(createdate);
                u.setPwdErrCunt("0");//登录成功，密码错误次数置0
                loginValidService.updateById(u);
                rememberPwdIsOrNot(request, response, remember, username, password);
                return setSuccess("登录成功");
            }
            if (!decryptBasedDes(user.getLoginPwd()).equals(password)) {
                pwdErrCuntInt++;
                Integer count = 3 - pwdErrCuntInt;
                String strpwdErrCuntInt = pwdErrCuntInt.toString();
                String strCount = count.toString();//"密码输入错误三次，可以选择找回密码！"
                u.setUserId(user.getUserId());
                u.setPwdErrCunt(strpwdErrCuntInt);
                loginValidService.updatePwdErrById(u);
                return setFailure("密码输入错误，还有" + strCount + "次机会！");
            }
        } catch (Exception e) {
            LOGGER.info(opNm, "--end,异常", e);
            return setFailure("登录失败");
        }
        return setFailure("登录失败");
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
            User user = loginValidService.getByName(u);

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

    //获取登录用户ip地址
    public static String getIpAddress(HttpServletRequest request) {

        String ip = request.getHeader("x-forwarded-for");

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {

            ip = request.getHeader("Proxy-Client-IP");

        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {

            ip = request.getHeader("WL-Proxy-Client-IP");

        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {

            ip = request.getHeader("HTTP_CLIENT_IP");

        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {

            ip = request.getHeader("HTTP_X_FORWARDED_FOR");

        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {

            ip = request.getRemoteAddr();

        }

        return ip;

    }

    /**
     * 生成验证码
     */
    @RequestMapping(value = "/getVerify")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
            response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            RandomValidateCodeUtil randomValidateCode = new RandomValidateCodeUtil();
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            LOGGER.error("获取验证码失败>>>>   ", e);
        }
    }


    /**
     * 校验验证码是否输入正确
     */
    public boolean checkVerify(String inputStr, HttpSession session) {
        try {
            //从session中获取随机数
            String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
            if (random == null) {
                return false;
            }
            if (random.equals(inputStr)) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            LOGGER.error("验证码校验失败", e);
            return false;
        }
    }

    /*
     * 登录时是否选择记住密码
     */
    public void rememberPwdIsOrNot(HttpServletRequest request, HttpServletResponse response, String remember, String userName, String password) {
        //勾选了记住账号密码，
        if (remember.equals("1")) {
            Cookie c1 = new Cookie("userName", userName);
            Cookie c2 = new Cookie("password", password);
            c1.setMaxAge(60 * 60 * 24 * 30);
            c2.setMaxAge(60 * 60 * 24 * 30);//这里设置保存这条Cookie的时间  
            response.addCookie(c1);//添加Cookie  
            response.addCookie(c2);
        } else {//取消保存用户名
            Cookie cookies[] = request.getCookies();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("userName")) {
                    //System.out.println("清除");
                    cookie.setMaxAge(0);
                }
                if (cookie.getName().equals("password")) {
                    cookie.setMaxAge(0);
                }
            }
        }

    }

    /**
     * @param session
     * @param paramVo
     * @return map
     * @description: 信息查询
     * @author zhao_qg
     * @date 20200220 18:44:20
     */
    @RequestMapping(value = "/getDicCode", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getDicCode(HttpSession session, @ModelAttribute DicCode paramVo) {
        return setResult(DicCodeUtils.DIC_CODE_MAP_KEY.get(paramVo.getCodeKey()), 1000);
    }
}
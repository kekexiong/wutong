package com.wutong.wsk.service.system;

import com.wutong.wsk.domain.user.User;
import com.wutong.wsk.mapper.system.LoginValidMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author zhangleying
 * @version 1.0
 * @date 2020/2/21 15:03
 */
@Service
public class LoginValidService {

    @Autowired
    private LoginValidMapper loginValidMapper;

    /**
     * 根据昵称查询密码
     *
     * @param paramVo
     * @return
     */
    public User getByName(User paramVo) {
        return loginValidMapper.getByName(paramVo);
    }

    /**
     * 允许登录情况下更新登录ip,最新登录时间
     *
     * @param user
     * @return
     */
    public int updateById(User user) {
        return loginValidMapper.updateById(user);
    }

    /**
     * 密码输入错误，密码错误次数加1
     *
     * @param user
     * @return
     */
    public int updatePwdErrById(User user) {
        return loginValidMapper.updatePwdErrById(user);
    }
}

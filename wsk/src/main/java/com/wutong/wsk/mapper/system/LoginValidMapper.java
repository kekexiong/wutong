package com.wutong.wsk.mapper.system;

import com.wutong.wsk.domain.user.User;
import org.springframework.stereotype.Component;

/**
 * @author zhangleying
 * @version 1.0
 * @date 2020/2/21 14:59
 */
@Component
public interface LoginValidMapper {


    /**
     * 根据昵称查询密码
     *
     * @param paramVo
     * @return
     */
    public User getByName(User paramVo);

    /**
     * 允许登录情况下更新登录ip,最新登录时间
     *
     * @param user
     * @return
     */
    public int updateById(User user);

    /**
     * 密码输入错误，密码错误次数加1
     *
     * @param user
     * @return
     */
    public int updatePwdErrById(User user);


}

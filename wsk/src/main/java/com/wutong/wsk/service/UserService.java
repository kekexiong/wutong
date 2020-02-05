package com.wutong.wsk.service;

import com.wutong.wsk.domain.UserDomain;
import com.wutong.wsk.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserService {

    @Autowired
    UserMapper userMapper;


    public List<UserDomain> getAll() {
        return userMapper.getAll();
    }

}

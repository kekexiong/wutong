package com.wutong.wsk.mapper;

import com.wutong.wsk.domain.UserDomain;
import org.springframework.stereotype.Component;

import java.util.List;


@Component
public interface UserMapper {

    List<UserDomain> getAll();

}
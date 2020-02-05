package com.wutong.wsk.controller;

import com.wutong.wsk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@ResponseBody
public class UserController {


    @Autowired
    UserService userService;

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public Object say() {

//        return myLong;
//        return content;

        Object a = userService.getAll();
        return userService.getAll().get(0).toString();
    }
}

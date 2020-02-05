package com.wutong.wsk;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.wutong.wsk.mapper")
public class WskApplication {

    public static void main(String[] args) {
        SpringApplication.run(WskApplication.class, args);
        System.out.println("WSK启动成功");
    }

}

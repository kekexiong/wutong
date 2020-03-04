//package com.wutong.wsk.controller.system;
//
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//
//        // 定制授权规则
//        http.authorizeRequests().antMatchers("/").permitAll(). // 所有角色可访问
//                antMatchers("/springboot/**").hasAnyRole("admin", "test"). // 只有xx角色才能访问
//                antMatchers("/work/**").hasRole("admin"); // 只有xx角色才能访问
//    }
//}

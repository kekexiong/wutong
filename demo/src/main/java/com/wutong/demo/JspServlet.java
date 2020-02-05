package com.wutong.demo;


import org.springframework.boot.web.servlet.ServletComponentScan;

import javax.servlet.annotation.WebServlet;

@ServletComponentScan
@WebServlet(urlPatterns = "*.jsp",name = "JspServlet")
public class JspServlet extends org.apache.jasper.servlet.JspServlet{
}

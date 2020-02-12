package com.wutong.demo.config;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class YmlValue {

    @Value("${file.importpath}")
    public static  String FILE_IMPORT_PATH;
}

package com.wutong.demo.domain;
import lombok.Data;

/**
 * @description  TUserdomain
 * @author zhao_qg
 * @date   20200204 12:09:57
 * @review zhao_qg/2020-02-04
 */
@Data
public class TUser {
    /**
     * 名字
     */
    private String name;
    /**
     * 年龄
     */
    private String age;
    /**
     * 电话
     */
    private String tel;
}

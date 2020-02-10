package com.wutong.demo.domain;
import lombok.Data;

/**
 * @description  TUserdomain
 * @author zhao_qg
 * @date   20200209 21:35:09
 * @review zhao_qg/2020-02-09
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
    /**
     * 主键
     */
    private String uuid;
}

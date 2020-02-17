package com.wutong.wsk.domain;
import lombok.Data;

/**
 * @description TUserdomain
 * @author zhao_qg
 * @date 20200217 10:28:05
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

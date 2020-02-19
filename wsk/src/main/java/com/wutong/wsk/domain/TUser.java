package com.wutong.wsk.domain;
import lombok.Data;

/**
 * @description TUserdomain
 * @author zhao_qg
 * @date 20200218 17:47:58
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

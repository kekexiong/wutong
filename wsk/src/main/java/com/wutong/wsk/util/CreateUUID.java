package com.wutong.wsk.util;

import java.util.UUID;

public class CreateUUID {

    /**
     * @throws
     * @Description:使用JDK生成32为随机UUID
     * @param: @return
     * @return: String
     * @date 2014年7月9日下午5:10:28
     * @author zhang_haixiang
     */
    public static synchronized String GetRandomUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}

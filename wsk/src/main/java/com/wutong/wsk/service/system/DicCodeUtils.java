package com.wutong.wsk.service.system;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.support.hsf.HSFJSONUtils;
import com.wutong.wsk.domain.system.DicCode;
import com.wutong.wsk.mapper.system.DicCodeMapper;
import com.wutong.wsk.util.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * 项目字典 项目启动时增加
 *
 * @Author zhao_qg
 * @Date 12:16 2020/8/31
 */
@Service("dicCodeUtils")
public class DicCodeUtils implements CommandLineRunner {
    static final Logger LOGGER = LoggerFactory.getLogger(DicCodeUtils.class);
    /**
     *
     */
    public static HashMap<String, String> DIC_CODE_MAP = new HashMap<>();
    public static HashMap<String, List<Map<String, Object>>> DIC_CODE_MAP_KEY = new HashMap<>();
    private static Lock lock = new ReentrantLock();
    private static String upFlg = "";
    @Autowired
    private DicCodeMapper dicCodeMapper;

    private static String getCur() {
        return DateUtil.getCurTime("yyyyMMddHH");
    }

    public static String getCodeMap() {

        return JSON.toJSONString(DIC_CODE_MAP);
    }

    public void checkTcd() {
        String nowHH = getCur();
        if (!nowHH.equals(upFlg)) {
            if (lock.tryLock()) {
                LOGGER.info("{}开始加载加载字典表", nowHH);
                try {
                    init();
                    LOGGER.info("{}加载加载字典表完成", nowHH);
                } catch (Exception e) {
                    LOGGER.error("{}加载加载字典表异常", nowHH, e);
                } finally {
                    lock.unlock();
                }
            } else {
                LOGGER.info("{} - 加载字典表加载中", nowHH);
            }
        }
    }

    /**
     * 初始化
     *
     * @Author shanzhongxu
     * @Date 12:16 2017/8/31
     */
    public void init() throws Exception {
        loadCode();
        upFlg = getCur();
        LOGGER.info("{}加载加载字典表", DIC_CODE_MAP);
        LOGGER.info("字典加载完成！");
    }

    /**
     * 加载基于模式记账的tcd
     *
     * @throws Exception
     * @author: zhangjin[zhang_jin@suixingpay.com]
     * @date: 2018年5月4日 下午4:40:45
     */
    private void loadCode() throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("startRow", 0);
        map.put("endRow", 1000);
        map.put("dicCode", new DicCode());
        List<Map<String, Object>> codeList = dicCodeMapper.findByCondition(map);
        if (codeList != null && !codeList.isEmpty()) {
            HashMap<String, String> tempMap = new HashMap<>();
            codeList.forEach(tb -> {
                String codeKey = String.valueOf(tb.get("codeKey"));
                String codeValue = String.valueOf(tb.get("codeValue"));
                String codeName = String.valueOf(tb.get("codeName"));
                tempMap.put(codeKey+""+codeValue, codeName);
                if (DIC_CODE_MAP_KEY.get(codeKey)==null){
                    List<Map<String, Object>>  tempList = new ArrayList<>();
                    tempList.add(tb);
                    DIC_CODE_MAP_KEY.put(codeKey, tempList);
                }else{
                    List<Map<String, Object>>  tempList = DIC_CODE_MAP_KEY.get(codeKey);
                    tempList.add(tb);
                    DIC_CODE_MAP_KEY.put(codeKey, tempList);
                }
            });
            DIC_CODE_MAP = tempMap;
        } else {
            throw new Exception("未加载到任何字典表！！！");
        }
    }

    @Override
    public void run(String... args) throws Exception {
        init();
    }
}

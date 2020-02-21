package com.wutong.wsk.service.system;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wutong.wsk.domain.system.Menu;
import com.wutong.wsk.mapper.system.MenuMapper;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import com.wutong.wsk.util.FileUtil;
import com.wutong.wsk.domain.ImportError;
import com.wutong.wsk.util.ExcelUtils;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.wutong.wsk.util.UuidUtil;
import com.google.common.collect.Lists;
import com.wutong.wsk.util.DateUtil;
import com.wutong.wsk.util.LoginUtils;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @title  MenuService
 * @author zhao_qg
 * @date   20200221 21:58:07
 */
 @Service
public class MenuService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MenuService.class);
	
	@Autowired
	private MenuMapper menuMapper;

	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200221 21:58:07
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map) {
		return  menuMapper.findByCondition(map);
	}
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200221 21:58:07
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  menuMapper.findByConditionCount(map);
	}
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200221 21:58:07
	 * @param paramVo
	 * @return
	 */
	public Menu getByKey(Menu paramVo) {
		return  menuMapper.getByKey(paramVo);
	}

	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200221 21:58:07
	 * @param menu
	 * @return
	 */
	public int update(Menu menu) {
        menu.setUteUserNo(LoginUtils.getLoginName());
            menu.setUteDt(DateUtil.getDate());
		return  menuMapper.update(menu);
	}
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date   20200221 21:58:07
	 * @param menu
	 * @return
	 */
	public int insert(Menu menu) {
                menu.setCteUserNo(LoginUtils.getLoginName());
                    menu.setCteDt(DateUtil.getDate());
		return  menuMapper.insert(menu);
	}
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200221 21:58:07
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map) {
		return  menuMapper.delete(map);
	}
}
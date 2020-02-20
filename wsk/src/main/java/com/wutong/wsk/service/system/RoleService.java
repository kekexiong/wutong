package com.wutong.wsk.service.system;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.wutong.wsk.domain.system.Role;
import com.wutong.wsk.mapper.system.RoleMapper;
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
 * @title  RoleService
 * @author zhao_qg
 * @date   20200220 21:17:11
 */
 @Service
public class RoleService {

	private static final Logger LOGGER = LoggerFactory.getLogger(RoleService.class);
	
	@Autowired
	private RoleMapper roleMapper;

	/**
	 * 根据条件查询
	 * @author zhao_qg
 	 * @date   20200220 21:17:11
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map) {
		return  roleMapper.findByCondition(map);
	}
	/**
	 * 根据条件查询总数
	 * @author zhao_qg
 	 * @date   20200220 21:17:11
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  roleMapper.findByConditionCount(map);
	}
	/**
	 * 根据主键查询详细
	 * @author zhao_qg
 	 * @date   20200220 21:17:11
	 * @param paramVo
	 * @return
	 */
	public Role getByKey(Role paramVo) {
		return  roleMapper.getByKey(paramVo);
	}

	/**
	 * 更新
	 * @author zhao_qg
 	 * @date   20200220 21:17:11
	 * @param role
	 * @return
	 */
	public int update(Role role) {
        role.setUteUserNo(LoginUtils.getLoginName());
        role.setUteDt(DateUtil.getCurDT());
		return  roleMapper.update(role);
	}
	/**
	 * 插入
	 * @author zhao_qg
 	 * @date   20200220 21:17:11
	 * @param role
	 * @return
	 */
	public int insert(Role role) {
                role.setCteUserNo(LoginUtils.getLoginName());
                role.setCteDt(DateUtil.getCurDT());
		return  roleMapper.insert(role);
	}
	/**
	 * 根据主键删除
	 * @author zhao_qg
 	 * @date   20200220 21:17:11
	 * @param map
	 * @return
	 */
	public int delete(Map<String,Object> map) {
		return  roleMapper.delete(map);
	}
	/**
	 * 导出
	 * @param paramMap
	 * @return SXSSFWorkbook
	 * @throws Exception
     * @date:20200220 21:17:11
	 */
	public SXSSFWorkbook export(Map<String, Object> paramMap) throws Exception{
        int count = findByConditionCount(paramMap);
        int pageSize = 10000; //每次查询10000条
        List<Map<String, Object>> infoList;
        String[] tableName = {"角色ID","角色名称","权限集合","状态","部门ID","备注","创建人","创建日期","更新操作人","更新日期"};
        String[] tableValue = {"roleId","roleName","scope","sts","deptId","remarks","cteUserNo","cteDt","uteUserNo","uteDt"};
        SXSSFWorkbook swb = new SXSSFWorkbook(10000);
        int sheetContentCount = 1000000;
        int sheetCount = 0 == count % sheetContentCount ? count / sheetContentCount : count / sheetContentCount + 1;

        for (int i = 0; i < sheetCount; i++) {
            Sheet sheet = swb.createSheet("Sheet" + (i + 1));
            Row tableNameRow = sheet.createRow(0);
            for (int j = 0; j < tableName.length; j++) {
                tableNameRow.createCell(j).setCellValue(tableName[j]);
            }

            int queryCount = 0 == sheetContentCount % pageSize ? sheetContentCount / pageSize : sheetContentCount / pageSize + 1;
            for (int k = 0; k < queryCount; k++) {
                //循环查询
                paramMap.put("pageNumber", i * queryCount + k + 1);
                paramMap.put("pageSize", pageSize);
                infoList = findByCondition(paramMap);
                if (infoList.isEmpty()) {
                    break;
                }

                for (int l = 0; l < infoList.size(); l++) {

                    int curRows = k * pageSize + l + 1;
                    Row row = sheet.createRow(curRows);
                    Map<String, Object> content = infoList.get(l);

                    for (int m = 0; m < tableValue.length; m++) {
                        row.createCell(m).setCellValue(String.valueOf(content.get(tableValue[m])));
                    }
                    if (0 == curRows % pageSize) {
                        LOGGER.info("SXSSF已处理数据条数" + (curRows + i * sheetContentCount));
                    }
                }
                infoList.clear();
            }
        }
        return swb;
	}
}
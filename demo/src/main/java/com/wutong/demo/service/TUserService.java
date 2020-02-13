package com.wutong.demo.service;

import com.wutong.demo.domain.ImportError;
import com.wutong.demo.domain.TUser;
import com.wutong.demo.mapper.TUserMapper;
import com.wutong.demo.util.ExcelUtils;
import com.wutong.demo.util.FileUtil;
import com.wutong.demo.util.UuidUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author zhao_qg
 * @title TUserService
 * @date 20200212 18:19:54
 */
@Service
public class TUserService {

    private static final Logger LOGGER = LoggerFactory.getLogger(TUserService.class);

    @Autowired
    private TUserMapper tUserMapper;

    /**
     * 根据条件查询
     *
     * @param map
     * @return
     * @author zhao_qg
     * @date 20200212 18:19:54
     */
    public List<Map<String, Object>> findByCondition(Map<String, Object> map) {
        return tUserMapper.findByCondition(map);
    }

    /**
     * 根据条件查询总数
     *
     * @param map
     * @return
     * @author zhao_qg
     * @date 20200212 18:19:54
     */
    public int findByConditionCount(Map<String, Object> map) {
        return tUserMapper.findByConditionCount(map);
    }

    /**
     * 根据主键查询详细
     *
     * @param paramVo
     * @return
     * @author zhao_qg
     * @date 20200212 18:19:54
     */
    public TUser getByKey(TUser paramVo) {
        return tUserMapper.getByKey(paramVo);
    }

    /**
     * 更新
     *
     * @param tUser
     * @return
     * @author zhao_qg
     * @date 20200212 18:19:54
     */
    public int update(TUser tUser) {
        return tUserMapper.update(tUser);
    }

    /**
     * 插入
     *
     * @param tUser
     * @return
     * @author zhao_qg
     * @date 20200212 18:19:54
     */
    public int insert(TUser tUser) {
        return tUserMapper.insert(tUser);
    }

    /**
     * 根据主键删除
     *
     * @param map
     * @return
     * @author zhao_qg
     * @date 20200212 18:19:54
     */
    public int delete(Map<String, Object> map) {
        return tUserMapper.delete(map);
    }

    /**
     * @param request
     * @description:主页面导入功能
     * @return:Map<String, Object>
     * @author:zhao_qg
     * @date:
     */
    public Map<String, Object> batchOperate(HttpServletRequest request) {
        LOGGER.info("批量添加用户信息", "", "批量添加用户信息开始");
        Map<String, Object> map = new HashMap<String, Object>();//返回结果map
        //设置表头信息
        String[] fields = {"名字", "年龄", "电话"};
        //设置表头对应字段
        String[] columnName = {"name", "age", "tel"};
        //字段对应的长度限制
        int[] sizeLimit = {255, 3, 13};
        List<Map<String, Object>> dataMaps = new ArrayList<Map<String, Object>>();//创建一个存放读取Excel内容的list
        this.fileValid(request, fields, columnName, sizeLimit, dataMaps, map);
        map.put("msgCd", "MEC00000");
        if (!(Boolean) map.get("success")) {
            return map;
        }
        //遍历读取数据
        List<TUser> insertList = organizeData(dataMaps);
        List<TUser> subList;
        int insertCount = 1000;
        int result = 0;
        int insertSum = (dataMaps.size() % insertCount == 0) ? (dataMaps.size() / insertCount) : (dataMaps.size() / insertCount + 1);
        for (int i = 0; i < insertSum; i++) {
            subList = ExcelUtils.getChildList(i, insertSum, insertCount, insertList);
            result = i;
            LOGGER.info("批量添加用户信息", "", "批量添加用户信息结束");
            result = result + tUserMapper.insertBatch(subList);
        }
        map.put("msgCd", "MEC00000");
        map.put("msgInfo", "导入成功");
        map.put("successCount", result);
        LOGGER.info("#批量添加用户信息#批量导入添加成功#map:{}", map);
        return map;
    }

    /**
     * @param dataMaps
     * @description:读取Excel
     * @return:List<TUser>
     * @author:zhao_qg
     * @date:
     */
    public Map<String, Object> fileValid(HttpServletRequest request, String[] fields, String[] columnName, int[] sizeLimit, List<Map<String, Object>> dataMaps,
                                         Map<String, Object> map) {
        //获取上传文件
        FileUtil fileUtil = new FileUtil();
        InputStream input = fileUtil.getUploadInputStream(request, map);
        if (input == null) {
            LOGGER.info("批量操作用户信息", "", "获取上传的文件流失败");
            map.put("success", false);
            map.put("msgCd", "MEC99999");
            map.put("msgInfo", map.get("msg"));
            return map;
        }
        //检查文件是否超出范围
        XSSFWorkbook xwb = ExcelUtils.checkUploadExcel(input, map);
        if (xwb == null) {
            LOGGER.info("批量操作用户信息", "", "上传的文件有问题");
            map.put("success", false);
            map.put("msgCd", "MEC99999");
            map.put("msgInfo", map.get("msg"));
            return map;
        }

        // 读取excel
        List<ImportError> errorList = ExcelUtils.readExcel(xwb, fields, columnName, sizeLimit, dataMaps);
        if (errorList.size() > 0) {
            LOGGER.info("批量操作用户信息", "", "上传的文件有问题");
            map.put("success", false);
            map.put("msgCd", "MEC99999");
            map.put("msgInfo", "读取文件错误");
            if (!errorList.isEmpty()) {
                map.put("errorList", errorList);
                map.put("hasError", true);
            }
            return map;
        }
        if (dataMaps.size() == 0) {
            map.put("success", false);
            map.put("msgCd", "MEC99999");
            map.put("msgInfo", "导入excel文件无数据，请核对后再做操作！");
            return map;
        }
        map.put("success", true);
        return map;
    }

    /**
     * @param dataMaps
     * @description:读取Excel之后，保存数据
     * @return:List<TUser>
     * @author:zhao_qg
     * @date:
     */
    public List<TUser> organizeData(List<Map<String, Object>> dataMaps) {
        //返回list集合数据
        List<TUser> tUserList = new ArrayList<TUser>();
        for (int i = 0; i < dataMaps.size(); i++) {
            Map<String, Object> dataMap = dataMaps.get(i);
            TUser po = new TUser();
            po.setName(String.valueOf(dataMap.get("name")));
            po.setAge(String.valueOf(dataMap.get("age")));
            po.setTel(String.valueOf(dataMap.get("tel")));
            po.setUuid(UuidUtil.getUUID());
            tUserList.add(po);
        }
        return tUserList;
    }

    /**
     * @description:导入之后导出错误信息
     * @param erroList
     * @param loginName
     * @return:List<TUser>
     * @author:zhao_qg
     * @date:
     */
    public SXSSFWorkbook exportExcelFail(List<Map<String, Object>> erroList, String loginName) throws Exception {
        int count = erroList.size();
        int pageSize = 10000;
        List<Map<String, Object>> infoList;
        String[] tableName = {"错误位置", "插入值", "错误原因"};
        String[] tableValue = {"position", "importValue", "failReason"};
        SXSSFWorkbook swb = new SXSSFWorkbook(10000);
        Sheet sheet = swb.createSheet("Sheet");
        Row tableNameRow = sheet.createRow(0);
        for (int j = 0; j < tableName.length; j++) {
            tableNameRow.createCell(j).setCellValue(tableName[j]);
        }
        for (int k = 0; k < count; k++) {
            for (int l = 0; l < erroList.size(); l++) {

                int curRows = k + l + 1;
                Row row = sheet.createRow(curRows);
                Map<String, Object> content = erroList.get(l);

                for (int m = 0; m < tableValue.length; m++) {
                    row.createCell(m).setCellValue(String.valueOf(content.get(tableValue[m])));
                }
                if (0 == curRows % pageSize) {
                    LOGGER.info("SXSSF已处理数据条数" + erroList.size());
                }
            }
            erroList.clear();
        }
        return swb;
    }

    /**
     * 导出
     *
     * @param paramMap
     * @return
     * @throws Exception
     */
    public SXSSFWorkbook export(Map<String, Object> paramMap) throws Exception {
        int count = findByConditionCount(paramMap);
        int pageSize = 10000; //每次查询10000条
        List<Map<String, Object>> infoList;
        String[] tableName = {"名字", "年龄", "电话"};
        String[] tableValue = {"name", "age", "tel"};
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
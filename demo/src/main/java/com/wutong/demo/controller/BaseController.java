package com.wutong.demo.controller;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.HashMap;
import java.util.Map;

/**
 * @Title: AbstractController.java
 * @Package: com.trs.controller
 * @Description:公共Controller，随着需求添加通用方法
 * @author: fuwei
 * @date: 2014年3月13日
 * @version: V1.0
 */

public abstract class BaseController {

    public final String START = "0";
    public final String LIMIT = "10";

    /**
     * 设置查询返回信息
     *
     * @param list  返回结果集
     * @param count 查询记录数
     */
    protected Map<String, Object> setResult(Object list, int count) {
        Map<String, Object> rsMap = new HashMap<String, Object>(2);
        rsMap.put("items", list);
        rsMap.put("totalCount", count);
        return rsMap;
    }

    /**
     * 设置分页查询通用信息
     *
     * @param start 起始行号
     * @param limit 每页显示的行数
     * @return
     */
    protected Map<String, Object> setParams(int start, int limit) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("startRow", start);
        map.put("endRow", start + limit);
        return map;
    }

    /**
     * @param errors
     * @return Map<String                               ,                                                               Object>
     * @Title: setFailure
     * @Description: 设置操作失败信息
     * @return: Map<String                               ,                               Object>
     * @author: xingxin
     * @date: 2014年6月23日 下午4:43:28
     */
    protected Map<String, Object> setFailure(String errors) {
        Map<String, Object> rsMap = new HashMap<String, Object>();
        if (errors != null) {
            errors = errors.replaceAll(":", "： ").replaceAll("\"", "“ ").replaceAll("\r\n", "<br/> ").replaceAll("'", " ").replaceAll("\\\\", "/ ").replaceAll("\n", "<br/> ");
        }
        rsMap.put("success", false);
        rsMap.put("msg", errors);
        return rsMap;
    }

    /**
     * @param message
     * @return Map<String                               ,                                                               Object>
     * @Title: setSuccess
     * @Description: 设置操作成功信息
     * @return: Map<String                               ,                               Object>
     * @author: xingxin
     * @date: 2014年6月23日 下午4:43:28
     */
    protected Map<String, Object> setSuccess(String message) {
        Map<String, Object> rsMap = new HashMap<String, Object>();
        rsMap.put("success", true);
        rsMap.put("msg", message);
        return rsMap;
    }


    /**
     * 文件下载
     * @param file
     * @param response
     */
    protected void downloadFile(File file, HttpServletResponse response) {
        FileInputStream fileInputStream = null;
        try {
            fileInputStream = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        // 设置被下载而不是被打开
        response.setContentType("application/gorce-download");
        //Content-disposition其实可以控制用户请求所得的内容存为一个文件的时候提供一个默认的文件名，文件直接在浏览器上显示或者在访问时弹出文件下载对话框。
        response.addHeader("Content-disposition", "attachment;fileName=Delphine Mantoulet - Java.mp3");
        //NIO 实现
        int bufferSize = 1024 * 1024 * 2;
        FileChannel fileChannel = fileInputStream.getChannel();
        // 6x128 KB = 768KB byte buffer

        ByteBuffer buff = ByteBuffer.allocateDirect(1024 * 1024 * 4);
        byte[] byteArr = new byte[bufferSize];
        int nRead, nGet;

        try {
            while ((nRead = fileChannel.read(buff)) != -1) {
                if (nRead == 0) {
                    continue;
                }
                buff.position(0);
                buff.limit(nRead);
                while (buff.hasRemaining()) {
                    nGet = Math.min(buff.remaining(), bufferSize);
                    // read bytes from disk
                    buff.get(byteArr, 0, nGet);
                    // write bytes to output
                    response.getOutputStream().write(byteArr);
                }
                buff.clear();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            buff.clear();
//                fileChannel.close();
//                fileInputStream.close();
        }

    }

}
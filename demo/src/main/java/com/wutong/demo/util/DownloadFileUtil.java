package com.wutong.demo.util;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * describe: DownloadFileUtil
 */

public final class DownloadFileUtil {
    private static final Logger LOGGER = LoggerFactory.getLogger(DownloadFileUtil.class);
    public static final DownloadFileUtil INSTANCE = new DownloadFileUtil();

    private DownloadFileUtil() {

    }

    public static DownloadFileUtil getInstance() {
        return INSTANCE;
    }

    /**
     * 文件下载
     *
     * @param file
     * @param response
     */
    public void downLoad(File file, HttpServletResponse response) throws IOException {

        if (null != file) {
            String fileName = file.getName();
            OutputStream out = null;
            InputStream in = null;
            try {
                byte[] b = fileName.getBytes("GBK");
                fileName = new String(b, "8859_1");
                in = new BufferedInputStream(new FileInputStream(file));
                byte[] buffer = new byte[in.available()];
                int count = in.read(buffer);
                response.reset();
                response.setHeader("content-disposition", "attachment; filename=" + fileName);
                out = new BufferedOutputStream(response.getOutputStream());
                out.write(buffer);
            } catch (IOException e) {
                LOGGER.error("异常", e);
            } finally {
                if (null != in) {
                    try {
                        in.close();
                    } catch (Exception e) {
                        LOGGER.error("文件下载资源关闭异常", e);
                    }
                }
                if (null != out) {
                    try {
                        out.close();
                    } catch (Exception e) {
                        LOGGER.error("文件下载资源关闭异常", e);
                    }
                }

            }
        }
    }


    /**
     * 文件下载
     *
     * @param file
     * @param response
     */
    public void downLoad(File file, String fileName, HttpServletResponse response) throws IOException {
        if (null != file) {
            OutputStream out = null;
            InputStream in = null;
            try {
                byte[] b = fileName.getBytes("GBK");
                fileName = new String(b, "8859_1");
                in = new BufferedInputStream(new FileInputStream(file));
                byte[] buffer = new byte[in.available()];
                int count = in.read(buffer);
                response.reset();
                response.setHeader("content-disposition", "attachment; filename=" + fileName);
                out = new BufferedOutputStream(response.getOutputStream());
                out.write(buffer);

            } catch (IOException e) {
                LOGGER.error("异常", e);
            } finally {
                if (null != in) {
                    try {
                        in.close();
                    } catch (Exception e) {
                        LOGGER.error("文件下载资源关闭异常", e);
                    }
                }
                if (null != out) {
                    try {
                        out.close();
                    } catch (Exception e) {
                        LOGGER.error("文件下载资源关闭异常", e);
                    }
                }
            }
        }
    }

    /**
     * 下载excel文件,并且服务器上不生成文件
     * zqg 2020-07-18
     *
     * @param wb
     * @param fileName
     * @param response
     */

    public void downLoadExcel(Workbook wb, String fileName, HttpServletResponse response) throws IOException {
        if (wb != null) {
            BufferedOutputStream out = null;
            try {
                fileName = fileName == null ? "" : fileName;
                byte[] b = fileName.getBytes("GBK");
                fileName = new String(b, "8859_1");
                response.reset();
                response.setContentType("application/x-msdownload");
                response.setHeader("Content-disposition", "attachment;filename=" + fileName);
                response.setCharacterEncoding("utf-8");
                out = new BufferedOutputStream(response.getOutputStream());
                wb.write(out);
                out.flush();
                out.close();
            } catch (IOException e) {
                LOGGER.error("异常", e);
            } finally {
                if (null != out) {
                    out.close();
                }
                if (wb instanceof SXSSFWorkbook) {
                    ((SXSSFWorkbook) wb).dispose();
                }
            }
        }
    }
}

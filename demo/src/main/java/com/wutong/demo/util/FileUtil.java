/**
 * Description 文件操作工具类
 */
package com.wutong.demo.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * describe: FileUtil工具类
 */
public class FileUtil {
    static Logger logger = LoggerFactory.getLogger(FileUtil.class);

    public FileUtil() {
    }

    public static void rename(String oldFileName, String newFileName) {
        File newFile = new File(newFileName);
        File oldFile = new File(oldFileName);
        if (!newFile.getName().equals(oldFile.getName())) {
            boolean isSuc = newFile.delete();
            if (!isSuc) {
                logger.info("删除失败: " + newFileName);
            }

            isSuc = oldFile.renameTo(newFile);
            if (!isSuc) {
                logger.info("重命名失败: oldFileName=" + oldFileName + ", newFileName=" + newFileName);
            }

            isSuc = oldFile.delete();
            if (!isSuc) {
                logger.info("删除失败: " + oldFileName);
            }
        }
    }

    public InputStream getUploadInputStream(HttpServletRequest request, Map<String, Object> msg) {
        MultipartHttpServletRequest mulRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = mulRequest.getFile("file");
        //6*1024*1024
        if (file.getSize() > 6291456) {
            msg.put("msg", "文件大于6M！");
            return null;
        }
        String filename = file.getOriginalFilename();
        if (!filename.substring(filename.length() - 5).equals(".xlsx")) {
            msg.put("msg", "文件格式错误，请导入07+版本EXCEL文件！!！");
            return null;
        }
        try {
            InputStream input = file.getInputStream();
            return input;
        } catch (IOException e) {
            logger.info("批量添加的文件上传 获取流异常,上传文件名:{}", filename);
            logger.error("异常信息", e);
            msg.put("msg", "获取信息流异常！");
            return null;
        }
    }

    public static InputStream getFileStream(String filename) {
        return FileUtil.class.getClassLoader().getResourceAsStream(filename);
    }

    /**
     * @param filePath
     * @throws IOException
     * @Title: mkdirs
     * @Description: 创建文件路径
     * @return: boolean
     * @author: xingxin
     * @date: 2014年11月10日 下午3:30:31
     */
    public static boolean mkdirs(String filePath) throws IOException {
        boolean bMkdirs = false;
        File file = new File(filePath);
        if (!file.exists()) {
            bMkdirs = file.mkdirs();
            if (!bMkdirs) {
                throw new IOException("创建文件路径失败:" + filePath);
            }
        }
        return bMkdirs;
    }

    /**
     * 压缩文件
     *
     * @param directory
     * @param zipFile
     */
    public static void zip(String directory, String zipFile) {
        ZipOutputStream zos = null;
        try {
            zipFile = zipFile.replaceAll("\\\\", "/");
            int lastPos = zipFile.lastIndexOf('/');
            String zipDir = zipFile.substring(0, lastPos);
            new File(zipDir).mkdirs();
            zos = new ZipOutputStream(new FileOutputStream(zipFile));
            fileZip(zos, new File(directory));
        } catch (Exception e) {
            logger.error("异常信息", e);
        } finally {
            try {
                if (zos != null) {
                    zos.close();
                }
            } catch (IOException e) {
                logger.error("zos关闭资源异常{}", e);
            }
        }
    }


    private static void directoryZip(ZipOutputStream out, File f, String base) {
        FileInputStream in = null;
        try {
            if (f.isDirectory()) {
                File[] fl = f.listFiles();
                out.putNextEntry(new ZipEntry(base + "/"));
                if (base.length() == 0) {
                    base = "";
                } else {
                    base = base + "/";
                }
                for (int i = 0; i < fl.length; i++) {
                    directoryZip(out, fl[i], base + fl[i].getName());
                }
            } else {
                out.putNextEntry(new ZipEntry(base));
                in = new FileInputStream(f);
                byte[] bb = new byte[2048];
                int aa = 0;
                while ((aa = in.read(bb)) != -1) {
                    out.write(bb, 0, aa);
                }
            }
        } catch (Exception e) {
            logger.error("directoryZip异常{}", e);
        } finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (IOException e) {
                logger.error("in关闭异常{}", e);
            }
        }
    }

    /**
     * 压缩文件(File对象)
     *
     * @param zos
     * @param file
     * @throws Exception
     */
    private static void fileZip(ZipOutputStream zos, File file) {
        FileInputStream fis = null;
        try {
            if (file.isFile()) {
                zos.putNextEntry(new ZipEntry(file.getName()));
                fis = new FileInputStream(file);
                byte[] bb = new byte[2048];
                int aa = 0;
                while ((aa = fis.read(bb)) != -1) {
                    zos.write(bb, 0, aa);
                }
            } else {
                directoryZip(zos, file, "");
            }
        } catch (Exception e) {
            logger.error("压缩文件异常{}", e);
        } finally {
            try {
                if (null != fis) {
                    fis.close();
                }
            } catch (IOException e) {
                logger.error("fis关闭异常{}", e);
            }
        }
    }
}

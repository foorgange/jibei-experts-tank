package com.jd.tecachieve.Utils;

import com.jd.tecachieve.Config.ExportConfig;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import sun.misc.BASE64Encoder;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

@Component
public class DocUtil {

    @Autowired
    ExportConfig exportConfig;

    private Configuration configuration = null;

    public DocUtil() {
        configuration = new Configuration();
        configuration.setDefaultEncoding("UTF-8");
    }

    public void createWord(Map<String, Object> dataMap, String templateName, File filePath) throws Exception {
        //资源上传路径
        System.out.println(System.getProperty("user.dir"));
        System.out.println(exportConfig.getTemplatePath());
        configuration.setDirectoryForTemplateLoading(new File(System.getProperty("user.dir") + exportConfig.getTemplatePath())); // FTL文件所存在的位置

        configuration.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);

        Template t = null;
        try {
            t = configuration.getTemplate(templateName); // 文件名
        } catch (IOException e) {
            e.printStackTrace();
        }

        Writer out = null;
        try {
            out = new BufferedWriter(new OutputStreamWriter(Files.newOutputStream(filePath.toPath()), StandardCharsets.UTF_8));
        } catch (Exception e1) {
            e1.printStackTrace();
        }
        try {
            assert t != null;
            t.process(dataMap, out);
            assert out != null;
            out.close();
        } catch (TemplateException | IOException e) {
            e.printStackTrace();
        }
    }

    public static String getImageBase64Code(String imgFilePath){
        if (new File(imgFilePath).exists()){//判断图片是否存在
            InputStream in = null;
            byte[] data = null;

            try {
                in = Files.newInputStream(Paths.get(imgFilePath));
                data = new byte[in.available()];

                in.read(data);
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            //返回图片的 base64码
            BASE64Encoder encoder = new BASE64Encoder();
            return encoder.encode(data);
        }else {
            return null;
        }
    }

    // 判断文件是否存在
    public static boolean judeFileExists(File file) {

        if (file.exists()) {
            System.out.println("file exists");
            return false;
        } else {
            System.out.println("file not exists, create it ...");

            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
            return true;
        }
    }

    // 判断文件夹是否存在
    public static void judeDirExists(File file) {

        if (file.exists()) {
            if (file.isDirectory()) {
                System.out.println("dir exists");
            } else {
                System.out.println("the same name file exists, can not create dir");
            }
        } else {
            System.out.println("dir not exists, create it ...");
            file.mkdir();
        }

    }

    public static void download(HttpServletResponse response, String fileUrl, String fileName) {
        java.io.BufferedInputStream bis = null;
        java.io.BufferedOutputStream bos = null;
        try {
            // 客户使用保存文件的对话框：
            fileUrl = fileUrl + fileName;
            //fileUrl = new String((fileUrl + fileName).getBytes("utf-8"), "utf-8");
            //String userAgent = request.getHeader("User-Agent");
            //byte[] bytes = userAgent.contains("MSIE") ? fileName.getBytes() : fileName.getBytes("UTF-8");// fileName.getBytes("UTF-8")处理safari的乱码问题
            //fileName = new String(bytes, "ISO-8859-1");// 各浏览器基本都支持ISO编码

            response.setContentType("multipart/form-data");
            response.setCharacterEncoding("utf-8");
            response.setHeader("Content-disposition", "attachment; filename=" + java.net.URLEncoder.encode(fileName, "UTF-8"));
            // 通知客户文件的MIME类型：
            bis = new java.io.BufferedInputStream(new java.io.FileInputStream((fileUrl)));
            bos = new java.io.BufferedOutputStream(response.getOutputStream());
            byte[] buff = new byte[2048];
            int bytesRead;
            int i = 0;

            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
                i++;
            }
            bos.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (bis != null) {
                try {
                    bis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                bis = null;
            }
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                bos = null;
            }
        }
    }
}

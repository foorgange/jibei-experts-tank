package com.jb.property.controller;

import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.framework.config.ServerConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;


@Slf4j
@RestController
@RequestMapping("/file")
public class FileOperationController {

    @Autowired
    private ServerConfig serverConfig;

    /**
     * 下载请求
     *
     * @param fileName 文件名称
     * @param delete 是否删除
     */
    @GetMapping("/download")
    public void fileDownload(String fileName, Boolean delete, HttpServletResponse response, HttpServletRequest request) {
        try {
            if (!FileUtils.checkAllowDownload(fileName)) {
                throw new Exception(StringUtils.format("文件名称({})非法，不允许下载。 ", fileName));
            }
            String realFileName = fileName.substring(fileName.indexOf("_") + 1);
            String filePath = RuoYiConfig.getDownloadPath() + fileName;

            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, realFileName);
            FileUtils.writeBytes(filePath, response.getOutputStream());
            if (delete) {
                FileUtils.deleteFile(filePath);
            }
        } catch (Exception e) {
            log.error("下载文件失败", e);
        }
    }

    /**
     * 上传请求
     */
    @PostMapping("/upload/{college}")
    public AjaxResult uploadFile(@RequestParam("file") MultipartFile file, @PathVariable(value = "college") String college) throws Exception {
        // 项目本地路径
        String localPath = System.getProperty("user.dir");
        System.out.println("localPath    " + localPath);

        //资源上传路径
        String uploadPath = RuoYiConfig.getProfile();
        System.out.println("uploadPath    " + uploadPath);

        //文件绝对路径：项目本地路径 + 资源上传路径 + 数据库资源地址
        String finalPath = localPath + uploadPath + "/" + college;
        System.out.println("finalPath    " + finalPath);

        //获取上传的文件名字
        String originalFileName = file.getOriginalFilename();
        System.out.println("----------上传文件名称为：" + originalFileName);

        assert originalFileName != null;
        File newFile = new File(finalPath, originalFileName);

        //获得文件目录，判断是否存在
        if(!newFile.getParentFile().exists()) {
            //如果path路径不存在，创建一个文件夹，存在则使用当前文件夹
            newFile.getParentFile().mkdirs();
        }

        //保存文件到指定路径之中
        file.transferTo(newFile);
        return AjaxResult.success("/" + college + "/" + originalFileName);
    }

    /**
     * 本地资源下载
     */
    @GetMapping("/download/resource")
    public void resourceDownload(String resource, HttpServletResponse response) {
        try {
            if (!FileUtils.checkAllowDownload(resource)) {
                throw new Exception(StringUtils.format("资源文件({})非法，不允许下载。 ", resource));
            }
            // 项目本地路径
            String localPath = System.getProperty("user.dir");
            System.out.println("localPath    " + localPath);

            //资源上传路径
            String uploadPath = RuoYiConfig.getProfile();
            System.out.println("uploadPath    " + uploadPath);

            //数据库资源地址（filePath）
            System.out.println("resource    " + resource);

            //文件绝对路径：项目本地路径 + 资源上传路径 + 数据库资源地址
            String downloadPath = localPath + uploadPath + StringUtils.substringAfter(resource, Constants.RESOURCE_PREFIX);
            System.out.println("downloadPath    " + downloadPath);

            // 下载名称？作用未知
            String downloadName = StringUtils.substringAfterLast(downloadPath, "/");
            System.out.println("downloadName    " + downloadName);

            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, downloadName);
            FileUtils.writeBytes(downloadPath, response.getOutputStream());
        } catch (Exception e) {
            log.error("下载文件失败", e);
        }
    }
}

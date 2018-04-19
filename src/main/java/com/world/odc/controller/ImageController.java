package com.world.odc.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.Charset;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.world.odc.common.AjaxResult;
import com.world.odc.common.AttachmentType;
import com.world.odc.common.Constants;
import com.world.odc.model.domain.Attachment;
import com.world.odc.model.domain.Image;
import com.world.odc.model.domain.Product;
import com.world.odc.service.ImageService;


@Controller
@RequestMapping("/image")
public class ImageController {

    Logger logger = LoggerFactory.getLogger(ImageController.class);

    @Autowired
    ImageService imageService;

    /**
     * 上传
     *
     * @param type
     * @param member
     * @param multipartFile
     * @return
     */
    @PostMapping(value = "/upload")
    @ResponseBody
    public AjaxResult upload(@RequestParam(defaultValue = "PUBLIC") AttachmentType type,
                             @SessionAttribute(Constants.SESSION_MEMBER_KEY) Product product,
                             @RequestParam("file") MultipartFile multipartFile) {

        try {
            //将通用方法，抽成服务，供其他地方调用
            Image img = imageService.saveFile(product, type, multipartFile);
            return new AjaxResult().setData(img);
        } catch (Exception e) {
            return new AjaxResult(false, e.getMessage());
        }
    }

    /**
     * 显示或下载文件
     *
     * @param request
     * @return
     */
    @GetMapping("/**")
    @ResponseBody
    public ResponseEntity<Resource> loadFile(HttpServletRequest request) {
        String path = request.getServletPath();
        try {
            Image img = imageService.getFile(path);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentDispositionFormData("attachment", img.getOriginalName(), Charset.forName("utf-8"));
            headers.setContentType(MediaType.parseMediaType(img.getContentType()));
            headers.setContentLength(img.getFileSize());
            return ResponseEntity.ok().headers(headers).body(new UrlResource(img.getFile().toURI()));
        } catch (FileNotFoundException e) {
            logger.error("文件不存在{}", path);
            return ResponseEntity.notFound().build();
        } catch (IOException e) {
            logger.error("下载文件失败{}", path);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}

package com.world.odc.controller;

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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.world.odc.common.AjaxResult;
import com.world.odc.common.AttachmentType;
import com.world.odc.common.Constants;
import com.world.odc.model.domain.Attachment;
import com.world.odc.model.domain.Member;
import com.world.odc.service.AttachmentService;

import javax.servlet.http.HttpServletRequest;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.Charset;

/**
 * <p>****************************************************************************</p>
 * <p><b>Copyright © 2010-2017 soho team All Rights Reserved<b></p>
 * <ul style="margin:15px;">
 * <li>Description : 附件处理</li>
 * <li>Version     : 1.0</li>
 * <li>Creation    : 2017年07月12日</li>
 * <li>Author      : 郭华</li>
 * </ul>
 * <p>****************************************************************************</p>
 */
@Controller
@RequestMapping("/attachment")
public class AttachmentController {

    Logger logger = LoggerFactory.getLogger(AttachmentController.class);

    @Autowired
    AttachmentService attachmentService;

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
                             @SessionAttribute(Constants.SESSION_MEMBER_KEY) Member member,
                             @RequestParam("file") MultipartFile multipartFile) {

        try {
            //将通用方法，抽成服务，供其他地方调用
            Attachment att = attachmentService.saveFile(member, type, multipartFile);
            return new AjaxResult().setData(att);
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
            Attachment att = attachmentService.getFile(path);
            HttpHeaders headers = new HttpHeaders();
            headers.setContentDispositionFormData("attachment", att.getOriginalName(), Charset.forName("utf-8"));
            headers.setContentType(MediaType.parseMediaType(att.getContentType()));
            headers.setContentLength(att.getFileSize());
            return ResponseEntity.ok().headers(headers).body(new UrlResource(att.getFile().toURI()));
        } catch (FileNotFoundException e) {
            logger.error("文件不存在{}", path);
            return ResponseEntity.notFound().build();
        } catch (IOException e) {
            logger.error("下载文件失败{}", path);
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}

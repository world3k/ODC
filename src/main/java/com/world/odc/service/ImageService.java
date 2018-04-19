package com.world.odc.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.world.odc.common.AttachmentType;
import com.world.odc.model.dao.ImageDao;
import com.world.odc.model.domain.Image;
import com.world.odc.model.domain.Product;


@Service
@Transactional(readOnly = true)
public class ImageService {

    Logger logger = Logger.getLogger(ImageService.class);

    @Autowired
    ImageDao imageDao;

    /**
     * 可以在配置文件，配置附件存储目录
     */
///    @Value("${crm.image.root-path}")
    private String rootPath;

    private String separator = File.separator;

  ///  @Value("${crm.attachment.allow-file-type}")
    private String allowFileType;

    /**
     * 存储附件
     *
     * @param member
     * @param type
     * @param multipartFile
     * @return
     * @throws Exception
     */
    @Transactional
    public Image saveFile(Product product, AttachmentType type, MultipartFile multipartFile) throws Exception {
        //判断文件是否允许呗
        if (this.getAllowFileType().contains("." + FilenameUtils.getExtension(multipartFile.getOriginalFilename()))) {

            Image img = new Image();
            img.setProduct(product);
            img.setOriginalName(multipartFile.getOriginalFilename());
            img.setFileSize(multipartFile.getSize());
            img.setSuffix(FilenameUtils.getExtension(img.getOriginalName()));
            img.setContentType(multipartFile.getContentType());
            img.setType(type);

            //新文件名
            String fileName = UUID.randomUUID().toString().toLowerCase() + "." + img.getSuffix();
            //文件的存储的相对路径
            String filePath = this.getSaveRootPath(type) + fileName;

            try {
                //将文件存储到实际存储目录中
                Files.copy(multipartFile.getInputStream(), this.getRootPath().resolve(filePath));
                img.setFilePath("/attachment/" + filePath);

                imageDao.save(img);
                return img;
            } catch (Exception e) {
                logger.error("上传文件存储失败！", e);
                throw new Exception("上传文件存储失败", e);
            }
        } else {
            throw new Exception("对不起，不支持上传此类型文件！");
        }
    }

    /**
     * 获取附件文件
     *
     * @param filePath
     * @return
     * @throws FileNotFoundException
     */
    public Image getFile(String filePath) throws FileNotFoundException {
        Image img = imageDao.findByFilePath(filePath);
        File file = this.getRootPath().resolve(filePath.substring("/attachment/".length())).toFile();
        if (img == null || !file.exists()) {
            throw new FileNotFoundException("文件不存在");
        }
        img.setFile(file);
        return img;
    }

    /**
     * 清除用户无用头像
     *
     * @param member
     */
    public void clearAvatar(Product product) {
        //获取到非当前头像的历史头像记录
        List<Image> avatars = imageDao.findByFilePathIsNotAndProductAndType(product.getAvatar(), product, AttachmentType.AVATAR);
        //物理删除
        avatars.forEach((Image item) -> {
            try {
                FileUtils.forceDelete(getRootPath().resolve(item.getFilePath().substring("/attachment/".length())).toFile());
            } catch (IOException e) {
                logger.error("头像删除失败：" + item, e);
            }
        });
        //数据库删除
        imageDao.delete(avatars);
    }

    /**
     * 获取文件存储的绝对路径
     *
     * @param type
     * @return
     */
    private String getSaveRootPath(AttachmentType type) {
        //附件按照类型和年月分目录存储，至于为什么，是考虑目录文件检索效率问题
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy" + separator + "MM");
        //实际文件存储路径
        String path = type.name().toLowerCase() + separator + sdf.format(new Date()) + separator;

        //判断存储路径是否已经存在，不存在则需要先创建出来

        File f = getRootPath().resolve(path).toFile();
        if (!f.exists()) {
            try {
                FileUtils.forceMkdir(f);
            } catch (IOException e) {
                logger.error("创建存储目录失败！", e);
            }
        }

        return path;
    }

    /**
     * 获取根路径
     *
     * @return
     */
    private Path getRootPath() {
        if (StringUtils.isEmpty(rootPath)) {
            //如果没有设置附件存储根目录，这默认存储到系统用户目录中
            rootPath = FilenameUtils.concat(FileUtils.getUserDirectoryPath(), "crm_attachments");
        }

        return Paths.get(rootPath);
    }

    /**
     * 允许上传的文件类型
     *
     * @return
     */
    private List<String> getAllowFileType() {
        if (StringUtils.isEmpty(allowFileType)) {
            allowFileType = ".jpg,.png,.gif,.bmp,.jpeg,.zip,.rar";
        }
        return Arrays.asList(StringUtils.split(allowFileType, ","));
    }
}

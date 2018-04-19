package com.world.odc.model.dao;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import com.world.odc.common.AttachmentType;
import com.world.odc.model.domain.Image;
import com.world.odc.model.domain.Product;

@Repository
public interface ImageDao extends PagingAndSortingRepository<Image, Long> {
    Image findByFilePath(String filePath);

    List<Image> findByFilePathIsNotAndProductAndType(String filePath, Product product, AttachmentType type);

}

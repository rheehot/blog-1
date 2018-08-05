package com.sang12.blog.service.common.impl;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sang12.blog.service.common.StorageService;
import com.sang12.blog.utils.UploadFileUtils;

/**
 * com.sang12.blog.service.common.impl
 * StorageServiceImpl.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 8. 5.
 * @Description : 구현체
 */

@Service
public class StorageServiceImpl implements StorageService{
	@Value("${static.resource.savePath}")
	String resourceSavePath;
	
	@Override
	public String imageStore(MultipartFile paramMultipartFile) {
		String saveFileName = null;
		try {
			saveFileName = UploadFileUtils.fileSave(this.resourceSavePath, paramMultipartFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return saveFileName;
	}

}

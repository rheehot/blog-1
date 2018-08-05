package com.sang12.blog.service.common;

import org.springframework.web.multipart.MultipartFile;

/**
 * com.sang12.blog.service.common
 * StorageService.java
 * 
 * @author Choi Sang Il
 * @Date 2018. 8. 5.
 * @Description : 저장관련 서비스
 */
public interface StorageService {
	public String imageStore(MultipartFile paramMultipartFile);
}

package com.itzl.service;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.itzl.pojo.News;

public interface FileUploadService {
	public News newsUpload(News news,CommonsMultipartFile img)throws Exception;
}

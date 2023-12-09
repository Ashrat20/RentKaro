package com.spring.mvc.service;

import java.util.List;

import com.spring.mvc.model.ImageItem;

public interface ImageItemServiceInterface {
	void saveImageItem(ImageItem imageItem);
	public List<ImageItem> getAllimg();
}

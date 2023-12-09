package com.spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mvc.dao.ImageItemRepository;
import com.spring.mvc.model.ImageItem;

@Service
public class ImageItemService implements ImageItemServiceInterface {
	
	@Autowired
    private ImageItemRepository imagerepo;
    
	@Override
    public void saveImageItem(ImageItem imageItem) {
		imagerepo.save(imageItem);
	}

	public List<ImageItem> getAllimg() {
		return imagerepo.findAll();
	}
}

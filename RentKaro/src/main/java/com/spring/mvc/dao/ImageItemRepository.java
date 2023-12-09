package com.spring.mvc.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.mvc.model.ImageItem;

@Repository
public interface ImageItemRepository extends JpaRepository<ImageItem, Integer>{

}

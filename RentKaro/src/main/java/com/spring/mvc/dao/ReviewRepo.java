package com.spring.mvc.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.mvc.model.Property;
import com.spring.mvc.model.Review;

@Repository
public interface ReviewRepo extends JpaRepository<Review,Integer> {
	 List<Review> findByProperty(Property property);
}

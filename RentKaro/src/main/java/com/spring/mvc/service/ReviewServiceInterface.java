package com.spring.mvc.service;

import java.util.List;

import com.spring.mvc.model.Property;
import com.spring.mvc.model.Review;

public interface ReviewServiceInterface {
	public void save(Review review);
	public List<Review> getReviewsForProperty(Property property);

}

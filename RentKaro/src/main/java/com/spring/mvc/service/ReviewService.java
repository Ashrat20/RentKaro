package com.spring.mvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mvc.dao.ReviewRepo;
import com.spring.mvc.dao.TenantRepo;
import com.spring.mvc.model.Property;
import com.spring.mvc.model.Review;
import com.spring.mvc.model.Tenant;

@Service
public class ReviewService implements ReviewServiceInterface{
	
	@Autowired
	private TenantRepo trepo;
	
	@Autowired
	private ReviewRepo rvrepo;
	

	public void save(Review review) {
		String name = review.getTenant().getName();
		Tenant tenant = trepo.findByname(name);
		review.setTenant(tenant);
		review.getProperty().getProp_id();
		rvrepo.save(review);	
	}
	public List<Review> getReviewsForProperty(Property property) {
        return rvrepo.findByProperty(property);
    }
}

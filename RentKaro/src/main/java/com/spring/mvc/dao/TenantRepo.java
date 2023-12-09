package com.spring.mvc.dao;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.mvc.model.Review;
import com.spring.mvc.model.Tenant;

@Repository
public interface TenantRepo extends JpaRepository<Tenant,Integer>{

	Optional<Tenant> findByEmail(String email);
	Tenant findByname(String name);
	void save(Review review);

}

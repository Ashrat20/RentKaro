package com.spring.mvc.dao;


import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.mvc.model.Owner;

@Repository
public interface OwnerRepo extends JpaRepository<Owner,Integer> 
{
	Optional<Owner> findByEmail(String email);
	
	Owner findByname(String name);
}

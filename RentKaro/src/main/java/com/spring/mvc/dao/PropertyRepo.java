package com.spring.mvc.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.spring.mvc.model.Owner;
import com.spring.mvc.model.Property;

@Repository
public interface PropertyRepo extends JpaRepository<Property,Integer> {
	
	@Query(value="select * from property where prop_type=? and prop_location=?",nativeQuery = true)
	List<Property> findByTypeAndLocation(String type, String location);
	
	Property findById(int propertyId);
	
	List<Property> findByOwner(Owner owner);

	void deleteById(int propertyId);

}

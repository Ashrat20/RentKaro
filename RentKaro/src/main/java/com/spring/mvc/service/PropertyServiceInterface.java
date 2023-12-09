package com.spring.mvc.service;

import java.util.List;

import com.spring.mvc.model.Property;

public interface PropertyServiceInterface {
	public void saveProperty(Property property);
	public List<Property> getAllProperties();	
	public List<Property> searchProperties(String propType, String propLocation);
	Property getPropertyById(int propertyId);	
	public void deletePropertyById(int propertyId);
	public void updateProperty(int propertyId, Property updatedProperty);
}

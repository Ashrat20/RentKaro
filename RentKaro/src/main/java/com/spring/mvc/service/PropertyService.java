package com.spring.mvc.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mvc.dao.OwnerRepo;
import com.spring.mvc.dao.PropertyRepo;
import com.spring.mvc.model.Owner;
import com.spring.mvc.model.Property;

@Service
public class PropertyService implements PropertyServiceInterface{
	
	@Autowired
	private PropertyRepo prepo;
	
	@Autowired
	private OwnerRepo orepo;

	List<Property> list = new ArrayList<Property>();
	 @Override
		public void saveProperty(Property property) {
		 String username = property.getOwner().getName();
	     Owner owner = orepo.findByname(username);
	     property.setOwner(owner);
			property.setDate_of_list(new Date());
			prepo.save(property);
		}
	    

	public List<Property> getAllProperties() {
	        return prepo.findAll();
	 }


	public List<Property> searchProperties(String propType, String propLocation) {
        return prepo.findByTypeAndLocation(propType, propLocation);
    }
	
	@Override
	public Property getPropertyById(int propertyId) {
		return prepo.findById(propertyId);
	}
	
	public void deletePropertyById(int propertyId) {
        prepo.deleteById(propertyId);
    }

	public void updateProperty(int propertyId, Property updatedProperty) {
        Property existingProperty = prepo.findById(propertyId);
        if (existingProperty != null) {
            existingProperty.setProp_title(updatedProperty.getProp_title());;
            existingProperty.setProp_description(updatedProperty.getProp_description());
            existingProperty.setProp_address(updatedProperty.getProp_address());
            existingProperty.setProp_area(updatedProperty.getProp_area());
            existingProperty.setProp_price(updatedProperty.getProp_price());
            existingProperty.setStatus(updatedProperty.getStatus());
            prepo.save(existingProperty); // Save the changes
        }
    }

	
	    
	
	
}

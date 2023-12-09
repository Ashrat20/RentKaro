package com.spring.mvc.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mvc.dao.OwnerRepo;
import com.spring.mvc.dao.PropertyRepo;
import com.spring.mvc.model.Owner;
import com.spring.mvc.model.Property;

@Service
public class OwnerService implements OwnerServiceInterface
{
	@Autowired
	private OwnerRepo orepo;
	
	@Autowired
	private PropertyRepo prepo;
	
	public void addOwner(Owner obj) 
	{
		orepo.save(obj);
	}
	
	public Owner getOwnerByEmail(String email)
	{
		return orepo.findByEmail(email).orElse(null);	
	}

	@Override
    public Owner getOwnerByName(String name) {
        return orepo.findByname(name);
    }

	 public List<Property> getPropertiesForOwner(Owner owner) {
	        return prepo.findByOwner(owner);
	 }
}

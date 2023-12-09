package com.spring.mvc.service;

import com.spring.mvc.model.Owner;

public interface OwnerServiceInterface 
{
	public void addOwner(Owner obj);
	public Owner getOwnerByEmail(String email);
	public Owner getOwnerByName(String name);
}

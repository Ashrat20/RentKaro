package com.spring.mvc.service;

import com.spring.mvc.model.Tenant;

public interface TenantServiceInterface 
{
	public void addTenant(Tenant tobj);
	public Tenant getTenantByEmail(String email);
	public Tenant getTenantByName(String name);

}

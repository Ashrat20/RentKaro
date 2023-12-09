package com.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mvc.dao.TenantRepo;
import com.spring.mvc.model.Tenant;



@Service
public class TenantService implements TenantServiceInterface
{
	@Autowired
	private TenantRepo trepo;
	
	public void addTenant(Tenant tobj) 
	{
		trepo.save(tobj);
	}

	public Tenant getTenantByEmail(String email) {
		
		return trepo.findByEmail(email).orElse(null);	
	}
	public Tenant getTenantByName(String name) {
        return trepo.findByname(name);
    }
}

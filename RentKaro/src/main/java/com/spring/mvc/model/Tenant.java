package com.spring.mvc.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Tenant {
	@Id
	private int tenant_id;
	private String name;
	private String email;
	private String password;
	private long contact;
	public Tenant() {
		super();
	}
	public Tenant(int tenant_id, String name, String email, String password, long contact) {
		super();
		this.tenant_id = tenant_id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.contact = contact;
	}
	public int getTenant_id() {
		return tenant_id;
	}
	public void setTenant_id(int tenant_id) {
		this.tenant_id = tenant_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public long getContact() {
		return contact;
	}
	public void setContact(long contact) {
		this.contact = contact;
	}
	@Override
	public String toString() {
		return "Tenant [tenant_id=" + tenant_id + ", name=" + name + ", email=" + email + ", password=" + password
				+ ", contact=" + contact + "]";
	}
	
}

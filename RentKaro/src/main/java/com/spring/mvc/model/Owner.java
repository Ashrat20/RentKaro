package com.spring.mvc.model;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Owner 
{
	@Id
	private int owner_id;
	private String name;
	private String email;
	private String password;
	private long contact;
	@OneToMany(mappedBy = "owner")
    private List<Property> properties;
	public Owner() {
		super();
	}
	public Owner(int owner_id, String name, String email, String password, long contact, List<Property> properties) {
		super();
		this.owner_id = owner_id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.contact = contact;
		this.properties = properties;
	}
	public int getOwner_id() {
		return owner_id;
	}
	public void setOwner_id(int owner_id) {
		this.owner_id = owner_id;
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
	public List<Property> getProperties() {
		return properties;
	}
	public void setProperties(List<Property> properties) {
		this.properties = properties;
	}
}


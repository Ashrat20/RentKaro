package com.spring.mvc.model;

import java.util.Base64;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class ImageItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    private byte[] imageData;
    
    @ManyToOne
    @JoinColumn(name = "prop_id")
    private Property property;

	public ImageItem() {
		super();
	}

	public ImageItem(int id, byte[] imageData, Property property) {
		super();
		this.id = id;
		this.imageData = imageData;
		this.property = property;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public byte[] getImageData() {
		return imageData;
	}

	public void setImageData(byte[] imageData) {
		this.imageData = imageData;
	}

	public Property getProperty() {
		return property;
	}

	public void setProperty(Property property) {
		this.property = property;
	}

	public String getBase64ImageData() {
        if (imageData != null) {
            return Base64.getEncoder().encodeToString(imageData);
        }
        return null;
    }
}
package com.spring.mvc.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
public class Property {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int prop_id;
	private String prop_title;
	private String prop_description;
	private float prop_price;
	private int prop_area;
	@Column(name = "prop_location")
    private String prop_location;
	private String prop_address;
	@Column(name = "prop_type")
	private String prop_type;
	@Temporal(TemporalType.DATE)
	private Date date_of_list;
	private String status;
	
	@OneToMany(mappedBy = "property", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ImageItem> imageItems;
	
	@ManyToOne
    @JoinColumn(name = "owner_id")
    private Owner owner;

    public void addImageItem(ImageItem imageItem) {
        if (imageItems == null) {
            imageItems = new ArrayList<>();
        }
        imageItems.add(imageItem);
        imageItem.setProperty(this);
    }

	public Property() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Property(int prop_id, String prop_title, String prop_description, float prop_price, int prop_area,
			String prop_location, String prop_address, String prop_type, Date date_of_list, String status,
			List<ImageItem> imageItems, Owner owner) {
		super();
		this.prop_id = prop_id;
		this.prop_title = prop_title;
		this.prop_description = prop_description;
		this.prop_price = prop_price;
		this.prop_area = prop_area;
		this.prop_location = prop_location;
		this.prop_address = prop_address;
		this.prop_type = prop_type;
		this.date_of_list = date_of_list;
		this.status = status;
		this.imageItems = imageItems;
		this.owner = owner;
	}

	public int getProp_id() {
		return prop_id;
	}

	public void setProp_id(int prop_id) {
		this.prop_id = prop_id;
	}

	public String getProp_title() {
		return prop_title;
	}

	public void setProp_title(String prop_title) {
		this.prop_title = prop_title;
	}

	public String getProp_description() {
		return prop_description;
	}

	public void setProp_description(String prop_description) {
		this.prop_description = prop_description;
	}

	public float getProp_price() {
		return prop_price;
	}

	public void setProp_price(float prop_price) {
		this.prop_price = prop_price;
	}

	public int getProp_area() {
		return prop_area;
	}

	public void setProp_area(int prop_area) {
		this.prop_area = prop_area;
	}

	public String getProp_location() {
		return prop_location;
	}

	public void setProp_location(String prop_location) {
		this.prop_location = prop_location;
	}

	public String getProp_address() {
		return prop_address;
	}

	public void setProp_address(String prop_address) {
		this.prop_address = prop_address;
	}

	public String getProp_type() {
		return prop_type;
	}

	public void setProp_type(String prop_type) {
		this.prop_type = prop_type;
	}

	public Date getDate_of_list() {
		return date_of_list;
	}

	public void setDate_of_list(Date date_of_list) {
		this.date_of_list = date_of_list;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<ImageItem> getImageItems() {
		return imageItems;
	}

	public void setImageItems(List<ImageItem> imageItems) {
		this.imageItems = imageItems;
	}

	public Owner getOwner() {
		return owner;
	}

	public void setOwner(Owner owner) {
		this.owner = owner;
	}
	
}

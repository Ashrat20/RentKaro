package com.spring.mvc.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.mvc.dao.OwnerRepo;
import com.spring.mvc.dao.TenantRepo;
import com.spring.mvc.model.ImageItem;
import com.spring.mvc.model.Owner;
import com.spring.mvc.model.Property;
import com.spring.mvc.model.Review;
import com.spring.mvc.model.Tenant;
import com.spring.mvc.service.ImageItemService;
import com.spring.mvc.service.PropertyService;
import com.spring.mvc.service.ReviewService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PropertyController {

	@Autowired
	private PropertyService pservice;

	@Autowired
	private ImageItemService imageItemService;
	
	@Autowired
	private ReviewService rservice;
	
	@Autowired
	private OwnerRepo orepo;
	
	@Autowired
	private TenantRepo trepo;

	@GetMapping("/addproperty")
	public String showPropertyForm(HttpSession session, Model model) {

		model.addAttribute("property", new Property());
		return "addproperty";
	}

	@GetMapping("/propertyview")
	public String getAllproperty(@RequestParam(value = "prop_type", required = false) String propType,
            @RequestParam(value = "prop_location", required = false) String propLocation,Model model)
	{
		List<Property> list;
		if (propType != null && propLocation != null) {
            list = pservice.searchProperties(propType, propLocation);
        } else {
        	 list = pservice.getAllProperties();		
        }

		List<ImageItem> imglist = imageItemService.getAllimg();		
		model.addAttribute("property", list);
		model.addAttribute("imageitem",imglist);
		return "propertyview";	
	}

	@PostMapping("/addproperty")
	public String addProperty(@ModelAttribute("property") Property property,
			@RequestParam("imageData") List<MultipartFile> imageFiles, HttpSession session) {

		String name = (String) session.getAttribute("name");
		 Owner owner = orepo.findByname(name);
		 property.setOwner(owner);
	    
	        property.setDate_of_list(new Date());
	        pservice.saveProperty(property);

	        saveImageItems(property, imageFiles);

	        return "redirect:/profile";
    }

	private void saveImageItems(Property property, List<MultipartFile> imageFiles) {
		if (imageFiles != null && !imageFiles.isEmpty()) {
			for (MultipartFile file : imageFiles) {
				try {
					byte[] imageData = file.getBytes();
					ImageItem imageItem = new ImageItem();
					imageItem.setImageData(imageData);
					property.addImageItem(imageItem);
					imageItemService.saveImageItem(imageItem);
				} catch (IOException e) {
					e.printStackTrace(); 
				}
			}
		}
	}

	@GetMapping("/propertyDetails")
	public String getPropertyDetails(@RequestParam("propertyId") int propertyId, Model model,HttpSession session) {
		
		Property property = pservice.getPropertyById(propertyId);
		List<Review> propertyReviews = rservice.getReviewsForProperty(property);
		model.addAttribute("review",new Review());
		model.addAttribute("property", property);
		model.addAttribute("propertyReviews", propertyReviews);
		
		return "propertyDetails";
	}
	@PostMapping("/propertyDetails")
	public String addreview(@RequestParam("propertyId") int propertyId,String message,int rating,Model model,HttpSession session) {
		String name = (String) session.getAttribute("name");
		Tenant tenant = trepo.findByname(name);	
		Property property = pservice.getPropertyById(propertyId);
		Review review = new Review();
		review.setTenant(tenant);
		review.setProperty(property);
        review.setMessage(message);
        review.setRating(rating);
        review.setTimestamp(new Date());
        rservice.save(review);
		return "redirect:/propertyDetails?propertyId="+ propertyId;
	}
	
	 @PostMapping("/deleteProperty")
	    public String deleteProperty(@RequestParam("propertyId") int propertyId) {
	        pservice.deletePropertyById(propertyId);
	        return "redirect:/profile"; 
	    }
	 
	 @GetMapping("/edit")
	 public String showEditPropertyForm(@RequestParam("propertyId") int propertyId, Model model) {
	     Property property = pservice.getPropertyById(propertyId);
	     model.addAttribute("property", property);
	     return "propertEditpage";
	 }
	 
	 @PostMapping("/edit")
	    public String editProperty(@ModelAttribute Property updatedProperty) {
	        pservice.updateProperty(updatedProperty.getProp_id(), updatedProperty);
	        return "redirect:/profile";
	    }

}

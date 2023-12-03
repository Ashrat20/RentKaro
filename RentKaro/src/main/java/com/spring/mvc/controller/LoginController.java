package com.spring.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mvc.model.Login;
import com.spring.mvc.model.Owner;
import com.spring.mvc.model.Property;
import com.spring.mvc.model.Tenant;
import com.spring.mvc.service.OwnerService;
import com.spring.mvc.service.TenantService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {
	
	  @Autowired
	  private OwnerService ownerservice;
	  
	  @Autowired
	  private TenantService tenantservice;
	  	  
	  @GetMapping({"/", "/home"})
	  public String landingPage(HttpSession session, Model model) {
		  String name = (String) session.getAttribute("name");
	      model.addAttribute("name", name != null ? name : " ");
		        return "home";
	  }
	    
	 @GetMapping("/login")
	 public String loginform()
	 {
		 return "login";
	 }
	    
	 @PostMapping("/login")
	 public String processLogin(@ModelAttribute("login") Login loginForm, Model model,HttpSession session,RedirectAttributes redirectAttributes) {
	        String email = loginForm.getEmail();
	        String password = loginForm.getPassword();
	        String userType = loginForm.getUserType();

	        if (userType.equals("obj")) {
	            Owner obj = ownerservice.getOwnerByEmail(email);
	            if (obj != null && obj.getPassword().equals(password)) {
	            	session.setAttribute("name", obj.getName());
	            	session.setAttribute("role", "owner"); 
	                return "redirect:/home";
	            }
	        } else if (userType.equals("tobj")) {
	        	Tenant tobj = tenantservice.getTenantByEmail(email);
	            if (tobj != null && tobj.getPassword().equals(password)) {
	            	session.setAttribute("name", tobj.getName());
	            	session.setAttribute("role", "tenant");
	                return "redirect:/home";
	            }
	        }
	        redirectAttributes.addFlashAttribute("loginError", "Invalid email or password or both. Please try again.");
			return "redirect:/login";
	  }
	 
	 @GetMapping("/logout")
	 public String logout(HttpSession session) {
	     session.invalidate(); 
	     return "redirect:/home";
	 }
	 @GetMapping("/profile")
	 public String userDetails(HttpSession session, Model model) {
		    Object roleAttribute = session.getAttribute("role");
		    if (roleAttribute != null) {
		        String role = roleAttribute.toString();

		        if ("owner".equals(role)) {
		           
		            Owner owner = ownerservice.getOwnerByName(session.getAttribute("name").toString());
		            List<Property> ownerProperties = ownerservice.getPropertiesForOwner(owner);
		            model.addAttribute("owner", owner);
		            model.addAttribute("ownerProperties", ownerProperties);
		            model.addAttribute("userType", "owner");		       
		            return "profile"; 
		        } else if ("tenant".equals(role)) {
		            
		            Tenant tenant = tenantservice.getTenantByName(session.getAttribute("name").toString()); 
		            model.addAttribute("tenant", tenant);
		            model.addAttribute("userType", "tenant");	            
		            return "profile"; 
		        }
		    }
		    return "redirect:/Error";
		}
	 
	 @GetMapping("/aboutus")
	 public String aboutpage() {
		 return "about";
	 }
}

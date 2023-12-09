package com.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mvc.model.Tenant;
import com.spring.mvc.service.TenantService;

import jakarta.servlet.http.HttpSession;

@Controller
public class TenantController 
{
	@Autowired
	private TenantService tservice;
	
	@GetMapping("/register-tenant")
	 public String showTenantSignupForm(Model model) {
        model.addAttribute("tobj", new Tenant());
        return "register-tenant";
    }
	
	@PostMapping("/register-tenant")
	public String addTenant(@ModelAttribute("tobj") Tenant tobj,HttpSession session)
	{
		tservice.addTenant(tobj);
		session.setAttribute("name", tobj.getName());
		session.setAttribute("role", "tenant");
		return "redirect:/home";
	}
}

package com.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;

import com.spring.mvc.model.Owner;
import com.spring.mvc.service.OwnerService;

import jakarta.servlet.http.HttpSession;

@Controller
//@RequestMapping("/owner")
public class OwnerController 
{
	@Autowired
	private OwnerService oservice;
	
	@GetMapping("/register")
    public String showOwnerSignupForm(Model model) {
        model.addAttribute("obj", new Owner()); 
        return "register";
    }
	
	@PostMapping("/register")
	public String addOwner(@ModelAttribute("obj") Owner obj,HttpSession session)
	{
		oservice.addOwner(obj);
		session.setAttribute("name", obj.getName());
		session.setAttribute("role", "owner");
		return "redirect:/home";
	}
			
}

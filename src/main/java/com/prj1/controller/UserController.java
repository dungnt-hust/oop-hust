package com.prj1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.prj1.service.UserService;

@Controller
public class UserController {
	
//    Tiem su phu thuoc
	 @Autowired
	  private UserService userService;
	 
	 
}

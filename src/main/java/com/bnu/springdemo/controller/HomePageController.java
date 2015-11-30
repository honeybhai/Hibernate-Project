/**
 * @author Muhammad Haris
 * Feb 22, 2014
 */
package com.bnu.springdemo.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 */
@Controller
public class HomePageController {
	
	//private static final Logger logger = LoggerFactory.getLogger(HomePageController.class);

	@RequestMapping(value = "/login")
	public String showLoginPage() {
		//logger.info("Going to Load Login Form");
		return "LoginForm";
	}

	@RequestMapping(value = "/common/home", method = RequestMethod.GET)
	public String showHomePage() {
		return "home";
	}
}

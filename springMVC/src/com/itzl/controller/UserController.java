package com.itzl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itzl.pojo.User;
@Controller
public class UserController {
	
	@RequestMapping("/login")
	public ModelAndView login(User user) {
	
	ModelAndView mv = new ModelAndView();
	System.out.println(user);
	
	mv.addObject("mv","放置在request作用域中");
	
	mv.setViewName("News");
	return mv;
}

}

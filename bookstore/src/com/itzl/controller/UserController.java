package com.itzl.controller;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itzl.pojo.User;
import com.itzl.service.UserService;
import com.itzl.util.MD5;
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService us;
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String userLogin(HttpServletResponse resp,HttpSession session,User user,String isno) {
		String result="";
		if (user.getPwd().length()<32) {
			user.setPwd(MD5.GetMD5Code(user.getPwd()));
		}
		user=us.loginUser(user);
		if (user!=null) {
			session.setAttribute("loginUser",user);
			try {
				if("yse".equals(isno)){
					Cookie names = new Cookie("username",URLEncoder.encode(user.getUserName(), "utf-8"));
					Cookie pwds = new Cookie("password",user.getPwd());
					//设置存储路径
					names.setPath("/ssmRestful");
					pwds.setPath("/ssmRestful");
					//设置保存时长
					names.setMaxAge(24*3600);
					pwds.setMaxAge(24*3600);
					//把cookie发送给客户端
					resp.addCookie(names);
					resp.addCookie(pwds);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			result="redirect:/userMap.jsp";
		}else {
			result="redirect:/userlogin.jsp";
		}
		return result;
		}
	
	@RequestMapping(value = "/registere",method = RequestMethod.POST)
	public String registere(User user,String username) {
		if (us.getName(username)==null) {
			us.registere(user);
			return "redirect:/userlogin.jsp";
		}
		return "registere";
	}
}
	



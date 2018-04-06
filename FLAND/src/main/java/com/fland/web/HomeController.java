package com.fland.web;


import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView indexHandle() throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "index");
		return mav;
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView adminHandle() throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "home");
		return mav;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public String loginHandle(@RequestParam Map<String, String> map, HttpSession session, HttpServletResponse response ) throws Exception{
		String user = (String)map.get("usrname");
		String pw = (String)map.get("psw");
		String keep = (String)map.get("keep");
		if(user.equals("fabricland@kita.net")) {
			if(pw.equals("land1027")) {
				if(keep.equals("on")) {
					Cookie remember = new Cookie("keep", "fabricland");	// default 라는 이름의 쿠키(내용은 off) 생성
					remember.setMaxAge(60*60*24);
					remember.setPath("/");
					response.addCookie(remember);
				}
				return "ok";
			}else {
				return "pwmissing";
			}
		}else {
			return "idmissing";
		}
	}
	
	@RequestMapping(value = "/keep", method = RequestMethod.GET)
	@ResponseBody
	public String keepHandle(HttpServletRequest request) {
		Cookie[] ar=request.getCookies();
		String rst="no";
		if(ar!=null){
			for(Cookie cm : ar){
				if(cm.getName().equals("keep")){
					rst= "remember";
				}
			}
		}
		return rst;
	}
}

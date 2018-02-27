package com.fland.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping("/order")
public class OrderController {
	@RequestMapping(value = "/dyeing", method = RequestMethod.GET)
	public ModelAndView incomeAdd() throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "order/dyeing");
		return mav;
	}
	
}

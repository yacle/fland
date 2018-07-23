package com.fland.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/sample")
public class SampleController {

	@RequestMapping(value = "/sample_order", method = RequestMethod.GET)
	public ModelAndView dyePrint(@RequestParam Map<String, String> map)throws Exception{
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "sample/sample_order");
		return mav;
	}
}

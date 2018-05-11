package com.fland.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fland.persistence.PrintDAO;

@Controller
@RequestMapping("/print")
public class PrintController {
	@Inject
	ServletContext application;
	@Inject
	PrintDAO printdao;
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public ModelAndView dyePrint(@RequestParam Map<String, String> map)throws Exception{
		ModelAndView mav = new ModelAndView("temp");
		String orderno = map.get("orderno");
		Map<String, String> dyeData = printdao.dyePrint(orderno);
		System.out.println(orderno+"/"+dyeData.toString());
		mav.addObject("section", "order/print/dyePrint");
		mav.addObject("data", dyeData);
		return mav;
	}
	
	
}

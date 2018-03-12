package com.fland.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fland.domain.SumCount;
import com.fland.persistence.CompanyDAO;
import com.fland.persistence.OrderDAO;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Inject
	OrderDAO orderdao;
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public ModelAndView incomeAdd() throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "order/order");
		return mav;
	}
	
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	@ResponseBody
	public String orderAdd(@RequestParam Map map)  throws Exception {
		String color = (String) map.get("color");
		String html = SumCount.orderSum(color);
		String orderno = (String)map.get("orderno");
		if(orderno==null) {
			return html;
		}else {
			int r = orderdao.orderRead(orderno);
			if(r==0) {
				orderdao.orderAdd(map);
			}else {
				orderdao.orderUpdate(map);
			}
			return html;
		}
	}
	
	@RequestMapping(value = "/dyeSum", method = RequestMethod.POST)
	@ResponseBody
	public String dyeSum(@RequestParam Map map)  throws Exception {
		String rollList = SumCount.dyeSum(map);
		return rollList;
	}
	
	@RequestMapping(value = "/dye", method = RequestMethod.POST)
	@ResponseBody
	public String dyeAdd(@RequestParam Map map) throws Exception{
		System.out.println(map.toString());
		return "";
	}
}

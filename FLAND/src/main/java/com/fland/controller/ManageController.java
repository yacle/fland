package com.fland.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fland.domain.New_DyeVO;
import com.fland.domain.New_KnitVO;
import com.fland.domain.New_OrderVO;
import com.fland.domain.New_ProcessVO;
import com.fland.domain.New_YarnVO;
import com.fland.persistence.ManageDAO;
import com.fland.persistence.New_OrderDAO;

@Controller
@RequestMapping("/manage")
public class ManageController {
	
	@Inject
	New_OrderDAO new_order_dao;
	@Inject
	ManageDAO manage_dao;
	
	@RequestMapping(value = "/view_order", method = RequestMethod.GET)
	public ModelAndView view_order(String ORDER_NO) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		List<New_OrderVO> order_list = new_order_dao.orderRead(ORDER_NO);
		List<New_YarnVO> yarn_list = new_order_dao.yarnRead(ORDER_NO);
		List<New_KnitVO> knit_list = new_order_dao.knitRead(ORDER_NO);
		List<New_DyeVO> dye_list = new_order_dao.dyeRead(ORDER_NO);
		List<New_ProcessVO> process_list = new_order_dao.processRead(ORDER_NO);
		
		mav.addObject("section", "order/view_order");
		mav.addObject("order", order_list);
		mav.addObject("yarn", yarn_list);
		mav.addObject("knit", knit_list);
		mav.addObject("dye", dye_list);
		mav.addObject("process", process_list);
		mav.addObject("order_no", ORDER_NO);
		return mav;
	}
	
	@RequestMapping(value = "/yarn_in", method = RequestMethod.POST)
	public void yarnIn(@RequestParam MultiValueMap<String,String> multiMap)throws Exception{
		List<String> yarn = multiMap.get("yarn");
		List<String> yarn_date = multiMap.get("yarn_date");
		List<String> yarn_quantity = multiMap.get("yarn_quantity");
		List<String> order_no = multiMap.get("ORDER_NO");
		for(int i=0; i<yarn_quantity.size(); i++) {
			New_YarnVO vo = new New_YarnVO();
			vo.setORDER_NO(order_no.get(0));
			vo.setYARN(yarn.get(i));
			vo.setYARN_ORDER_DATE(yarn_date.get(i));
			vo.setYARN_ORDER_QUANTITY(yarn_quantity.get(i));
			System.out.println(vo.toString());
		}
	}
}

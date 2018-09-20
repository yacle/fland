package com.fland.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fland.domain.New_DyeVO;
import com.fland.domain.New_KnitVO;
import com.fland.domain.New_OrderVO;
import com.fland.domain.New_ProcessVO;
import com.fland.domain.New_YarnVO;
import com.fland.persistence.New_OrderDAO;

@Controller
@RequestMapping("/manage")
public class ManageController {
	
	@Inject
	New_OrderDAO new_order_dao;
	
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
		return mav;
	}
}

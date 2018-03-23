package com.fland.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fland.domain.Criteria;
import com.fland.domain.PageMaker;
import com.fland.domain.SumCount;
import com.fland.persistence.OrderDAO;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Inject
	OrderDAO orderdao;
	// new ���ּ�
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public ModelAndView incomeAdd() throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "order/order");
		return mav;
	}
	// ���ּ� ����Ʈ
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public ModelAndView orderList(Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "order/orderList");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(orderdao.countPaging(cri));
		mav.addObject("list", orderdao.listCriteria(cri));
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}
	// ���ּ� ����, ������Ʈ
	@RequestMapping(value = "/order", method = RequestMethod.POST)
	@ResponseBody
	public String orderAdd(@RequestParam Map map)  throws Exception {
		String orderno = (String)map.get("orderno");
		int r = orderdao.orderRead(orderno);
		if(r==0) {
			orderdao.orderAdd(map);
			return "new";
		}else {
			orderdao.orderUpdate(map);
			return "update";
		}
	}
	// �����Ƿ� ���� ���
	@RequestMapping(value = "/dyeSum", method = RequestMethod.POST)
	@ResponseBody
	public String dyeSum(@RequestParam Map map)  throws Exception {
		String rollList = SumCount.dyeSum(map);
		return rollList;
	}
	// �����Ƿڼ� ����
	@RequestMapping(value = "/dyeAdd", method = RequestMethod.POST)
	@ResponseBody
	public String dyeAdd(@RequestParam Map map) throws Exception{
		orderdao.dyeAdd(map);
		return "";
	}
	// �����Ƿڼ� ����
	@RequestMapping(value = "/knitAdd", method = RequestMethod.POST)
	@ResponseBody
	public String knitAdd(@RequestParam Map map) throws Exception{
		orderdao.knitAdd(map);
		return "";
	}
}

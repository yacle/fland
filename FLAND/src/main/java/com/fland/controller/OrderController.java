package com.fland.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Spliterator;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fland.domain.Criteria;
import com.fland.domain.KnitVO;
import com.fland.domain.PageMaker;
import com.fland.domain.SumCount;
import com.fland.domain.VoEdit;
import com.fland.persistence.OrderDAO;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Inject
	OrderDAO orderdao;
	@Inject
	ObjectMapper mapper;
	
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
		if(r==0) {	// orderno �� ���� ���
			orderdao.orderAdd(map);
			return "new";
		}else {		// ���� orderno�� �ִ� ���
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
	public Map knitAdd(@RequestParam Map map) throws Exception{
		KnitVO vo = VoEdit.knitvoEdit(map);
		orderdao.knitAdd(vo);
		Map<String, Object> orderVal = new HashMap<String, Object>();
		orderVal.put("ratio", vo.getRatio());
		orderVal.put("kgttl", vo.getKgttl());
		orderVal.put("thread", vo.getThread());
		return orderVal;
	}
	
	@RequestMapping(value = "/thread", method = { RequestMethod.POST, RequestMethod.GET})
	public ModelAndView threadOrder(@RequestParam Map map) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		String thread = (String)map.get("thread");
		String[] threadArr = thread.split("/");
		String ratio = (String)map.get("ratio");
		String[] ratioArr = ratio.split("/");
		String kgttl = (String)map.get("kgttl");
		mav.addObject("section", "order/thread_order");
		mav.addObject("threadArr", threadArr);
		mav.addObject("ratioArr", ratioArr);
		mav.addObject("kgttl", kgttl);
		return mav;
	}
}

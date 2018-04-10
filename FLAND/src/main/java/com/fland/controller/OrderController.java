package com.fland.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
	public ModelAndView orderNew() throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "order/order");
		return mav;
	}
	
	
	// new �����Ƿڼ�
	@RequestMapping(value = "/dye", method = RequestMethod.GET)
	public ModelAndView dyeNew(@RequestParam Map<String, String> map) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "order/dye");
		mav.addObject("color", map.get("color"));
		mav.addObject("workWeight", map.get("workWeight"));
		mav.addObject("orderLength", map.get("orderLength"));
		mav.addObject("orderno", map.get("orderno"));
		return mav;
	}
	// �����Ƿڼ� Search
		@RequestMapping(value = "/dye", method = RequestMethod.POST)
		public ModelAndView dyeSearch(@RequestParam Map<String, String> param) throws Exception {
			ModelAndView mav = new ModelAndView("temp");
			Map<String, String> map = orderdao.dyeSearch(param.get("orderno"));
			mav.addObject("section", "order/dye");
			mav.addObject("color", map.get("COLOR"));
			mav.addObject("workWeight", map.get("WORKWEIGHT"));
			mav.addObject("orderLength", map.get("ORDERLENGTH"));
			mav.addObject("orderno", param.get("orderno"));
			return mav;
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
	public String dyeAdd(@RequestParam Map<String, String> map) throws Exception{
		int r = orderdao.dyeRead( map.get("orderno"));
		if(r==0) {	// orderno �� ���� ���
			orderdao.dyeAdd(map);
			return "new";
		}else {		// ���� orderno�� �ִ� ���
			orderdao.dyeUpdate(map);
			return "update";
		}
	}
	// new knit 
	@RequestMapping(value = "/knit", method = RequestMethod.GET)
	public ModelAndView knitNew(@RequestParam Map<String, String> param) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "order/knit");
		mav.addObject("map", param);
		return mav;
	}
	// knit setting
	@RequestMapping(value = "/knitNew", method = RequestMethod.POST)
	@ResponseBody
	public String knitNewSet(@RequestParam Map<String, Object> param) throws Exception {
		 Map<String, Object> map = orderdao.knitNew(param.get("orderno"));
		 String rollList = SumCount.dyeSum(map);
		 return rollList;
	}
	// �����Ƿڼ� ����
		@RequestMapping(value = "/knitAdd", method = RequestMethod.POST)
		@ResponseBody
		public void knitAdd(@RequestParam Map<String, String> map) throws Exception{
			KnitVO vo = VoEdit.knitvoSave(map);
			System.out.println(map.get("knitno"));
			if(map.get("knitno").equals("0")){
				orderdao.knitAdd(vo);
				System.out.println("add");
			}else {
				orderdao.knitUpdate(vo);
				System.out.println("update");
			}
		}
		
	// knit search
		@RequestMapping(value = "/knitSearch", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public ModelAndView knitSearch(@RequestParam Map<String, String> param) throws Exception {
			ModelAndView mav = new ModelAndView("temp");
			 Map<String, Object> map = orderdao.knitNew(param.get("orderno"));
			 String rollList = SumCount.dyeSum(map);
			 List<Map<String, String>> list = orderdao.knitSearch(param.get("orderno"));
			 String index = "0";
			 if(!param.get("index").equals("0")) {
				 index = param.get("index");
			 }
			 Map<String, List<String>> data = SumCount.knitData(list.get(Integer.parseInt(index)));
			 mav.addObject("section", "order/knit");
			 mav.addObject("list", list.get(Integer.parseInt(index)));
			 mav.addObject("size", list.size());
			 mav.addObject("index", index);
			 mav.addObject("data", data);
			 mav.addObject("html", rollList);
			 mav.addObject("map", param);
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
	public String orderAdd(@RequestParam Map<String, String> map)  throws Exception {
		String orderno = map.get("orderno");
		int r = orderdao.orderRead(orderno);
		if(r==0) {	// orderno �� ���� ���
			orderdao.orderAdd(map);
			return "new";
		}else {		// ���� orderno�� �ִ� ���
			orderdao.orderUpdate(map);
			return "update";
		}
	}
	
	
	@RequestMapping(value = "/thread", method = { RequestMethod.POST, RequestMethod.GET})
	public ModelAndView threadOrder(@RequestParam Map<String, String> map) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		String thread = map.get("thread");
		String[] threadArr = thread.split("/");
		String ratio = map.get("ratio");
		String[] ratioArr = ratio.split("/");
		String kgttl = map.get("kgttl");
		mav.addObject("section", "order/thread_order");
		mav.addObject("threadArr", threadArr);
		mav.addObject("ratioArr", ratioArr);
		mav.addObject("kgttl", kgttl);
		return mav;
	}
}

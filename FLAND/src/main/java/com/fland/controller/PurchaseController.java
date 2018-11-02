package com.fland.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fland.domain.Criteria;
import com.fland.domain.PageMaker;
import com.fland.domain.PurchaseVO;
import com.fland.persistence.PurchaseDAO;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {
	@Inject
	PurchaseDAO purchaseDao;
	
	// 매입 입력
		@RequestMapping(value = "", method = RequestMethod.GET)
		public ModelAndView incomeAdd() throws Exception {
			ModelAndView mav = new ModelAndView("temp");
			mav.addObject("section", "purchase/purchase_input");
			return mav;
		}
		
		@RequestMapping(value = "/add", method = RequestMethod.POST)
		public String incomeAddPostHandle(@RequestParam MultiValueMap<String,String> multiMap) throws Exception {
			List<String> date = multiMap.get("purchase_date");
			List<String> order_no = multiMap.get("order_no");
			List<String> category = multiMap.get("category");
			List<String> company = multiMap.get("company");
			List<String> detail = multiMap.get("detail");
			List sum = multiMap.get("sum");
			for(int i=0; i<sum.size(); i++) {
				PurchaseVO vo = new PurchaseVO();
				vo.setPurchase_date(date.get(0));
				vo.setOrder_no(order_no.get(i));
				vo.setCategory(category.get(i));
				vo.setCompany(company.get(i));
				vo.setDetail(detail.get(i));
				vo.setSum((String)sum.get(i));
				purchaseDao.Add(vo);
			}
			return "redirect:/purchase/";
		}
		
		@RequestMapping(value = "/read", method = RequestMethod.GET)
		public ModelAndView orderList(Criteria cri) throws Exception {
			ModelAndView mav = new ModelAndView("temp");
			mav.addObject("section", "purchase/purchase_list");
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(purchaseDao.countPaging(cri));
			mav.addObject("list", purchaseDao.listCriteria(cri));
			mav.addObject("pageMaker", pageMaker);
			return mav;
		}
		
		@RequestMapping(value = "/monthly", method = RequestMethod.GET)
		public void purchaseOrder() throws Exception{
			List<Map<String, String>> orderMap = purchaseDao.orderList();
			for(int i=0; i<orderMap.size(); i++) {
				Map<String, String> order =orderMap.get(i);
				String order_no = order.get("order_no");
				Map<String, String> map = new HashMap<>();
				for(int j=0; j<3; j++) {
					
					map.put("order_no", order_no);
					map.put(", value)
				}
				
				purchaseDao.month(map)
			}
		}
		
		@RequestMapping(value = "/modify", method = RequestMethod.GET)
		@ResponseBody
		public PurchaseVO purchaseModify(@RequestParam String no) throws Exception {
			PurchaseVO vo = purchaseDao.modify(no);
			return vo;
		}
		
		@RequestMapping(value = "/update", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public String purchaseUpdate(PurchaseVO vo) throws Exception{
			purchaseDao.update(vo);
			return "2";
		}
		
		@RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
		@ResponseBody
		public String purchaseDelete(String	no) throws Exception{
			purchaseDao.delete(no);
			return "2";
		}
}

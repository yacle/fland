package com.fland.controller;

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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fland.domain.ExpenseVO;
import com.fland.domain.IncomeVO;
import com.fland.domain.New_DyeVO;
import com.fland.domain.New_KnitVO;
import com.fland.domain.New_OrderVO;
import com.fland.domain.New_ProcessVO;
import com.fland.domain.New_YarnVO;
import com.fland.domain.SumCount;
import com.fland.persistence.AccountDAO;
import com.fland.persistence.InputDAO;
import com.fland.persistence.New_OrderDAO;

@Controller
@RequestMapping("/input")
public class InputController {
@Inject
New_OrderDAO new_order_dao;
@Inject
InputDAO inputDao;
@Inject
AccountDAO accountDao;
@Inject
ObjectMapper mapper;

	// 입력 수입
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView incomeAdd() throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "input/income2");
		return mav;
	}
	@RequestMapping(value = "/input_order", method = RequestMethod.GET)
	public ModelAndView dyePrint(@RequestParam Map<String, String> map)throws Exception{
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "order/order_input");
		return mav;
	}
	@RequestMapping(value = "/readAccount", method = RequestMethod.POST)
	@ResponseBody
	public String readAccountHandle(@RequestParam Map<String, String> map)throws Exception{
		String date = (String)map.get("date");
		List<IncomeVO> list = accountDao.readBeginDaily(date);
		Map<String, String> accsum = SumCount.accountSum(list);
		String jsonString = mapper.writeValueAsString(accsum);
		return jsonString;
	}
	
	// 수입 입력 DB 전송
	@RequestMapping(value = "/incomeAdd", method = RequestMethod.POST)
	public String incomeAddPostHandle(@RequestParam MultiValueMap<String,String> multiMap) throws Exception {
		List<String> date = multiMap.get("date");
		List<String> account = multiMap.get("account");
		List<String> company = multiMap.get("company");
		List<String> item = multiMap.get("item");
		List<String> detail = multiMap.get("detail");
		List sum = multiMap.get("sum");
		List<String> etc = multiMap.get("etc");
		for(int i=0; i<sum.size(); i++) {
			IncomeVO vo = new IncomeVO();
			vo.setINCOME_DATE(date.get(0));
			vo.setACCOUNT(account.get(i));
			vo.setCOMPANY(company.get(i));
			vo.setITEM(item.get(i));
			vo.setDETAIL(detail.get(i));
			vo.setSUM((String)sum.get(i));
			vo.setETC(etc.get(i));
			inputDao.incomeAdd(vo);
		}
		return "redirect:/inquiry/daily?date="+date.get(0);
	}
	// 입력 지출
	@RequestMapping(value = "/expense", method = RequestMethod.GET)
	public ModelAndView spendAdd() throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "input/expense");
		return mav;
	}
	
	@RequestMapping(value = "/expenseAdd", method = RequestMethod.POST)
	public String expenseAddPostHandle(@RequestParam MultiValueMap<String,String> multiMap) throws Exception {
		List<String> date = multiMap.get("expense_date");
		List<String> account = multiMap.get("account");
		List<String> employee = multiMap.get("employee");
		List<String> item = multiMap.get("item");
		List<String> method = multiMap.get("method");
		List<String> detail = multiMap.get("detail");
		List sum = multiMap.get("sum");
		List<String> etc = multiMap.get("etc");
		for(int i=0; i<account.size(); i++) {
			ExpenseVO vo = new ExpenseVO();
			vo.setEXPENSE_DATE(date.get(0));
			vo.setACCOUNT(account.get(i));
			vo.setEMPLOYEE(employee.get(i));
			vo.setITEM(item.get(i));
			vo.setMETHOD(method.get(i));
			vo.setDETAIL(detail.get(i));
			vo.setSUM((String)sum.get(i));
			vo.setETC(etc.get(i));
			inputDao.expenseAdd(vo);
		}
		return "redirect:/inquiry/daily?date="+date.get(0);
	}
	
	@RequestMapping(value = "/order_Add", method = RequestMethod.POST)
	public String orderAddPostHandle(@RequestParam MultiValueMap<String,String> multiMap) throws Exception {
		List<String> order_date = multiMap.get("ORDER_DATE");
		List<String> order_no = multiMap.get("ORDER_NO");
		List<String> fabric_name = multiMap.get("FABRIC_NAME");
		List<String> color = multiMap.get("COLOR");
		List<String> order_quantity = multiMap.get("ORDER_QUANTITY");
		List<String> order_price = multiMap.get("ORDER_PRICE");
		for(int i=0; i<color.size(); i++) {
			New_OrderVO vo = new New_OrderVO();
			vo.setORDER_DATE(order_date.get(0));
			vo.setORDER_NO(order_no.get(0));
			vo.setFABRIC_NAME(fabric_name.get(0));
			vo.setCOLOR(color.get(i));
			vo.setORDER_QUANTITY(order_quantity.get(i));
			vo.setORDER_PRICE(order_price.get(i));
			new_order_dao.orderAdd(vo);
		}
		
		List<String> yarn = multiMap.get("YARN");
		List<String> yarn_com = multiMap.get("YARN_COM");
		List<String> yarn_price = multiMap.get("YARN_PRICE");
		List<String> yarn_order_date = multiMap.get("YARN_ORDER_DATE");
		List<String> yarn_order_quantity = multiMap.get("YARN_ORDER_QUANTITY");
		for(int i=0; i<yarn.size(); i++) {
			New_YarnVO vo = new New_YarnVO();
			vo.setORDER_NO(order_no.get(0));
			vo.setYARN(yarn.get(i));
			vo.setYARN_COM(yarn_com.get(i));
			vo.setYARN_PRICE(yarn_price.get(i));
			vo.setYARN_ORDER_DATE(yarn_order_date.get(i));
			vo.setYARN_ORDER_QUANTITY(yarn_order_quantity.get(i));
			new_order_dao.yarnAdd(vo);
		}
		
		List<String> knit = multiMap.get("KNIT");
		List<String> knit_com = multiMap.get("KNIT_COM");
		List<String> knit_price = multiMap.get("KNIT_PRICE");
		List<String> knit_order_date = multiMap.get("KNIT_ORDER_DATE");
		List<String> knit_order_quantity = multiMap.get("KNIT_ORDER_QUANTITY");
		for(int i=0; i<yarn.size(); i++) {
			New_KnitVO vo = new New_KnitVO();
			vo.setORDER_NO(order_no.get(0));
			vo.setKNIT(knit.get(i));
			vo.setKNIT_COM(knit_com.get(i));
			vo.setKNIT_PRICE(knit_price.get(i));
			vo.setKNIT_ORDER_DATE(knit_order_date.get(i));
			vo.setKNIT_ORDER_QUANTITY(knit_order_quantity.get(i));
			new_order_dao.knitAdd(vo);
		}
		
		List<String> dyeing = multiMap.get("DYEING");
		List<String> dyeing_com = multiMap.get("DYEING_COM");
		List<String> dye_color = multiMap.get("DYE_COLOR");
		List<String> dye_price = multiMap.get("DYE_PRICE");
		List<String> dye_order_date = multiMap.get("DYE_ORDER_DATE");
		List<String> dye_order_quantity = multiMap.get("DYE_ORDER_QUANTITY");
		for(int i=0; i<yarn.size(); i++) {
			New_DyeVO vo = new New_DyeVO();
			vo.setORDER_NO(order_no.get(0));
			vo.setDYEING(dyeing.get(i));
			vo.setDYEING_COM(dyeing_com.get(i));
			vo.setDYE_COLOR(dye_color.get(i));
			vo.setDYE_PRICE(dye_price.get(i));
			vo.setDYE_ORDER_DATE(dye_order_date.get(i));
			vo.setDYE_ORDER_QUANTITY(dye_order_quantity.get(i));
			new_order_dao.dyeAdd(vo);
		}
		
		List<String> process = multiMap.get("PROCESS");
		List<String> process_com = multiMap.get("PROCESS_COM");
		List<String> process_price = multiMap.get("PROCESS_PRICE");
		List<String> process_order_date = multiMap.get("PROCESS_ORDER_DATE");
		List<String> process_order_quantity = multiMap.get("PROCESS_ORDER_QUANTITY");
		for(int i=0; i<yarn.size(); i++) {
			New_ProcessVO vo = new New_ProcessVO();
			vo.setORDER_NO(order_no.get(0));
			vo.setPROCESS(process.get(i));
			vo.setPROCESS_COM(process_com.get(i));
			vo.setPROCESS_PRICE(process_price.get(i));
			vo.setPROCESS_ORDER_DATE(process_order_date.get(i));
			vo.setPROCESS_ORDER_QUANTITY(process_order_quantity.get(i));
			new_order_dao.processAdd(vo);
		}
		return "redirect:/manage/view_order?ORDER_NO="+order_no.get(0);
	}
}

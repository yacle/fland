package com.fland.controller;

import java.text.SimpleDateFormat;
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
import com.fland.domain.AccountVO;
import com.fland.domain.ExpenseVO;
import com.fland.domain.IncomeVO;
import com.fland.domain.SumCount;
import com.fland.persistence.AccountDAO;
import com.fland.persistence.InputDAO;

@Controller
@RequestMapping("/input")
public class InputController {
@Inject
InputDAO inputDao;
@Inject
AccountDAO accountDao;
@Inject
ObjectMapper mapper;
@Inject
SimpleDateFormat format;
	// 입력 수입
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView incomeAdd() throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "input/income");
		return mav;
	}
	
	@RequestMapping(value = "/readAccount", method = RequestMethod.POST)
	@ResponseBody
	public String readAccountHandle(@RequestParam Map<String, String> map)throws Exception{
		String date = (String)map.get("date");
		List<IncomeVO> list = accountDao.readBegin(date);
		Map<String, Integer> accsum = SumCount.accountSum(list);
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
		mav.addObject("section", "input/spend");
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
}

package com.fland.controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fland.domain.ExpenseVO;
import com.fland.domain.IncomeVO;
import com.fland.domain.InquiryVO;
import com.fland.domain.SumCount;
import com.fland.persistence.AccountDAO;
import com.fland.persistence.InquiryDAO;

@Controller
@RequestMapping("/inquiry")
public class InquiryController {
@Inject
InquiryDAO inquiryDao;
@Inject
AccountDAO accountDao;

	@RequestMapping(value = "/daily", method = RequestMethod.GET)
	public ModelAndView inquiryDailyHandle(@RequestParam Map param) throws Exception {
		String date = (String)param.get("date");
		Map<String, List<InquiryVO>> map = inquiryDao.daily(date);
		List<IncomeVO> beginList = accountDao.readBegin(date);
			Map begin = SumCount.accountSum(beginList);
		List<IncomeVO> endList = accountDao.readEnd(date);
			Map end = SumCount.accountSum(endList);
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "inquiry/daily");
		mav.addObject("date", date);
		mav.addObject("size", map.size());
		mav.addObject("in_nhi", map.get("in_nhi"));
		mav.addObject("in_nhe", map.get("in_nhe"));
		mav.addObject("in_kbi", map.get("in_kbi"));
		mav.addObject("in_kbe", map.get("in_kbe"));
		mav.addObject("in_sh", map.get("in_sh"));
		mav.addObject("in_km", map.get("in_km"));
		mav.addObject("out_nhi", map.get("out_nhi"));
		mav.addObject("out_nhe", map.get("out_nhe"));
		mav.addObject("out_kbi", map.get("out_kbi"));
		mav.addObject("out_kbe", map.get("out_kbe"));
		mav.addObject("out_sh", map.get("out_sh"));
		mav.addObject("out_km", map.get("out_km"));
		mav.addObject("begin", begin);
		mav.addObject("end", end);	
		return mav;
	}

	@RequestMapping(value = "/month", method = RequestMethod.GET)
	public ModelAndView inquiryMonthHandle(@RequestParam Map param) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		List<Integer> begin = new ArrayList<Integer>();		// 기초잔액
		List<Integer> end = new ArrayList<Integer>();		// 기말잔액
		// 입금
		List<Integer> item01 = new ArrayList<Integer>();	// 매출
		List<Integer> item02 = new ArrayList<Integer>();	// 업체환급
		List<Integer> item03 = new ArrayList<Integer>();	// 이체
		List<Integer> item04 = new ArrayList<Integer>();	// 금융이자
		List<Integer> item05 = new ArrayList<Integer>();	// 차입금
		List<Integer> item06 = new ArrayList<Integer>();	// 카드취소
		List<Integer> item07 = new ArrayList<Integer>();	// 세금환급
		// 출금
		List<Integer> item08 = new ArrayList<Integer>();	// 거래처결제
		List<Integer> item09 = new ArrayList<Integer>();	// 이체
		List<Integer> item10 = new ArrayList<Integer>();	// 경비
		List<Integer> item11 = new ArrayList<Integer>();	// 접대비
		List<Integer> item12 = new ArrayList<Integer>();	// 대표자경비
		List<Integer> item13 = new ArrayList<Integer>();	// 대표자차량
		List<Integer> item14 = new ArrayList<Integer>();	// 원단물류비
		List<Integer> item15 = new ArrayList<Integer>();	// 기타
		List<Integer> item16 = new ArrayList<Integer>();	// 식대
		List<Integer> item17 = new ArrayList<Integer>();	// 한정신차량
		List<Integer> item18 = new ArrayList<Integer>();	// 박성진차량
		List<Integer> item19 = new ArrayList<Integer>();	// 박성진경비
		List<Integer> item20 = new ArrayList<Integer>();	// 박성진식대
		List<Integer> item21 = new ArrayList<Integer>();	// 임대관리비
		List<Integer> item22 = new ArrayList<Integer>();	// 급여
		List<Integer> item23 = new ArrayList<Integer>();	// 차입금상환
		List<Integer> item24 = new ArrayList<Integer>();	// 대출
		List<Integer> item25 = new ArrayList<Integer>();	// 세금
		List<Integer> item26 = new ArrayList<Integer>();	// 4대보험
		String month = (String)param.get("month");
		for(int i=1; i<32; i++) {
			String d="";
			if(i<10) {
				d="0"+String.valueOf(i);
			}else {
				d=String.valueOf(i);
			}
			String day = month+"-"+d;
			Map<String, String> map = new HashMap<String, String>();
			map.put("day", day);
			map.put("month", month);
			begin.add(accountDao.beginDailyBegin(map));	// 기초잔액
			end.add(accountDao.beginDailyEnd(map));	// 기초잔액
			item01.add(inquiryDao.item01(day));	// 매출
			item02.add(inquiryDao.item02(day));	// 업체환급
			item03.add(inquiryDao.item03(day));	// 이체
			item04.add(inquiryDao.item04(day));	// 금융이자
			item05.add(inquiryDao.item05(day));	// 차입금
			item06.add(inquiryDao.item06(day));	// 카드취소
			item07.add(inquiryDao.item07(day));	// 세금환급
			item08.add(inquiryDao.item08(day));	// 거래처결제
			item09.add(inquiryDao.item09(day));	// 이체
			item10.add(inquiryDao.item10(day));	// 경비
			item11.add(inquiryDao.item11(day));	// 접대비
			item12.add(inquiryDao.item12(day));	// 대표자경비
			item13.add(inquiryDao.item13(day));	// 대표자차량
			item14.add(inquiryDao.item14(day));	// 원단물류비
			item15.add(inquiryDao.item15(day));	// 기타
			item16.add(inquiryDao.item16(day));	// 식대
			item17.add(inquiryDao.item17(day));	// 한정신차량
			item18.add(inquiryDao.item18(day));	// 박성진차량
			item19.add(inquiryDao.item19(day));	// 박성진경비
			item20.add(inquiryDao.item20(day));	// 박성진식대
			item21.add(inquiryDao.item21(day));	// 임대관리비
			item22.add(inquiryDao.item22(day));	// 급여
			item23.add(inquiryDao.item23(day));	// 차입금상환
			item24.add(inquiryDao.item24(day));	// 대출
			item25.add(inquiryDao.item25(day));	// 세금
			item26.add(inquiryDao.item26(day));	// 4대보험
		}
		//
		mav.addObject("section", "inquiry/list");
		mav.addObject("month", month);
		mav.addObject("begin", begin);	// 기초잔액
		mav.addObject("end", end);	// 기말잔액
		mav.addObject("item01", item01);	// 매출
		mav.addObject("item02", item02);	// 업체환급v
		mav.addObject("item03", item03);	// 이체
		mav.addObject("item04", item04);	// 금융이자
		mav.addObject("item05", item05);	// 차입금
		mav.addObject("item06", item06);	// 카드취소
		mav.addObject("item07", item07);	// 세금환급
		mav.addObject("item08", item08);	// 거래처결제
		mav.addObject("item09", item09);	// 이체
		mav.addObject("item10", item10);	// 경비
		mav.addObject("item11", item11);	// 접대비
		mav.addObject("item12", item12);	// 대표자경비
		mav.addObject("item13", item13);	// 대표자차량
		mav.addObject("item14", item14);	// 원단물류비
		mav.addObject("item15", item15);	// 기타
		mav.addObject("item16", item16);	// 식대
		mav.addObject("item17", item17);	// 한정신차량
		mav.addObject("item18", item18);	// 박성진차량
		mav.addObject("item19", item19);	// 박성진경비
		mav.addObject("item20", item20);	// 박성진식대
		mav.addObject("item21", item21);	// 임대관리비
		mav.addObject("item22", item22);	// 급여
		mav.addObject("item23", item23);	// 차입금상환
		mav.addObject("item24", item24);	// 대출
		mav.addObject("item25", item25);	// 세금
		mav.addObject("item26", item26);	// 4대보험
		return mav;
	}
}

package com.fland.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fland.domain.IncomeVO;
import com.fland.domain.InquiryVO;
import com.fland.domain.SearchVO;
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
@Inject
ObjectMapper mapper;

	@RequestMapping(value = "/daily", method = RequestMethod.GET)
	public ModelAndView inquiryDailyHandle(@RequestParam Map param) throws Exception {
		String date = (String)param.get("date");
		Map<String, List<InquiryVO>> map = inquiryDao.daily(date);
		List<IncomeVO> beginList = accountDao.readBegin(date);
			Map begin = SumCount.accountSum(beginList);
		List<IncomeVO> endList = accountDao.readEnd(date);
			Map end = SumCount.accountSum(endList);
		int incomeSum = inquiryDao.incomeSum(date);
		int expenseSum = inquiryDao.expenseSum(date);
			
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
		mav.addObject("incomeSum", incomeSum);
		mav.addObject("expenseSum", expenseSum);
		return mav;
	}

	@RequestMapping(value = "/monthly", method = RequestMethod.GET)
	public ModelAndView inquiryMonthHandle(@RequestParam Map param) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "inquiry/monthly");
		List<Integer> begin = new ArrayList<Integer>();		// 기초잔액
		List<Integer> end = new ArrayList<Integer>();		// 기말잔액
		// 입금
		List<Integer> item01 = new ArrayList<Integer>();	// 매출
		List<Integer> item02 = new ArrayList<Integer>();	// 업체환급
		List<Integer> item03 = new ArrayList<Integer>();	// 금융이자
		List<Integer> item04 = new ArrayList<Integer>();	// 차입금
		List<Integer> item05 = new ArrayList<Integer>();	// 카드취소
		List<Integer> item06 = new ArrayList<Integer>();	// 세금환급
		// 출금
		List<Integer> item07 = new ArrayList<Integer>();	// 대금결제
		List<Integer> item08 = new ArrayList<Integer>();	// 물류비
		List<Integer> item081 = new ArrayList<Integer>();	// 에어물류비
		List<Integer> item09 = new ArrayList<Integer>();	// 임대관리비
		List<Integer> item10 = new ArrayList<Integer>();	// 급여
		List<Integer> item11 = new ArrayList<Integer>();	// 차입금상환
		List<Integer> item12 = new ArrayList<Integer>();	// 세금
		List<Integer> item13 = new ArrayList<Integer>();	// 4대보험
		List<Integer> item14 = new ArrayList<Integer>();	// 접대비
		List<Integer> item15 = new ArrayList<Integer>();	// 대표자차량
		List<Integer> item16 = new ArrayList<Integer>();	// 대표자경비
		List<Integer> item17 = new ArrayList<Integer>();	// 박성진차량
		List<Integer> item18 = new ArrayList<Integer>();	// 박성진식대
		List<Integer> item19 = new ArrayList<Integer>();	// 박성진경비
		List<Integer> item20 = new ArrayList<Integer>();	// 한정신차량
		List<Integer> item21 = new ArrayList<Integer>();	// 한정신식대
		List<Integer> item22 = new ArrayList<Integer>();	// 한정신경비
		List<Integer> item23 = new ArrayList<Integer>();	// 공용식대
		List<Integer> item24 = new ArrayList<Integer>();	// 공용경비
		List<Integer> incomeSum = new ArrayList<Integer>();	// 수입합계
		List<Integer> expenseSum = new ArrayList<Integer>();	// 지출합계
		
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
			item03.add(inquiryDao.item03(day));	// 금융이자
			item04.add(inquiryDao.item04(day));	// 차입금
			item05.add(inquiryDao.item05(day));	// 카드취소
			item06.add(inquiryDao.item06(day));	// 세금환급
			item07.add(inquiryDao.item07(day));	// 대금결재
			item08.add(inquiryDao.item08(day));	// 물류비
			item081.add(inquiryDao.item081(day));	// 물류비
			item09.add(inquiryDao.item09(day));	// 임대관리비
			item10.add(inquiryDao.item10(day));	// 급여
			item11.add(inquiryDao.item11(day));	// 차입금상환
			item12.add(inquiryDao.item12(day));	// 세금
			item13.add(inquiryDao.item13(day));	// 4대보험
			item14.add(inquiryDao.item14(day));	// 접대비
			item15.add(inquiryDao.item15(day));	// 대표자 차량
			item16.add(inquiryDao.item16(day));	// 대표자 경비
			item17.add(inquiryDao.item17(day));	// 박성진 차량
			item18.add(inquiryDao.item18(day));	// 박성진 식대
			item19.add(inquiryDao.item19(day));	// 박성진 경비
			item20.add(inquiryDao.item20(day));	// 한정신 차량
			item21.add(inquiryDao.item21(day));	// 한정신 식대
			item22.add(inquiryDao.item22(day));	// 한정신 경비
			item23.add(inquiryDao.item23(day));	// 공용 식대
			item24.add(inquiryDao.item24(day));	// 공용 경비
			incomeSum.add(inquiryDao.incomeSum(day));	// 수입 합계
			expenseSum.add(inquiryDao.expenseSum(day));	// 지출 합계
		}
		mav.addObject("month", month);
		mav.addObject("begin", begin);	// 기초잔액
		mav.addObject("end", end);	// 기말잔액
		mav.addObject("item01", item01);	
		mav.addObject("item01Sum", SumCount.itemSum(item01));	
		mav.addObject("item02", item02);	
		mav.addObject("item02Sum", SumCount.itemSum(item02));	
		mav.addObject("item03", item03);	
		mav.addObject("item03Sum", SumCount.itemSum(item03));	
		mav.addObject("item04", item04);	
		mav.addObject("item04Sum", SumCount.itemSum(item04));	
		mav.addObject("item05", item05);	
		mav.addObject("item05Sum", SumCount.itemSum(item05));	
		mav.addObject("item06", item06);	
		mav.addObject("item06Sum", SumCount.itemSum(item06));	
		mav.addObject("item07", item07);	
		mav.addObject("item07Sum", SumCount.itemSum(item07));	
		mav.addObject("item08", item08);	
		mav.addObject("item08Sum", SumCount.itemSum(item08));
		mav.addObject("item081", item081);	
		mav.addObject("item081Sum", SumCount.itemSum(item081));	
		mav.addObject("item09", item09);	
		mav.addObject("item09Sum", SumCount.itemSum(item09));	
		mav.addObject("item10", item10);	
		mav.addObject("item10Sum", SumCount.itemSum(item10));	
		mav.addObject("item11", item11);	
		mav.addObject("item11Sum", SumCount.itemSum(item11));	
		mav.addObject("item12", item12);	
		mav.addObject("item12Sum", SumCount.itemSum(item12));	
		mav.addObject("item13", item13);	
		mav.addObject("item13Sum", SumCount.itemSum(item13));	
		mav.addObject("item14", item14);	
		mav.addObject("item14Sum", SumCount.itemSum(item14));	
		mav.addObject("item15", item15);	
		mav.addObject("item15Sum", SumCount.itemSum(item15));	
		mav.addObject("item16", item16);	
		mav.addObject("item16Sum", SumCount.itemSum(item16));	
		mav.addObject("item17", item17);	
		mav.addObject("item17Sum", SumCount.itemSum(item17));	
		mav.addObject("item18", item18);	
		mav.addObject("item18Sum", SumCount.itemSum(item18));	
		mav.addObject("item19", item19);	
		mav.addObject("item19Sum", SumCount.itemSum(item19));	
		mav.addObject("item20", item20);	
		mav.addObject("item20Sum", SumCount.itemSum(item20));	
		mav.addObject("item21", item21);	
		mav.addObject("item21Sum", SumCount.itemSum(item21));	
		mav.addObject("item22", item22);	
		mav.addObject("item22Sum", SumCount.itemSum(item22));	
		mav.addObject("item23", item23);	
		mav.addObject("item23Sum", SumCount.itemSum(item23));	
		mav.addObject("item24", item24);	
		mav.addObject("item24Sum", SumCount.itemSum(item24));	
		mav.addObject("incomeSum", incomeSum);	
		mav.addObject("incomeTotal", SumCount.itemSum(incomeSum));	
		mav.addObject("expenseSum", expenseSum);	
		mav.addObject("expenseTotal", SumCount.itemSum(expenseSum));	
		return mav;
	}
	
	@RequestMapping(value = "/state", method = RequestMethod.GET)
	public ModelAndView inquiryMonthStateHandle(@RequestParam Map param) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
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
		List<Integer> incomeSum = new ArrayList<Integer>();	// 수입합계
		List<Integer> expenseSum = new ArrayList<Integer>();	// 지출합계
		
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
			incomeSum.add(inquiryDao.incomeSum(day));	// 수입합계
			expenseSum.add(inquiryDao.expenseSum(day));	// 지출합계
		}
		//
		mav.addObject("section", "inquiry/stat");
		mav.addObject("month", month);
		mav.addObject("item01Sum", SumCount.itemSum(item01));	// 매출 합계
		mav.addObject("item02Sum", SumCount.itemSum(item02));	// 업체환급 합계
		mav.addObject("item03Sum", SumCount.itemSum(item03));	// 이체 합계
		mav.addObject("item04Sum", SumCount.itemSum(item04));	// 금융이자 합계
		mav.addObject("item05Sum", SumCount.itemSum(item05));	// 차입금 합계
		mav.addObject("item06Sum", SumCount.itemSum(item06));	// 카드취소 합계
		mav.addObject("item07Sum", SumCount.itemSum(item07));	// 세금 환급 합계
		mav.addObject("item08Sum", SumCount.itemSum(item08));	// 거래처 결재 합계
		mav.addObject("item09Sum", SumCount.itemSum(item09));	// 이체 합계
		mav.addObject("item10Sum", SumCount.itemSum(item10));	// 경비 합계
		mav.addObject("item11Sum", SumCount.itemSum(item11));	// 접대비 합계
		mav.addObject("item12Sum", SumCount.itemSum(item12));	// 대표자 경비 합계
		mav.addObject("item13Sum", SumCount.itemSum(item13));	// 대표자 차량 합계
		mav.addObject("item14Sum", SumCount.itemSum(item14));	// 원단 물류비 합계
		mav.addObject("item15Sum", SumCount.itemSum(item15));	// 기타 합계
		mav.addObject("item16Sum", SumCount.itemSum(item16));	// 식대 합계
		mav.addObject("item17Sum", SumCount.itemSum(item17));	// 한정신 차량 합계
		mav.addObject("item18Sum", SumCount.itemSum(item18));	// 박성진 차량 합계
		mav.addObject("item19Sum", SumCount.itemSum(item19));	// 박성진 경비 합계
		mav.addObject("item20Sum", SumCount.itemSum(item20));	// 박성진 식대 합계
		mav.addObject("item21Sum", SumCount.itemSum(item21));	// 임대관리비 합계
		mav.addObject("item22Sum", SumCount.itemSum(item22));	// 급여 합계
		mav.addObject("item23Sum", SumCount.itemSum(item23));	// 차입금상환합계
		mav.addObject("item24Sum", SumCount.itemSum(item24));	//대출 합계
		mav.addObject("incomeTotal", SumCount.itemSum(incomeSum));	// 수입월합계
		mav.addObject("expenseTotal", SumCount.itemSum(expenseSum));	// 지출월합계
		return mav;
	}
	
	@RequestMapping(value = "/yearly", method = RequestMethod.GET)
	public ModelAndView inquiryYearHandle(@RequestParam Map param) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
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
		List<Integer> incomeSum = new ArrayList<Integer>();	// 수입합계
		List<Integer> expenseSum = new ArrayList<Integer>();	// 지출합계	
		
		mav.addObject("section", "inquiry/yearly");
		
		String year = (String) param.get("year");
		for(int i=1; i<13; i++) {
			String m="";
			if(i<10) {
				m="0"+String.valueOf(i);
			}else {
				m=String.valueOf(i);
			}
			String date = year+"-"+m;
			item01.add(inquiryDao.item01Year(date));	// 매출
			item02.add(inquiryDao.item02Year(date));	// 업체환급
			item03.add(inquiryDao.item03Year(date));	// 이체
			item04.add(inquiryDao.item04Year(date));	// 금융이자
			item05.add(inquiryDao.item05Year(date));	// 차입금
			item06.add(inquiryDao.item06Year(date));	// 카드취소
			item07.add(inquiryDao.item07Year(date));	// 세금환급
			item08.add(inquiryDao.item08Year(date));	// 거래처결제
			item09.add(inquiryDao.item09Year(date));	// 이체
			item10.add(inquiryDao.item10Year(date));	// 경비
			item11.add(inquiryDao.item11Year(date));	// 접대비
			item12.add(inquiryDao.item12Year(date));	// 대표자경비
			item13.add(inquiryDao.item13Year(date));	// 대표자차량
			item14.add(inquiryDao.item14Year(date));	// 원단물류비
			item15.add(inquiryDao.item15Year(date));	// 기타
			item16.add(inquiryDao.item16Year(date));	// 식대
			item17.add(inquiryDao.item17Year(date));	// 한정신차량
			item18.add(inquiryDao.item18Year(date));	// 박성진차량
			item19.add(inquiryDao.item19Year(date));	// 박성진경비
			item20.add(inquiryDao.item20Year(date));	// 박성진식대
			item21.add(inquiryDao.item21Year(date));	// 임대관리비
			item22.add(inquiryDao.item22Year(date));	// 급여
			item23.add(inquiryDao.item23Year(date));	// 차입금상환
			item24.add(inquiryDao.item24Year(date));	// 대출
			incomeSum.add(inquiryDao.incomeSumYear(date));	// 수입합계
			expenseSum.add(inquiryDao.expenseSumYear(date));	// 지출합계
		}
		mav.addObject("year", year);
		mav.addObject("item01", item01);
		mav.addObject("item02", item02);
		mav.addObject("item03", item03);
		mav.addObject("item04", item04);
		mav.addObject("item05", item05);
		mav.addObject("item06", item06);
		mav.addObject("item07", item07);
		mav.addObject("item08", item08);
		mav.addObject("item09", item09);
		mav.addObject("item10", item10);
		mav.addObject("item11", item11);
		mav.addObject("item12", item12);
		mav.addObject("item13", item13);
		mav.addObject("item14", item14);
		mav.addObject("item15", item15);
		mav.addObject("item16", item16);
		mav.addObject("item17", item17);
		mav.addObject("item18", item18);
		mav.addObject("item19", item19);
		mav.addObject("item20", item20);
		mav.addObject("item21", item21);
		mav.addObject("item22", item22);
		mav.addObject("item23", item23);
		mav.addObject("item24", item24);
		mav.addObject("incomeSum", incomeSum);
		mav.addObject("expenseSum", expenseSum);
		return mav;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView inquirySearchPostHandle(SearchVO vo) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		String item = vo.getCondition();
		int r = 0;
		if(item.equals("내용")) {
			r=1;
		}else if(item.equals("비고")) {
			r=2;
		}else if(item.equals("금액")) {
			r=3;
		}
		List<InquiryVO> list = new ArrayList<InquiryVO>();
		switch(r) {
		case 1:
			list = inquiryDao.search1(vo); break;
		case 2:
			list = inquiryDao.search2(vo); break;
		case 3:
			list = inquiryDao.search3(vo); break;
		default :
			list = inquiryDao.search1(vo); break;	
		}
		mav.addObject("section", "inquiry/search");
		mav.addObject("list", list);
		mav.addObject("vo", vo);
		return mav;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	@ResponseBody
	public InquiryVO inquiryModifyHandle(@RequestParam Map param) throws Exception {
		InquiryVO vo = inquiryDao.modify(param);
		return vo;
	}
	
	@RequestMapping(value = "/update", method = {RequestMethod.GET, RequestMethod.POST})
	public String inquiryUpdateHandle(InquiryVO vo) throws Exception{
		String date = vo.getTran_date();
		inquiryDao.update(vo);
		return "redirect: /inquiry/daily?date="+date;
	}
	
	@RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String inquiryDeleteHandle(InquiryVO vo) throws Exception{
		String date = vo.getTran_date();
		inquiryDao.delete(vo);
		return "redirect: /inquiry/daily?date="+date;
	}
}

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

	@RequestMapping(value = "/month", method = RequestMethod.GET)
	public ModelAndView inquiryMonthHandle(@RequestParam Map param) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		List<Integer> begin = new ArrayList<Integer>();		// �����ܾ�
		List<Integer> end = new ArrayList<Integer>();		// �⸻�ܾ�
		// �Ա�
		List<Integer> item01 = new ArrayList<Integer>();	// ����
		List<Integer> item02 = new ArrayList<Integer>();	// ��üȯ��
		List<Integer> item03 = new ArrayList<Integer>();	// ��ü
		List<Integer> item04 = new ArrayList<Integer>();	// ��������
		List<Integer> item05 = new ArrayList<Integer>();	// ���Ա�
		List<Integer> item06 = new ArrayList<Integer>();	// ī�����
		List<Integer> item07 = new ArrayList<Integer>();	// ����ȯ��
		// ���
		List<Integer> item08 = new ArrayList<Integer>();	// �ŷ�ó����
		List<Integer> item09 = new ArrayList<Integer>();	// ��ü
		List<Integer> item10 = new ArrayList<Integer>();	// ���
		List<Integer> item11 = new ArrayList<Integer>();	// �����
		List<Integer> item12 = new ArrayList<Integer>();	// ��ǥ�ڰ��
		List<Integer> item13 = new ArrayList<Integer>();	// ��ǥ������
		List<Integer> item14 = new ArrayList<Integer>();	// ���ܹ�����
		List<Integer> item15 = new ArrayList<Integer>();	// ��Ÿ
		List<Integer> item16 = new ArrayList<Integer>();	// �Ĵ�
		List<Integer> item17 = new ArrayList<Integer>();	// ����������
		List<Integer> item18 = new ArrayList<Integer>();	// �ڼ�������
		List<Integer> item19 = new ArrayList<Integer>();	// �ڼ������
		List<Integer> item20 = new ArrayList<Integer>();	// �ڼ����Ĵ�
		List<Integer> item21 = new ArrayList<Integer>();	// �Ӵ������
		List<Integer> item22 = new ArrayList<Integer>();	// �޿�
		List<Integer> item23 = new ArrayList<Integer>();	// ���Աݻ�ȯ
		List<Integer> item24 = new ArrayList<Integer>();	// ����
		List<Integer> item25 = new ArrayList<Integer>();	// ����
		List<Integer> item26 = new ArrayList<Integer>();	// 4�뺸��
		List<Integer> incomeSum = new ArrayList<Integer>();	// �����հ�
		List<Integer> expenseSum = new ArrayList<Integer>();	// �����հ�
		
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
			begin.add(accountDao.beginDailyBegin(map));	// �����ܾ�
			end.add(accountDao.beginDailyEnd(map));	// �����ܾ�
			item01.add(inquiryDao.item01(day));	// ����
			item02.add(inquiryDao.item02(day));	// ��üȯ��
			item03.add(inquiryDao.item03(day));	// ��ü
			item04.add(inquiryDao.item04(day));	// ��������
			item05.add(inquiryDao.item05(day));	// ���Ա�
			item06.add(inquiryDao.item06(day));	// ī�����
			item07.add(inquiryDao.item07(day));	// ����ȯ��
			item08.add(inquiryDao.item08(day));	// �ŷ�ó����
			item09.add(inquiryDao.item09(day));	// ��ü
			item10.add(inquiryDao.item10(day));	// ���
			item11.add(inquiryDao.item11(day));	// �����
			item12.add(inquiryDao.item12(day));	// ��ǥ�ڰ��
			item13.add(inquiryDao.item13(day));	// ��ǥ������
			item14.add(inquiryDao.item14(day));	// ���ܹ�����
			item15.add(inquiryDao.item15(day));	// ��Ÿ
			item16.add(inquiryDao.item16(day));	// �Ĵ�
			item17.add(inquiryDao.item17(day));	// ����������
			item18.add(inquiryDao.item18(day));	// �ڼ�������
			item19.add(inquiryDao.item19(day));	// �ڼ������
			item20.add(inquiryDao.item20(day));	// �ڼ����Ĵ�
			item21.add(inquiryDao.item21(day));	// �Ӵ������
			item22.add(inquiryDao.item22(day));	// �޿�
			item23.add(inquiryDao.item23(day));	// ���Աݻ�ȯ
			item24.add(inquiryDao.item24(day));	// ����
			item25.add(inquiryDao.item25(day));	// ����
			item26.add(inquiryDao.item26(day));	// 4�뺸��
			incomeSum.add(inquiryDao.incomeSum(day));	// ����
			expenseSum.add(inquiryDao.expenseSum(day));	// 4�뺸��
		}
		//
		mav.addObject("section", "inquiry/list");
		mav.addObject("month", month);
		mav.addObject("begin", begin);	// �����ܾ�
		mav.addObject("end", end);	// �⸻�ܾ�
		mav.addObject("item01", item01);	// ����
		mav.addObject("item01Sum", SumCount.itemSum(item01));	// ���� �հ�
		mav.addObject("item02", item02);	// ��üȯ��v
		mav.addObject("item02Sum", SumCount.itemSum(item02));	// ��üȯ�� �հ�
		mav.addObject("item03", item03);	// ��ü
		mav.addObject("item03Sum", SumCount.itemSum(item03));	// ��ü �հ�
		mav.addObject("item04", item04);	// ��������
		mav.addObject("item04Sum", SumCount.itemSum(item04));	// �������� �հ�
		mav.addObject("item05", item05);	// ���Ա�
		mav.addObject("item05Sum", SumCount.itemSum(item05));	// ���Ա� �հ�
		mav.addObject("item06", item06);	// ī�����
		mav.addObject("item06Sum", SumCount.itemSum(item06));	// ī����� �հ�
		mav.addObject("item07", item07);	// ����ȯ��
		mav.addObject("item07Sum", SumCount.itemSum(item07));	// ���� ȯ�� �հ�
		mav.addObject("item08", item08);	// �ŷ�ó����
		mav.addObject("item08Sum", SumCount.itemSum(item08));	// �ŷ�ó ���� �հ�
		mav.addObject("item09", item09);	// ��ü
		mav.addObject("item09Sum", SumCount.itemSum(item09));	// ��ü �հ�
		mav.addObject("item10", item10);	// ���
		mav.addObject("item10Sum", SumCount.itemSum(item10));	// ��� �հ�
		mav.addObject("item11", item11);	// �����
		mav.addObject("item11Sum", SumCount.itemSum(item11));	// ����� �հ�
		mav.addObject("item12", item12);	// ��ǥ�ڰ��
		mav.addObject("item12Sum", SumCount.itemSum(item12));	// ��ǥ�� ��� �հ�
		mav.addObject("item13", item13);	// ��ǥ������
		mav.addObject("item13Sum", SumCount.itemSum(item13));	// ��ǥ�� ���� �հ�
		mav.addObject("item14", item14);	// ���ܹ�����
		mav.addObject("item14Sum", SumCount.itemSum(item14));	// ���� ������ �հ�
		mav.addObject("item15", item15);	// ��Ÿ
		mav.addObject("item15Sum", SumCount.itemSum(item15));	// ��Ÿ �հ�
		mav.addObject("item16", item16);	// �Ĵ�
		mav.addObject("item16Sum", SumCount.itemSum(item16));	// �Ĵ� �հ�
		mav.addObject("item17", item17);	// ����������
		mav.addObject("item17Sum", SumCount.itemSum(item17));	// ������ ���� �հ�
		mav.addObject("item18", item18);	// �ڼ�������
		mav.addObject("item18Sum", SumCount.itemSum(item18));	// �ڼ��� ���� �հ�
		mav.addObject("item19", item19);	// �ڼ������
		mav.addObject("item19Sum", SumCount.itemSum(item19));	// �ڼ��� ��� �հ�
		mav.addObject("item20", item20);	// �ڼ����Ĵ�
		mav.addObject("item20Sum", SumCount.itemSum(item20));	// �ڼ��� �Ĵ� �հ�
		mav.addObject("item21", item21);	// �Ӵ������
		mav.addObject("item21Sum", SumCount.itemSum(item21));	// �Ӵ������ �հ�
		mav.addObject("item22", item22);	// �޿�
		mav.addObject("item22Sum", SumCount.itemSum(item22));	// �޿� �հ�
		mav.addObject("item23", item23);	// ���Աݻ�ȯ
		mav.addObject("item23Sum", SumCount.itemSum(item23));	// ���Աݻ�ȯ�հ�
		mav.addObject("item24", item24);	// ����
		mav.addObject("item24Sum", SumCount.itemSum(item24));	//���� �հ�
		mav.addObject("item25", item25);	// ����
		mav.addObject("item25Sum", SumCount.itemSum(item25));	// �����հ�
		mav.addObject("item26", item26);	// 4�뺸��
		mav.addObject("item26Sum", SumCount.itemSum(item26));	// 4�뺸�� �հ�
		mav.addObject("incomeSum", incomeSum);	// �����հ�
		mav.addObject("incomeTotal", SumCount.itemSum(incomeSum));	// ���Կ��հ�
		mav.addObject("expenseSum", expenseSum);	// �����հ�
		mav.addObject("expenseTotal", SumCount.itemSum(expenseSum));	// ������հ�
		return mav;
	}
	
	@RequestMapping(value = "/state", method = RequestMethod.GET)
	public ModelAndView inquiryMonthStateHandle(@RequestParam Map param) throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		// �Ա�
		List<Integer> item01 = new ArrayList<Integer>();	// ����
		List<Integer> item02 = new ArrayList<Integer>();	// ��üȯ��
		List<Integer> item03 = new ArrayList<Integer>();	// ��ü
		List<Integer> item04 = new ArrayList<Integer>();	// ��������
		List<Integer> item05 = new ArrayList<Integer>();	// ���Ա�
		List<Integer> item06 = new ArrayList<Integer>();	// ī�����
		List<Integer> item07 = new ArrayList<Integer>();	// ����ȯ��
		// ���
		List<Integer> item08 = new ArrayList<Integer>();	// �ŷ�ó����
		List<Integer> item09 = new ArrayList<Integer>();	// ��ü
		List<Integer> item10 = new ArrayList<Integer>();	// ���
		List<Integer> item11 = new ArrayList<Integer>();	// �����
		List<Integer> item12 = new ArrayList<Integer>();	// ��ǥ�ڰ��
		List<Integer> item13 = new ArrayList<Integer>();	// ��ǥ������
		List<Integer> item14 = new ArrayList<Integer>();	// ���ܹ�����
		List<Integer> item15 = new ArrayList<Integer>();	// ��Ÿ
		List<Integer> item16 = new ArrayList<Integer>();	// �Ĵ�
		List<Integer> item17 = new ArrayList<Integer>();	// ����������
		List<Integer> item18 = new ArrayList<Integer>();	// �ڼ�������
		List<Integer> item19 = new ArrayList<Integer>();	// �ڼ������
		List<Integer> item20 = new ArrayList<Integer>();	// �ڼ����Ĵ�
		List<Integer> item21 = new ArrayList<Integer>();	// �Ӵ������
		List<Integer> item22 = new ArrayList<Integer>();	// �޿�
		List<Integer> item23 = new ArrayList<Integer>();	// ���Աݻ�ȯ
		List<Integer> item24 = new ArrayList<Integer>();	// ����
		List<Integer> item25 = new ArrayList<Integer>();	// ����
		List<Integer> item26 = new ArrayList<Integer>();	// 4�뺸��
		List<Integer> incomeSum = new ArrayList<Integer>();	// �����հ�
		List<Integer> expenseSum = new ArrayList<Integer>();	// �����հ�
		
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
			item01.add(inquiryDao.item01(day));	// ����
			item02.add(inquiryDao.item02(day));	// ��üȯ��
			item03.add(inquiryDao.item03(day));	// ��ü
			item04.add(inquiryDao.item04(day));	// ��������
			item05.add(inquiryDao.item05(day));	// ���Ա�
			item06.add(inquiryDao.item06(day));	// ī�����
			item07.add(inquiryDao.item07(day));	// ����ȯ��
			item08.add(inquiryDao.item08(day));	// �ŷ�ó����
			item09.add(inquiryDao.item09(day));	// ��ü
			item10.add(inquiryDao.item10(day));	// ���
			item11.add(inquiryDao.item11(day));	// �����
			item12.add(inquiryDao.item12(day));	// ��ǥ�ڰ��
			item13.add(inquiryDao.item13(day));	// ��ǥ������
			item14.add(inquiryDao.item14(day));	// ���ܹ�����
			item15.add(inquiryDao.item15(day));	// ��Ÿ
			item16.add(inquiryDao.item16(day));	// �Ĵ�
			item17.add(inquiryDao.item17(day));	// ����������
			item18.add(inquiryDao.item18(day));	// �ڼ�������
			item19.add(inquiryDao.item19(day));	// �ڼ������
			item20.add(inquiryDao.item20(day));	// �ڼ����Ĵ�
			item21.add(inquiryDao.item21(day));	// �Ӵ������
			item22.add(inquiryDao.item22(day));	// �޿�
			item23.add(inquiryDao.item23(day));	// ���Աݻ�ȯ
			item24.add(inquiryDao.item24(day));	// ����
			item25.add(inquiryDao.item25(day));	// ����
			item26.add(inquiryDao.item26(day));	// 4�뺸��
			incomeSum.add(inquiryDao.incomeSum(day));	// ����
			expenseSum.add(inquiryDao.expenseSum(day));	// 4�뺸��
		}
		//
		mav.addObject("section", "inquiry/stat");
		mav.addObject("month", month);
		mav.addObject("item01Sum", SumCount.itemSum(item01));	// ���� �հ�
		mav.addObject("item02Sum", SumCount.itemSum(item02));	// ��üȯ�� �հ�
		mav.addObject("item03Sum", SumCount.itemSum(item03));	// ��ü �հ�
		mav.addObject("item04Sum", SumCount.itemSum(item04));	// �������� �հ�
		mav.addObject("item05Sum", SumCount.itemSum(item05));	// ���Ա� �հ�
		mav.addObject("item06Sum", SumCount.itemSum(item06));	// ī����� �հ�
		mav.addObject("item07Sum", SumCount.itemSum(item07));	// ���� ȯ�� �հ�
		mav.addObject("item08Sum", SumCount.itemSum(item08));	// �ŷ�ó ���� �հ�
		mav.addObject("item09Sum", SumCount.itemSum(item09));	// ��ü �հ�
		mav.addObject("item10Sum", SumCount.itemSum(item10));	// ��� �հ�
		mav.addObject("item11Sum", SumCount.itemSum(item11));	// ����� �հ�
		mav.addObject("item12Sum", SumCount.itemSum(item12));	// ��ǥ�� ��� �հ�
		mav.addObject("item13Sum", SumCount.itemSum(item13));	// ��ǥ�� ���� �հ�
		mav.addObject("item14Sum", SumCount.itemSum(item14));	// ���� ������ �հ�
		mav.addObject("item15Sum", SumCount.itemSum(item15));	// ��Ÿ �հ�
		mav.addObject("item16Sum", SumCount.itemSum(item16));	// �Ĵ� �հ�
		mav.addObject("item17Sum", SumCount.itemSum(item17));	// ������ ���� �հ�
		mav.addObject("item18Sum", SumCount.itemSum(item18));	// �ڼ��� ���� �հ�
		mav.addObject("item19Sum", SumCount.itemSum(item19));	// �ڼ��� ��� �հ�
		mav.addObject("item20Sum", SumCount.itemSum(item20));	// �ڼ��� �Ĵ� �հ�
		mav.addObject("item21Sum", SumCount.itemSum(item21));	// �Ӵ������ �հ�
		mav.addObject("item22Sum", SumCount.itemSum(item22));	// �޿� �հ�
		mav.addObject("item23Sum", SumCount.itemSum(item23));	// ���Աݻ�ȯ�հ�
		mav.addObject("item24Sum", SumCount.itemSum(item24));	//���� �հ�
		mav.addObject("item25Sum", SumCount.itemSum(item25));	// �����հ�
		mav.addObject("item26Sum", SumCount.itemSum(item26));	// 4�뺸�� �հ�
		mav.addObject("incomeTotal", SumCount.itemSum(incomeSum));	// ���Կ��հ�
		mav.addObject("expenseTotal", SumCount.itemSum(expenseSum));	// ������հ�
		return mav;
	}
}

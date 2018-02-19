package com.fland.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fland.domain.IncomeVO;
import com.fland.domain.InquiryVO;

@Repository
public class InquiryDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	// 일일 입출금조회
	public Map<String, List<InquiryVO>> daily(String date) throws Exception{
		List<InquiryVO> in_nhi = session.selectList("inquiry.income01", date);
		List<InquiryVO> in_nhe = session.selectList("inquiry.income02", date);
		List<InquiryVO> in_kbi = session.selectList("inquiry.income03", date);
		List<InquiryVO> in_kbe = session.selectList("inquiry.income04", date);
		List<InquiryVO> in_sh = session.selectList("inquiry.income05", date);
		List<InquiryVO> in_km = session.selectList("inquiry.income06", date);
		List<InquiryVO> out_nhi = session.selectList("inquiry.out01", date);
		List<InquiryVO> out_nhe = session.selectList("inquiry.out02", date);
		List<InquiryVO> out_kbi = session.selectList("inquiry.out03", date);
		List<InquiryVO> out_kbe = session.selectList("inquiry.out04", date);
		List<InquiryVO> out_sh = session.selectList("inquiry.out05", date);
		List<InquiryVO> out_km = session.selectList("inquiry.out06", date);
		Map<String, List<InquiryVO>> map = new HashMap<String, List<InquiryVO>>();
		map.put("in_nhi", in_nhi);
		map.put("in_nhe", in_nhe);
		map.put("in_kbi", in_kbi);
		map.put("in_kbe", in_kbe);
		map.put("in_sh", in_sh);
		map.put("in_km", in_km);
		map.put("out_nhi", out_nhi);
		map.put("out_nhe", out_nhe);
		map.put("out_kbi", out_kbi);
		map.put("out_kbe", out_kbe);
		map.put("out_sh", out_sh);
		map.put("out_km", out_km);
		return map;
	}
	
	public int item01(String date) throws Exception {
		if(session.selectOne("month.item01", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item01", date);
		}
	}
	public int item02(String date) throws Exception{
		if(session.selectOne("month.item02", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item02", date);
		}
	}
	public int item03(String date) throws Exception {
		if(session.selectOne("month.item03", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item03", date);
		}
	}
	public int item04(String date) throws Exception {
		if(session.selectOne("month.item04", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item04", date);
		}
	}
	public int item05(String date) throws Exception {
		if(session.selectOne("month.item05", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item05", date);
		}
	}
	public int item06(String date) throws Exception {
		if(session.selectOne("month.item06", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item06", date);
		}
	}
	public int item07(String date) throws Exception {
		if(session.selectOne("month.item07", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item07", date);
		}
	}
	public int item08(String date) throws Exception {
		if(session.selectOne("month.item08", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item08", date);
		}
	}
	public int item09(String date) throws Exception {
		if(session.selectOne("month.item09", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item09", date);
		}
	}
	public int item10(String date) throws Exception {
		if(session.selectOne("month.item10", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item10", date);
		}
	}
	public int item11(String date) throws Exception {
		if(session.selectOne("month.item11", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item11", date);
		}
	}
	public int item12(String date) throws Exception {
		if(session.selectOne("month.item12", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item12", date);
		}
	}
	public int item13(String date) throws Exception {
		if(session.selectOne("month.item13", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item13", date);
		}
	}
	public int item14(String date) throws Exception {
		if(session.selectOne("month.item14", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item14", date);
		}
	}
	public int item15(String date) throws Exception {
		if(session.selectOne("month.item15", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item15", date);
		}
	}
	public int item16(String date) throws Exception {
		if(session.selectOne("month.item16", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item16", date);
		}
	}
	public int item17(String date) throws Exception {
		if(session.selectOne("month.item17", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item17", date);
		}
	}
	public int item18(String date) throws Exception {
		if(session.selectOne("month.item18", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item18", date);
		}
	}
	public int item19(String date) throws Exception {
		if(session.selectOne("month.item19", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item19", date);
		}
	}
	public int item20(String date) throws Exception {
		if(session.selectOne("month.item20", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item20", date);
		}
	}
	public int item21(String date) throws Exception {
		if(session.selectOne("month.item21", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item21", date);
		}
	}
	public int item22(String date) throws Exception {
		if(session.selectOne("month.item22", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item22", date);
		}
	}
	public int item23(String date) throws Exception {
		if(session.selectOne("month.item23", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item23", date);
		}
	}
	public int item24(String date) throws Exception {
		if(session.selectOne("month.item24", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item24", date);
		}
	}
	public int item25(String date) throws Exception {
		if(session.selectOne("month.item25", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item25", date);
		}
	}
	public int item26(String date) throws Exception {
		if(session.selectOne("month.item26", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.item26", date);
		}
	}
	public int incomeSum(String date) throws Exception {
		if(session.selectOne("month.incomeSum", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.incomeSum", date);
		}
	}
	public int expenseSum(String date) throws Exception {
		if(session.selectOne("month.expenseSum", date)==null) {
			return 0;
		}else {
			return session.selectOne("month.expenseSum", date);
		}
	}
// 월별 item 합계
	public int item01Year(String date) throws Exception {
		if(session.selectOne("year.item01", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item01", date);
		}
	}
	public int item02Year(String date) throws Exception{
		if(session.selectOne("year.item02", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item02", date);
		}
	}
	public int item03Year(String date) throws Exception {
		if(session.selectOne("year.item03", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item03", date);
		}
	}
	public int item04Year(String date) throws Exception {
		if(session.selectOne("year.item04", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item04", date);
		}
	}
	public int item05Year(String date) throws Exception {
		if(session.selectOne("year.item05", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item05", date);
		}
	}
	public int item06Year(String date) throws Exception {
		if(session.selectOne("year.item06", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item06", date);
		}
	}
	public int item07Year(String date) throws Exception {
		if(session.selectOne("year.item07", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item07", date);
		}
	}
	public int item08Year(String date) throws Exception {
		if(session.selectOne("year.item08", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item08", date);
		}
	}
	public int item09Year(String date) throws Exception {
		if(session.selectOne("year.item09", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item09", date);
		}
	}
	public int item10Year(String date) throws Exception {
		if(session.selectOne("year.item10", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item10", date);
		}
	}
	public int item11Year(String date) throws Exception {
		if(session.selectOne("year.item11", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item11", date);
		}
	}
	public int item12Year(String date) throws Exception {
		if(session.selectOne("year.item12", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item12", date);
		}
	}
	public int item13Year(String date) throws Exception {
		if(session.selectOne("year.item13", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item13", date);
		}
	}
	public int item14Year(String date) throws Exception {
		if(session.selectOne("year.item14", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item14", date);
		}
	}
	public int item15Year(String date) throws Exception {
		if(session.selectOne("year.item15", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item15", date);
		}
	}
	public int item16Year(String date) throws Exception {
		if(session.selectOne("year.item16", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item16", date);
		}
	}
	public int item17Year(String date) throws Exception {
		if(session.selectOne("year.item17", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item17", date);
		}
	}
	public int item18Year(String date) throws Exception {
		if(session.selectOne("year.item18", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item18", date);
		}
	}
	public int item19Year(String date) throws Exception {
		if(session.selectOne("year.item19", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item19", date);
		}
	}
	public int item20Year(String date) throws Exception {
		if(session.selectOne("year.item20", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item20", date);
		}
	}
	public int item21Year(String date) throws Exception {
		if(session.selectOne("year.item21", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item21", date);
		}
	}
	public int item22Year(String date) throws Exception {
		if(session.selectOne("year.item22", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item22", date);
		}
	}
	public int item23Year(String date) throws Exception {
		if(session.selectOne("year.item23", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item23", date);
		}
	}
	public int item24Year(String date) throws Exception {
		if(session.selectOne("year.item24", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item24", date);
		}
	}
	public int item25Year(String date) throws Exception {
		if(session.selectOne("year.item25", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item25", date);
		}
	}
	public int item26Year(String date) throws Exception {
		if(session.selectOne("year.item26", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.item26", date);
		}
	}
	public int incomeSumYear(String date) throws Exception {
		if(session.selectOne("year.incomeSum", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.incomeSum", date);
		}
	}
	public int expenseSumYear(String date) throws Exception {
		if(session.selectOne("year.expenseSum", date)==null) {
			return 0;
		}else {
			return session.selectOne("year.expenseSum", date);
		}
	}
}

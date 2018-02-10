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
	public Map<String, List<InquiryVO>> daily(String date) {
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
}

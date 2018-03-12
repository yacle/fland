package com.fland.persistence;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fland.domain.CompanyVO;
@Repository
public class CompanyDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	public void companyAdd(CompanyVO vo) {
		session.insert("company.add", vo);
	}
	
	public List<CompanyVO> companyListRead(){
		return session.selectList("company.listRead");
	}
	
	public CompanyVO companyRead(String NAME) {
		return session.selectOne("company.companyRead", NAME);
	}
	
	public void companyUpdate(CompanyVO vo) {
		session.update("company.update", vo);
	}
}

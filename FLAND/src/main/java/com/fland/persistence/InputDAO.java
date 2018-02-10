package com.fland.persistence;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fland.domain.ExpenseVO;
import com.fland.domain.IncomeVO;
@Repository
public class InputDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	public void incomeAdd(IncomeVO vo) {
		session.insert("input.incomeAdd", vo);
	}
	
	public void expenseAdd(ExpenseVO vo) {
		session.insert("input.expenseAdd", vo);
	}
}

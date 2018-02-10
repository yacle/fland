package com.fland.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fland.domain.AccountVO;
import com.fland.domain.IncomeVO;
@Repository
public class AccountDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	// ∞Ë¡¬¡∂»∏
	public int insert(AccountVO vo) throws Exception{
		return session.insert("account.insert", vo);
	}
	public List<IncomeVO> readAll(String date) throws Exception{
		return session.selectList("account.readAll", date);
	}
	public List<IncomeVO> readEnd(String date) throws Exception{
		return session.selectList("account.readEnd", date);
	}
	public int readOne(String account) throws Exception{
		return session.selectOne("account.readOne", account);
	}
	public int update(AccountVO vo) throws Exception{
		return session.update("account.update", vo);
	}
	public List<AccountVO> readInfo() throws Exception{
		return session.selectList("account.readInfo");
	}
}

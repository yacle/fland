package com.fland.persistence;

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
	public List<IncomeVO> readBegin(String date) throws Exception{
		return session.selectList("account.readBegin", date);
	}
	public List<IncomeVO> readBeginDaily(String date) throws Exception{
		return session.selectList("account.readBeginDaily", date);
	}
	public List<IncomeVO> readEnd(String date) throws Exception{
		return session.selectList("account.readEnd", date);
	}
	public int beginDailyBegin(Map map) throws Exception{
		return session.selectOne("account.readDailyBegin", map);
	}
	public int beginDailyEnd(Map map) throws Exception{
		return session.selectOne("account.readDailyEnd", map);
	}
	public int update(AccountVO vo) throws Exception{
		return session.update("account.update", vo);
	}
	public List<AccountVO> readInfo() throws Exception{
		return session.selectList("account.readInfo");
	}
}

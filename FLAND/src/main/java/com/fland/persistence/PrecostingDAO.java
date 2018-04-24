package com.fland.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PrecostingDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	public Map<String, String> orderData(String orderno)throws Exception{
		return session.selectOne("precosting.order", orderno);
	}
	// 원사발주서 데이터
	public Map<String, String> threadData(String orderno)throws Exception{
		return session.selectOne("precosting.thread", orderno);
	}
	// 편직의뢰서 데이터
	public Map<String, String> knitData(String orderno)throws Exception{
		return session.selectOne("precosting.knit", orderno);
	}
	// 염색의뢰서 데이터
	public Map<String, String> dyeData(String orderno)throws Exception{
		return session.selectOne("precosting.dye", orderno);
	}
}

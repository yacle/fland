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
	// 원사발주서 체크
	public int checkData(String orderno)throws Exception{
		return session.selectOne("precosting.check", orderno);
	}
	// 원사발주서 저장
	public void saveData(Map<String, String> map)throws Exception{
		session.insert("precosting.add", map);
	}
	// 원사발주서 업데이트
	public void updateData(Map<String, String> map)throws Exception{
		session.update("precosting.update", map);
	}
	// 발주서 단가 업데이트
	public void updatePrice(Map<String, String> map)throws Exception{
		session.update("precosting.priceupdate", map);
	}
	// 사전원가계산서 read
	public Map<String, String> readData(String orderno)throws Exception{
		return session.selectOne("precosting.read", orderno);
	}
}

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
	// ������ּ� ������
	public Map<String, String> threadData(String orderno)throws Exception{
		return session.selectOne("precosting.thread", orderno);
	}
	// �����Ƿڼ� ������
	public Map<String, String> knitData(String orderno)throws Exception{
		return session.selectOne("precosting.knit", orderno);
	}
	// �����Ƿڼ� ������
	public Map<String, String> dyeData(String orderno)throws Exception{
		return session.selectOne("precosting.dye", orderno);
	}
}

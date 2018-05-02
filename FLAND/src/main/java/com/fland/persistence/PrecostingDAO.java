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
	// ������ּ� üũ
	public int checkData(String orderno)throws Exception{
		return session.selectOne("precosting.check", orderno);
	}
	// ������ּ� ����
	public void saveData(Map<String, String> map)throws Exception{
		session.insert("precosting.add", map);
	}
	// ������ּ� ������Ʈ
	public void updateData(Map<String, String> map)throws Exception{
		session.update("precosting.update", map);
	}
	// ���ּ� �ܰ� ������Ʈ
	public void updatePrice(Map<String, String> map)throws Exception{
		session.update("precosting.priceupdate", map);
	}
	// ����������꼭 read
	public Map<String, String> readData(String orderno)throws Exception{
		return session.selectOne("precosting.read", orderno);
	}
}

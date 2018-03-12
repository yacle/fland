package com.fland.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	public void orderAdd(Map map) {
		session.insert("order.add", map);
	}
	
	public int orderRead(String orderno) {
		return session.selectOne("order.read", orderno);
	}
	
	public void orderUpdate(Map map) {
		session.update("order.update", map);
	}
}

package com.fland.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	public int orderAdd(Map map) {
		return session.insert("order.add", map);
	}
}

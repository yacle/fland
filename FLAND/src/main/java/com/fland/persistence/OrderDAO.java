package com.fland.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fland.domain.Criteria;
import com.fland.domain.OrderVO;

@Repository
public class OrderDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	public void orderAdd(Map map) throws Exception {
		session.insert("order.add", map);
	}
	
	public int orderRead(String orderno) throws Exception {
		return session.selectOne("order.read", orderno);
	}
	
	public void orderUpdate(Map map) throws Exception {
		session.update("order.update", map);
	}
	
	public void dyeAdd(Map map) throws Exception {
		session.insert("order.dyeadd", map);
	}
	
	public void knitAdd(Map map) throws Exception {
		session.insert("order.knitadd", map);
	}
	
	// paging
	public List<OrderVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList("order.pageList", cri);
	}
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne("order.countPaging", cri);
	}
}

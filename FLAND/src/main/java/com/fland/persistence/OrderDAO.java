package com.fland.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fland.domain.Criteria;
import com.fland.domain.KnitVO;
import com.fland.domain.OrderVO;

@Repository
public class OrderDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	public void orderAdd(Map map) throws Exception {
		session.insert("order.add", map);
	}
	
	public int orderRead(String orderno) throws Exception {
		return session.selectOne("order.orderread", orderno);
	}
	
	public void orderUpdate(Map map) throws Exception {
		session.update("order.orderupdate", map);
	}
	
	public int dyeRead(String orderno) throws Exception {
		return session.selectOne("order.dyeread", orderno);
	}
	
	public void dyeAdd(Map map) throws Exception {
		session.insert("order.dyeadd", map);
	}
	
	public void dyeUpdate(Map map) throws Exception {
		session.update("order.dyeupdate", map);
	}
	// dye Search
	public Map<String, String> dyeSearch(String orderno) throws Exception {
		return session.selectOne("order.dyesearch", orderno);
	}
	
	public void knitAdd(KnitVO vo) throws Exception {
		session.insert("order.knitadd", vo);
	}
	// knit update
	public void knitUpdate(KnitVO vo) throws Exception {
		session.update("order.knitupdate", vo);
	}
	// knit Search
	public List<Map<String, String>> knitSearch(String orderno) throws Exception {
		return session.selectList("order.knitsearch", orderno);
	}
	// knit new
	public Map<String, Object> knitNew(Object object) throws Exception{
		return session.selectOne("order.knitnew", object);
	}
	// paging oracle
	public List<OrderVO> listCriteriaOracle(Criteria cri) throws Exception {
		return session.selectList("order.pageList", cri);
	}
	// paging MySQL
	public List<OrderVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList("order.listCriteria", cri);
	}
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne("order.countPaging", cri);
	}
	
	
}

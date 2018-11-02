package com.fland.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fland.domain.Criteria;
import com.fland.domain.OrderVO;
import com.fland.domain.PurchaseVO;

@Repository
public class PurchaseDAO {
	@Inject
	private  SqlSessionTemplate session;

	public void Add(PurchaseVO vo) {
		session.insert("purchase.add", vo);
	}
	
	public PurchaseVO modify(String no) {
		return session.selectOne("purchase.modify", no);
	}
	
	public void update(PurchaseVO vo) {
		session.update("purchase.update", vo);
	}
	
	public void delete(String no) {
		session.delete("purchase.delete", no);
	}
	
	public List<Map<String, String>> orderList(){
		return session.selectList("purchase.order_list" );
	}
	
	public Map<String, String> month(Map<String, String> map){
		return session.selectOne("purchase.month", map);
	}
	// paging MySQL
		public List<PurchaseVO> listCriteria(Criteria cri) throws Exception {
			return session.selectList("purchase.listCriteria", cri);
		}
		public int countPaging(Criteria cri) throws Exception {
			return session.selectOne("purchase.countPaging", cri);
		}
}

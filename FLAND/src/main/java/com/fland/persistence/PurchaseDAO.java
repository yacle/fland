package com.fland.persistence;

import java.util.List;

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
	
	
	// paging MySQL
		public List<PurchaseVO> listCriteria(Criteria cri) throws Exception {
			return session.selectList("purchase.listCriteria", cri);
		}
		public int countPaging(Criteria cri) throws Exception {
			return session.selectOne("purchase.countPaging", cri);
		}
}

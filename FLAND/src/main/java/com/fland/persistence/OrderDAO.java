package com.fland.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fland.domain.Criteria;
import com.fland.domain.KnitVO;
import com.fland.domain.OrderVO;
import com.fland.domain.ThreadVO;

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
	
	// 염색의뢰서 체크
	public int dyeRead(String orderno) throws Exception {
		return session.selectOne("order.dyeread", orderno);
	}
	// 염색의뢰서 저장
	public void dyeAdd(Map map) throws Exception {
		session.insert("order.dyeadd", map);
	}
	// 염색의뢰서 업데이트
	public void dyeUpdate(Map map) throws Exception {
		session.update("order.dyeupdate", map);
	}
	// 염색의뢰서 검색
	public Map<String, String> dyeSearch(String orderno) throws Exception {
		return session.selectOne("order.dyesearch", orderno);
	}
	
	// 편직의뢰서 저장
	public void knitAdd(KnitVO vo) throws Exception {
		session.insert("order.knitadd", vo);
	}
	// 편진의뢰서 업데이트
	public void knitUpdate(KnitVO vo) throws Exception {
		session.update("order.knitupdate", vo);
	}
	// 편직의뢰서 삭제
	public int knitDel(String knitno)throws Exception{
		return session.delete("order.knitdel", knitno);
	}
	// 편직의뢰서 검색
	public List<Map<String, String>> knitSearch(String orderno) throws Exception {
		return session.selectList("order.knitsearch", orderno);
	}
	// 편직의뢰서 데이터
	public Map<String, Object> knitNew(Object object) throws Exception{
		return session.selectOne("order.knitnew", object);
	}
	// 원사발주서 저장
	public void threadAdd(Map map)throws Exception{
		session.insert("order.threadadd", map);
	}
	// 원사발주서 삭제
	public int threadDel(String threadno)throws Exception{
		return session.delete("order.threaddel", threadno);
	}
	// 원사발주서 업데이트
	public int threadUpdate(Map map)throws Exception{
		return session.update("order.threadupdate", map);
	}
	// 원사발주서 편직데이터
	public List<Map<String, String>> threadData(String orderno)throws Exception{
		return session.selectList("order.threaddata", orderno);
	}
	// 원사발주서 검색
	public List<ThreadVO> threadList(String orderno)throws Exception{
		return session.selectList("order.threadsearch", orderno);
	}
	// 원사발주서 체크
	public int threadCheck(String orderno)throws Exception{
		return session.selectOne("order.threadcheck", orderno);
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

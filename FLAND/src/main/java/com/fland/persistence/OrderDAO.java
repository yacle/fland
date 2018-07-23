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
	// ���ּ� �˻�
	public Map<String, String> orderSearch(String orderno)throws Exception{
		return session.selectOne("order.ordersearch", orderno);
	}
	// �����Ƿڼ� üũ
	public int dyeRead(String orderno) throws Exception {
		return session.selectOne("order.dyeread", orderno);
	}
	// �����Ƿڼ� ����
	public void dyeAdd(Map map) throws Exception {
		session.insert("order.dyeadd", map);
	}
	// �����Ƿڼ� ������Ʈ
	public void dyeUpdate(Map map) throws Exception {
		session.update("order.dyeupdate", map);
	}
	// �����Ƿڼ� �˻�
	public Map<String, String> dyeSearch(String orderno) throws Exception {
		System.out.println(orderno);
		return session.selectOne("order.dyesearch", orderno);
	}
	
	// �����Ƿڼ� ����
	public void knitAdd(KnitVO vo) throws Exception {
		session.insert("order.knitadd", vo);
	}
	// �����Ƿڼ� ������Ʈ
	public void knitUpdate(KnitVO vo) throws Exception {
		session.update("order.knitupdate", vo);
	}
	// �����Ƿڼ� ����
	public int knitDel(String knitno)throws Exception{
		return session.delete("order.knitdel", knitno);
	}
	// �����Ƿڼ� �˻�
	public List<Map<String, String>> knitSearch(String orderno) throws Exception {
		return session.selectList("order.knitsearch", orderno);
	}
	// �����Ƿڼ� ������
	public Map<String, Object> knitNew(Object object) throws Exception{
		return session.selectOne("order.knitnew", object);
	}
	// ������ּ� ����
	public void threadAdd(Map map)throws Exception{
		session.insert("order.threadadd", map);
	}
	// ������ּ� ����
	public int threadDel(String threadno)throws Exception{
		return session.delete("order.threaddel", threadno);
	}
	// ������ּ� ������Ʈ
	public int threadUpdate(Map map)throws Exception{
		return session.update("order.threadupdate", map);
	}
	// ������ּ� ����������
	public List<Map<String, String>> threadData(String orderno)throws Exception{
		return session.selectList("order.threaddata", orderno);
	}
	// ������ּ� �˻�
	public List<ThreadVO> threadSearch(String orderno)throws Exception{
		return session.selectList("order.threadsearch", orderno);
	}
	// ������ּ� üũ
	public int threadCheck(String orderno)throws Exception{
		return session.selectOne("order.threadcheck", orderno);
	}
	// �����Ƿڼ� data
	public Map<String, String> work(String orderno)throws Exception{
		return session.selectOne("order.work", orderno);
	}
	// �����Ƿڼ� �˻�
	public Map<String, String> workSearch(String orderno)throws Exception{
		return session.selectOne("order.worksearch", orderno);
	}
	// �����Ƿڼ� ����
	public String workAdd(Map<String, String> map)throws Exception{
		int r = session.selectOne("order.workcheck", map.get("orderno"));
		if(r>0) {
			session.insert("order.workupdate", map);
			return "update";
		}else {
			session.insert("order.workadd", map);
			return "add";
		}
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

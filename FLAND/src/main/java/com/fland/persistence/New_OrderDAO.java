package com.fland.persistence;


import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fland.domain.New_DyeVO;
import com.fland.domain.New_KnitVO;
import com.fland.domain.New_OrderVO;
import com.fland.domain.New_ProcessVO;
import com.fland.domain.New_YarnVO;

@Repository
public class New_OrderDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	public void orderAdd(New_OrderVO vo) throws Exception {
		session.insert("new_order.order_add", vo);
	}
	public void yarnAdd(New_YarnVO vo) throws Exception {
		session.insert("new_order.yarn_add", vo);
	}
	public void knitAdd(New_KnitVO vo) throws Exception {
		session.insert("new_order.knit_add", vo);
	}
	public void dyeAdd(New_DyeVO vo) throws Exception {
		session.insert("new_order.dye_add", vo);
	}
	public void processAdd(New_ProcessVO vo) throws Exception {
		session.insert("new_order.process_add", vo);
	}
	
	public List<New_OrderVO> orderRead(String ORDER_NO)throws Exception{
		List<New_OrderVO> order_list = session.selectList("new_order.order_read", ORDER_NO);
		return order_list;
	}
	public List<New_YarnVO> yarnRead(String ORDER_NO)throws Exception{
		List<New_YarnVO> yarn_list = session.selectList("new_order.yarn_read", ORDER_NO);
		return yarn_list;
	}
	public List<New_KnitVO> knitRead(String ORDER_NO)throws Exception{
		List<New_KnitVO> knit_list = session.selectList("new_order.knit_read", ORDER_NO);
		return knit_list;
	}
	public List<New_DyeVO> dyeRead(String ORDER_NO)throws Exception{
		List<New_DyeVO> dye_list = session.selectList("new_order.dye_read", ORDER_NO);
		return dye_list;
	}
	public List<New_ProcessVO> processRead(String ORDER_NO)throws Exception{
		List<New_ProcessVO> process_list = session.selectList("new_order.process_read", ORDER_NO);
		return process_list;
	}
}

package com.fland.persistence;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fland.domain.New_YarnVO;

@Repository
public class ManageDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	public void yarn(New_YarnVO vo) throws Exception {
		session.insert("manage.yarn_in", vo);
	}
}

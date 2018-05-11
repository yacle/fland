package com.fland.persistence;

import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PrintDAO {
	@Inject
	private  SqlSessionTemplate session;
	
	// ¿°»öÀÇ·Ú¼­ print
	public Map<String, String> dyePrint(String orderno){
		System.out.println(orderno+":");
		return session.selectOne("print.dye", orderno);
	}
}

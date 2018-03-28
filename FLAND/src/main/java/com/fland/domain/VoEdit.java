package com.fland.domain;

import java.util.ArrayList;
import java.util.Map;

import com.fasterxml.jackson.databind.ObjectMapper;

public class VoEdit {
	
	public static KnitVO knitvoEdit(Map map) {
		KnitVO vo = new KnitVO();
		try {
			String thread="";
			String ratio="";
			String weight="";
			String thread_com="";
			String con="";
			ArrayList threadList = new ObjectMapper().readValue((String)map.get("thread"), ArrayList.class);
			ArrayList ratioList = new ObjectMapper().readValue((String)map.get("ratio"), ArrayList.class);
			ArrayList weightList = new ObjectMapper().readValue((String)map.get("weight"), ArrayList.class);
			ArrayList thread_comList = new ObjectMapper().readValue((String)map.get("thread_com"), ArrayList.class);
			ArrayList conList = new ObjectMapper().readValue((String)map.get("con"), ArrayList.class);
			for(int i=0; i<threadList.size(); i++) {
				if(i!=threadList.size()) {
					thread += threadList.get(i)+"/";
					ratio += ratioList.get(i)+"/";
					weight += weightList.get(i)+"/";
					thread_com += thread_comList.get(i)+"/";
					con += conList.get(i)+"/";
				}else {
					thread += threadList.get(i);
					ratio += ratioList.get(i);
					weight += weightList.get(i);
					thread_com += thread_comList.get(i);
					con += conList.get(i);
				}
			}
			vo.setOrderno((String)map.get("orderno"));
			vo.setThread(thread);
			vo.setRatio(ratio);
			vo.setWeight(weight);
			vo.setThread_com(thread_com);
			vo.setCon(con);
			vo.setRoll(Integer.valueOf((String) map.get("roll")));
			vo.setKgttl(Integer.valueOf((String) map.get("kgttl")));
			vo.setKnitcompany((String)map.get("knitcompany"));
			vo.setDelivery((String)map.get("delivery"));
			vo.setInch((String) map.get("inch"));
			vo.setGage((String) map.get("gage"));
			vo.setNiddle((String) map.get("niddle"));
			vo.setOrgan((String)map.get("organ"));
			vo.setLooplength((String)map.get("looplength"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
}

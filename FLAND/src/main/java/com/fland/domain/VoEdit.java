package com.fland.domain;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class VoEdit {
	
	public static KnitVO knitvoSave(Map<String, String> map) throws JsonParseException, JsonMappingException, IOException {
		KnitVO vo = new KnitVO();
			String thread="";
			String ratio="";
			String weight="";
			String thread_com="";
			String con="";
			ArrayList threadList = new ObjectMapper().readValue(map.get("thread"), ArrayList.class);
			ArrayList ratioList = new ObjectMapper().readValue(map.get("ratio"), ArrayList.class);
			ArrayList weightList = new ObjectMapper().readValue(map.get("weight"), ArrayList.class);
			ArrayList thread_comList = new ObjectMapper().readValue(map.get("thread_com"), ArrayList.class);
			ArrayList conList = new ObjectMapper().readValue(map.get("con"), ArrayList.class);
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
			vo.setRolltotal(Integer.valueOf((String) map.get("rolltotal")));
			vo.setPerkgtotal(Integer.valueOf((String) map.get("perkgtotal")));
			vo.setKnitcompany((String)map.get("knitcompany"));
			vo.setDelivery((String)map.get("delivery"));
			vo.setInch((String) map.get("inch"));
			vo.setGage((String) map.get("gage"));
			vo.setNiddle((String) map.get("niddle"));
			vo.setOrgan((String)map.get("organ"));
			vo.setLooplength((String)map.get("looplength"));
		return vo;
	}
	
	public static List<Map<String, ArrayList<String>>> knitRead(List<KnitVO> list){
		List<Map<String, ArrayList<String>>> listMap = new ArrayList<Map<String, ArrayList<String>>>();
		for(KnitVO vo : list) {
			Map<String, ArrayList<String>> map = new HashMap<String, ArrayList<String>>();
			ArrayList<String> threadList = new ArrayList<String>();
			ArrayList<String> ratioList = new ArrayList<String>();
			ArrayList<String> weightList = new ArrayList<String>();
			ArrayList<String> thread_comList = new ArrayList<String>();
			ArrayList<String> conList = new ArrayList<String>();
			String[] thread = vo.getThread().split("/");
			String[] ratio = vo.getRatio().split("/");
			String[] weight = vo.getWeight().split("/");
			String[] thread_com = vo.getThread_com().split("/");
			String[] con = vo.getCon().split("/");
			for(int i=0; i<thread.length; i++) {
				threadList.add(thread[i]);
				ratioList.add(ratio[i]);
				weightList.add(weight[i]);
				thread_comList.add(thread_com[i]);
				conList.add(con[i]);
			}
			map.put("threadList", threadList);
			map.put("ratioList", ratioList);
			map.put("weightList", weightList);
			map.put("thread_comList", thread_comList);
			map.put("conList", conList);
			listMap.add(map);
		}
		return listMap;
	}
}

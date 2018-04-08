package com.fland.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SumCount {
	static String nhe;
	static String nhi;
	static String kbe;
	static String kbi;
	static String sh;
	static String km;
	public static Map accountSum(List<IncomeVO> list) {
		Map<String, String> accsum = new HashMap<String, String>();
		for(int i=0; i<list.size(); i++){
			String account = list.get(i).getACCOUNT();
			if(account.equals("³óÇù(¸ÅÃâ)")){
				nhi = list.get(i).getSUM();
			}else if(account.equals("³óÇù(°æºñ)")) {
				nhe = list.get(i).getSUM();
			}else if(account.equals("±â¾÷(¸ÅÃâ)")) {
				kbi = list.get(i).getSUM();
			}else if(account.equals("±â¾÷(°æºñ)")) {
				kbe = list.get(i).getSUM();
			}else if(account.equals("½ÅÇÑ(¸ÅÃâ)")) {
				sh = list.get(i).getSUM();
			}else if(account.equals("±¹¹Î(¸ÅÃâ)")) {
				km = list.get(i).getSUM();
			}
		}
		int total = Integer.parseInt(nhi)+Integer.parseInt(nhe)+Integer.parseInt(kbi)+Integer.parseInt(kbe)+Integer.parseInt(sh)+Integer.parseInt(km);
		accsum.put("nhe", nhe);
		accsum.put("nhi", nhi);
		accsum.put("kbe", kbe);
		accsum.put("kbi", kbi);
		accsum.put("sh", sh);
		accsum.put("km", km);
		accsum.put("total", String.valueOf(total));
		return accsum;
	}
	
	public static int itemSum(List<Map<String, Integer>> list) {
		int total=0;
		for(Map<String, Integer> m : list) {
			for(String key : m.keySet()) {
				total += Integer.parseInt(String.valueOf(m.get(key)));
			}
		}
		return total;
	}
	
	public static String dyeSum(Map map) {
		String colors = (String) map.get("COLOR");
		String color[] = colors.split("/");
		String orderLengths = (String) map.get("ORDERLENGTH");
		String orderLength[] = orderLengths.split("/");
		String html="";
		Double workWeight = Double.parseDouble(String.valueOf(map.get("WORKWEIGHT")));
		Double loss = Double.parseDouble(String.valueOf(map.get("LOSS")));
		Double perkg = Double.parseDouble(String.valueOf(map.get("PERKG")));
		Double rollttl=0.0;
		Double perkgttl=0.0;
		int orderttl=0;
		for(int i=0; i<orderLength.length; i++) {
			Double length = Double.parseDouble(orderLength[i]);
			Double a = (loss*length*(workWeight/1000))/perkg;
			html += "<tr>"+
							"<td>"+color[i]+"</td>"+	
							"<td>"+Math.ceil(a)+"</td>"+
							"<td>"+(Math.ceil(a)*perkg)+
								"(<span style='color:#DC143C;'>"+(int)((loss*length*(workWeight/1000))*100+0.5f)/100f+"</span>)</td>"+
							"<td>"+orderLength[i]+"</td>"+							
						"<tr>";
			rollttl += Math.ceil(a);
			perkgttl += Math.ceil(a)*perkg;
			orderttl +=Integer.parseInt(orderLength[i]);
		}
		int rollTotal = Integer.parseInt(String.valueOf(Math.round(rollttl))); 
		int perkgTotal = Integer.parseInt(String.valueOf(Math.round(perkgttl))); 
		html += "<tr>"+
						"<td>TOTAL</td>"+
						"<td><b><span id='rollTotal'>"+rollTotal+"</span></b></td>"+
						"<td><b><span id='perkgTotal'>"+perkgTotal+"</span></b></td>"+
						"<td><b><span id='orderLength'>"+orderttl+"</span></b></td>"+
					"<tr>";
		return html;
	}
	
	public static Map<String, List<String>> knitData(Map<String, String> data){
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		List<String> thread = new ArrayList<String>();
		List<String> ratio = new ArrayList<String>();
		List<String> knitweight = new ArrayList<String>();
		List<String> thread_com = new ArrayList<String>();
		List<String> con = new ArrayList<String>();
		String[] threadArr = data.get("thread").split("/");
		String[] ratioArr = data.get("ratio").split("/");
		String[] KnitweightArr = data.get("Knitweight").split("/");
		String[] thread_comArr = data.get("thread_com").split("/");
		String[] conArr = data.get("con").split("/");
		
		for(int i=0; i<threadArr.length; i++) {
			thread.add(threadArr[i]);
			ratio.add(ratioArr[i]);
			knitweight.add(KnitweightArr[i]);
			thread_com.add(thread_comArr[i]);
			con.add(conArr[i]);
		}
		map.put("thread", thread);
		map.put("ratio", ratio);
		map.put("knitweight", knitweight);
		map.put("thread_com", thread_com);
		map.put("con", con);
		return map;
	}
}

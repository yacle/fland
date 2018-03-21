package com.fland.domain;

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
			if(account.equals("����(����)")){
				nhi = list.get(i).getSUM();
			}else if(account.equals("����(���)")) {
				nhe = list.get(i).getSUM();
			}else if(account.equals("���(����)")) {
				kbi = list.get(i).getSUM();
			}else if(account.equals("���(���)")) {
				kbe = list.get(i).getSUM();
			}else if(account.equals("����(����)")) {
				sh = list.get(i).getSUM();
			}else if(account.equals("����(����)")) {
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
	
	public static int itemSum(List<Integer> list) {
		int total=0;
		for(int sum : list) {
			total += sum;
		}
		return total;
	}
	
	public static String dyeSum(Map map) {
		String colors = (String) map.get("color");
		String color[] = colors.split("/");
		String orderLengths = (String) map.get("orderLength");
		String orderLength[] = orderLengths.split("/");
		String html="";
		Double workWeight = Double.parseDouble((String) map.get("workWeight"));
		Double loss = Double.parseDouble((String) map.get("loss"));
		Double perkg = Double.parseDouble((String)map.get("perkg"));
		Double rollttl=0.0;
		Double perkgttl=0.0;
		for(int i=0; i<orderLength.length; i++) {
			Double length = Double.parseDouble(orderLength[i]);
			Double a = (loss*length*(workWeight/1000))/perkg;
			html += "<tr>"+
						"<td>"+color[i]+"</td>"+	
						"<td>"+Math.ceil(a)+"</td>"+
						"<td>"+(Math.ceil(a)*perkg)+
							"(<span style='color:#DC143C;'>"+(int)((loss*length*(workWeight/1000))*100+0.5f)/100f+"</span>)</td>"+
					"<tr>";
			rollttl += Math.ceil(a);
			perkgttl += Math.ceil(a)*perkg;
		}
		int rollTotal = Integer.parseInt(String.valueOf(Math.round(rollttl))); 
		int perkgTotal = Integer.parseInt(String.valueOf(Math.round(perkgttl))); 
		html += "<tr>"+
					"<td>TOTAL</td>"+
					"<td><b><span id='rollTotal'>"+rollTotal+"</span></b></td>"+
					"<td><b><span id='perkgTotal'>"+perkgTotal+"</span></b></td>"+
				"<tr>";
		return html;
	}

}

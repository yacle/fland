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
	
	public static int itemSum(List<Integer> list) {
		int total=0;
		for(int sum : list) {
			total += sum;
		}
		return total;
	}
	
	public static String orderSum(String a) {
		String color[] = a.split("/");
		String html="";
		for(int i=0; i<color.length; i++) {
			html += "<tr>"+
					"<td><input type='text' class='form-control color2' value='"+color[i]+"' readonly></td>"+
					"<td><input type='number' id='roll"+i+"' class='form-control' style='text-align: right;'></td>"+
					"<td><input type='text' id='kg"+i+"' class='form-control'></td>"+
				"<tr>";
		}
		return html;
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
		Double rollTotal=0.0;
		Double perkgTotal=0.0;
		for(int i=0; i<orderLength.length; i++) {
			Double length = Double.parseDouble(orderLength[i]);
			Double a = (loss*length*(workWeight/1000))/perkg;
			html += "<tr>"+
						"<td width='10%' style='text-align:left'>"+
							"<select class='form-control group'>"+
								"<option>1</option>"+
								"<option>2</option>"+
							"</select>"+
						"</td>"+
						"<td>"+color[i]+"</td>"+	
						"<td>"+Math.ceil(a)+"</td>"+
						"<td>"+(Math.ceil(a)*perkg)+
							"(<span style='color:#DC143C;'>"+(int)((loss*length*(workWeight/1000))*100+0.5f)/100f+"</span>)</td>"+
					"<tr>";
			rollTotal += Math.ceil(a);
			perkgTotal += Math.ceil(a)*perkg;
		}
		html += "<tr>"+
					"<td colspan='2'>TOTAL</td>"+
					"<td><b>"+rollTotal+"</b></td>"+
					"<td><b><span id='perkgTotal'>"+perkgTotal+"</span></b></td>"+
				"<tr>";
		return html;
	}

}

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
}

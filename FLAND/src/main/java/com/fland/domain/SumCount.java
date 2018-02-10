package com.fland.domain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SumCount {
	public static Map accountSum(List<IncomeVO> list) {
		int nhe=0;
		int nhi=0;
		int kbe=0;
		int kbi=0;
		int sh=0;
		int km=0;
		Map<String, Integer> accsum = new HashMap<String, Integer>();
		for(int i=0; i<list.size(); i++){
			String account = list.get(i).getACCOUNT();
			if(account.equals("³óÇù(¸ÅÃâ)")){
				nhi += Integer.parseInt(list.get(i).getSUM());
			}else if(account.equals("³óÇù(°æºñ)")) {
				nhe += Integer.parseInt(list.get(i).getSUM());
			}else if(account.equals("±â¾÷(¸ÅÃâ)")) {
				kbi += Integer.parseInt(list.get(i).getSUM());
			}else if(account.equals("±â¾÷(°æºñ)")) {
				kbe += Integer.parseInt(list.get(i).getSUM());
			}else if(account.equals("½ÅÇÑ(¸ÅÃâ)")) {
				sh += Integer.parseInt(list.get(i).getSUM());
			}else if(account.equals("±¹¹Î(¸ÅÃâ)")) {
				km += Integer.parseInt(list.get(i).getSUM());
			}
		}
		accsum.put("nhe", nhe);
		accsum.put("nhi", nhi);
		accsum.put("kbe", kbe);
		accsum.put("kbi", kbi);
		accsum.put("sh", sh);
		accsum.put("km", km);
		return accsum;
	}
}

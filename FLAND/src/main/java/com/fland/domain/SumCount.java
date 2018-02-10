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
			if(account.equals("����(����)")){
				nhi += Integer.parseInt(list.get(i).getSUM());
			}else if(account.equals("����(���)")) {
				nhe += Integer.parseInt(list.get(i).getSUM());
			}else if(account.equals("���(����)")) {
				kbi += Integer.parseInt(list.get(i).getSUM());
			}else if(account.equals("���(���)")) {
				kbe += Integer.parseInt(list.get(i).getSUM());
			}else if(account.equals("����(����)")) {
				sh += Integer.parseInt(list.get(i).getSUM());
			}else if(account.equals("����(����)")) {
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

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
		accsum.put("nhe", nhe);
		accsum.put("nhi", nhi);
		accsum.put("kbe", kbe);
		accsum.put("kbi", kbi);
		accsum.put("sh", sh);
		accsum.put("km", km);
		return accsum;
	}
}

package com.fland.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fland.domain.SumCount;
import com.fland.domain.VoEdit;
import com.fland.persistence.OrderDAO;
import com.fland.persistence.PrecostingDAO;

@Controller
@RequestMapping("/precost")
public class PrecostingController {
	@Inject
	PrecostingDAO precostingdao;
	@Inject
	OrderDAO orderdao;
	// ����������꼭
		@RequestMapping(value = "/precosting", method = RequestMethod.GET)
		public ModelAndView precosting() throws Exception {
			ModelAndView mav = new ModelAndView("temp");
			mav.addObject("section", "order/precosting");
			return mav;
		}
	// ����������꼭 �˻�
		@RequestMapping(value = "/search", method = RequestMethod.POST)
		public ModelAndView search(@RequestParam Map<String, String> map)throws Exception{
			ModelAndView mav = new ModelAndView("temp");
			String orderno = map.get("orderno");
			// ����������꼭 data
			Map<String, String> precost = precostingdao.readData(orderno);
			Map<String, List<String>> precostlist = VoEdit.precost(precost);
			// ���ּ� data
				Map<String, String> order = precostingdao.orderData(orderno);
				String[] length_arr= order.get("ORDERLENGTH").split("&&");
				int orderLength = 0;
				for(int i=0; i<length_arr.length; i++) {
					orderLength += Integer.parseInt(length_arr[i]);
				}
				order.put("ORDERLENGTH", Integer.toString(orderLength) );
			// ������ּ� data
				Map<String, String> thread = precostingdao.threadData(orderno);	
				String[] weight_arr = thread.get("threadweight").split("&&");
				String[] thread_arr = thread.get("THREAD").split("&&");	
				ArrayList<String> weight_list = new ArrayList<String>();
				ArrayList<String> thread_list = new ArrayList<String>();
				Double weight = (double) 0.0f;
				for(int i=0; i<weight_arr.length; i++) {
					weight += Double.parseDouble(weight_arr[i]);
					weight_list.add(weight_arr[i]);
					thread_list.add(thread_arr[i]);
				}
				Map<String, Object> threadMap = new HashMap<String, Object>();
				threadMap.put("thread_list", thread_list);
				threadMap.put("weight_list", weight_list);
				threadMap.put("weight", (double)((int)(weight*100))/100.0);
				
			// �����Ƿڼ� data	
				List<Map<String, String>> list =  orderdao.threadData(orderno);
				List<Map<String, Object>> rstlist = SumCount.threadData(list);
			
			// �����Ƿڼ� data
				Map<String, String> dyeData = precostingdao.dyeData(orderno);
				Map<String, ArrayList<String>> dyeMap = SumCount.dyeSum2(dyeData);
				
			// data ����	
			mav.addObject("section", "order/precosting");
			mav.addObject("precost", precost);
			mav.addObject("precostlist", precostlist);
			mav.addObject("orderno", map.get("orderno"));
			mav.addObject("order", order);
			mav.addObject("threadMap", threadMap);
			mav.addObject("knitlist", rstlist);
			mav.addObject("dyeMap", dyeMap);
			return mav;
			
		}
	// ����������꼭 ����
		@RequestMapping(value = "/precostSave", method = RequestMethod.POST)
		@ResponseBody
		public String precostSave(@RequestParam Map<String, String> map)throws Exception{
			precostingdao.updatePrice(map);
			String orderno = map.get("ORDERNO");
			int check = precostingdao.checkData(orderno);
			String result = "";
			if(check>0) {
				precostingdao.updateData(map);
				result = "update";
			}else {
				precostingdao.saveData(map);
				result = "save";
			}
			return result;
		}
}







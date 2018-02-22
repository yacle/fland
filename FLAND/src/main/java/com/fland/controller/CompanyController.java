package com.fland.controller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fland.domain.CompanyVO;
import com.fland.persistence.CompanyDAO;

@Controller
@RequestMapping("/company")
public class CompanyController {
	@Inject
	CompanyDAO companydao;
	
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public ModelAndView companyReadHandle() throws Exception {
		ModelAndView mav = new ModelAndView("temp");
		mav.addObject("section", "company/companyList");
		mav.addObject("list", companydao.companyListRead());
		return mav;
	}
	
	@RequestMapping(value = "readOne", method = RequestMethod.GET)
	@ResponseBody
	public CompanyVO oneReadHandle(@RequestParam Map param) throws Exception {
		String name = (String)param.get("name");
		CompanyVO vo = companydao.companyRead(name);
		return vo;
	}
}

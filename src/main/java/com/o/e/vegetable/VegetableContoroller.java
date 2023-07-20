package com.o.e.vegetable;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VegetableContoroller {
	
	@Autowired
	VegetableDAO vDAO;
	
	@RequestMapping(value = "vegetable", method = RequestMethod.GET)
	public String vegetable(HttpServletRequest req) {
		vDAO.getList(req);
		
		return "vegetable/vegetable";
	}
	
	@RequestMapping(value = "regVegetable", method = RequestMethod.GET)
	public String regVegetable(HttpServletRequest req) {
		
		return "vegetable/regVegetable";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String vegetableDetail(HttpServletRequest req) {
		
		return "vegetable/detail";
	}
}

package com.o.e.vegetable;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class VegetableContoroller {
	@RequestMapping(value = "vegetable", method = RequestMethod.GET)
	public String vegetable() {
		
		return "vegetable/vegetable";
	}
}

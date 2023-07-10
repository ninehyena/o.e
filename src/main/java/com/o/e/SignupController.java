package com.o.e;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SignupController {
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String Singup(Locale locale, Model model) {

		return "signup";
	}
}

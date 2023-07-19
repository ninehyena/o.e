package com.o.e;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.o.e.lesson.LessonDAO;

@Controller
public class HomeController {
	
	@Autowired
	private LessonDAO lDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		lDAO.countLessons();
		
		return "index";
	}
	
}

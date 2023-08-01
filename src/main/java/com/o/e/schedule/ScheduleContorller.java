package com.o.e.schedule;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.o.e.lesson.ApplicationList;
import com.o.e.lesson.Lesson;
import com.o.e.member.Member;
import com.o.e.member.MemberDAO;

@Controller
public class ScheduleContorller {

	@Autowired
	private ScheduleDAO sDAO;
	
	@Autowired
	private MemberDAO mDAO;

	// 캘린더
	@RequestMapping(value = "/myCalendar", method = RequestMethod.GET)
	public String calendar(HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}

		return "user/calendar";
	}
	
	@RequestMapping(value = "/getStuList", method = RequestMethod.GET)
	public @ResponseBody List<ApplicationList> getList(HttpServletRequest req) {
		
		return sDAO.list(req);
	}

	// 캘린더
	@RequestMapping(value = "/myCalendar", method = RequestMethod.POST)
	public @ResponseBody String calendarPost(String a_id, String title, String start, String end, HttpServletRequest req) {
		if (!mDAO.loginCheck(req)) {
			return "redirect:/";
		}
		
		System.out.println(title +", " + start + ", " + end);
		
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date s_start = sdf.parse(start);
			System.out.println(s_start);
			Date s_end = sdf.parse(end);
			System.out.println(s_end);

			Schedule s = new Schedule();
			Member m = (Member) req.getSession().getAttribute("loginMember");
			
			s.setM_id(m.getM_id());
			s.setA_id(a_id);
			s.setS_title(title);
			s.setS_start(s_start);
			s.setS_end(s_end);
			
			
			sDAO.insert(s, req);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		//return "user/calendar";
		return "user/myLesson";
	}
	
	@RequestMapping(value = "/mySchedule", method = RequestMethod.GET)
	public @ResponseBody List<Schedule> getSchedule(HttpServletRequest req) {
		
		return sDAO.select(req);
	}
	
	@RequestMapping(value = "/deleteSchedule", method = RequestMethod.POST)
	public @ResponseBody int deleteSchedule(String title, String start) {
		try {
			int cnt = 0; 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date s_start = sdf.parse(start);
			System.out.println(s_start);

			Schedule s = new Schedule();
			
			s.setS_title(title);
			s.setS_start(s_start);
			
			cnt = sDAO.delete(s);
			
			return cnt;
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
}

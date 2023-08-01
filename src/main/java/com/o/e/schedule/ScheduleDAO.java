package com.o.e.schedule;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.o.e.lesson.ApplicationList;
import com.o.e.lesson.Lesson;
import com.o.e.member.Member;

@Service
public class ScheduleDAO {
	
	@Autowired
	private SqlSession ss;
	
	public List<ApplicationList> list(HttpServletRequest req) {
		try {
			ScheduleMapper sm = ss.getMapper(ScheduleMapper.class);
			Member m = (Member) req.getSession().getAttribute("loginMember");
			return sm.list(m);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리스트 가져오기 실패");
			return null;
		}
	}
	
	public void insert(Schedule s, HttpServletRequest req) {
		try {
			ScheduleMapper sm = ss.getMapper(ScheduleMapper.class);
			
			if (sm.insert(s) == 1) {
				System.out.println("일정 등록 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("일정 등록 실패");
		}
	}
	
	public List<Schedule> select(HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			ScheduleMapper sm = ss.getMapper(ScheduleMapper.class);
//			return sm.select(m.getM_id());
			if (m.getM_lesson().equals("lesson")) {
				System.out.println(sm.select(m.getM_id()).size());
				return sm.select(m.getM_id());
			} else {
				List<Schedule> s = sm.select2(m.getM_id());
				String title = "";
				for (int i = 0; i < s.size(); i++) {
					String[] str = s.get(i).getS_title().split(" ");
					title = str[1] + " " +  str[2];
					System.out.println(title);
					s.get(i).setS_title(title);
					System.out.println(s.get(i).getS_title());
					System.out.println(s.get(i).getS_start());
					System.out.println(s.get(i).getS_end());
				}
				
				return s;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int delete(Schedule s) {
		try {
			ScheduleMapper sm = ss.getMapper(ScheduleMapper.class);
			return sm.delete(s);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}

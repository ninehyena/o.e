package com.o.e.lesson;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LessonDAO {

	@Autowired
	private SqlSession ss;

	// 레슨 등록
	public void regLesson(Lesson l, HttpServletRequest req) {
		try {
			// 작성자 아이디 - 세션에서 받아오기
			// Member m = (Member) req.getSession().getAttribute("loginMember");
			// l.setL_teacher_id(m.getM_id());
			l.setL_teacher_id("test");

			LessonMapper lm = ss.getMapper(LessonMapper.class);
			
			if(lm.regLesson(l) == 1) {
				System.out.println("레슨 등록 성공");
				System.out.println("레슨번호 : " + l.getL_num());
				req.setAttribute("l_num", l.getL_num());
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레슨 등록 실패");
		}
	}
	
	// 레슨 상세 정보 등록
	public void regLessonDetaul(LessonDetail ld, HttpServletRequest req) {
		try {
			String[] l_dayArr = req.getParameterValues("l_day");
			String l_day = "";
			
			l_day = String.join(",", l_dayArr);
			System.out.println(l_day);
			ld.setL_day(l_day);
			
			LessonMapper lm = ss.getMapper(LessonMapper.class);
			
			if (lm.regLessonDetail(ld) == 1) {
				System.out.println("레슨 상세 정보 등록 성공");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레슨 상세 정보 등록 실패");
		}
	}

	// 레슨 리스트 가져오기
	public void getList(HttpServletRequest req) {
		try {
			req.setAttribute("List", ss.getMapper(LessonMapper.class).getList());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

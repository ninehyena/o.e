package com.o.e.lesson;

<<<<<<< HEAD
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.o.e.member.Member;

@Service
public class LessonDAO {

	@Autowired
	private SqlSession ss;

	private int allLessonCount;
	private int userRegCount;
	private int userApplyCount;

	// 레슨 등록
	public void regLesson(Lesson l, HttpServletRequest req) {
		try {
			// 작성자 아이디 - 세션에서 받아오기
			Member m = (Member) req.getSession().getAttribute("loginMember");
			l.setL_teacher_id(m.getM_id());

			LessonMapper lm = ss.getMapper(LessonMapper.class);

			if (lm.regLesson(l) == 1) {
				System.out.println("레슨 등록 성공");
				// System.out.println("레슨번호 : " + l.getL_num());
				req.setAttribute("l_num", l.getL_num());
				allLessonCount++;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레슨 등록 실패");
		}
	}

	// 레슨 상세 정보 등록
	public void regLessonDetail(LessonDetail ld, HttpServletRequest req) {
		try {
			String[] l_dayArr = req.getParameterValues("l_day");
			String l_day = "";

			l_day = String.join(",", l_dayArr);
			// System.out.println(l_day);
			ld.setL_day(l_day);

			// textarea 줄바꿈 처리
			ld.getL_content().replace("\r\n", "<br>");

			LessonMapper lm = ss.getMapper(LessonMapper.class);

			if (lm.regLessonDetail(ld) == 1) {
				System.out.println("레슨 상세 정보 등록 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레슨 상세 정보 등록 실패");
		}
	}

	// 전체 레슨 글 갯수 가져오기
	public void countLessons() {
		try {
			allLessonCount = ss.getMapper(LessonMapper.class).count();
			System.out.println("전체 레슨 글 갯수 : " + allLessonCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시판에 처음 접근 or 타입선택 X
	public void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
	}

	// 검색어 값 가져오기
	public void searchMsg(HttpServletRequest req) {
		// 새로운 요청이 일어났을 때(페이지 전환)에도 검색어는 살아있어야 해서 세션 사용
		String search = req.getParameter("search");
		req.getSession().setAttribute("search", search);
	}

	// 검색어에 해당하는 글 갯수
	private int countSearchMsg(String search) { // Controller에서 사용할 것이 아니라서 private으로 작성
		try {
			return ss.getMapper(LessonMapper.class).countSearch(search);
		} catch (Exception e) {
			e.printStackTrace();
			return 0; // 검색어에 해당하는 내용이 없으면 0 리턴
		}
	}

	// 레슨 리스트 가져오기
	public void getAllList(int pageNo, HttpServletRequest req) {
		try {
			int lessonCount = allLessonCount; // 레슨 전체 갯수
			String search = (String) req.getSession().getAttribute("search"); // 세션에 있는 검색어
			if (search == null) {
				search = "";
			} else {
				lessonCount = countSearchMsg(search);
			}

			// System.out.println("검색어: " + search);
			// System.out.println("레슨 전체 갯수: " + allLessonCount);
			// System.out.println("필터링된 레슨 갯수: " + lessonCount);

			int lessonPerpage = 12; // 한 페이지당 보여줄 게시글 데이터 수

			// 페이지 갯수 가져오기
			int pageCount = (int) (Math.ceil(lessonCount / (double) lessonPerpage));
			req.setAttribute("pageCount", pageCount);
			// System.out.println("페이지 갯수: " + pageCount);

			int start = (lessonPerpage * (pageNo - 1)) + 1; // 한 페이지에 담을 게시물 첫 번째 번호 값
			int end = (pageNo == pageCount) ? allLessonCount : (start + lessonPerpage - 1); // 한 페이지에 담을 끝 게시물 번호 값

			req.setAttribute("List", ss.getMapper(LessonMapper.class).getAllList(search, start, end));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 레슨 상세보기
	public void getDetail(int l_num, HttpServletRequest req) {
		try {
			// 세션에서 아이디 가져오기
			Member m = (Member) req.getSession().getAttribute("loginMember");
			// String m_id = m.getM_id();
			// String m_id = "student";

			req.setAttribute("lesson", ss.getMapper(LessonMapper.class).getDetail1(l_num));
			req.setAttribute("detail", ss.getMapper(LessonMapper.class).getDetail2(l_num));

			ApplicationList list = ss.getMapper(LessonMapper.class).getApplicationList(l_num, m.getM_id());

			req.setAttribute("list", list);

			System.out.println("레슨 상세보기 성공");
		} catch (NullPointerException npe) {
			System.out.println("비회원이 레슨 상세보기 조회");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레슨 상세보기 실패");
		}
	}

	// 레슨 신청하기
	public void apply(int l_num, HttpServletRequest req) {
		try {
			// 세션에서 아이디 가져오기
			Member m = (Member) req.getSession().getAttribute("loginMember");
			String m_id = m.getM_id();
			// String m_id = "student";

			LessonMapper lm = ss.getMapper(LessonMapper.class);
			if (lm.apply(l_num, m_id) == 1) {
				System.out.println("레슨 신청 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레슨 신청 실패");
		}
	}

	// 레슨 신청 취소
	public void cancel(int l_num, HttpServletRequest req) {
		try {
			// 세션에서 아이디 가져오기
			Member m = (Member) req.getSession().getAttribute("loginMember");
			String m_id = m.getM_id();
			// String m_id = "student";

			LessonMapper lm = ss.getMapper(LessonMapper.class);
			if (lm.cancel(l_num, m_id) == 1) {
				System.out.println("레슨 신청 취소 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레슨 신청 취소 실패");
		}
	}

	// 레슨 수정
	public void update(Lesson l, LessonDetail ld) {
		try {
			LessonMapper lm = ss.getMapper(LessonMapper.class);

			// textarea 줄바꿈 처리
			ld.getL_content().replace("\r\n", "<br>");

			if (lm.updateLesson(l) == 1 && lm.updateLessonDetail(ld) == 1) {
				System.out.println("레슨 수정 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레슨 수정 실패");
		}
	}

	// 레슨 삭제
	public void delete(int l_num) {
		try {
			LessonMapper lm = ss.getMapper(LessonMapper.class);

			if (lm.deleteLesson(l_num) == 1 && lm.deleteLessonDetail(l_num) == 1) {
				System.out.println("레슨 삭제 성공");
				allLessonCount--;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레슨 삭제 실패");
		}
	}

	// 유저가 등록한 전체 레슨 글 갯수 가져오기
	public void countUserRegLessons(HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			userRegCount = ss.getMapper(LessonMapper.class).countRegLessons(m.getM_id());
			System.out.println("유저가 등록한 전체 레슨 글 갯수 : " + userRegCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 유저가 신청한 전체 레슨 글 갯수 가져오기
	public void countUserApplyLessons(HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			userApplyCount = ss.getMapper(LessonMapper.class).countApplyLessons(m.getM_id());
			System.out.println("유저가 신청한 전체 레슨 글 갯수 : " + userApplyCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 유저의 레슨 리스트 가져오기
	public void getMyList(int pageNo, HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");

			int lessonCount = 0;
			if (m.getM_lesson().equals("not_lesson")) { // 로그인한 유저가 강습생이면
				lessonCount = userApplyCount;
			} else { // 로그인한 유저가 강사면
				lessonCount = userRegCount;
			}
			System.out.println("가져올 레슨 갯수 : " + lessonCount);

			int lessonPerpage = 5;

			// 페이지 갯수 가져오기
			int pageCount = (int) (Math.ceil(lessonCount / (double) lessonPerpage));
			req.setAttribute("pageCount", pageCount);

			int start = (lessonPerpage * (pageNo - 1)) + 1; // 한 페이지에 담을 게시물 첫 번째 번호 값
			int end = (pageNo == pageCount) ? lessonCount : (start + lessonPerpage - 1); // 한 페이지에 담을 끝 게시물 번호 값

			if (m.getM_lesson().equals("lesson")) { // 로그인한 유저가 강사면
				req.setAttribute("myList", ss.getMapper(LessonMapper.class).getMyList2(m.getM_id(), start, end));
			} else { // 로그인한 유저가 강습생이면
				req.setAttribute("myList", ss.getMapper(LessonMapper.class).getMyList(m.getM_id(), start, end));
			}
			System.out.println("유저의 레슨 리스트 가져오기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("유저의 레슨 리스트 가져오기 실패");
		}
	}

	// 레슨 신청한 회원 정보 가져오기
	public void getStudent(int pageNo, int l_num, HttpServletRequest req) {
		try {
			Lesson lesson = ss.getMapper(LessonMapper.class).getDetail1(l_num);

			req.setAttribute("lesson", lesson);

			int lessonCount = ss.getMapper(LessonMapper.class).getStudent2(l_num);
			int lessonPerpage = 10;

			// 페이지 갯수 가져오기
			int pageCount = (int) (Math.ceil(lessonCount / (double) lessonPerpage));
			req.setAttribute("pageCount", pageCount);

			int start = (lessonPerpage * (pageNo - 1)) + 1; // 한 페이지에 담을 게시물 첫 번째 번호 값
			int end = (pageNo == pageCount) ? lessonCount : (start + lessonPerpage - 1);

			System.out.println(l_num);
			System.out.println(start + ", " + end);
			List<ApplicationList> studentList = ss.getMapper(LessonMapper.class).getStudent(l_num, start, end);
			System.out.println(studentList.size());

			req.setAttribute("studentList", studentList);
			System.out.println(lessonCount + "명");
			System.out.println("신청 회원 목록 가져오기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("신청 회원 목록 가져오기 실패");
		}
	}

	// 레슨 신청 확인 대기 -> 진행
	public int confirm(int l_num, String a_id) {
		try {
			int cnt = ss.getMapper(LessonMapper.class).confirm(l_num, a_id);
			int cnt2 = ss.getMapper(LessonMapper.class).updateStudent(l_num);
			if (cnt == 1 && cnt2 == 1) {
				System.out.println("레슨 신청 확인 성공");
			}
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레슨 신청 확인 실패");
			return 0;
		}
	}

	// 레슨 종료 진행 -> 완료
	public int finish(int l_num, String a_id) {
		try {
			int cnt = ss.getMapper(LessonMapper.class).finish(l_num, a_id);
			if (cnt == 1) {
				System.out.println("레슨 완료 성공");
			}
			return cnt;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레슨 완료 실패");
			return 0;
=======
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
>>>>>>> refs/remotes/origin/LJ
		}
	}
}

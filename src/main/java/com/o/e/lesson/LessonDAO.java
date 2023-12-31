package com.o.e.lesson;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.o.e.member.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
		String path = null;
		MultipartRequest mr = null;
		try { // 프로필 사진 업로드
			path = req.getRealPath("storage");
			System.out.println(path);
			mr = new MultipartRequest(req, path, 20 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("프로필 업로드 실패");
			return;
		}

		try {
			// ld에 값 셋팅
			ld.setL_num(Integer.parseInt(mr.getParameter("l_num")));
			ld.setL_location(mr.getParameter("l_location"));
			ld.setL_room(mr.getParameter("l_room"));

			String photo = mr.getFilesystemName("l_photo");
			photo = URLEncoder.encode(photo, "UTF-8").replace("+", " ");
			System.out.println(photo);
			ld.setL_photo(photo);

			ld.setL_level_of_education1(mr.getParameter("l_level_of_education1"));
			ld.setL_level_of_education2(mr.getParameter("l_level_of_education2"));
			ld.setL_major(mr.getParameter("l_major"));
			ld.setL_career1(mr.getParameter("l_career1"));
			ld.setL_career2(mr.getParameter("l_career2"));
			ld.setL_career3(mr.getParameter("l_career3"));

			// textarea 줄바꿈 처리
			ld.setL_content(mr.getParameter("l_content"));
			ld.getL_content().replace("\r\n", "<br>");

			ld.setL_pay(Integer.parseInt(mr.getParameter("l_pay")));

			String[] l_dayArr = mr.getParameterValues("l_day");
			String l_day = "";

			l_day = String.join(",", l_dayArr);
			// System.out.println(l_day);
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

	// 전체 레슨 글 갯수 가져오기
	public void countLessons(HttpServletRequest req) {
		try {
			allLessonCount = ss.getMapper(LessonMapper.class).count();
			System.out.println("전체 레슨 글 갯수 : " + allLessonCount);
			req.setAttribute("allLessonCount", allLessonCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시판에 처음 접근 or 타입선택 X
	public void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("type", null);
		req.getSession().setAttribute("search", null);
	}

	// 검색어 값 가져오기
	public void searchMsg(HttpServletRequest req) {
		// 새로운 요청이 일어났을 때(페이지 전환)에도 검색어는 살아있어야 해서 세션 사용
		String type = req.getParameter("type");
		String search = req.getParameter("search");
		req.getSession().setAttribute("type", type);
		req.getSession().setAttribute("search", search);
		
		System.out.println("현재 검색어 : " + type + ", " + search);
	}

	// 검색어에 해당하는 글 갯수
	private int countSearchMsg(String type, String search) { // Controller에서 사용할 것이 아니라서 private으로 작성
		try {
			int cnt = 0;
			System.out.println(type + ", " + search + "으로 검색어에 해당하는 글 갯수 카운트");
			cnt = ss.getMapper(LessonMapper.class).countSearch(type, search);
			// System.out.println(cnt);
			return cnt;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0; // 검색어에 해당하는 내용이 없으면 0 리턴
		}
	}

	// 레슨 리스트 가져오기
	public void getAllList(int pageNo, HttpServletRequest req) {
		try {
			// 리스트 가져오기 전에 레슨 상세 내역이 없는 레슨 삭제하기
			ss.getMapper(LessonMapper.class).deleteRegLesson();

			int lessonCount = allLessonCount; // 레슨 전체 갯수
			String type = (String) req.getSession().getAttribute("type"); // 세션에 있는 타입
			String search = (String) req.getSession().getAttribute("search"); // 세션에 있는 검색어
			if (search == null && type == null) {
				search = "";
				type = "";
			} else {
				lessonCount = countSearchMsg(type, search);
			}
			

			System.out.println("타입: " + type);
			System.out.println("검색어: " + search);
			System.out.println("레슨 전체 갯수: " + allLessonCount);
			System.out.println("필터링된 레슨 갯수: " + lessonCount);

			int lessonPerpage = 12; // 한 페이지당 보여줄 게시글 데이터 수

			// 페이지 갯수 가져오기
			int pageCount = (int) (Math.ceil(lessonCount / (double) lessonPerpage));
			req.setAttribute("pageCount", pageCount);
			// System.out.println("페이지 갯수: " + pageCount);

			int start = (lessonPerpage * (pageNo - 1)) + 1; // 한 페이지에 담을 게시물 첫 번째 번호 값
			int end = (pageNo == pageCount) ? allLessonCount : (start + lessonPerpage - 1); // 한 페이지에 담을 끝 게시물 번호 값
			
			req.setAttribute("List", ss.getMapper(LessonMapper.class).getAllList(type, search, start, end));
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
	public int update(Lesson l, LessonDetail ld, HttpServletRequest req) {
		String path = null;
		MultipartRequest mr = null;
		String old_photo = null;
		String new_photo = null;
		
		// 프로필 사진 업로드
		try {
			path = req.getRealPath("storage");
			System.out.println(path);
			mr = new MultipartRequest(req, path, 20 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			ld = ss.getMapper(LessonMapper.class).getDetail2(Integer.parseInt(mr.getParameter("l_num")));
			old_photo = ld.getL_photo();
			System.out.println(old_photo);
			
			new_photo = mr.getFilesystemName("l_photo"); // 선택한 파일명
			if (new_photo != null) {
				new_photo = URLEncoder.encode(new_photo, "UTF-8").replace("+", " ");
			} else { // 새로 선택한 파일이 없으면
				new_photo = old_photo;
			}
		} catch (Exception e) { // 파일 업로드에 실패한 경우
			e.printStackTrace();
			System.out.println("프로필 수정 실패");
			return 0; // 업로드에 실패하면 아래 내용의 DB 작업 실행 X (메소드 강제 종료)
		}

		try {
			// 값 셋팅
			l.setL_num(Integer.parseInt(mr.getParameter("l_num")));
			l.setL_type(mr.getParameter("l_type"));
			l.setL_category(mr.getParameter("l_category"));
			l.setL_level(mr.getParameter("l_level"));
			
			ld.setL_num(Integer.parseInt(mr.getParameter("l_num")));
			ld.setL_location(mr.getParameter("l_location"));
			ld.setL_room(mr.getParameter("l_room"));

			ld.setL_photo(new_photo);

			ld.setL_level_of_education1(mr.getParameter("l_level_of_education1"));
			ld.setL_level_of_education2(mr.getParameter("l_level_of_education2"));
			ld.setL_major(mr.getParameter("l_major"));
			ld.setL_career1(mr.getParameter("l_career1"));
			ld.setL_career2(mr.getParameter("l_career2"));
			ld.setL_career3(mr.getParameter("l_career3"));

			// textarea 줄바꿈 처리
			ld.setL_content(mr.getParameter("l_content"));
			ld.getL_content().replace("\r\n", "<br>");

			ld.setL_pay(Integer.parseInt(mr.getParameter("l_pay")));

			String[] l_dayArr = mr.getParameterValues("l_day");
			String l_day = "";

			l_day = String.join(",", l_dayArr);
			// System.out.println(l_day);
			ld.setL_day(l_day);
			LessonMapper lm = ss.getMapper(LessonMapper.class);

			if (lm.updateLesson(l) == 1 && lm.updateLessonDetail(ld) == 1) {
				System.out.println("레슨 수정 성공");
				if (!new_photo.equals(old_photo)) { // 사진을 수정했으면
					// 기존 사진 파일 지우기
					new File(path + "/" + URLDecoder.decode(old_photo, "UTF-8")).delete();
				}
			} else {
				System.out.println("레슨 수정 실패");
				if (!new_photo.equals(old_photo)) { 
					// 새로운 사진 올라간 거 삭제
					new File(path + "/" + URLDecoder.decode(new_photo, "UTF-8")).delete();
				}
			}
			return l.getL_num();
		} catch (Exception e) {
			e.printStackTrace();
			e.printStackTrace();
			// DB쪽 문제로 수정은 실패지만, 사진 파일은 업로드가 되어있는 상태
			// 업로드된 사진 파일 삭제(파일명은 한글처리가 안되어있어야 함)
			try {
				new File(path + "/" + URLDecoder.decode(new_photo, "UTF-8")).delete();
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
			System.out.println("레슨 수정 실패");
			return l.getL_num();
		}
	} 

	// 레슨 삭제
	public void delete(int l_num, HttpServletRequest req) {
		try {
			LessonMapper lm = ss.getMapper(LessonMapper.class);
			
			String path = req.getRealPath("storage");
			String l_photo = ss.getMapper(LessonMapper.class).getDetail2(l_num).getL_photo();
			System.out.println(l_photo);
			new File(path + "/" + URLDecoder.decode(l_photo, "UTF-8")).delete();
					
			if (lm.deleteLesson(l_num) == 1 || lm.deleteLessonDetail(l_num) == 1) {
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
		}
	}
	
	// 레슨 추천
//	public void recommendLesson(Lesson l, LessonDetail ld, HttpServletRequest req) {
//		try {
//			System.out.println(ld.getL_location());
//			int l_pay_min = Integer.parseInt(req.getParameter("l_pay_min"));
//			int l_pay_max = Integer.parseInt(req.getParameter("l_pay_max"));
//			
//			System.out.println(l.getL_category());
//			
//			List<Lesson> recommend = ss.getMapper(LessonMapper.class).recommendLesson(l, ld, l_pay_min, l_pay_max);
//			System.out.println(recommend.get(0).getL_category());
//			req.setAttribute("recommend", recommend);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	public List<Lesson> recommendLesson(String m_id, String l_location, String l_type, String l_category,
			String l_level, int l_pay_min, int l_pay_max, String l_day, HttpServletRequest req) {
		try {
			System.out.println(l_location);
			System.out.println(l_pay_min);
			
			Lesson l = new Lesson();
			LessonDetail ld = new LessonDetail();
			ld.setL_location(l_location);
			l.setL_type(l_type);
			l.setL_category(l_category);
			l.setL_level(l_level);
			ld.setL_day(l_day);

			System.out.println("레슨 추천 대상 : " + m_id);
			List<Lesson> recommend = ss.getMapper(LessonMapper.class).recommendLesson(m_id, l, ld, l_pay_min, l_pay_max);

			System.out.println("리스트 사이즈 : " + recommend.size());
			if (recommend.size() != 0) {
				return recommend;
			} else {
				return null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	// index.js에서 필요한 데이터들 (레슨별 신청자 주간 통계 등)
	public void needDatas(HttpServletRequest req) {
		try {
			LessonMapper lm = ss.getMapper(LessonMapper.class);
			ReviewMapper rm = ss.getMapper(ReviewMapper.class);
			// 주간 인기 레슨 TOP6
			req.setAttribute("popular", lm.popularLesson());
			System.out.println("인기 레슨 " + lm.popularLesson().size());
			// 총 레슨 수
			req.setAttribute("countA", lm.countAll());
			// 총 리뷰 수
			req.setAttribute("countR", rm.countAll());
			// 총 추천 수
			req.setAttribute("countRec", rm.getRec());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 음악 카테고리별 수강생 수
	public List<Lesson> jsonData() {
		try {
			LessonMapper lm = ss.getMapper(LessonMapper.class);
			return lm.popularCategory();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}

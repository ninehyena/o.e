package com.o.e.notice;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeDAO {

	@Autowired
	private SqlSession ss;

	private int count;

	// 공지글 개수 가져오기
	public void getCountListNotice() {
		try {
			count = ss.getMapper(NoticeMapper.class).countListNotice();
			System.out.println("전체 공지글 개수: " + count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
	}

	public void searchListNotice(HttpServletRequest req) {
		String search = req.getParameter("search");
		req.getSession().setAttribute("search", search);
	}

	public int countSearchListNotice(String search) {
		try {
			return ss.getMapper(NoticeMapper.class).countSearchNotice(search);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public void getListNotice(int pageNo, HttpServletRequest req) {
		try {
			int noticeCount = count;
			String search = (String) req.getSession().getAttribute("search");

			if (search == null) {
				search = "";
			} else {
				noticeCount = countSearchListNotice(search);
			}

			int noticePerPage = 10;
			int pageCount = (int) (Math.ceil(noticeCount / (double) noticePerPage));
			req.setAttribute("pageCount", pageCount);

			int start = (noticePerPage * (pageNo - 1) + 1);
			int end = (pageNo == pageCount) ? count : (start + noticePerPage - 1);
			req.setAttribute("notices", ss.getMapper(NoticeMapper.class).getListNotice(search, start, end));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void regNotice(HttpServletRequest req, Notice n) {
		try {
			NoticeMapper nm = ss.getMapper(NoticeMapper.class);
			
			// textarea 줄바꿈 처리
			n.getN_content().replace("\r\n", "<br>");
			if (nm.regNotice(n) == 1) {
				System.out.println("공지글 등록 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("공지글 등록 실패");
		}
	}

	public void readNotice(HttpServletRequest req, BigDecimal n_no) {
		try {
			Notice notice = ss.getMapper(NoticeMapper.class).readNotice(n_no);
			req.setAttribute("notice", notice);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateNotice(HttpServletRequest req, Notice n) {
		try {
			NoticeMapper nm = ss.getMapper(NoticeMapper.class);
			if (nm.updateNotice(n) == 1) {
				System.out.println("공지글 수정 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("공지글 수정 실패");
		}
	}

	public void deleteNotice(BigDecimal n_no, HttpServletRequest req) {
		try {
			NoticeMapper nm = ss.getMapper(NoticeMapper.class);
			if (nm.deleteNotice(n_no) == 1) {
				System.out.println("공지글 삭제 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("공지글 삭제 실패");
		}
	}
}
package com.o.e.notice;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.o.e.Criteria;

@Service
public class NoticeDAO {

	@Autowired
	private SqlSession ss;

	public void getListNotice(HttpServletRequest req) {
		try {
			List<Notice> notices = ss.getMapper(NoticeMapper.class).getListNotice();
			req.setAttribute("notices", notices);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getListNoticeWithNotice(HttpServletRequest req, Criteria cri) {
		try {
			List<Notice> notices = ss.getMapper(NoticeMapper.class).getListNoticeWithPaging(cri);
			req.setAttribute("notices", notices);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void regNotice(HttpServletRequest req, Notice n) {
		try {
			NoticeMapper nm = ss.getMapper(NoticeMapper.class);
			if (nm.regNotice(n) == 1) {
				req.setAttribute("r", "공지 등록 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "공지 등록 실패");
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
				req.setAttribute("r", "공지 수정 성공");

			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "공지 수정 실패");
		}
	}

	public void deleteNotice(BigDecimal n_no, HttpServletRequest req) {
		try {
			NoticeMapper nm = ss.getMapper(NoticeMapper.class);
			if (nm.deleteNotice(n_no) == 1) {
				System.out.println("공지 삭제 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("공지 삭제 실패");
		}
	}
}
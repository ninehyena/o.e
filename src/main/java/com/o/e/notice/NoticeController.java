package com.o.e.notice;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NoticeController {

	@Autowired
	private NoticeDAO nDAO;

	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String getAllNotice(HttpServletRequest request) {
		System.out.println("공지글 게시판으로 이동합니다.");
		nDAO.clearSearch(request);
		nDAO.getCountListNotice();
		if (request.getParameter("p") != null) {
			int p = Integer.parseInt(request.getParameter("p"));
			nDAO.getListNotice(p, request);
		} else {
			nDAO.getListNotice(1, request);
		}
		return "notice/notice";
	}

	@RequestMapping(value = "notice_paging", method = RequestMethod.GET)
	public String pagingNotice(HttpServletRequest request) {
		if (request.getParameter("p") != null) {
			int p = Integer.parseInt(request.getParameter("p"));
			nDAO.getListNotice(p, request);
		} else {
			nDAO.getListNotice(1, request);
		}
		return "notice/notice";
	}

	@RequestMapping(value = "regNotice", method = RequestMethod.GET)
	public String regNoticeGET(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("공지글 등록 페이지로 이동합니다.");

		return "notice/regNotice";
	}

	@RequestMapping(value = "regNotice", method = RequestMethod.POST)
	public String regNoticePOST(Notice n, HttpServletRequest request) {
		System.out.println("공지글을 등록합니다: " + n);

		nDAO.regNotice(request, n);

		return "redirect:/notice";
	}

	@RequestMapping(value = "noticeDetail", method = RequestMethod.GET)
	public String readNoticeGET(HttpServletRequest request, BigDecimal n_no) {

		System.out.println("공지글을 읽어옵니다: " + n_no);

		nDAO.readNotice(request, n_no);

		return "notice/noticeDetail";
	}

	@RequestMapping(value = "updateNotice", method = RequestMethod.GET)
	public String updateNoticeGET(HttpServletRequest request, BigDecimal n_no) {
		System.out.println("공지글 수정 페이지로 이동합니다.");
		nDAO.readNotice(request, n_no);
		return "notice/updateNotice";
	}

	@RequestMapping(value = "updateNotice", method = RequestMethod.POST)
	public String updateNoticePOST(HttpServletRequest request, Notice n) {
		System.out.println("공지글을 수정합니다: " + n);

		BigDecimal n_no = n.getN_no();

		nDAO.updateNotice(request, n);

		return "redirect:/noticeDetail?n_no=" + n_no;
	}

	@RequestMapping(value = "deleteNotice", method = RequestMethod.GET)
	public String deleteNoticeGET(BigDecimal n_no, HttpServletRequest request) {
		System.out.println("공지글을 삭제합니다: " + n_no);

		nDAO.deleteNotice(n_no, request);

		return "redirect:/notice";
	}
}
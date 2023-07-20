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

	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public String getAllNotice(HttpServletRequest request, HttpServletRequest response) {
		System.out.println("공지 사항 게시판으로 이동합니다.");

		nDAO.getListNotice(request);

		return "notice/noticeList";
	}

	@RequestMapping(value = "regNotice", method = RequestMethod.GET)
	public String regNoticeGET(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("공지 사항 등록 페이지로 이동합니다.");

		return "notice/regNotice";
	}

	@RequestMapping(value = "regNotice.do", method = RequestMethod.POST)
	public String regNoticePOST(Notice n, HttpServletRequest request) {
		System.out.println("공지 사항을 등록합니다: " + n);

		nDAO.regNotice(request, n);

		return "redirect:/noticeList";
	}

	@RequestMapping(value = "readNotice", method = RequestMethod.GET)
	public String readNoticeGET(HttpServletRequest request, BigDecimal n_no) {

		System.out.println("공지 사항을 읽어옵니다: " + n_no);

		nDAO.readNotice(request, n_no);

		return "notice/readNotice";
	}

	@RequestMapping(value = "updateNotice", method = RequestMethod.GET)
	public String updateNoticeGET(HttpServletRequest request, BigDecimal n_no) {
		System.out.println("공지 사항 수정 페이지로 이동합니다.");
		nDAO.readNotice(request, n_no);
		return "notice/updateNotice";
	}

	@RequestMapping(value = "updateNotice.do", method = RequestMethod.POST)
	public String updateNoticePOST(HttpServletRequest request, Notice n) {
		System.out.println("공지 사항을 수정합니다: " + n);

		BigDecimal n_no = n.getN_no();

		nDAO.updateNotice(request, n);

		return "redirect:/readNotice?n_no=" + n_no;
	}

	@RequestMapping(value = "deleteNotice", method = RequestMethod.GET)
	public String deleteNoticeGET(BigDecimal n_no, HttpServletRequest request) {
		System.out.println("공지 사항을 삭제합니다: " + n_no);

		nDAO.deleteNotice(n_no, request);

		return "redirect:/noticeList";
	}
}
package com.o.e.board;

import java.math.BigDecimal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	@Autowired
	private BoardDAO bDAO;

	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String getAllBoard(HttpServletRequest request, HttpServletRequest response) {
		System.out.println("게시글 게시판으로 이동합니다.");

		bDAO.getListBoard(request);

		return "board/boardList";
	}

	@RequestMapping(value = "regBoard", method = RequestMethod.GET)
	public String regBoardGET(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("게시글 등록 페이지로 이동합니다.");

		return "board/regBoard";
	}

	@RequestMapping(value = "regBoard.do", method = RequestMethod.POST)
	public String regBoardPOST(Board n, HttpServletRequest request) {
		System.out.println("게시글을 등록합니다: " + n);

		bDAO.regBoard(request, n);

		return "redirect:/boardList";
	}

	@RequestMapping(value = "readBoard", method = RequestMethod.GET)
	public String readBoardGET(HttpServletRequest request, BigDecimal b_no) {
		System.out.println("게시글을 읽어옵니다: " + b_no);

		bDAO.readBoard(request, b_no);

		return "board/readBoard";
	}

	@RequestMapping(value = "updateBoard", method = RequestMethod.GET)
	public String updateBoardGET(HttpServletRequest request, BigDecimal b_no) {
		System.out.println("게시글 수정 페이지로 이동합니다.");
		bDAO.readBoard(request, b_no);
		return "board/updateBoard";
	}

	@RequestMapping(value = "updateBoard.do", method = RequestMethod.POST)
	public String updateBoardPOST(HttpServletRequest request, Board b) {
		System.out.println("게시글을 수정합니다: " + b);

		BigDecimal b_no = b.getB_no();

		bDAO.updateBoard(request, b);

		return "redirect:/readBoard?b_no=" + b_no;
	}

	@RequestMapping(value = "deleteBoard", method = RequestMethod.GET)
	public String deleteBoardPOST(BigDecimal b_no, HttpServletRequest request) {
		System.out.println("게시글을 삭제합니다: " + b_no);

		bDAO.deleteBoard(b_no, request);

		return "redirect:/boardList";
	}
}
package com.o.e.board;

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

	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String getAllBoard(HttpServletRequest request) {
		System.out.println("정보글 게시판으로 이동합니다.");
		bDAO.clearSearch(request);
		bDAO.getCountListBoard();
		if (request.getParameter("p") != null) {
			int p = Integer.parseInt(request.getParameter("p"));
			bDAO.getListBoard(p, request);
		} else {
			bDAO.getListBoard(1, request);
		}
		return "board/board";
	}

	@RequestMapping(value = "board_paging", method = RequestMethod.GET)
	public String pagingBoard(HttpServletRequest request) {
		if (request.getParameter("p") != null) {
			int p = Integer.parseInt(request.getParameter("p"));
			bDAO.getListBoard(p, request);
		} else {
			bDAO.getListBoard(1, request);
		}
		return "board/board";
	}

	@RequestMapping(value = "board_search", method = RequestMethod.GET)
	public String boardSearch(HttpServletRequest req) {
		bDAO.searchListBoard(req);
		bDAO.getListBoard(1, req);

		return "board/board";
	}

	@RequestMapping(value = "regBoard", method = RequestMethod.GET)
	public String regBoardGET(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("정보글 등록 페이지로 이동합니다.");

		return "board/regBoard";
	}

	@RequestMapping(value = "regBoard", method = RequestMethod.POST)
	public String regBoardPOST(Board n, HttpServletRequest request) {
		System.out.println("정보글을 등록합니다: " + n);

		bDAO.regBoard(request, n);

		return "redirect:/board";
	}

	@RequestMapping(value = "boardDetail", method = RequestMethod.GET)
	public String readBoardGET(HttpServletRequest request, int b_no) {
		System.out.println("정보글을 읽어옵니다: " + b_no);

		bDAO.readBoard(request, b_no);

		return "board/boardDetail";
	}

	@RequestMapping(value = "updateBoard", method = RequestMethod.GET)
	public String updateBoardGET(HttpServletRequest request, int b_no) {
		System.out.println("정보글 수정 페이지로 이동합니다.");
		bDAO.readBoard(request, b_no);
		return "board/updateBoard";
	}

	@RequestMapping(value = "updateBoard", method = RequestMethod.POST)
	public String updateBoardPOST(HttpServletRequest request, Board b) {
		System.out.println("정보글을 수정합니다: " + b);

		int b_no = b.getB_no();

		b_no = bDAO.updateBoard(request, b);
		System.out.println(b_no);
		if (b_no == 0) {
			return "redirect:/notice";
		}

		return "redirect:/boardDetail?b_no=" + b_no;
	}

	@RequestMapping(value = "deleteBoard", method = RequestMethod.GET)
	public String deleteBoardPOST(int b_no, HttpServletRequest request) {
		System.out.println("정보글을 삭제합니다: " + b_no);

		bDAO.deleteBoard(b_no, request);

		return "redirect:/board";
	}
}
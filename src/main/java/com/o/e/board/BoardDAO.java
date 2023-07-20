package com.o.e.board;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.o.e.Criteria;

@Service
public class BoardDAO {

	@Autowired
	private SqlSession ss;

	public void getListBoard(HttpServletRequest req) {
		try {
			List<Board> boards = ss.getMapper(BoardMapper.class).getListBoard();
			req.setAttribute("boards", boards);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void getListBoardWithNotice(HttpServletRequest req, Criteria cri) {
		try {
			List<Board> boards = ss.getMapper(BoardMapper.class).getListBoardWithPaging(cri);
			req.setAttribute("boards", boards);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void regBoard(HttpServletRequest req, Board b) {
		try {
			BoardMapper bm = ss.getMapper(BoardMapper.class);
			if (bm.regBoard(b) == 1) {
				req.setAttribute("r", "글 등록 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "글 등록 실패");
		}
	}

	public void readBoard(HttpServletRequest req, BigDecimal b_no) {
		try {
			Board board = ss.getMapper(BoardMapper.class).readBoard(b_no);
			req.setAttribute("board", board);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateBoard(HttpServletRequest req, Board b) {
		try {
			BoardMapper bm = ss.getMapper(BoardMapper.class);
			if (bm.updateBoard(b) == 1) {
				req.setAttribute("r", "글 수정 성공");

			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("r", "글 수정 실패");
		}
	}

	public void deleteBoard(BigDecimal b_no, HttpServletRequest req) {
		try {
			BoardMapper bm = ss.getMapper(BoardMapper.class);
			if (bm.deleteBoard(b_no) == 1) {
				System.out.println("글 삭제 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("글 삭제 실패");
		}
	}
}
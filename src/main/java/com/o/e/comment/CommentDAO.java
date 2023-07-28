package com.o.e.comment;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.o.e.member.Member;


@Service
public class CommentDAO {
	
	@Autowired
	private SqlSession ss;
	
	private int allCmtCount;

	// 댓글 등록
	public void regCmt(Comment cmt, HttpServletRequest req) {
		try {
			Member m = (Member) req.getSession().getAttribute("loginMember");
			cmt.setC_id(m.getM_id());
			int l_num = Integer.parseInt(req.getParameter("l_num"));
			cmt.setL_num(l_num);
			System.out.println("글번호 얻어오기 성공 : " + cmt.getL_num());
			int c_indent = 0;
			int c_ansnum = 0;

			String formerToken = (String) req.getSession().getAttribute("formerToken");
			System.out.println(formerToken);

			String token = req.getParameter("token");
			System.out.println(token);

			if (formerToken == null || !token.equals(formerToken)) {
				// 정보 가져와서 들여쓰기, 글순서 생성
				List<HashMap<String, Object>> cmts = ss.getMapper(CommentMapper.class).getCmt(cmt.getC_num());
				if (cmts.size() != 0) {
					// System.out.println(cmts.get(cmts.size()-1));
					c_indent = Integer.parseInt(String.valueOf(cmts.get(cmts.size() - 1).get("C_INDENT"))) + 1;
					c_ansnum = Integer.parseInt(String.valueOf(cmts.get(cmts.size() - 1).get("C_ANSNUM"))) + 1;
				}

				// 댓글 순서 다시 조정
				ss.getMapper(CommentMapper.class).setAnsnum(l_num, c_ansnum);

				// 댓글 추가
				cmt.setC_indent(c_indent);
				cmt.setC_ansnum(c_ansnum);
				ss.getMapper(CommentMapper.class).regCmt(cmt);

				System.out.println("댓글 등록 성공");
				req.getSession().setAttribute("formerToken", token);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 전체 글 갯수 가져오기
	public void countCmts(HttpServletRequest req) {
		try {
			int l_num = Integer.parseInt(req.getParameter("l_num"));

			allCmtCount = ss.getMapper(CommentMapper.class).countCmt(l_num);
			// System.out.println(allBoardCount);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 댓글 가져오기
	public void getAllCmt(int pageNo, int l_num, HttpServletRequest req) {
		try {
			int boardCount = allCmtCount; // 해당 게시글의 댓글 전체 갯수

			int boardPerPage = 6; // 한 페이지당 보여줄 댓글 데이터 수

			// 페이지 갯수 가져오기
			int pageCount = (int) (Math.ceil(boardCount / (double) boardPerPage));
			req.setAttribute("pageCount", pageCount);
			// System.out.println(pageCount);

			int start = (boardPerPage * (pageNo - 1)) + 1; // 한 페이지에 담을 게시물 첫 번째 번호 값
			int end = (pageNo == pageCount) ? allCmtCount : (start + boardPerPage - 1); // 한 페이지에 담을 끝 게시물 번호 값

			List<Comment> cmts = ss.getMapper(CommentMapper.class).getAllCmt(l_num, start, end);
			System.out.println("댓글 : " + cmts.size());
			req.setAttribute("cmts", cmts);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 댓글 삭제
	public void deleteCmt(int l_num, int c_num) {
		try {
			ss.getMapper(CommentMapper.class).deleteCmt(l_num, c_num);
			System.out.println("댓글 삭제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 댓글 수정
	public int updateCmt(int l_num, int c_num, String c_content) {
		try {
			System.out.println(l_num);
			System.out.println(c_num);
			System.out.println(c_content);
			return ss.getMapper(CommentMapper.class).updateCmt(c_content, l_num, c_num);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}

package com.o.e.board;

import java.io.File;
import java.math.BigDecimal;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class BoardDAO {

	@Autowired
	private SqlSession ss;

	private int count;

	// 정보글 개수 가져오기
	public void getCountListBoard() {
		try {
			count = ss.getMapper(BoardMapper.class).countListBoard();
			System.out.println("전체 정보글 개수: " + count);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void clearSearch(HttpServletRequest req) {
		req.getSession().setAttribute("search", null);
	}

	public void searchListBoard(HttpServletRequest req) {
		String search = req.getParameter("search");
		req.getSession().setAttribute("search", search);
	}

	public int countSearchListBoard(String search) {
		try {
			return ss.getMapper(BoardMapper.class).countSearchBoard(search);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public void getListBoard(int pageNo, HttpServletRequest req) {
		try {
			int boardCount = count;
			String search = (String) req.getSession().getAttribute("search");

			if (search == null) {
				search = "";
			} else {
				boardCount = countSearchListBoard(search);
			}

			int boardPerPage = 10;
			int pageCount = (int) (Math.ceil(boardCount / (double) boardPerPage));
			req.setAttribute("pageCount", pageCount);

			int start = (boardPerPage * (pageNo - 1) + 1);
			int end = (pageNo == pageCount) ? count : (start + boardPerPage - 1);
			req.setAttribute("boards", ss.getMapper(BoardMapper.class).getListBoard(search, start, end));

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void regBoard(HttpServletRequest req, Board b) {

		String path = null;
		MultipartRequest mr = null;

		try {
			path = req.getRealPath("storage");
			System.out.println(path);
			mr = new MultipartRequest(req, path, 20 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("등록 실패");
			return;
		}

		try {
			BoardMapper bm = ss.getMapper(BoardMapper.class);

			String category = mr.getParameter("b_category");
			String title = mr.getParameter("b_title");
			String content = mr.getParameter("b_content");
			String poster = mr.getFilesystemName("b_poster");
			poster = URLEncoder.encode(poster, "UTF-8").replace("+", " ");
			System.out.println(poster);

			b.setB_category(category);
			b.setB_title(title);
			b.setB_content(content);

			if (poster != null) {
				b.setB_poster(poster);
			}

			if (bm.regBoard(b) == 1) {
				System.out.println("정보글 등록 성공");
				req.setAttribute("b_no", b.getB_no());
				count++;
			}
		} catch (Exception e) {
			e.printStackTrace();
			File f = new File(path + "/" + mr.getFilesystemName("m_photo"));
			f.delete();
			System.out.println("정보글 등록 실패");
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

		String path = null;
		MultipartRequest mr = null;

		try {
			path = req.getRealPath("storage");
			System.out.println(path);
			mr = new MultipartRequest(req, path, 20 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("등록 실패");
			return;
		}

		try {
			BoardMapper bm = ss.getMapper(BoardMapper.class);

			BigDecimal no = new BigDecimal(mr.getParameter("b_no"));
			String category = mr.getParameter("b_category");
			String title = mr.getParameter("b_title");
			String content = mr.getParameter("b_content");
			String poster = mr.getFilesystemName("b_poster");
			poster = URLEncoder.encode(poster, "UTF-8").replace("+", " ");
			System.out.println(poster);

			b.setB_no(no);
			b.setB_category(category);
			b.setB_title(title);
			b.setB_content(content);
			b.setB_poster(poster);

			if (bm.updateBoard(b) == 1) {
				System.out.println("정보글 수정 성공");
			}
		} catch (NullPointerException ne) {
			System.out.println("파일 미입력");

		} catch (Exception e) {
			e.printStackTrace();
			File f = new File(path + "/" + mr.getFilesystemName("m_photo"));
			f.delete();
			System.out.println("정보글 수정 실패");
		}
	}

	public void deleteBoard(BigDecimal b_no, HttpServletRequest req) {
		try {
			BoardMapper bm = ss.getMapper(BoardMapper.class);
			if (bm.deleteBoard(b_no) == 1) {
				System.out.println("정보글 삭제 성공");
				count--;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("정보글 삭제 실패");
		}
	}
}
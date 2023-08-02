package com.o.e.board;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
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
			if (poster != null) {
				poster = URLEncoder.encode(poster, "UTF-8").replace("+", " ");
				System.out.println(poster);
			}

			b.setB_category(category);
			b.setB_title(title);
			b.setB_content(content);
			
			// textarea 줄바꿈 처리
			b.getB_content().replace("\r\n", "<br>");

//			if (poster != null) {
//				b.setB_poster(poster);
//			}
			b.setB_poster(poster);

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

	public void readBoard(HttpServletRequest req, int b_no) {
		try {
			Board board = ss.getMapper(BoardMapper.class).readBoard(b_no);
			req.setAttribute("board", board);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int updateBoard(HttpServletRequest req, Board b) {
		String path = null;
		MultipartRequest mr = null;
		String old_poster = null;
		String new_poster = null;
		int b_no = 0;

		try {
			path = req.getRealPath("storage");
			System.out.println(path);
			mr = new MultipartRequest(req, path, 20 * 1024 * 1024, "UTF-8", new DefaultFileRenamePolicy());
			b_no = Integer.parseInt(mr.getParameter("b_no"));
			b = ss.getMapper(BoardMapper.class).readBoard(b_no);
			old_poster = b.getB_poster();
			
			new_poster = mr.getFilesystemName("b_poster");
			if (new_poster != null) {
				new_poster = URLEncoder.encode(new_poster, "UTF-8").replace("+", " ");
			} else {
				new_poster = old_poster;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("등록 실패");
			return 0;
		}

		try {
			// 값 셋팅
			b.setB_no(b_no);
			b.setB_category(mr.getParameter("b_category"));
			b.setB_title(mr.getParameter("b_title"));
			
			b.setB_content(mr.getParameter("b_content"));
			b.getB_content().replace("\r\n", "<br>");
			
			b.setB_poster(new_poster);
			
			BoardMapper bm = ss.getMapper(BoardMapper.class);
			

			if (bm.updateBoard(b) == 1) {
				System.out.println("정보글 수정 성공");
				if (old_poster != null) {
					if (!new_poster.equals(old_poster)) { // 사진을 수정했으면
						// 기존 사진 파일 지우기
						new File(path + "/" + URLDecoder.decode(old_poster, "UTF-8")).delete();
					}
				}
			} else {
				System.out.println("레슨 수정 실패");
				if (old_poster != null) {
					if (!new_poster.equals(old_poster)) { // 사진을 수정했으면
						// 기존 사진 파일 지우기
						new File(path + "/" + URLDecoder.decode(old_poster, "UTF-8")).delete();
					} 
				}
			}
			return b.getB_no();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				new File(path + "/" + URLDecoder.decode(new_poster, "UTF-8")).delete();
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
			}
			System.out.println("정보글 수정 실패");
			return b.getB_no();
		}
	}

	public void deleteBoard(int b_no, HttpServletRequest req) {
		try {
			BoardMapper bm = ss.getMapper(BoardMapper.class);
			
			String path = req.getRealPath("storage");
			String poster = bm.readBoard(b_no).getB_poster();
			
			if (poster != null) {
				new File(path + "/" + URLDecoder.decode(poster, "UTF-8")).delete();
			}
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
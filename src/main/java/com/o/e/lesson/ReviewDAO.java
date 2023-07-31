package com.o.e.lesson;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.binding.BindingException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.o.e.member.Member;

@Service
public class ReviewDAO {

	@Autowired
	private SqlSession ss;

	// 리뷰 등록
	public void writeReview(Review r, int l_num, HttpServletRequest req) {
		try {
			// 작성자 아이디 - 세션에서 받아오기
			Member m = (Member) req.getSession().getAttribute("loginMember");
			r.setA_id(m.getM_id());
			r.setL_num(l_num);

			// textarea 줄바꿈 처리
			r.getR_content().replace("\r\n", "<br>");
			System.out.println(r.getR_content());

			ReviewMapper rm = ss.getMapper(ReviewMapper.class);
			if (rm.writeReview(r) == 1) {
				System.out.println("리뷰 등록 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 등록 실패");
		}
	}

	// 리뷰 작성 확인
	public void check(int l_num, HttpServletRequest req) {
		try {
			// 작성자 아이디 - 세션에서 받아오기
			Member m = (Member) req.getSession().getAttribute("loginMember");

			req.setAttribute("check", ss.getMapper(ReviewMapper.class).check(l_num, m.getM_id()));
		} catch (NullPointerException npe) {
			System.out.println("비회원이 레슨 상세보기 조회");
		} catch (BindingException be) {
			System.out.println("아직 리뷰 작성 안함");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 리뷰 리스트 가져오기
	public void getReivews(int pageNo, int l_num, HttpServletRequest req) {
		try {
			int reviewCount = ss.getMapper(ReviewMapper.class).count(l_num);
			int reviewPerpage = 9;

			// 페이지 갯수 가져오기
			int pageCount = (int) (Math.ceil(reviewCount / (double) reviewPerpage));
			req.setAttribute("pageCount", pageCount);

			int start = (reviewPerpage * (pageNo - 1)) + 1;
			int end = (pageNo == pageCount) ? reviewCount : (start + reviewPerpage - 1);

			req.setAttribute("l_num", l_num);
			req.setAttribute("reviews", ss.getMapper(ReviewMapper.class).getReviews(l_num, start, end));
			req.setAttribute("lesson", ss.getMapper(LessonMapper.class).getDetail1(l_num));
			System.out.println("리뷰 리스트 가져오기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 리스트 가져오기 실패");
		}
	}

	// 리뷰 평점 가져오기
	public void getAvg(int l_num, HttpServletRequest req) {
		try {
			req.setAttribute("sCnt", ss.getMapper(ReviewMapper.class).getStuCnt(l_num));
			req.setAttribute("avg", ss.getMapper(ReviewMapper.class).getAvg(l_num));
			req.setAttribute("recCnt", ss.getMapper(ReviewMapper.class).getRecCnt(l_num));
			req.setAttribute("lCnt", ss.getMapper(ReviewMapper.class).getLevCnt(l_num));
			System.out.println("평점 가져오기 성공");
		} catch (BindingException be) {
			System.out.println("리뷰가 없음");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("평점 가져오기 실패");
		}
	}

	// 리뷰 상세보기
	public Review reviewDetail(int r_num, HttpServletRequest req) {
		try {
			Review r = ss.getMapper(ReviewMapper.class).reviewDetail(r_num);
			System.out.println("리뷰 상세보기 성공");
			req.setAttribute("review", r);
			return r;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 상세보기 실패");
			return null;
		}
	}

	// 리뷰 수정
	public void updateReview(Review r, HttpServletRequest req) {
		try {
			// textarea 줄바꿈 처리
			r.getR_content().replace("\r\n", "<br>");
			System.out.println(r.getR_content());
			
			System.out.println(r.getL_num());
			System.out.println(r.getR_num());

			ReviewMapper rm = ss.getMapper(ReviewMapper.class);
			if (rm.updateReview(r) == 1) {
				System.out.println("리뷰 수정 성공");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 수정 실패");
		}
	}
	
	// 리뷰 삭제
	public void deleteReview(int r_num, HttpServletRequest req) {
		try {
			ReviewMapper rm = ss.getMapper(ReviewMapper.class);
			if (rm.deleteReview(r_num) == 1) {
				System.out.println("리뷰 삭제 성공");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 삭제 실패");
		}
	}
}

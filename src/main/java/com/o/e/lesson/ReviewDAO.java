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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 리뷰 리스트 가져오기
	public void getReivews(int pageNo, int l_num, HttpServletRequest req) {
		try {
			int reviewCount = ss.getMapper(ReviewMapper.class).count(l_num);
			int reviewPerpage = 10;

			// 페이지 갯수 가져오기
			int pageCount = (int) (Math.ceil(reviewCount / (double) reviewPerpage));
			req.setAttribute("pageCount", pageCount);

			int start = (reviewPerpage * (pageNo - 1)) + 1;
			int end = (pageNo == pageCount) ? reviewCount : (start + reviewPerpage - 1);

			req.setAttribute("reivews", ss.getMapper(ReviewMapper.class).getReviews(l_num, start, end));
			System.out.println("리뷰 리스트 가져오기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰 리스트 가져오기 실패");
		}
	}

	// 리뷰 평점 가져오기
	public void getAvg(int l_num, HttpServletRequest req) {
		try {
			req.setAttribute("avg", ss.getMapper(ReviewMapper.class).getAvg(l_num));
			System.out.println("평점 가져오기 성공");
		} catch (BindingException be) {
			System.out.println("리뷰가 없음");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("평점 가져오기 실패");
		}
	}
}

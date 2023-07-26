package com.o.e.lesson;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface ReviewMapper {
	// 리뷰 등록
	public abstract int writeReview(Review r);
	public abstract int check(@Param("l_num") int l_num, @Param("a_id") String a_id);
	
	// 리뷰 갯수 카운트
	public abstract int count(@Param("l_num") int l_num);
	
	// 리뷰 리스트 가져오기
	public abstract List<Review> getReviews(@Param("l_num") int l_num, @Param("start") int start, @Param("end") int end);

	// 리뷰 평점 가져오기
	public abstract double getAvg(@Param("l_num") int l_num);
	
	// 레슨을 추천한 수강생 카운트
	public abstract int getStuCnt(@Param("l_num") int l_num);
	public abstract int getRecCnt(@Param("l_num") int l_num);
	public abstract int getLevCnt(@Param("l_num") int l_num);
	
	// 리뷰 상세보기
	public abstract Review reviewDetail(@Param("r_num") int r_num);
	
	// 전체 리뷰 갯수
	public abstract int countAll();
	public abstract int getRec();
}

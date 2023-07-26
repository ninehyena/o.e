package com.o.e.lesson;

import java.util.List;

import org.apache.ibatis.annotations.Param;


public interface LessonMapper {
	public abstract int regLesson(Lesson l);
	public abstract int regLessonDetail(LessonDetail ld);
	public abstract int deleteRegLesson();
	
	public abstract int count();
	public abstract int countSearch(@Param("type") String type, @Param("search") String search);
	
	public abstract List<Lesson> getAllList(@Param("type") String type, @Param("search") String search, @Param("start") int start,
			@Param("end") int end);
	
	public abstract Lesson getDetail1(@Param("l_num") int l_num);
	public abstract LessonDetail getDetail2(@Param("l_num") int l_num);
	public abstract ApplicationList getApplicationList(@Param("l_num") int l_num, @Param("m_id") String m_id);
	
	// 레슨 신청
	public abstract int apply(@Param("l_num") int l_num, @Param("m_id") String m_id);
	
	// 레슨 신청 취소
	public abstract int cancel(@Param("l_num") int l_num, @Param("m_id") String m_id);

	public abstract int updateLesson(Lesson l);
	public abstract int updateLessonDetail(LessonDetail ld);
	
	public abstract int deleteLesson(@Param("l_num") int l_num);
	public abstract int deleteLessonDetail(@Param("l_num") int l_num);
	
	// 로그인한 회원의 레슨 리스트
	public abstract int countRegLessons(@Param("m_id") String m_id);
	public abstract int countApplyLessons(@Param("m_id") String m_id);
	
	// 수강생의 레슨 리스트
	public abstract List<Lesson> getMyList(@Param("m_id") String m_id, @Param("start") int start,
			@Param("end") int end);
	
	// 강사의 레슨 리스트
	public abstract List<Lesson> getMyList2(@Param("m_id") String m_id, @Param("start") int start,
			@Param("end") int end);
	
	public abstract List<ApplicationList> getStudent(@Param("l_num") int l_num, @Param("start") int start,
			@Param("end") int end);
//	public abstract List<ApplicationList> getStudent(@Param("l_num") int l_num);
	public abstract int getStudent2(@Param("l_num") int l_num);
	
	// 레슨 신청 확인 대기 -> 진행
	public abstract int confirm(@Param("l_num") int l_num, @Param("a_id") String a_id);
	public abstract int updateStudent(@Param("l_num") int l_num);
	
	// 레슨 종료 진행 -> 완료
	public abstract int finish(@Param("l_num") int l_num, @Param("a_id") String a_id);

	// 수강 중인 수업이 없는 회원
	public abstract int noLesson(@Param("m_id") String m_id);

	// 신규 신청이 있는 강사
	public abstract int countNewStu(@Param("m_id") String m_id);
	
	// 레슨을 등록한 강사
	public abstract int notRegLesson(@Param("m_id") String m_id);
	
	// 레슨별 신청자 주간 통계
	public abstract List<Lesson> popularLesson();
	
	// 레슨 추천
	public abstract List<Lesson> recommendLesson(@Param("l") Lesson l, @Param("ld") LessonDetail ld, @Param("l_pay_min") int l_pay_min, @Param("l_pay_max") int l_pay_max);
	
	// index.js에서 띄워줄 것들
	public abstract int countAll();
	public abstract List<Lesson> popularCategory();
}

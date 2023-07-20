package com.o.e.lesson;

import java.util.List;

<<<<<<< HEAD
import org.apache.ibatis.annotations.Param;

import com.o.e.member.Member;

public interface LessonMapper {
	public abstract int regLesson(Lesson l);
	public abstract int regLessonDetail(LessonDetail ld);
	
	public abstract int count();
	public abstract int countSearch(@Param("search") String search);
	
	public abstract List<Lesson> getAllList(@Param("search") String search, @Param("start") int start,
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
=======
public interface LessonMapper {
	public abstract int regLesson(Lesson l);
	public abstract int regLessonDetail(LessonDetail ld);
	public abstract List<Lesson> getList();
>>>>>>> refs/remotes/origin/LJ
}
package com.o.e.lesson;

import java.util.List;

public interface LessonMapper {
	public abstract int regLesson(Lesson l);
	public abstract int regLessonDetail(LessonDetail ld);
	public abstract List<Lesson> getList();
}

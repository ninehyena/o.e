package com.o.e.schedule;

import java.util.List;

import com.o.e.lesson.ApplicationList;
import com.o.e.member.Member;

public interface ScheduleMapper {
	public abstract int insert(Schedule s);
	public abstract List<Schedule> select(String m_id);
	public abstract List<Schedule> select2(String m_id);
	public abstract int delete(Schedule s);
	public abstract List<ApplicationList> list(Member m);
}

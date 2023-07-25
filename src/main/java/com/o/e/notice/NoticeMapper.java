package com.o.e.notice;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface NoticeMapper {

	public abstract int countListNotice();

	public abstract int countSearchNotice(@Param("search") String search);

	public abstract List<Notice> getListNotice(@Param("search") String search, @Param("start") int start,
			@Param("end") int end);

	public abstract int regNotice(Notice n);

	public abstract Notice readNotice(BigDecimal n_no);

	public abstract int updateNotice(Notice n);

	public abstract int deleteNotice(BigDecimal n_no);
}
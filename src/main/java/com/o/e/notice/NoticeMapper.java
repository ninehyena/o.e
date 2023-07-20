package com.o.e.notice;

import java.math.BigDecimal;
import java.util.List;

import com.o.e.Criteria;

public interface NoticeMapper {
	
	public abstract int getCountTotalNotice(Criteria cri);

	public abstract List<Notice> getListNotice();

	public abstract List<Notice> getListNoticeWithPaging(Criteria cri);

	public abstract int regNotice(Notice n);

	public abstract Notice readNotice(BigDecimal n_no);

	public abstract int updateNotice(Notice n);

	public abstract int deleteNotice(BigDecimal n_no);
}
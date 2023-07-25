package com.o.e.comment;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CommentMapper {
	// 댓글
	public abstract List<HashMap<String, Object>> getCmt(@Param("c_num") int c_num);

	public abstract int setAnsnum(@Param("l_num") int l_num, @Param("c_ansnum") int c_ansnum);

	public abstract int regCmt(Comment cmt);

	public abstract List<Comment> getAllCmt(@Param("l_num") int l_num, @Param("start") int start, @Param("end") int end);

	public abstract int countCmt(@Param("l_num") int l_num);

	public abstract int deleteCmt(@Param("l_num") int l_num, @Param("c_num") int c_num);

	public abstract int updateCmt(@Param("c_content") String c_content, @Param("l_num") int l_num,
			@Param("c_num") int c_num);
}

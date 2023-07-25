package com.o.e.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BoardMapper {

	public abstract int countListBoard();

	public abstract int countSearchBoard(@Param("search") String search);

	public abstract List<Board> getListBoard(@Param("search") String search, @Param("start") int start,
			@Param("end") int end);

	public abstract int regBoard(Board b);

	public abstract Board readBoard(int b_no);

	public abstract int updateBoard(Board b);

	public abstract int deleteBoard(int b_no);
}

package com.o.e.board;

import java.math.BigDecimal;
import java.util.List;

import com.o.e.Criteria;

public interface BoardMapper {

	public abstract int getCountTotalBoard(Criteria cri);

	public abstract List<Board> getListBoard();

	public abstract List<Board> getListBoardWithPaging(Criteria cri);

	public abstract int regBoard(Board b);

	public abstract Board readBoard(BigDecimal b_no);

	public abstract int updateBoard(Board b);

	public abstract int deleteBoard(BigDecimal b_no);
}

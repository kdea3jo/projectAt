package org.teamAT.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.teamAT.vo.BoardVo;


@Repository
public interface BoardDao {
	public List<BoardVo> getList(int page);
		
	public boolean delete(int num);
	public boolean insert(BoardVo board);
	public BoardVo getContent(String author);
	public BoardVo getCurrentContent(int num);
	public boolean update(BoardVo board);
}


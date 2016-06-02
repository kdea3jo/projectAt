package org.teamAT.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.teamAT.vo.BoardVo;


@Repository
public interface BoardDao {
	public List<BoardVo> getList(@Param("page") int page,@Param("boardname") String boardname);
	public BoardVo getContent(@Param("num") int num,@Param("boardname") String boardname);
	
	public boolean delete(int num);
	public boolean insert(BoardVo board);
	
	public BoardVo getCurrentContent(int num);
	public boolean update(BoardVo board);
}


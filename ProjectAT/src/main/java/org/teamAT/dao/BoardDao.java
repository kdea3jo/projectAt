package org.teamAT.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.teamAT.vo.BoardVo;
import org.teamAT.vo.SearchVo;


@Repository
public interface BoardDao {
	public List<BoardVo> getList(@Param("page") int page,@Param("boardname") String boardname, @Param("search") SearchVo search);
	public BoardVo getContent(@Param("num") int num,@Param("boardname") String boardname);
	
	public boolean insert(@Param("board") BoardVo board,@Param("boardname") String boardname);
	public BoardVo getCurrentContent(@Param("userid") String userid,@Param("boardname") String boardname);
	public boolean update(@Param("board") BoardVo board,@Param("boardname") String boardname);
	
	public boolean delete(@Param("num") int num,@Param("boardname") String boardname);
	public List<BoardVo> search(@Param("page") int page,@Param("search") SearchVo search, @Param("boardname") String boardname);
}


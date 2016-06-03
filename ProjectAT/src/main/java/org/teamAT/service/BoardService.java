package org.teamAT.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.teamAT.dao.BoardDao;
import org.teamAT.vo.BoardVo;
import org.teamAT.vo.PageVo;
import org.teamAT.vo.SearchVo;

@Service
public class BoardService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
			
	public void getList(HttpServletRequest request, String boardname) {
			BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
			String sPage = request.getParameter("pg");
			int page=0;
			if(sPage==null || sPage.equals("")) page=1;
			else page = Integer.parseInt(sPage);
			
			int rowsPerScreen = 10;
			int linksPerScreen = 5;
			
			List<BoardVo> list = dao.getList(page,boardname);
			
			PageVo pagination = new PageVo();
			int totalpage = list.get(0).getTotalpage();
			int linkGroup = (page-1)/linksPerScreen+1;
			int linkEnd = linkGroup*linksPerScreen;
			int linkBegin = linkEnd-linksPerScreen+1;
			if(linkEnd>totalpage)linkEnd= totalpage;
			
			pagination.setTotalPages(totalpage);
			pagination.setCurrPage(page);
			pagination.setLeftMore(linkGroup!=1? true:false);
			pagination.setRightMore(linkEnd<totalpage? true:false);
			pagination.setLinkBegin(linkBegin);
			pagination.setLinkEnd(linkEnd);
			request.setAttribute("pageNation", pagination);
			request.setAttribute("boardList", dao.getList(page, boardname));
	}

	public void getContent(HttpServletRequest request, String boardName) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		int num = Integer.parseInt(request.getParameter("num"));
		request.setAttribute("content", dao.getContent(num, boardName));
	}
	
	public void insert(BoardVo board, String boardName) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		dao.insert(board, boardName);
	}

	public BoardVo getCurrentContent(BoardVo board, String boardName) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		dao.getCurrentContent(board.getUserid(), boardName);
		return dao.getCurrentContent(board.getUserid(), boardName);
	}

	public boolean update(BoardVo board, String boardName) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		return dao.update(board, boardName);
	}

	public boolean delete(BoardVo board, String boardName) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		return dao.delete(board.getNum(), boardName);
	}
	
	public void search(HttpServletRequest request, String boardname) {
		BoardDao dao=sqlSessionTemplate.getMapper(BoardDao.class);
		String sPage = request.getParameter("pg");
		int page=0;
		if(sPage==null || sPage.equals("")) page=1;
		else page = Integer.parseInt(sPage);
		
		SearchVo search = new SearchVo();
		search.setType((String)request.getParameter("type"));
		search.setKeyword((String)request.getParameter("keyword"));
		
		String type = search.getType();
		if(type.equals("제목")){
			search.setType("title");
		}else if(type.equals("내용")){
			search.setType("conetne");
		}else if(type.equals("글번호")){
			search.setType("num");
		}else if(type.equals("글쓴이")){
			search.setType("userid");
		}
		
		int rowsPerScreen = 10;
		int linksPerScreen = 5;
		
		List<BoardVo> list = dao.search(page,search, boardname);
		
		PageVo pagination = new PageVo();
		int totalpage = list.get(0).getTotalpage();
		int linkGroup = (page-1)/linksPerScreen+1;
		int linkEnd = linkGroup*linksPerScreen;
		int linkBegin = linkEnd-linksPerScreen+1;
		if(linkEnd>totalpage)linkEnd= totalpage;
		
		pagination.setTotalPages(totalpage);
		pagination.setCurrPage(page);
		pagination.setLeftMore(linkGroup!=1? true:false);
		pagination.setRightMore(linkEnd<totalpage? true:false);
		pagination.setLinkBegin(linkBegin);
		pagination.setLinkEnd(linkEnd);
		
		request.setAttribute("pageNation", pagination);
		request.setAttribute("boardList", list);
	}

}

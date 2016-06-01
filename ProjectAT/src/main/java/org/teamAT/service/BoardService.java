package org.teamAT.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.teamAT.dao.BoardDao;
import org.teamAT.vo.BoardVo;
import org.teamAT.vo.PageVo;

@Service
public class BoardService {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void getList(HttpServletRequest request) {
			BoardDao dao = sqlSessionTemplate.getMapper(BoardDao.class);
			
			String sPage = request.getParameter("pg");
			int page=0;
			if(sPage==null || sPage.equals("")) page=1;
			else page = Integer.parseInt(sPage);
			
			int rowsPerScreen = 10;
			int linksPerScreen = 5;
			
			List<BoardVo> list = dao.getList(page);
			
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
			request.setAttribute("boardList", dao.getList(page));
	}

}

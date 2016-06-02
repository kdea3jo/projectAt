package org.teamAT.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.teamAT.dao.MemberDao;
import org.teamAT.vo.MemberVo;

public class MemberService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberVo loadUserByUsername(String id) {
		MemberDao dao=sqlSessionTemplate.getMapper(MemberDao.class);
		MemberVo vo=dao.getMember(id);
        if(vo==null){
            throw new UsernameNotFoundException("�������� �ʴ� ���̵��Դϴ�.");
        }
        return vo;
	}
	
	public boolean join(HttpServletRequest request) throws ParseException {
		MemberDao dao=sqlSessionTemplate.getMapper(MemberDao.class);
		
		/*��Ʈ�ѷ����� �ڵ� ������ �ȵǼ� �������� ó����*/
		MemberVo vo=new MemberVo();
		vo.setUserid(request.getParameter("userid"));
		vo.setUserpw(request.getParameter("userpw"));
		vo.setUsername(request.getParameter("username"));
		vo.setPhone(Integer.parseInt(request.getParameter("phone")));
		SimpleDateFormat date=new SimpleDateFormat("yy-MM-dd");
		Date d=date.parse(request.getParameter("birthday"));
		vo.setBirthday(d);
		
		int result=dao.setMember(vo);
		
		return result>=1? true:false;
	}
}

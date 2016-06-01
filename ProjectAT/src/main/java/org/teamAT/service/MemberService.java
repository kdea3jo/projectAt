package org.teamAT.service;

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
}

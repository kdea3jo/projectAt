package org.teamAT.dao;

import org.teamAT.vo.MemberVo;

public interface MemberDao {

	public MemberVo getMember(String id);
	public int setMember(MemberVo vo);
	public String getPassword(String id);
}

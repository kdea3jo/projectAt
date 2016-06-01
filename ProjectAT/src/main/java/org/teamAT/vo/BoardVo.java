package org.teamAT.vo;

import java.sql.Date;

public class BoardVo {
	private int num;
	private String userid;
	private String title;
	private String contents;
	private Date wDate;
	private int ref;
	private int Totalpage;
	public int getNum() {
		return num;
	}
	public String getUserid() {
		return userid;
	}
	public String getTitle() {
		return title;
	}
	public String getContents() {
		return contents;
	}
	public Date getwDate() {
		return wDate;
	}
	public int getRef() {
		return ref;
	}
	public int getTotalpage() {
		return Totalpage;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public void setwDate(Date wDate) {
		this.wDate = wDate;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public void setTotalpage(int totalpage) {
		Totalpage = totalpage;
	}
	
	
}

package com.icss.entity;

//管理员
public class Manger {
	private String mangerId;//管理员编号
	private String name;//姓名
	private String pwd;//密码
	private String tel;//电话号码
	
	public String getMangerId() {
		return mangerId;
	}
	public void setMangerId(String mangerId) {
		this.mangerId = mangerId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}

}

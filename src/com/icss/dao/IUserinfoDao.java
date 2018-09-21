package com.icss.dao;

import org.apache.ibatis.annotations.Select;

import com.icss.entity.Userinfo;

public interface IUserinfoDao {
	/*
	 * 依据房屋编号查询房屋信息
	 */
	@Select("select * from userinfo where userId=#{userId}")
	public Userinfo findUserinfoByid(Integer userId);
}

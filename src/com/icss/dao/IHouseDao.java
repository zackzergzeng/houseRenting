package com.icss.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import com.icss.entity.House;

public interface IHouseDao {
	/*
	 * 添加房屋信息
	 */
	@Insert("insert into house value(default,#{rents},#{area}"
			+ ",#{houseType},#{houseClass},#{level},#{orientation}"
			+ ",#{age},#{fitment},#{leaserId},0,default,"
			+ "#{province},#{city},#{district},#{address},#{introduction})")
	@Options(useGeneratedKeys = true,  keyProperty = "houseId", keyColumn = "houseId")
	public int insertHouse(House house);
	/*
	 * 依据房屋编号查询房屋信息
	 */
	@Select("select * from house where houseId=#{houseId}")
	@Results({
		@Result(property="houseId",column="houseId"),
		@Result(property="rents",column="rents"),
		@Result(property="area",column="area"),
		@Result(property="houseType",column="houseType"),
		@Result(property="houseClass",column="houseClass"),
		@Result(property="level",column="level"),
		@Result(property="orientation",column="orientation"),
		@Result(property="age",column="age"),
		@Result(property="leaserId",column="leaserId"),
		@Result(property="status",column="status"),
		@Result(property="isCheck",column="isCheck"),
		@Result(property="province",column="province"),
		@Result(property="city",column="city"),
		@Result(property="district",column="district"),
		@Result(property="address",column="address"),
		@Result(property="introduction",column="introduction"),
		@Result(property="userinfo",column="leaserId",one=@One(select="com.icss.dao.IUserinfoDao.findUserinfoByid")),
		@Result(property="imagelist",column="houseId",many=@Many(select="com.icss.dao.IImageDao.findImageByhouse"))
	})
	public House findHouseByid(Integer houseId);
	/*
	 * 查询所有房屋信息
	 */
	@Select("select * from house")
	@Results({
		@Result(property="houseId",column="houseId"),
		@Result(property="rents",column="rents"),
		@Result(property="area",column="area"),
		@Result(property="houseType",column="houseType"),
		@Result(property="houseClass",column="houseClass"),
		@Result(property="level",column="level"),
		@Result(property="orientation",column="orientation"),
		@Result(property="age",column="age"),
		@Result(property="leaserId",column="leaserId"),
		@Result(property="status",column="status"),
		@Result(property="isCheck",column="isCheck"),
		@Result(property="province",column="province"),
		@Result(property="city",column="city"),
		@Result(property="district",column="district"),
		@Result(property="address",column="address"),
		@Result(property="introduction",column="introduction"),
		@Result(property="userinfo",column="leaserId",one=@One(select="com.icss.dao.IUserinfoDao.findUserinfoByid")),
		@Result(property="imagelist",column="houseId",many=@Many(select="com.icss.dao.IImageDao.findImageByhouse"))
	})
	public List<House> findHouseAll();//之后需要链接查询用户信息
	/*
	 * 依据搜索信息查询房屋信息
	 */
	@SelectProvider(type=SearchProvider.class,method="searchHouse")
	@Results({
		@Result(property="houseId",column="houseId"),
		@Result(property="rents",column="rents"),
		@Result(property="area",column="area"),
		@Result(property="houseType",column="houseType"),
		@Result(property="houseClass",column="houseClass"),
		@Result(property="level",column="level"),
		@Result(property="orientation",column="orientation"),
		@Result(property="age",column="age"),
		@Result(property="leaserId",column="leaserId"),
		@Result(property="status",column="status"),
		@Result(property="isCheck",column="isCheck"),
		@Result(property="province",column="province"),
		@Result(property="city",column="city"),
		@Result(property="district",column="district"),
		@Result(property="address",column="address"),
		@Result(property="introduction",column="introduction"),
		@Result(property="userinfo",column="leaserId",one=@One(select="com.icss.dao.IUserinfoDao.findUserinfoByid")),
		@Result(property="imagelist",column="houseId",many=@Many(select="com.icss.dao.IImageDao.findImageByhouse"))
	})
	public List<House> findHouseByinfo(Map<String, Object>info);//之后需要链接查询用户信息和照片信息
	/*
	 * 依据搜索信息查询房屋信息
	 */
	@Select("select * from house where leaserId=#{leaserId}")
	@Results({
		@Result(property="houseId",column="houseId"),
		@Result(property="rents",column="rents"),
		@Result(property="area",column="area"),
		@Result(property="houseType",column="houseType"),
		@Result(property="houseClass",column="houseClass"),
		@Result(property="level",column="level"),
		@Result(property="orientation",column="orientation"),
		@Result(property="age",column="age"),
		@Result(property="leaserId",column="leaserId"),
		@Result(property="status",column="status"),
		@Result(property="isCheck",column="isCheck"),
		@Result(property="province",column="province"),
		@Result(property="city",column="city"),
		@Result(property="district",column="district"),
		@Result(property="address",column="address"),
		@Result(property="introduction",column="introduction"),
		@Result(property="userinfo",column="leaserId",one=@One(select="com.icss.dao.IUserinfoDao.findUserinfoByid")),
		@Result(property="imagelist",column="houseId",many=@Many(select="com.icss.dao.IImageDao.findImageByhouse"))
	})
	public List<House> findHouseByUser(Integer leaserId);
	@Update("update house set rents=#{rents},area=#{area},houseType=#{houseType},"
			+ "houseClass=#{houseClass},level=#{level},orientation=#{orientation},age=#{age},"
			+ "leaserId=#{leaserId},status=#{status},isCheck=#{isCheck},"
			+ "province=#{province},city=#{city},district=#{district},"
			+ "address=#{address},introduction=#{introduction} where houseId=#{houseId}")
	public int updateHouseByid(House house);
	@Select("select * from house order by houseId DESC")
	@Results({
		@Result(property="houseId",column="houseId"),
		@Result(property="rents",column="rents"),
		@Result(property="area",column="area"),
		@Result(property="houseType",column="houseType"),
		@Result(property="houseClass",column="houseClass"),
		@Result(property="level",column="level"),
		@Result(property="orientation",column="orientation"),
		@Result(property="age",column="age"),
		@Result(property="leaserId",column="leaserId"),
		@Result(property="status",column="status"),
		@Result(property="isCheck",column="isCheck"),
		@Result(property="province",column="province"),
		@Result(property="city",column="city"),
		@Result(property="district",column="district"),
		@Result(property="address",column="address"),
		@Result(property="introduction",column="introduction"),
		@Result(property="userinfo",column="leaserId",one=@One(select="com.icss.dao.IUserinfoDao.findUserinfoByid")),
		@Result(property="imagelist",column="houseId",many=@Many(select="com.icss.dao.IImageDao.findImageByhouse"))
	})
	public List<House> findHouseByOrder();
	@Select("select * from house where province=#{province}")
	@Results({
		@Result(property="houseId",column="houseId"),
		@Result(property="rents",column="rents"),
		@Result(property="area",column="area"),
		@Result(property="houseType",column="houseType"),
		@Result(property="houseClass",column="houseClass"),
		@Result(property="level",column="level"),
		@Result(property="orientation",column="orientation"),
		@Result(property="age",column="age"),
		@Result(property="leaserId",column="leaserId"),
		@Result(property="status",column="status"),
		@Result(property="isCheck",column="isCheck"),
		@Result(property="province",column="province"),
		@Result(property="city",column="city"),
		@Result(property="district",column="district"),
		@Result(property="address",column="address"),
		@Result(property="introduction",column="introduction"),
		@Result(property="userinfo",column="leaserId",one=@One(select="com.icss.dao.IUserinfoDao.findUserinfoByid")),
		@Result(property="imagelist",column="houseId",many=@Many(select="com.icss.dao.IImageDao.findImageByhouse"))
	})
	public List<House> findHouseByLocation(String province);
}

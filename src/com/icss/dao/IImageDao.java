package com.icss.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.icss.entity.Image;

public interface IImageDao {
	@Insert("insert into image value(default,#{houseId},#{loading})")//没写完
	public int insertImage(Image image);
	@Select("select * from image where houseId=#{houseId}")
	public List<Image> findImageByhouse(Integer houseId);
	@Delete("delete from image where imageId=#{imageId}")
	public int deleteImageByid(Integer imageId);
}

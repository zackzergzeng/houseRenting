package com.icss.entity;

//房屋图片
public class Image {
	private int imageId;//图片ID
	private int houseId;//房屋ID
	private String loading;//图片路径
	
	public int getImageId() {
		return imageId;
	}
	public void setImageId(int imageId) {
		this.imageId = imageId;
	}
	public int getHouseId() {
		return houseId;
	}
	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}
	public String getLoading() {
		return loading;
	}
	public void setLoading(String loading) {
		this.loading = loading;
	}

}

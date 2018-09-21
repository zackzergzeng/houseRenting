package com.icss.entity;

import java.util.List;

//房屋
public class House {
	private int houseId;//房屋id
	private double rents;//租金
	private int area;//面积
	private int houseType;//户型 1：一室 2:两室 3：三室 4：四室 5：五室以上
	private int houseClass;//类型  1：整租 2：合租
	private int level;//楼层 1：底层  2：低楼层  3：中楼层 4：高楼层 5：顶层
	private int orientation;//朝向  1：南 2：东 3:西 4:北
	private int age;//楼龄
	private int fitment;//装修  1：精装修 2：普通装修 3：毛坯房
	private int leaserId;//出租人ID
	private int status;//使用状态
	private int isCheck;//是否通过审核  默认0：不通过  1：通过
	private String province;//省
	private String city;//市
	private String district;//区
	private String address;//详细地址
	private String introduction;
	private Userinfo userinfo;
	private List<Image> imagelist;

	public int getHouseId() {
		return houseId;
	}
	public void setHouseId(int houseId) {
		this.houseId = houseId;
	}
	public double getRents() {
		return rents;
	}
	public void setRents(double rents) {
		this.rents = rents;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public int getHouseType() {
		return houseType;
	}
	public void setHouseType(int houseType) {
		this.houseType = houseType;
	}
	public int getHouseClass() {
		return houseClass;
	}
	public void setHouseClass(int houseClass) {
		this.houseClass = houseClass;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getOrientation() {
		return orientation;
	}
	public void setOrientation(int orientation) {
		this.orientation = orientation;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getFitment() {
		return fitment;
	}
	public void setFitment(int fitment) {
		this.fitment = fitment;
	}
	public int getLeaserId() {
		return leaserId;
	}
	public void setLeaserId(int leaserId) {
		this.leaserId = leaserId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getIsCheck() {
		return isCheck;
	}
	public void setIsCheck(int isCheck) {
		this.isCheck = isCheck;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public Userinfo getUserinfo() {
		return userinfo;
	}
	public void setUserinfo(Userinfo userinfo) {
		this.userinfo = userinfo;
	}
	public List<Image> getImagelist() {
		return imagelist;
	}
	public void setImagelist(List<Image> imagelist) {
		this.imagelist = imagelist;
	}
	
}

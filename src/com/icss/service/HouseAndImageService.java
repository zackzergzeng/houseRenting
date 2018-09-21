package com.icss.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.icss.dao.IHouseDao;
import com.icss.dao.IImageDao;
import com.icss.entity.House;
import com.icss.entity.Image;

@Transactional
@Service
public class HouseAndImageService {
	@Autowired
	private IHouseDao hdao;
	@Autowired
	private IImageDao idao;
	public void addHouseInfo(House house,List<String>imagelist,HttpSession session) {
		//添加房屋信息
		hdao.insertHouse(house);
		//添加照片
		for (String photo : imagelist) {
			Image image=new Image();
			image.setHouseId(house.getHouseId());
			image.setLoading(photo);
			idao.insertImage(image);
		}
	}
	public void updateHouseInfo(House house,List<Integer> deletelist,List<String> imagelist) {
		hdao.updateHouseByid(house);
		if(deletelist!=null) {
			for (Integer id : deletelist) {
				idao.deleteImageByid(id);
			}
		}
		if(imagelist!=null) {
			for (String path : imagelist) {
				Image image=new Image();
				image.setHouseId(house.getHouseId());
				image.setLoading(path);
				idao.insertImage(image);
			}
		}
	}
}

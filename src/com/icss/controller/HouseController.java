package com.icss.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.icss.dao.IHouseDao;
import com.icss.dao.IImageDao;
import com.icss.entity.House;
import com.icss.entity.Image;
import com.icss.service.HouseAndImageService;

@Controller
public class HouseController {
	@Autowired
	IHouseDao hdao;
	@Autowired
	IImageDao idao;
	@Autowired
	HouseAndImageService hiservice;
	final Integer pagecount=2;
	/*
	 * 用于设置新的信息map，用于搜索和存入session
	 */
	public Map<String, Object> PutInMap(Map<String, Object> output,Map<String, Object> input) {
		if(input==null) {
			System.out.println("input为空");
			return output;
		}else {
			for (String key : output.keySet()) {
				if(input.get(key)!=null&&output.get(key)!=null) {
					if(output.get(key)!=input.get(key)) {
						System.out.println("更换"+key);
						input.put(key, output.get(key));
					}
				}else if(input.get(key)==null&&output.get(key)!=null) {
					System.out.println("添加"+key);
					input.put(key, output.get(key));
				}
			}
			return input;
		}
	}
	public void settag(HttpSession session,HttpServletRequest request,String tagname) {
		String newtag=request.getParameter(tagname);
		String oldtag=session.getAttribute(tagname).toString();
		if(oldtag!=null&&newtag!=null) {
			if(!oldtag.equals(newtag)) {
				session.setAttribute(tagname, newtag);
			}
		}else if(oldtag==null&&newtag!=null) {
			session.setAttribute(tagname, newtag);
		}
		
	}
	@RequestMapping("showhousetag")
	public String showhousetag() {
		
		return "";
	}
	@RequestMapping("addhouse")
	public String fun1(String location,Integer houseClass,
			String address,Double rents,Integer area,
			Integer fitment,Integer orientation,
			Integer level,Integer houseType,Integer age,String introduction,
			HttpSession session) {
		String province=location.substring(0, location.indexOf('/'));
		String others=location.substring(location.indexOf('/')+1);
		String city=location.substring(0,others.indexOf('/'));
		String district=others.substring(others.indexOf('/')+1);
		House house=new House();
		house.setAddress(address);
		house.setAge(age);
		house.setArea(area);
		house.setCity(city);
		house.setDistrict(district);
		house.setFitment(fitment);
		house.setHouseClass(houseClass);
		house.setHouseType(houseType);
		house.setLevel(level);
		house.setOrientation(orientation);
		house.setProvince(province);
		house.setRents(rents);
		house.setStatus(0);
		house.setLeaserId(1);//需要session支持
		house.setIntroduction(introduction);
		List<String>imagelist=(List<String>) session.getAttribute("imagelist");
		session.setAttribute("imagelist", null);
		hiservice.addHouseInfo(house, imagelist, session);
		return "redirect:showhousebyuser.do?leaserId=";//需要添加用户id
	}
	@RequestMapping("changehouseinfo")
	public String fun2(Integer houseId,HttpSession session) {
		House house=hdao.findHouseByid(houseId);
		session.setAttribute("house", house);
		session.setAttribute("deletelist", null);
		session.setAttribute("imagelist", null);
		return "index/changehouseinfo";
	}
	@RequestMapping("showhousebyid")
	public String fun4(Integer houseId,HttpSession session) {
		House house=hdao.findHouseByid(houseId);
		System.out.println(house.getIntroduction());
		session.setAttribute("house", house);
		List<Image>imagelist=idao.findImageByhouse(houseId);
		//以下好像没用了
		String[] imageurl=new String[imagelist.size()];
		for (int i = 0; i < imageurl.length; i++) {
			imageurl[i]="<img src='"+imagelist.get(i).getLoading()+"' class='file-preview-image'>";
		}
		session.setAttribute("imageurl", imageurl);
		return "index/proinfo";
	}
	/*
	 * 用来跳转到pro_zu.jsp的通用出口
	 */
	@RequestMapping("showhouse")
	public String showhouse() {
		return "index/pro_zu";
	}
	/*
	 * 用来跳转到userhouse.jsp的通用出口
	 */
	@RequestMapping("showuserhouse")
	public String showuserhouse() {
		return "index/userhouse";
	}
	@RequestMapping("setlocation")
	public String showindex(HttpServletRequest request,HttpSession session) {
		//System.out.println(showlocation);
		String province=request.getParameter("province");
		session.setAttribute("province", province);
		return "redirect:showindex.do";
	}
	/*
	 * 显示主页信息
	 */
	@RequestMapping("showindex")
	public String showindex(HttpSession session) {
		List<House> hlist=null;
		String province=(String) session.getAttribute("province");
		//System.out.println(showlocation);
		if(province==null||province.equals("")) {
			hlist=hdao.findHouseAll();
		}else {
			hlist=hdao.findHouseByLocation(province);
		}
		session.setAttribute("hlist", hlist);
		return "index/index";
	}
	/*
	 * 显示所有房屋信息
	 */
	@RequestMapping("showallhouse")
	public String fun3(HttpSession session) {
		String province=(String) session.getAttribute("province");
		List<House> hlist=null;
		if(province==null||province.equals("")) {
			hlist=hdao.findHouseAll();
		}else {
			hlist=hdao.findHouseByLocation(province);
		}
		session.setAttribute("hlist", hlist);
		List<House> hrlist=hdao.findHouseByOrder();
		session.setAttribute("hrlist", hrlist);
		List<House> hplist=new ArrayList<House>();
		if(pagecount<hlist.size()) {
			for (int i = 0; i < pagecount; i++) {
				hplist.add(hlist.get(i));
			}
		}else {
			hplist=hlist;
		}
		
		session.setAttribute("hplist", hplist);
		session.setAttribute("tag1", 0);
		session.setAttribute("tag2", 0);
		session.setAttribute("tag3", 0);
		session.setAttribute("tag4", 0);
		Map<String,Object> info=new HashMap<String,Object>();
		info.put("startrent", null);
		info.put("endrent", null);
		info.put("houseclass", null);
		info.put("startarea", null);
		info.put("endarea", null);
		info.put("housetype", null);
		session.setAttribute("info", info);
		session.setAttribute("currentPage", 1);
		session.setAttribute("pagecount", pagecount);
		return "redirect:showhouse.do";
	}
	/*
	 * 依据搜索信息，显示房屋信息
	 */
	@RequestMapping("showhousebyinfo")
	public String fun5(HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		Map<String,Object> info=(Map<String, Object>) session.getAttribute("info");
		String province=(String) session.getAttribute("province");
		System.out.println(province);
		info.put("province", province);
		List<House> hlist=hdao.findHouseByinfo(info);
		session.setAttribute("hlist", hlist);
		List<House> hplist=new ArrayList<House>();
		if(hlist.size()>pagecount) {
			for (int i = 0; i < pagecount; i++) {
				hplist.add(hlist.get(i));
			}
		}else {
			hplist=hlist;
		}
		session.setAttribute("hplist", hplist);
		session.setAttribute("currentPage", 1);
		return "redirect:showhouse.do";
	}
	/*
	 * 依据用户，显示房屋信息
	 */
	@RequestMapping("showhousebyuser")
	public String showhousebyuser(Integer leaserId,HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException {
		List<House> hlist=hdao.findHouseByUser(leaserId);
		session.setAttribute("hlist", hlist);
		List<House> hplist=new ArrayList<House>();
		if(hlist.size()>pagecount) {
			for (int i = 0; i < pagecount; i++) {
				hplist.add(hlist.get(i));
			}
		}else {
			hplist=hlist;
		}
		session.setAttribute("hplist", hplist);
		session.setAttribute("currentPage", 1);
		session.setAttribute("pagecount", pagecount);
		return "redirect:showuserhouse.do";
	}
	/*
	 * 刷新搜索信息
	 */
	@RequestMapping("refreshinfo")
	@ResponseBody
	public int fun6(HttpServletRequest request,HttpSession session) {
		Map<String,Object> info=(Map<String, Object>)session.getAttribute("info");
		String tag1=request.getParameter("tag1");
		String tag2=request.getParameter("tag2");
		String tag3=request.getParameter("tag3");
		String tag4=request.getParameter("tag4");
		if(tag1!=null) {
			String str1=request.getParameter("startrent");
			String str2=request.getParameter("endrent");
			Double startrent=null;
			Double endrent=null;
			if(str1!=null&&!str1.equals("")) {
				startrent=Double.parseDouble(str1);
			}
			if(str2!=null&&!str2.equals("")) {
				endrent=Double.parseDouble(str2);
			}
			info.put("startrent", startrent);
			info.put("endrent", endrent);
			session.setAttribute("tag1", tag1);
		}
		if(tag2!=null) {
			String str3=request.getParameter("houseclass");
			Integer houseclass=null;
			if(str3!=null&&!str3.equals("")) {
				houseclass=Integer.parseInt(str3);
			}
			info.put("houseclass", houseclass);
			session.setAttribute("tag2", tag2);
		}
		if(tag3!=null) {
			String str4=request.getParameter("startarea");
			String str5=request.getParameter("endarea");
			Integer startarea=null;
			Integer endarea=null;
			if(str4!=null&&!str4.equals("")) {
				startarea=Integer.parseInt(str4);
			}
			if(str5!=null&&!str5.equals("")) {
				endarea=Integer.parseInt(str5);
			}
			info.put("startarea", startarea);
			info.put("endarea", endarea);
			session.setAttribute("tag3", tag3);
		}
		if(tag4!=null) {
			String str6=request.getParameter("housetype");
			Integer housetype=null;
			if(str6!=null&&!str6.equals("")) {
				housetype=Integer.parseInt(str6);
			}
			info.put("housetype", housetype);
			session.setAttribute("tag4", tag4);
		}
		session.setAttribute("info", info);
		return 0;
	}
	/*
	 * 上传图片
	 */
	@RequestMapping("upload")
    @ResponseBody
    public Map<String, Object> updatePhoto(HttpServletRequest request,HttpServletResponse response,HttpSession session,@RequestParam("myFile") MultipartFile myFile){
        Map<String, Object> json = new HashMap<String, Object>();
        //
        try {
            //输出文件后缀名称
            System.out.println(myFile.getOriginalFilename());
            DateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
            //图片名称
            String name = df.format(new Date());

            Random r = new Random();
            for(int i = 0 ;i<3 ;i++){
                name += r.nextInt(10);
            }
            //
            String ext = FilenameUtils.getExtension(myFile.getOriginalFilename());
            //保存图片       File位置 （全路径）   /upload/fileName.jpg
            String url = request.getSession().getServletContext().getRealPath("/upload/phono/");
            System.out.println(url);
            //相对路径
            String path = "/"+name + "." + ext;
            File file = new File(url);
            if(!file.exists()){
                file.mkdirs();
            }
            myFile.transferTo(new File(url+path));
            json.put("success", "upload/phono"+path);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        //return "{\"path\":\"" + json.get("success") + "\"}" ;
        return json;
    }
	/*
	 * 存储图片路径到session
	 */
	@RequestMapping("setImage")
	@ResponseBody
	public int setImgae(HttpSession session,HttpServletRequest request) {
		System.out.println("------------setImagee--------------");
		String path=request.getParameter("path");
		List<String>imagelist=(List<String>) session.getAttribute("imagelist");
		if(imagelist==null) {
        	imagelist=new ArrayList<String>();
        }
        imagelist.add(path);
        session.setAttribute("imagelist", imagelist);
		return 0;
	}
	/*
	 * 记录需要删除的图片，到session中
	 */
	@RequestMapping("deleteimage")
	@ResponseBody
	public int deleteimage(HttpSession session,HttpServletRequest request) {
		Integer imageId=Integer.parseInt(request.getParameter("imageId"));
		System.out.println("------------deleteimage--------------");
		List<Integer>deletelist=(List<Integer>) session.getAttribute("deletelist");
		if(deletelist==null) {
			deletelist=new ArrayList<Integer>();
        }
		deletelist.add(imageId);
        session.setAttribute("deletelist", deletelist);
		return 0;
	}
	/*
	 * 取消删除图片
	 */
	@RequestMapping("readdimage")
	@ResponseBody
	public int readdimage(HttpSession session,HttpServletRequest request) {
		Integer imageId=Integer.parseInt(request.getParameter("imageId"));
		List<Integer>deletelist=(List<Integer>) session.getAttribute("deletelist");
		Integer img=null;
		for (Integer id : deletelist) {
			if(id==imageId) {
				img=id;
			}
		}
		deletelist.remove(img);
        session.setAttribute("deletelist", deletelist);
		return 0;
	}
	/*
	 * 更新房屋信息和增删图片
	 */
	@RequestMapping("updatehouseinfo")
	public String updatehouseinfo(String location,Integer houseClass,
			String address,Integer area,Double rents,
			Integer fitment,Integer orientation,
			Integer level,Integer houseType,Integer age,String introduction,
			HttpSession session) {
		String province=location.substring(0, location.indexOf('/'));
		String others=location.substring(location.indexOf('/')+1);
		String city=location.substring(0,others.indexOf('/'));
		String district=others.substring(others.indexOf('/')+1);
		House house=(House) session.getAttribute("house");
		house.setAddress(address);
		house.setAge(age);
		house.setArea(area);
		house.setCity(city);
		house.setDistrict(district);
		house.setFitment(fitment);
		house.setHouseClass(houseClass);
		house.setHouseType(houseType);
		house.setLevel(level);
		house.setOrientation(orientation);
		house.setProvince(province);
		house.setRents(rents);
		house.setStatus(0);
		house.setLeaserId(1);//需要session支持
		house.setIntroduction(introduction);
		List<Integer>deletelist=(List<Integer>) session.getAttribute("deletelist");
		//List<Integer> deletelist=new ArrayList<Integer>(protodelete);
		List<String>imagelist=(List<String>) session.getAttribute("imagelist");
		//List<String> imagelist=new ArrayList<String>(protoadd);
		session.setAttribute("deletelist", null);
		session.setAttribute("imagelist", null);
		hiservice.updateHouseInfo(house, deletelist, imagelist);
		return "redirect:showallhouse.do";
	}
	@RequestMapping("pagechange")//分页
	@ResponseBody
	public int pagechange(HttpServletRequest request,HttpSession session) {
		List<House> hlist=(List<House>) session.getAttribute("hlist");
		Integer num=Integer.parseInt(request.getParameter("num"));
		//Integer pagecount=Integer.parseInt(request.getParameter("pagecount"));
		Integer start=(num-1)*pagecount;
		Integer end=start+pagecount;
		List<House> hplist=new ArrayList<House>();
		if(end<hlist.size()+1) {
			for (int i = start; i < end; i++) {
				hplist.add(hlist.get(i));
			}
		}else {
			for (int i = start; i < hlist.size(); i++) {
				hplist.add(hlist.get(i));
			}
		}
		
		session.setAttribute("hplist", hplist);
		session.setAttribute("currentPage", num);
		return 0;
	}
	/*
	 * 在打开添加房屋信息前清除session
	 */
	@RequestMapping("clearsession")
	public String clearsession(HttpSession session) {
		session.setAttribute("deletelist", null);
		session.setAttribute("imagelist", null);
		return "addhouse.jsp";
	}
}

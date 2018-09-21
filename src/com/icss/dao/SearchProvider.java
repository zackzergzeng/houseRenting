package com.icss.dao;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

public class SearchProvider {
	/*@Param("startTime") final Date startTime,@Param("endTime") final Date endTime,
	@Param("real_Name") final String real_Name,@Param("status") final Integer status*/
	//通过搜索条件搜索所搜流程
	public String searchHouse(Map<String, Object> info){
		SQL sql = new SQL(){{
			SELECT("*");
			FROM("house");
			if(info.get("startrent")!=null){
				WHERE("rents>#{startrent}");
			}
			if(info.get("endrent")!=null){
				WHERE("rents<=#{endrent}");
			}
			if(info.get("housetype")!=null){
				WHERE("houseType=#{housetype}");
			}
			if(info.get("houseclass")!=null){
				WHERE("houseClass=#{houseclass}");
			}
			if(info.get("startarea")!=null){
				WHERE("area>#{startarea}");
			}
			if(info.get("endarea")!=null){
				WHERE("area<=#{endarea}");
			}
			if(info.get("province")!=null&&!info.get("province").equals("")){
				WHERE("province=#{province}");
			}
		}};
		return sql.toString();
	}
}

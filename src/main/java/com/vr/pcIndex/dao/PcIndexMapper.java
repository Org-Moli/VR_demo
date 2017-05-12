package com.vr.pcIndex.dao;

import java.util.Map;

import org.apache.ibatis.annotations.*;

import com.vr.pcIndex.Provider.GatherProvider;

public interface PcIndexMapper {

	
	
	
	
 @SelectProvider(type=GatherProvider.class,method="queryOrderByParam")
 Map<String,Object> getGatherInfo(
		 @Param("userName")   String userName,
		 @Param("chuang")     String chuang,
		 @Param("storey")     String storey,
		 @Param("timeStart")  String timeStart,
		 @Param("timeEnd")    String timeEnd);
 
 
  @Insert({
     "insert into gather_info",
     "(user_name,user_id,post,telephone,pic_url,pic_num,comment_num,upload_time,chuang,storey,miaoshu,projects,company)",
     "values",
     "(#{userId},#{userName},#{content},0,now())"
   })
   int insert(Map<String,Object> paramsMap);
}

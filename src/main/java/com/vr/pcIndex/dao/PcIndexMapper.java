package com.vr.pcIndex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.*;

import com.vr.pcIndex.Provider.GatherProvider;

public interface PcIndexMapper {

	
	
	
	
 @SelectProvider(type=GatherProvider.class,method="queryOrderByParam")
 List<Map<String,Object>> getGatherInfo(Map<String,Object> paramsMap);
 
 
  @Insert({
     "insert into gather_info",
     "(user_name,user_id,post,telephone,pic_url,pic_num,comment_num,upload_time,chuang,storey,miaoshu,projects,company)",
     "values",
     "(#{user_name},#{user_id},#{post},#{telephone},#{pic_url},#{pic_num},#{comment_num},#{upload_time},#{chuang},#{storey},#{miaoshu},#{projects},#{company})"
   })
   int insert(Map<String,Object> paramsMap);
}

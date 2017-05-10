package com.vr.pcIndex.dao;

import java.util.Map;

import org.apache.ibatis.annotations.*;

public interface PcIndexMapper {
	 @Select({
         "select * from gather_info ",
         "where userName = #{userName} and chuang=#{chuang} and storey=#{storey } and uploadTime &gt;= to_date(#{timeStart}, 'yyyy-MM-dd hh24:mi:ss')  and uploadTime &lt; to_date(#{timeEnd}, 'yyyy-MM-dd hh24:mi:ss')"
 })
 Map<String,Object> getGatherInfo(
		 @Param("userName")  String userName,
		 @Param("chuang")    String chuang,
		 @Param("storey")    String storey,
		 @Param("timeStart") String timeStart,
		 @Param("timeEnd")   String timeEnd);
}

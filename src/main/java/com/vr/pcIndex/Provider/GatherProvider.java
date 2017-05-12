package com.vr.pcIndex.Provider;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;


public class GatherProvider {
	 public String queryOrderByParam(Map<String,Object> paramsMap) {
	        SQL sql = new SQL().SELECT("*").FROM("gather_info");
	        StringBuffer  sb=new StringBuffer();
	        if (paramsMap.get("userName") != null) {
	        	sb.append(" userName like concat('%',#{userName},'%')");
	        }
	        if (paramsMap.get("chuang") != null) {
	        	sb.append(" chuang = #{chuang}");
	        }
	        if (paramsMap.get("storey") != null) {
	        	sb.append(" storey = #{storey}");
	        }
	        if (paramsMap.get("timeStart") != null) {
	        	sb.append(" uploadTime &gt;= to_date(#{timeStart}, 'yyyy-MM-dd hh24:mi:ss')");
	        }
	        if (paramsMap.get("timeEnd") != null) {
	        	sb.append(" uploadTime &lt; to_date(#{timeEnd}, 'yyyy-MM-dd hh24:mi:ss')");
	        }
	        if(sb!=null && sb.length()>0){
	        	sql.WHERE(sb.toString());
	        }
	        System.out.println(sql.toString());
	        return sql.toString();
	    }
}

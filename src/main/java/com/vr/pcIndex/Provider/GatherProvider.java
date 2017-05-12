package com.vr.pcIndex.Provider;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.jdbc.SQL;


public class GatherProvider {
	 public String queryOrderByParam(String userName,String chuang,String storey,String timeStart,String timeEnd) {
	        SQL sql = new SQL().SELECT("*").FROM("gather_info");
	        StringBuffer  sb=new StringBuffer();
	        if (StringUtils.isNotBlank(userName)) {
	        	sb.append(" userName LIKE #{room}");
	        }
	        if (StringUtils.isNotBlank(chuang)) {
	        	sb.append(" chuang = #{chuang}");
	        }
	        if (StringUtils.isNotBlank(storey)) {
	        	sb.append(" storey = #{storey}");
	        }
	        if (StringUtils.isNotBlank(timeStart)) {
	        	sb.append(" uploadTime &gt;= to_date(#{timeStart}, 'yyyy-MM-dd hh24:mi:ss')");
	        }
	        if (StringUtils.isNotBlank(timeEnd)) {
	        	sb.append(" uploadTime &lt; to_date(#{timeEnd}, 'yyyy-MM-dd hh24:mi:ss')");
	        }
	        if(sb!=null && sb.length()>0){
	        	sql.WHERE(sb.toString());
	        }
	        System.out.println(sql.toString());
	        return sql.toString();
	    }
}

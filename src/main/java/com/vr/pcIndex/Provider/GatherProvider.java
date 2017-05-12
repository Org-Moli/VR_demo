package com.vr.pcIndex.Provider;

import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.jdbc.SQL;

import java.util.Map;


public class GatherProvider {
	 public String queryOrderByParam(Map<String,Object> paramsMap) {
	        StringBuffer  sb=new StringBuffer("select * from  gather_info where  1=1 ");
	        if (paramsMap.get("userName") != null && StringUtils.isNotBlank(paramsMap.get("userName")+"")) {
	        	sb.append(" and user_name like concat('%',#{userName},'%')");
	        }
	        if (paramsMap.get("chuang") != null) {
	        	sb.append(" and chuang = #{chuang}");
	        }
	        if (paramsMap.get("storey") != null) {
	        	sb.append(" and storey = #{storey}");
	        }
	        if (paramsMap.get("timeStart") != null) {
	        	sb.append(" and upload_time >= #{timeStart}");
	        }
	        if (paramsMap.get("timeEnd") != null) {
	        	sb.append(" and upload_time  < #{timeEnd} ");
	        }
	        if(paramsMap.get("beginRow")==null){
	        	paramsMap.put("beginRow", 0);
	        }
	        if(paramsMap.get("pageSize")==null){
	        	paramsMap.put("pageSize", 15);
	        }
	        sb.append("  limit #{beginRow},#{pageSize} ");
	        System.out.println(sb.toString());
	        return sb.toString();
	    }
}

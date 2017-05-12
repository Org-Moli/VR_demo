package com.vr.junitTest;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.vr.pcIndex.dao.PcIndexMapper;

@RunWith(SpringJUnit4ClassRunner.class)    
@ContextConfiguration(locations={"classpath:spring-mvc.xml","classpath:mybatis-config.xml"})   
public class DbTest {
	@Autowired
    private PcIndexMapper pcIndexMapper;
	
	@Test
	public void sreachTest() {
		List<Map<String, Object>> gatherInfo = pcIndexMapper.getGatherInfo(new HashMap<>());
		System.out.println(gatherInfo.size());
	}
	
	@Test
	public void insertTest(){
		Map<String, Object>  paramsMap=new HashMap<String, Object>();
		Calendar c=Calendar.getInstance();
		c.setTime(new Date());
		
		Random random=new Random();
	
		for(int i=1;i<=30;i++){//30天数据
			c.setTime(new Date());
			c.add(Calendar.DAY_OF_MONTH, -i);
			for(int j=1;j<=20;j++){//每天20条
				paramsMap.put("user_name","顺子");
				paramsMap.put("user_id",1);
				paramsMap.put("post","施工员");
				paramsMap.put("telephone","18699998888");
				paramsMap.put("pic_url","../img/index/random/"+(random.nextInt(22)+1)+".jpg");
				paramsMap.put("pic_num",4);
				paramsMap.put("comment_num",0);
				paramsMap.put("upload_time",c.getTime());
				if(j<=10){
					paramsMap.put("chuang",1);
					paramsMap.put("storey",j);
					paramsMap.put("miaoshu","1幢"+j+"层全景图");
				}else{
					paramsMap.put("chuang",2);
					paramsMap.put("storey",j-10);
					paramsMap.put("miaoshu","2幢"+(j-10)+"层全景图");
				}
				paramsMap.put("projects", "腾飞创新园");
				paramsMap.put("company", "腾飞创新园");
				pcIndexMapper.insert(paramsMap);
			}
			
		}
		
	}
	

}

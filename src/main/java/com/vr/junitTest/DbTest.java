package com.vr.junitTest;

import java.util.Map;

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
	public void test() {
		Map<String, Object> gatherInfo = pcIndexMapper.getGatherInfo("小蒋","","","","");
		System.out.println(gatherInfo);
	}
	

}

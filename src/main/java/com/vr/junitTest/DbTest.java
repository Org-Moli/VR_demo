package com.vr.junitTest;

import java.util.HashMap;
import java.util.List;
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
		List<Map<String, Object>> gatherInfo = pcIndexMapper.getGatherInfo(new HashMap<>());
		System.out.println(gatherInfo);
	}
	

}

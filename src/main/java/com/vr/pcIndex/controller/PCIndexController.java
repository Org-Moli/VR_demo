package com.vr.pcIndex.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.vr.pcIndex.dao.PcIndexMapper;
import com.vr.question.dao.QuestionInfoMapper;

/**
 * 
 * @author huson
 *
 */
@Controller
@RequestMapping("pc")
public class PCIndexController {
	@Autowired
    private PcIndexMapper pcIndexMapper;
	
	@RequestMapping(value = "/index")
    public ModelAndView index(Model model) {
        return new ModelAndView("pc/index");
    }
	
	@RequestMapping(value = "/sreachIndexInfo")
    public ModelAndView sreachIndexInfo(Model model,String cjUserName,String lcNum,String dName,String startTime,String endTime) {
		System.out.println(cjUserName+":"+lcNum+":"+dName+":"+startTime+":"+endTime);
		Map<String, Object> gatherInfo = pcIndexMapper.getGatherInfo(cjUserName,dName,lcNum,startTime,endTime);
        return new ModelAndView("pc/index");
    }
}


package com.vr.info;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author huson
 *
 */
@Controller
@RequestMapping("pc")
public class PCIndexController {
	@RequestMapping(value = "/index")
    public ModelAndView index(Model model) {
        return new ModelAndView("pc/index");
    }
	
	@RequestMapping(value = "/sreachIndexInfo")
    public ModelAndView sreachIndexInfo(Model model,String cjUserName,Integer lcNum,Integer dName,String startTime,String endTime) {
		System.out.println(cjUserName+":"+lcNum+":"+dName+":"+startTime+":"+endTime);
        return new ModelAndView("pc/index");
    }
}


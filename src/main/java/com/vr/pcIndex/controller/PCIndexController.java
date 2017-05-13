package com.vr.pcIndex.controller;

import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vr.pcIndex.dao.PcIndexMapper;
import com.vr.question.dao.QuestionInfoMapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
    public ModelAndView index(Model model,Integer beginRow,Integer pageSize,HttpSession session) {
		Map<String,Object> paramsMap = new HashMap<String,Object>();
		if(beginRow!=null){
			 paramsMap.put("beginRow",beginRow);
		}
		if(pageSize!=null){
			 pageSize=pageSize>20?20:pageSize;
			 paramsMap.put("pageSize",pageSize);
		}
		List<Map<String, Object>> gatherInfoList = pcIndexMapper.getGatherInfo(paramsMap);
		System.out.println("index reSize="+gatherInfoList.size());
		ModelAndView modelAndView = new ModelAndView("pc/index");
		modelAndView.addObject("gatherInfoList", gatherInfoList);
		session.setAttribute("org_userName","测试");
	    session.setAttribute("org_post","安检员");
        return modelAndView;
    }
	
	@RequestMapping( value = "/sreachIndexInfo", produces = { "application/json;charset=UTF-8" } )
    public  @ResponseBody String sreachIndexInfo(Model model,String cjUserName,String lcNum,String dName,String searchTime) {
        Map<String,Object> paramsMap = new HashMap<>();
        paramsMap.put("userName",cjUserName);
        if(StringUtils.isNotBlank(dName)){
        	 paramsMap.put("chuang",dName);
        }
        if(StringUtils.isNotBlank(lcNum)){
        	 paramsMap.put("storey",lcNum);
        }
        if(StringUtils.isNotBlank(searchTime)){
        	String[] split = searchTime.split("至");
        	 paramsMap.put("timeStart",split[0]);
        	 if(split.length>1){
        		 paramsMap.put("timeEnd",split[1]);
        	 }
        }
		System.out.println(cjUserName + ":" + lcNum + ":" + dName + ":" + searchTime);
		JSONObject jsonObject = new JSONObject();
		List<Map<String, Object>> gatherInfoList = pcIndexMapper.getGatherInfo(paramsMap);
        jsonObject.put("gatherInfoList",gatherInfoList);
        jsonObject.put("success",true);
        return jsonObject.toString();
    }
}


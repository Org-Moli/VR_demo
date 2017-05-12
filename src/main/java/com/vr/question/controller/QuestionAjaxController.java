package com.vr.question.controller;

import com.vr.question.dao.QuestionInfoMapper;
import com.vr.question.dao.QuestionRemarkMapper;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>名称</p>
 * <p/>
 * <p>wikiURL</p>
 *
 * @author zb.jiang
 * @version 1.0
 * @Date 2017/5/9
 */
@Controller
@RequestMapping("questionAjax")
public class QuestionAjaxController {

    @Autowired
    private QuestionInfoMapper questionInfoMapper;

    @Autowired
    private QuestionRemarkMapper questionRemarkMapper;

    @RequestMapping( value = "listQuestion", produces = { "application/json;charset=UTF-8" } )
    public @ResponseBody String listQuestion(Integer mainId,Integer startPos, Integer maxRows)
    {
        if(startPos == null) startPos = 0;
        if(maxRows == null) maxRows = 10;
        JSONObject jsonObject = new JSONObject();
        List questionList = questionInfoMapper.listQuestionInfoByMainId(mainId);
        jsonObject.put("questionList",questionList);
        jsonObject.put("success",true);
        return jsonObject.toString();
    }

    @RequestMapping( value = "getQuestionById", produces = { "application/json;charset=UTF-8" } )
    public @ResponseBody String getQuestionById(Integer id)
    {
        JSONObject jsonObject = new JSONObject();
        Map<String,Object> questionMap = questionInfoMapper.getQuestionInfoById(id);
        jsonObject.put("questionMap",questionMap);
        jsonObject.put("success",true);
        return jsonObject.toString();
    }

    @RequestMapping( value = "saveQuestionInfo", produces = { "application/json;charset=UTF-8" } )
    public @ResponseBody String saveQuestionInfo(Integer id, Integer userId, String userName, String content)
    {
        Map<String,Object> paramsMap = new HashMap<String,Object>();
        paramsMap.put("userId",userId);
        paramsMap.put("userName",userName);
        paramsMap.put("content",content);
        paramsMap.put("mainId",id);
        questionInfoMapper.insert(paramsMap);
        //更新数据
        questionInfoMapper.updateCount(id);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success",true);
        return jsonObject.toString();
    }

    @RequestMapping( value = "deleteQuestionInfo", produces = { "application/json;charset=UTF-8" } )
    public @ResponseBody String deleteQuestionInfo(Integer id)
    {
        JSONObject jsonObject = new JSONObject();
        questionInfoMapper.delete(id);
        jsonObject.put("success",true);
        return jsonObject.toString();
    }

    @RequestMapping( value = "updateQuestionInfoState", produces = { "application/json;charset=UTF-8" } )
    public @ResponseBody String updateQuestionInfoState(Integer id, Integer state)
    {
        JSONObject jsonObject = new JSONObject();
        questionInfoMapper.updateStateById(state,id);
        jsonObject.put("success",true);
        return jsonObject.toString();
    }

    @RequestMapping( value = "saveQuestionRemark", produces = { "application/json;charset=UTF-8" } )
    public @ResponseBody String saveQuestionRemark(Integer userId, String userName, String content, Integer questionId)
    {
        Map<String,Object> paramsMap = new HashMap<String,Object>();
        paramsMap.put("userId",userId);
        paramsMap.put("userName",userName);
        paramsMap.put("content",content);
        paramsMap.put("questionId",questionId);
        questionRemarkMapper.insert(paramsMap);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("success",true);
        return jsonObject.toString();
    }

    @RequestMapping( value = "listQuestionRemarkByQuestionId", produces = { "application/json;charset=UTF-8" } )
    public @ResponseBody String listQuestionRemarkByQuestionId(Integer questionId)
    {
        JSONObject jsonObject = new JSONObject();
        List remarkList = questionRemarkMapper.listQuestionRemarkByQuestionId(questionId);
        jsonObject.put("remarkList",remarkList);
        jsonObject.put("success",true);
        return jsonObject.toString();
    }
}

package com.vr.info;

import com.vr.question.dao.QuestionInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

/**
 * <p>名称</p>
 * <p/>
 * <p>wikiURL</p>
 *
 * @author zb.jiang
 * @version 1.0
 * @Date 2017/5/10
 */
@Controller
@RequestMapping("vr")
public class VrInfoManageController {

    @Autowired
    private QuestionInfoMapper questionInfoMapper;

    @RequestMapping( value = "info" )
    public String info(Integer id,Model model)
    {
        Map<String,Object> infoMap = questionInfoMapper.getGatherInfoById(id);
        model.addAttribute("infoMap",infoMap);

        List<Map<String,Object>> listChuang = questionInfoMapper
                .listByChuangAndStorey((String) infoMap.get("chuang"), (String) infoMap.get("storey"));
        model.addAttribute("listChuang",listChuang);
        return "/vr/info";
    }

    @RequestMapping( value = "compare" )
    public String compare(String idStr, Model model)
    {
        String [] idArr = idStr.split(",");
        Map<String,Object> infoMap = questionInfoMapper.getGatherInfoById(Integer.valueOf(idArr[0]));
        model.addAttribute("infoMap",infoMap);
        Map<String,Object> infoMap1 = questionInfoMapper.getGatherInfoById(Integer.valueOf(idArr[1]));
        model.addAttribute("infoMap1",infoMap1);
        return "/vr/compare";
    }
}

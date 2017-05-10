package com.vr.info;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping( value = "info" )
    public String info( Model model)
    {
        return "/vr/info";
    }

    @RequestMapping( value = "compare" )
    public String compare(String userName, Model model)
    {
        model.addAttribute("userName",userName);
        return "/vr/compare";
    }
}

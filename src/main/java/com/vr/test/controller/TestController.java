package com.vr.test.controller;

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
 * @Date 2017/5/9
 */
@Controller
@RequestMapping("test")
public class TestController {
    @RequestMapping(value = "/test")
    public String test(Model model) {
        return null;
    }
}

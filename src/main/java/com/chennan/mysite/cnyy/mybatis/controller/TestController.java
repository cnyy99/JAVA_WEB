package com.chennan.mysite.cnyy.mybatis.controller;

import com.chennan.mysite.cnyy.controller.MainController;
import com.chennan.mysite.cnyy.model.FastjsonTest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
public class TestController {
    private Logger log = LoggerFactory.getLogger(MainController.class);

    @GetMapping("/tryintercept")
    public String tryintercept() {
        return "tryintercept";
    }

    @GetMapping("/fastjson")
    public FastjsonTest getFastJson() {
        FastjsonTest fastjsonTest = new FastjsonTest();
        fastjsonTest.setId(100);
        fastjsonTest.setString("fastjson test");
        fastjsonTest.setIgnore("ignore field");
        fastjsonTest.setDate(new Date());
        return fastjsonTest;
    }
}

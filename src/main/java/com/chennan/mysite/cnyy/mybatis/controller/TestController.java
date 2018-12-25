package com.chennan.mysite.cnyy.mybatis.controller;

import com.chennan.mysite.cnyy.model.FastjsonTest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
@RestController
public class TestController {

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

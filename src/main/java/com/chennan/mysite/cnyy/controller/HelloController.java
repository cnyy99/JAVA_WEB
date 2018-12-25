package com.chennan.mysite.cnyy.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Description
 * @Author cn
 * @Date 2018-12-25
 */
@RestController
public class HelloController {
    @Value("${pocket.county}")
    private String name;

    @GetMapping("/hello")
    public String hello() {
        return name+"aaaafsdfsaaaaaaaaa";
    }
}
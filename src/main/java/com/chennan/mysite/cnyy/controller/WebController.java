package com.chennan.mysite.cnyy.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/web")
public class WebController {

    @Value(value="${woniu.secret}")
    private String uuid;

    @Value(value="${woniu.number}")
    private int randomID;

    @Value(value="${woniu.limitnumber}")
    private int limitnumber;


    @RequestMapping("/index")
    public Map<String, Object> Index(){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("uuid", uuid);
        map.put("randomID", randomID);
        map.put("limitnumber", limitnumber);
        return map;
    }
}
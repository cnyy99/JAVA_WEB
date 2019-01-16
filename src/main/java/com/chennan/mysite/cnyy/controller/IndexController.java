package com.chennan.mysite.cnyy.controller;

import com.chennan.mysite.cnyy.mybatis.service.CourseService;
import com.chennan.mysite.cnyy.mybatis.service.SkillService;
import com.chennan.mysite.cnyy.mybatis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

    @Autowired
    private UserService userService;
    @Autowired
    private SkillService skillService;
    @Autowired
    private CourseService courseService;

    @GetMapping("/index")
    public ModelAndView index(HttpServletRequest request) {
        HttpSession session = request.getSession();
        skillService.addSkillsToSession(session);
        courseService.addCoursesToSession(session);

        ModelAndView view = new ModelAndView("index");
        return view;
    }

    @GetMapping("/comment")
    public String s() {
        return "comment";
    }

    @GetMapping("/videos")
    public String ss() {
        return "videos";
    }

}
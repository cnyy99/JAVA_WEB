package com.chennan.mysite.cnyy.controller;

import com.chennan.mysite.cnyy.mybatis.entity.Skill;
import com.chennan.mysite.cnyy.mybatis.entity.User;
import com.chennan.mysite.cnyy.mybatis.service.SkillService;
import com.chennan.mysite.cnyy.mybatis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @GetMapping("/index")
    public ModelAndView index(HttpServletRequest request) {
        HttpSession session=request.getSession();
        skillService.addSkills(session);
        ModelAndView view = new ModelAndView("index");
        return view;
    }
    @GetMapping("/login2")
    public String  login2() {
        return "login2";
    }


}
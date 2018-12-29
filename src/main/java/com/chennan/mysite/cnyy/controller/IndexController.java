package com.chennan.mysite.cnyy.controller;

import com.chennan.mysite.cnyy.mybatis.entity.User;
import com.chennan.mysite.cnyy.mybatis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @Autowired
    private UserService userService;

    @GetMapping("/index")
    public ModelAndView index() {
        ModelAndView view = new ModelAndView("index");
        return view;
    }
    @GetMapping("/login2")
    public String  login2() {
        return "login2";
    }

    @PostMapping("/toindex2")
//    @PostMapping(value = "/login1")
    public String toindex(@RequestParam String name, @RequestParam String pass,Model model) {
        User user = new User();
        user.setUserName(name);
        user.setUserPassword(pass);
        model.addAttribute("user",user);
        return "index";
    }

}
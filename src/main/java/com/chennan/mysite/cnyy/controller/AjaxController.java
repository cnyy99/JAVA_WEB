package com.chennan.mysite.cnyy.controller;

import com.chennan.mysite.cnyy.mybatis.entity.User;
import com.chennan.mysite.cnyy.mybatis.service.UserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AjaxController {
    @Autowired
    private UserService userService;

    @GetMapping("/toajax")
    public String toajax()
    {
        return "ajax";
    }

//    @GetMapping("/ajaxlist")
    @PostMapping("/ajaxlist")
    @ResponseBody
    public List<User> getAjaxlist()
    {
        return userService.getAllUsers();
    }
}

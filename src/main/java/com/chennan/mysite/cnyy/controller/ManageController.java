package com.chennan.mysite.cnyy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.SESSION_USERTYPE_KEY;
import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.USER_TYPE_NORMAL;

@Controller
@RequestMapping("/manage")
public class ManageController {
    @GetMapping("/skillmanage")
    public String login2(HttpServletRequest request) {
        HttpSession session=request.getSession();
        String  UserType=(String) session.getAttribute(SESSION_USERTYPE_KEY);
        if(UserType.equalsIgnoreCase(USER_TYPE_NORMAL))
        {
            return "/404";
        }
        return "skillManage";
    }
}

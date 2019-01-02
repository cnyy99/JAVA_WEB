package com.chennan.mysite.cnyy.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chennan.mysite.cnyy.mybatis.entity.User;
import com.chennan.mysite.cnyy.mybatis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.*;

/**
 *
 */
@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/register")
    public String toregister() {
        return "register";
    }

    @PostMapping("/register")
    public ModelAndView register(HttpSession session, Model model, HttpServletResponse httpResponse,
                                 @RequestParam String username, @RequestParam String password, @RequestParam(defaultValue = USER_TYPE_NORMAL) String type) {

        Map<String, String> msg = userService.register(username, password, type);
        model.addAttribute(SESSION_MSG_KEY, msg);
        if (msg.get(SESSION_MSG_KEY).equalsIgnoreCase(SUCCESS)) {
            ModelAndView view = new ModelAndView("login");
            return view;
        } else {
            ModelAndView view = new ModelAndView("register");
            view.addObject(SESSION_MSG_KEY, msg.get(SESSION_MSG_KEY));
            return view;
        }
    }

    @GetMapping("/login")
    public ModelAndView tologin() {
        return new ModelAndView("login");
    }

    @PostMapping("/toindex")
    public ModelAndView login(HttpServletRequest request, HttpSession session, Model model, HttpServletResponse response,
                              @RequestParam String username, @RequestParam String password) {
        Map<String, String> msg = userService.login(username, password);
        System.out.println(msg);
        model.addAttribute(SESSION_MSG_KEY, msg);
        if (msg.get(SESSION_MSG_KEY).equalsIgnoreCase(SUCCESS)) {
            // 设置 name 和 url cookie
            Cookie name = new Cookie(WebSecurityConfig.SESSION_USER_KEY,
                    username);
            Cookie url = new Cookie("url",
                    request.getParameter("url"));
            Cookie type = new Cookie(SESSION_USERTYPE_KEY,
                    msg.get(SESSION_USERTYPE_KEY));

            // 设置cookie过期时间为24小时。
            name.setMaxAge(COOKIE_MAX_AGE);
            url.setMaxAge(COOKIE_MAX_AGE);
            type.setMaxAge(COOKIE_MAX_AGE);
            // 在响应头部添加cookie
            response.addCookie(name);
            response.addCookie(url);
            response.addCookie(type);
            session.setAttribute(SESSION_USER_KEY, username);
            session.setAttribute(SESSION_USERTYPE_KEY, msg.get(SESSION_USERTYPE_KEY));
            ModelAndView view = new ModelAndView("index");
//            view.addObject("username", username);
            return view;
        } else {
            ModelAndView view = new ModelAndView("login");
            view.addObject(SESSION_MSG_KEY,msg.get(SESSION_MSG_KEY));
            return view;
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
        // 移除session
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equalsIgnoreCase(SESSION_USER_KEY)) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        session.removeAttribute(SESSION_USER_KEY);
        return "redirect:/index";
    }

}
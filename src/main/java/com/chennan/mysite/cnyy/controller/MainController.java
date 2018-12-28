package com.chennan.mysite.cnyy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chennan.mysite.cnyy.mybatis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 */
@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String index(@SessionAttribute(WebSecurityConfig.SESSION_KEY) String account, Model model) {
        model.addAttribute("name", account);
        return "index";
    }

    //    @GetMapping("/login")
//    public String login() {
//        return "login";
//    }
//
//    @PostMapping("/loginPost")
//    public @ResponseBody Map<String, Object> loginPost(String account, String password, HttpSession session) {
//        Map<String, Object> map = new HashMap<>();
//        if (!"123456".equals(password)) {
//            map.put("success", false);
//            map.put("message", "密码错误");
//            return map;
//        }
//
//        // 设置session
//        session.setAttribute(WebSecurityConfig.SESSION_KEY, account);
//
//        map.put("success", true);
//        map.put("message", "登录成功");
//        return map;
//    }
    @GetMapping("/register")
    public String toregister() {
        return "register";
    }

    @PostMapping("/register")
    public ModelAndView register(HttpSession session, Model model, HttpServletResponse httpResponse,
                                 @RequestParam String username, @RequestParam String password, @RequestParam String password2) {

        String msg = userService.register(username, password);
        model.addAttribute("msg", msg);
        if (msg.equalsIgnoreCase("登陆成功")) {
            session.setAttribute(WebSecurityConfig.SESSION_KEY, username);
            ModelAndView view = new ModelAndView("index");
            view.addObject("username", username);
            return view;
        } else {
            ModelAndView view = new ModelAndView("login");
            return view;
        }
    }

    @GetMapping("/login")
    public String tologin() {
        return "login";
    }

    @PostMapping("/addlogin")
    public ModelAndView login(HttpSession session, Model model, HttpServletResponse httpResponse,
                              @RequestParam String username, @RequestParam String password) {
        String msg = userService.login(username, password);
        System.out.println(msg);
        model.addAttribute("msg", msg);
        if (msg.equalsIgnoreCase("登陆成功")) {
            session.setAttribute(WebSecurityConfig.SESSION_KEY, username);
            ModelAndView view = new ModelAndView("index");
            view.addObject("username", username);
            return view;
        } else {
            ModelAndView view = new ModelAndView("login");
            return view;
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        // 移除session
        session.removeAttribute(WebSecurityConfig.SESSION_KEY);
        return "redirect:/login";
    }

}
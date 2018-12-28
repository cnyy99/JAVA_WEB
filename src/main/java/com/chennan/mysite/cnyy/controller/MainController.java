package com.chennan.mysite.cnyy.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.chennan.mysite.cnyy.mybatis.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.SESSION_KEY;

/**
 *
 */
@Controller
public class MainController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String index(@SessionAttribute(SESSION_KEY) String account, Model model) {
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
            session.setAttribute(SESSION_KEY, username);
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
    public ModelAndView login(HttpServletRequest request,HttpSession session, Model model, HttpServletResponse response,
                              @RequestParam String username, @RequestParam String password) {
        String msg = userService.login(username, password);
        System.out.println(msg);
        model.addAttribute("msg", msg);
        if (msg.equalsIgnoreCase("登陆成功")) {
            // 设置 name 和 url cookie
            Cookie name = new Cookie(WebSecurityConfig.SESSION_KEY,
                    username);
            Cookie url = new Cookie("url",
                    request.getParameter("url"));

            // 设置cookie过期时间为24小时。
            name.setMaxAge(60*60*24);
            url.setMaxAge(60*60*24);
            // 在响应头部添加cookie
            response.addCookie( name );
            response.addCookie( url );
            session.setAttribute(SESSION_KEY, username);
            ModelAndView view = new ModelAndView("index");
            view.addObject("username", username);
            return view;
        } else {
            ModelAndView view = new ModelAndView("login");
            return view;
        }
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpSession session, HttpServletResponse response) {
        // 移除session
        Cookie []cookies=request.getCookies();
        for(Cookie cookie :cookies)
        {
            if (cookie.getName().equalsIgnoreCase(SESSION_KEY))
            {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
        }
        session.removeAttribute(SESSION_KEY);
        return "redirect:/login";
    }

}
package com.chennan.mysite.cnyy.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**  *  */
@Configuration
public class WebSecurityConfig extends WebMvcConfigurerAdapter {
    private Logger log = LoggerFactory.getLogger(MainController.class);

    /**
     * 登录session key
     */
    public final static String SESSION_USER_KEY = "SESSION_USER_KEY";
    public final static String SESSION_USERTYPE_KEY = "SESSION_USERTYPE_KEY";
    public final static String SESSION_MSG_KEY = "SESSION_MSG_KEY";
    public final static String USER_TYPE_NORMAL = "USER_TYPE_NORMAL";
    public final static String USER_TYPE_ADMINISTRATOR = "USER_TYPE_ADMINISTRATOR";
    public final static String SUCCESS = "成功";
    public final static String FAILURE = "失败";
    public final static String SKILL_KEY = "SKILL_KEY";
    public final static Integer SKILL_NUM_KEY = 7;
    public final static String COURSE_KEY = "COURSE_KEY";
    public final static Integer COURSE_NUM_KEY = 50;
    public final static Integer COOKIE_MAX_AGE = 60 * 60 * 24;

    @Bean
    public SecurityInterceptor getSecurityInterceptor() {
        return new SecurityInterceptor();
    }

    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration addInterceptor = registry.addInterceptor(getSecurityInterceptor());
//        排除配置
        addInterceptor.excludePathPatterns("/error");
        addInterceptor.excludePathPatterns("/login**");
        addInterceptor.excludePathPatterns("/toindex");
//        addInterceptor.excludePathPatterns("/");
        addInterceptor.excludePathPatterns("/static/**");
        addInterceptor.excludePathPatterns("/index");
        addInterceptor.excludePathPatterns("/register");
//        拦截配置
//        addInterceptor.addPathPatterns("/**");
    }

    private class SecurityInterceptor extends HandlerInterceptorAdapter {
        @Override
        public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
            HttpSession session = request.getSession();
            Cookie[] cookies = request.getCookies();
            if (session.getAttribute(SESSION_USER_KEY) != null) {
                return true;
            }
            boolean isLogined = false;
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase(SESSION_USER_KEY)) {
                    session.setAttribute(SESSION_USER_KEY, cookie.getValue());
                    isLogined = true;
                    log.info("cookie: " + cookie.getName() + ": " + cookie.getValue());
                }
                if (cookie.getName().equalsIgnoreCase(SESSION_USERTYPE_KEY)) {
                    session.setAttribute(SESSION_USERTYPE_KEY, cookie.getValue());
                    isLogined = true;
                    log.info("cookie: " + cookie.getName() + ": " + cookie.getValue());
                }
            }
            if (isLogined)
                return true;
            String url = "/login";
            response.sendRedirect(url);
            return false;
        }
    }
}
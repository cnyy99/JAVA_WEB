package com.chennan.mysite.cnyy.mybatis.controller;

import com.chennan.mysite.cnyy.controller.MainController;
import com.chennan.mysite.cnyy.controller.WebSecurityConfig;
import com.chennan.mysite.cnyy.mybatis.entity.Comment;
import com.chennan.mysite.cnyy.mybatis.service.CommentService;
import com.chennan.mysite.cnyy.mybatis.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class CommentController {
    private Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;
    @PostMapping("/comment/save")
    public String saveComment(HttpServletRequest request, @RequestParam String commentText)
    {
        HttpSession session=request.getSession();
        Comment comment=new Comment();
        comment.setCommentPid(0);
        comment.setCommentText(commentText);
        comment.setCommentTime(new Date());
        comment.setUserId(userService.getUserId((String) session.getAttribute(WebSecurityConfig.SESSION_USER_KEY)));
        comment.setUserName((String) session.getAttribute(WebSecurityConfig.SESSION_USER_KEY));
        commentService.insert(comment);
        return "redirect:/comment";
    }

    @PostMapping("/comment/psave")
    public String saveCommentP(HttpServletRequest request, @RequestParam String commentText,@RequestParam(required = false) Integer pid)
    {
        HttpSession session=request.getSession();
        Comment comment=new Comment();
        comment.setCommentPid(pid);
        comment.setCommentText(commentText);
        comment.setCommentTime(new Date());
        comment.setUserId(userService.getUserId((String) session.getAttribute(WebSecurityConfig.SESSION_USER_KEY)));
        comment.setUserName((String) session.getAttribute(WebSecurityConfig.SESSION_USER_KEY));
        commentService.insert(comment);
        return "redirect:/index";
    }
}

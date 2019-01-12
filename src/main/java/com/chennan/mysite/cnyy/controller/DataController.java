package com.chennan.mysite.cnyy.controller;

import com.chennan.mysite.cnyy.mybatis.entity.Skill;
import com.chennan.mysite.cnyy.mybatis.entity.User;
import com.chennan.mysite.cnyy.mybatis.service.SkillService;
import com.chennan.mysite.cnyy.mybatis.service.UserService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RestController
@RequestMapping("/get")
public class DataController {
    private Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private SkillService skillService;

    @Autowired
    private UserService userService;

    @GetMapping("/usersPage")
    public PageInfo<User> lists(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "10") int pageSize) {
        return userService.getAllUsersPage(pageNo, pageSize);
    }

    @GetMapping("/skillsPage")
    public PageInfo<Skill> listsSkills(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "10") int pageSize) {
        return skillService.getAllSkillPage(pageNo, pageSize);
    }

    @GetMapping("/skills")
    public List<Skill> listSkills(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "10") int pageSize) {
        log.info("call /get/skills");
        return skillService.getAllSkill();
    }

    @GetMapping("/user/{id}")
    public User selectUserById(@PathVariable("id") Integer id) {
        return userService.selectById(id);
    }

}

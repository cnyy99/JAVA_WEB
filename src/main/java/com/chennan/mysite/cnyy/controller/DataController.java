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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RestController
@RequestMapping("/data")
public class DataController {
    private Logger log = LoggerFactory.getLogger(DataController.class);

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
    public Map<String,Object> listSkills() {
        log.info("call /data/skills");
        List<Skill> skillList=skillService.getAllSkill();
        Map<String,Object> stringObjectMap=new HashMap<>();
        stringObjectMap.put("data",skillList);
        stringObjectMap.put("itemsCount",skillList.size());
        return stringObjectMap;
    }

    @GetMapping("/deleteSkill")
    public Integer deleteSkills(@RequestParam Integer skillId) {
        log.info("call /data/deleteSkill");
        return skillService.deletePrimaryKey(skillId);
    }

    @PostMapping("/insertSkill")
    public Integer listSkillss(@RequestParam String skillName,@RequestParam Integer skillScore,@RequestParam Boolean skillShow) {
        Skill skill=new Skill();
        skill.setSkillName(skillName);
        skill.setSkillScore(skillScore);
        skill.setSkillShow(skillShow);
        log.info("call /data/insertSkills");
        return skillService.insert(skill);
    }
    @PostMapping("/updateSkill")
    public Skill listSkillsup(@RequestParam Integer skillId,@RequestParam String skillName,@RequestParam Integer skillScore,@RequestParam Boolean skillShow) {
        Skill skill=new Skill();
        skill.setSkillId(skillId);
        skill.setSkillName(skillName);
        skill.setSkillScore(skillScore);
        skill.setSkillShow(skillShow);
        log.info("call /data/updateSkill");
        skillService.update(skill);
        return skill;
    }

    @GetMapping("/user/{id}")
    public User selectUserById(@PathVariable("id") Integer id) {
        return userService.selectById(id);
    }

}

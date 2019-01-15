package com.chennan.mysite.cnyy.controller;

import com.chennan.mysite.cnyy.mybatis.entity.*;
import com.chennan.mysite.cnyy.mybatis.service.CommentService;
import com.chennan.mysite.cnyy.mybatis.service.CourseService;
import com.chennan.mysite.cnyy.mybatis.service.SkillService;
import com.chennan.mysite.cnyy.mybatis.service.UserService;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/data")
public class DataController {
    private Logger log = LoggerFactory.getLogger(DataController.class);

    @Autowired
    private SkillService skillService;

    @Autowired
    private UserService userService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private CommentService commentService;

    @GetMapping("/usersPage")
    public PageInfo<User> lists(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "10") int pageSize) {
        return userService.getAllUsersPage(pageNo, pageSize);
    }

    @GetMapping("/skillsPage")
    public PageInfo<Skill> listsSkills(@RequestParam(defaultValue = "1") int pageNo, @RequestParam(defaultValue = "10") int pageSize) {
        return skillService.getAllSkillPage(pageNo, pageSize);
    }


    @GetMapping("/skills")
    public List<Skill> listSkills(@RequestParam(required = false) Integer skillId, @RequestParam(required = false) String skillName, @RequestParam(required = false) Integer skillScore, @RequestParam(required = false) Boolean skillShow) {
        log.info("call /data/skills");
        if (skillId == null && skillShow == null && (skillName == null || skillName.equalsIgnoreCase("")) && skillScore == null) {
            return skillService.getAllSkill();
        }
        List<Skill> skillList = skillService.findSkill(skillId, skillName, skillScore, skillShow);
        return skillList;
    }

    @GetMapping("/deleteSkill")
    public Integer deleteSkills(@RequestParam Integer skillId) {
        log.info("call /data/deleteSkill");
        return skillService.deletePrimaryKey(skillId);
    }

    @PostMapping("/insertSkill")
    public Skill listSkillss(@RequestParam String skillName, @RequestParam Integer skillScore, @RequestParam Boolean skillShow) {
        if (skillName == null || skillName.equalsIgnoreCase("")) {
            return null;
        }
        Skill skill = new Skill();
        skill.setSkillName(skillName);
        skill.setSkillScore(skillScore);
        skill.setSkillShow(skillShow);
        log.info("call /data/insertSkills");
        skillService.insert(skill);
        return skillService.selectByName(skillName);
    }

    @PostMapping("/updateSkill")
    public Skill listSkillsup(@RequestParam Integer skillId, @RequestParam String skillName, @RequestParam Integer skillScore, @RequestParam Boolean skillShow) {
        if (skillName == null || skillName.equalsIgnoreCase("")) {
            return skillService.selectById(skillId);
        }
        Skill skill = new Skill();
        skill.setSkillId(skillId);
        skill.setSkillName(skillName);
        skill.setSkillScore(skillScore);
        skill.setSkillShow(skillShow);
        log.info("call /data/updateSkill");
        skillService.update(skill);
        return skill;
    }

    @GetMapping("/courses")
    public List<Course> listCourses() {
        log.info("call /data/courses");
        List<Course> courseList = courseService.getAllCourse();
        return courseList;
    }

    @GetMapping("/deleteCourse")
    public Integer deleteCourses(@RequestParam Integer courseId) {
        log.info("call /data/deleteCourse");
        return courseService.deletePrimaryKey(courseId);
    }

    @PostMapping("/insertCourse")
    public Course listCoursess(@RequestParam String courseName, @RequestParam Integer courseScore, @RequestParam String courseType, @RequestParam String courseTerm, @RequestParam Boolean courseShow) {
        Course course = new Course();
        if (courseName == null || courseName.equalsIgnoreCase("") || courseTerm == null || courseTerm.equalsIgnoreCase("") || courseType == null || courseType.equalsIgnoreCase("")) {
            return null;
        }
        course.setCourseName(courseName);
        course.setCourseScore(courseScore);
        course.setCourseShow(courseShow);
        course.setCourseType(courseType);
        course.setCourseTerm(courseTerm);
        log.info("call /data/insertCourses");
        courseService.insert(course);
        return courseService.selectByName(courseName);
    }

    @PostMapping("/updateCourse")
    public Course listCoursesup(@RequestParam Integer courseId, @RequestParam String courseName, @RequestParam Integer courseScore, @RequestParam String courseType, @RequestParam String courseTerm, @RequestParam Boolean courseShow) {
        if (courseName == null || courseName.equalsIgnoreCase("") || courseTerm == null || courseTerm.equalsIgnoreCase("") || courseType == null || courseType.equalsIgnoreCase("")) {
            return courseService.selectById(courseId);
        }
        Course course = new Course();
        course.setCourseId(courseId);
        course.setCourseName(courseName);
        course.setCourseScore(courseScore);
        course.setCourseShow(courseShow);
        course.setCourseType(courseType);
        course.setCourseTerm(courseTerm);
        log.info("call /data/updateCourse");
        courseService.update(course);
        return course;
    }



    @GetMapping("/comments")
    public List<Comment> comments() {
        return commentService.getAllComment();
    }

    @GetMapping("/commentshow")
    public List<Comment> commentshow() {

        return commentService.getAllComment();
    }

    @PostMapping("/commentshowinsert")
    public Comment commentshowinsert(HttpServletRequest request, @RequestParam String commentText,@RequestParam Integer commentPid)
    {
        HttpSession session=request.getSession();
        Comment comment=new Comment();
        comment.setCommentPid(commentPid);
        comment.setCommentText(commentText);
        comment.setCommentTime(new Date());
        comment.setUserId(userService.getUserId((String) session.getAttribute(WebSecurityConfig.SESSION_USER_KEY)));
        comment.setUserName((String) session.getAttribute(WebSecurityConfig.SESSION_USER_KEY));
        commentService.insert(comment);
        return commentService.selectByText(commentText);
    }
    @GetMapping("/deleteComment")
    public Integer deleteComment(@RequestParam Integer commentId) {
        return commentService.deletePrimaryKey(commentId);
    }


    @GetMapping("/user/{id}")
    public User selectUserById(@PathVariable("id") Integer id) {
        return userService.selectById(id);
    }


}

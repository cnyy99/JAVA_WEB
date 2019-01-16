package com.chennan.mysite.cnyy.mybatis.service;

import com.chennan.mysite.cnyy.controller.MainController;
import com.chennan.mysite.cnyy.mybatis.entity.Course;
import com.chennan.mysite.cnyy.mybatis.entity.CourseExample;
import com.chennan.mysite.cnyy.mybatis.mapper.CourseMapper;
import com.chennan.mysite.cnyy.util.DataHelper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.COURSE_KEY;
import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.COURSE_NUM_KEY;

@Service
public class CourseService {
    private Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired(required = false)
    private CourseMapper courseMapper;

    /**
     * 新增
     */
    public Integer insert(Course course) {

        // valid
        if (course == null) {
            return -1;
        }
        return courseMapper.insert(course);
    }

    /**
     * 删除
     */
    public Integer delete(String name) {
        CourseExample courseExample = new CourseExample();
        courseExample.or().andCourseNameEqualTo(name);
        return courseMapper.deleteByExample(courseExample);
    }

    /**
     * 更新
     */
    public Integer update(Course course) {

        return courseMapper.updateByPrimaryKeySelective(course);
    }

    /**
     * Load查询
     */
    public Course selectById(Integer id) {
        return courseMapper.selectByPrimaryKey(id);
    }

    public Course selectByName(String name) {
        CourseExample userExample = new CourseExample();
        userExample.or().andCourseNameEqualTo(name);
        List<Course> userList = courseMapper.selectByExample(userExample);
        if (userList.size() == 0) {
            return null;
        } else {
            return userList.get(0);
        }
    }

    public List<Course> getAllCourse() {
        CourseExample courseExample = new CourseExample();
        courseExample.or().andCourseIdIsNotNull();
        return courseMapper.selectByExample(courseExample);
    }

    public List<Course> getAllShowCourse() {
        CourseExample courseExample = new CourseExample();
        courseExample.or().andCourseShowEqualTo(true);
        return courseMapper.selectByExample(courseExample);
    }

    public PageInfo<Course> getAllCoursePage(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        PageInfo<Course> pageInfo = new PageInfo<>(getAllCourse());

        return pageInfo;
    }

    public void addCoursesToSession(HttpSession session) {
        List<Course> courseList = getAllShowCourse();
        List<Course> newCourseList = (List<Course>) DataHelper.getRandomList(courseList, COURSE_NUM_KEY);
        session.setAttribute(COURSE_KEY, newCourseList);
    }

    public Integer deletePrimaryKey(Integer courseId) {
        return courseMapper.deleteByPrimaryKey(courseId);
    }
}

package com.chennan.mysite.cnyy.mybatis.service;

import com.chennan.mysite.cnyy.controller.MainController;
import com.chennan.mysite.cnyy.mybatis.entity.Course;
import com.chennan.mysite.cnyy.mybatis.entity.CourseExample;
import com.chennan.mysite.cnyy.mybatis.mapper.CourseMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
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
        int ret = courseMapper.deleteByExample(courseExample);
        return ret > 0 ? ret : -1;
    }

    /**
     * 更新
     */
    public Integer update(Course course) {

        int ret = courseMapper.updateByPrimaryKeySelective(course);
        return ret > 0 ? ret : -1;
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

    public List<Course> getAllCourse()
    {
        CourseExample courseExample=new CourseExample();
        courseExample.or().andCourseIdIsNotNull();
        return  courseMapper.selectByExample(courseExample);
    }

    public PageInfo<Course> getAllCoursePage(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        PageInfo<Course> pageInfo = new PageInfo<>(getAllCourse());

        return pageInfo;
    }
}

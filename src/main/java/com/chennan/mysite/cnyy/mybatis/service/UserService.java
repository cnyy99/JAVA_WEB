package com.chennan.mysite.cnyy.mybatis.service;

import com.chennan.mysite.cnyy.mybatis.entity.User;
import com.chennan.mysite.cnyy.mybatis.mapper.UserMapper;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserService {

    @Autowired(required = false)
    private UserMapper userMapper;

    public Page<User> getUsers() {
        return userMapper.getUsers();
    }

//    @Cacheable(cacheNames = "users", key = "#id")
    public User selectById(long id) {
        System.out.println("没有缓存，开始查询数据库……");
        return userMapper.selectByPrimaryKey(id);
    }
}
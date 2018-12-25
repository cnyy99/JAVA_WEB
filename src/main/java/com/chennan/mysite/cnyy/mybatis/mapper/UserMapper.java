package com.chennan.mysite.cnyy.mybatis.mapper;

import com.chennan.mysite.cnyy.base.BaseMapper;
import com.chennan.mysite.cnyy.mybatis.entity.User;
import com.github.pagehelper.Page;


public interface UserMapper extends BaseMapper<User> {
    Page<User> getUsers();
}
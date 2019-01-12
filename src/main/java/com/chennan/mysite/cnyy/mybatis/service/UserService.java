package com.chennan.mysite.cnyy.mybatis.service;

import com.chennan.mysite.cnyy.controller.MainController;
import com.chennan.mysite.cnyy.mybatis.entity.User;
import com.chennan.mysite.cnyy.mybatis.entity.UserExample;
import com.chennan.mysite.cnyy.mybatis.mapper.UserMapper;
import com.chennan.mysite.cnyy.util.DataHelper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.SESSION_MSG_KEY;
import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.SESSION_USERTYPE_KEY;
import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.SUCCESS;


@Service
public class UserService {
    private Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired(required = false)
    private UserMapper userMapper;

    public List<User> getAllUsers() {
        UserExample userExample = new UserExample();
        userExample.or().andUserNameIsNotNull();
        return userMapper.selectByExample(userExample);
    }

    @Cacheable(cacheNames = "users", key = "#id")
    public User selectById(Integer id) {
        System.out.println("没有缓存，开始查询数据库……");
        return userMapper.selectByPrimaryKey(id);
    }

    public int insert(User user) {
        return userMapper.insert(user);
    }

    public User selectByName(String name) {
        UserExample userExample = new UserExample();
        userExample.or().andUserNameEqualTo(name);
        List<User> userList = userMapper.selectByExample(userExample);
        if (userList.size() == 0) {
            return null;
        } else {
            return userList.get(0);
        }
    }

    public Map<String, String> register(String username, String password, String type) {
        Map<String, String> stringMap = new HashMap<>();
        stringMap.put(SESSION_USERTYPE_KEY, type);
        if (StringUtils.isBlank(username)) {
            stringMap.put(SESSION_MSG_KEY, "用户名不能为空");
            return stringMap;
        }

        if (StringUtils.isBlank(password)) {
            stringMap.put(SESSION_MSG_KEY, "密码不能为空");
            return stringMap;
        }

        User u = selectByName(username);
        if (u != null) {
            stringMap.put(SESSION_MSG_KEY, "用户名已经被占用");
            return stringMap;
        }

        User user = new User();
        user.setUserName(username);
        user.setUserPassword(DataHelper.getSHA256Str(password));
        user.setUserType(type);
        insert(user);
        stringMap.put(SESSION_MSG_KEY, SUCCESS);
        return stringMap;


    }

    public Map<String, String> login(String username, String password) {
        Map<String, String> stringMap = new HashMap<>();

        User u = selectByName(username);
        if (u == null) {
            stringMap.put(SESSION_MSG_KEY, "用户名不存在");
            return stringMap;
        }

        if (!DataHelper.getSHA256Str(password).equals(u.getUserPassword())) {
//        if (!password.equals(u.getUserPassword())) {
            stringMap.put(SESSION_MSG_KEY, "密码错误");
            return stringMap;
        }
        stringMap.put(SESSION_MSG_KEY, SUCCESS);
        stringMap.put(SESSION_USERTYPE_KEY, u.getUserType());
        return stringMap;
    }


    public PageInfo<User> getAllUsersPage(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        PageInfo<User> pageInfo = new PageInfo<>(getAllUsers());

        return pageInfo;
    }

    public Integer getUserId(String userName) {
        UserExample userExample = new UserExample();
        userExample.or().andUserNameEqualTo(userName);
        List<User> userList = userMapper.selectByExample(userExample);
        if (userList.size() == 0) {
            return -1;
        } else {
            return userList.get(0).getUserId();
        }
    }
}
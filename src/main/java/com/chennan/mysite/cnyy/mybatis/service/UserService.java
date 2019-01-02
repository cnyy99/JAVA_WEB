package com.chennan.mysite.cnyy.mybatis.service;

import com.chennan.mysite.cnyy.mybatis.entity.User;
import com.chennan.mysite.cnyy.mybatis.entity.UserExample;
import com.chennan.mysite.cnyy.mybatis.mapper.UserMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class UserService {

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
        if (userList.size()==0) {
            return null;
        } else {
            return userList.get(0);
        }
    }

    public String register(String username, String password) {
        if (StringUtils.isBlank(username)) {
            return "用户名不能为空";
        }

        if (StringUtils.isBlank(password)) {
            return "密码不能为空";
        }

        User u = selectByName(username);
        if (u != null) {
            return "用户名已经被占用";
        }

        User user = new User();
        user.setUserName(username);
        user.setUserPassword(MD5(password));
        insert(user);


        return "注册成功";
    }

    public String login(String username, String password) {
        if (StringUtils.isBlank(username)) {
            return "用户名不能为空";
        }

        if (StringUtils.isBlank(password)) {
            return "密码不能为空";
        }

        User u = selectByName(username);
        if (u == null) {
            return "用户名不存在";
        }

        if (!MD5(password).equals(u.getUserPassword())) {
//        if (!password.equals(u.getUserPassword())) {
            return "密码错误";
        }
        return "登陆成功";
    }

    public String MD5(String message) {
        try {
            MessageDigest md5 = MessageDigest.getInstance("md5");
            byte[] cipherData = md5.digest(message.getBytes());
            StringBuilder builder = new StringBuilder();
            for (byte cipher : cipherData) {
                String toHexStr = Integer.toHexString(cipher & 0xff);
                builder.append(toHexStr.length() == 1 ? "0" + toHexStr : toHexStr);
            }
            return builder.toString();
        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("xxx");
        }
        //System.out.println(builder.toString());
        return null;
    }

    public PageInfo<User> getAllUsersPage(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        PageInfo<User> pageInfo = new PageInfo<>(getAllUsers());

        return pageInfo;
    }
}
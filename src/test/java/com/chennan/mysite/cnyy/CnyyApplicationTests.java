package com.chennan.mysite.cnyy;

import com.chennan.mysite.cnyy.mybatis.entity.User;
import com.chennan.mysite.cnyy.mybatis.service.UserService;
import com.chennan.mysite.cnyy.util.DataHelper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.SESSION_MSG_KEY;
import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.USER_TYPE_NORMAL;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CnyyApplicationTests {
    @Autowired
    UserService userService;
	@Test
	public void contextLoads() {

	}

	@Test
	public void testinsert()
    {
        User user = new User();
        user.setUserPassword("fas");
        user.setUserName("123");
        user.setUserType(USER_TYPE_NORMAL);
        Map<String, String> stringMap=userService.register(user.getUserName(),DataHelper.MD5(user.getUserPassword()),user.getUserType());
        System.out.println(stringMap.get(SESSION_MSG_KEY));
    }

}


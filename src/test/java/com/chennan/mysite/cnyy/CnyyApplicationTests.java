package com.chennan.mysite.cnyy;

import com.chennan.mysite.cnyy.mybatis.entity.User;
import com.chennan.mysite.cnyy.mybatis.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CnyyApplicationTests {
    @Autowired
    UserService userService;
	@Test
	public void contextLoads() {

	}

	@Test
    @Transactional
    @Rollback(value =true)
	public void testinsert()
    {
        User user = new User();
        user.setUserAge(1);
        user.setUserPassword("fas");
        user.setUserName("fdasasafsfafsafasdfa");
        userService.insert(user);
    }

}


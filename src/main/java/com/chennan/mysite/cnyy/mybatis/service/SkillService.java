package com.chennan.mysite.cnyy.mybatis.service;

import com.chennan.mysite.cnyy.controller.MainController;
import com.chennan.mysite.cnyy.mybatis.entity.Skill;
import com.chennan.mysite.cnyy.mybatis.entity.SkillExample;
import com.chennan.mysite.cnyy.mybatis.mapper.SkillMapper;
import com.chennan.mysite.cnyy.util.DataHelper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.SKILL_KEY;

@Service
public class SkillService {
    private Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired(required = false)
    private SkillMapper skillMapper;

    /**
     * 新增
     */
    public Integer insert(Skill skill) {

        // valid
        if (skill == null) {
            return -1;
        }
        return skillMapper.insert(skill);
    }

    /**
     * 删除
     */
    public Integer delete(String name) {
        SkillExample skillExample = new SkillExample();
        skillExample.or().andSkillNameEqualTo(name);
        return skillMapper.deleteByExample(skillExample);
    }

    /**
     * 更新
     */
    public Integer update(Skill skill) {
        return skillMapper.updateByPrimaryKeySelective(skill);
    }

    /**
     * Load查询
     */
    public Skill selectById(Integer id) {
        return skillMapper.selectByPrimaryKey(id);
    }

    public Skill selectByName(String name) {
        SkillExample userExample = new SkillExample();
        userExample.or().andSkillNameEqualTo(name);
        List<Skill> userList = skillMapper.selectByExample(userExample);
        if (userList.size() == 0) {
            return null;
        } else {
            return userList.get(0);
        }
    }

    public List<Skill> getAllSkill() {
        SkillExample skillExample = new SkillExample();
        skillExample.or().andSkillIdIsNotNull();
        if (skillMapper == null)
            log.error("SkillMapper is null");
        return skillMapper.selectByExample(skillExample);
    }

    public PageInfo<Skill> getAllSkillPage(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        PageInfo<Skill> pageInfo = new PageInfo<>(getAllSkill());

        return pageInfo;
    }

    public void addSkills(HttpSession session) {
        List<Skill> skillList = getAllSkill();
        List<Skill> newSkillList = (List<Skill>) DataHelper.getRandomList(skillList, 5);
        session.setAttribute(SKILL_KEY, newSkillList);
    }
}

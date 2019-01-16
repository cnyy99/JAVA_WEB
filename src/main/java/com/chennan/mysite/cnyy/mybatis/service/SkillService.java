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
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.*;

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

    public Integer deletePrimaryKey(Integer id) {

        return skillMapper.deleteByPrimaryKey(id);
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

    public List<Skill> findSkill(Integer skillId, String skillName, Integer skillScore, Boolean skillShow) {
        SkillExample skillExample = new SkillExample();
        if (skillId != null) {
            skillExample.or().andSkillIdEqualTo(skillId);
        }
        if (skillName != null && !skillName.equalsIgnoreCase("")) {
            skillExample.or().andSkillNameLike(skillName);
        }
        if (skillScore != null) {
            skillExample.or().andSkillScoreEqualTo(skillScore);
        }
        if (skillShow != null) {
            skillExample.or().andSkillShowEqualTo(skillShow);
        }
        return skillMapper.selectByExample(skillExample);
    }

    public List<Skill> getAllShowSkill() {
        SkillExample skillExample = new SkillExample();
        skillExample.or().andSkillShowEqualTo(true);
        return skillMapper.selectByExample(skillExample);
    }

    public PageInfo<Skill> getAllSkillPage(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        PageInfo<Skill> pageInfo = new PageInfo<>(getAllSkill());

        return pageInfo;
    }

    public void addSkillsToSession(HttpSession session) {
        List<Skill> skillList = getAllShowSkill();
        List<Skill> newSkillList = (List<Skill>) DataHelper.getRandomList(skillList, SKILL_NUM_KEY);
        session.setAttribute(SKILL_KEY, newSkillList);
    }
}

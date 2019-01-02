package com.chennan.mysite.cnyy.mybatis.service;

import com.chennan.mysite.cnyy.mybatis.entity.Skill;
import com.chennan.mysite.cnyy.mybatis.entity.SkillExample;
import com.chennan.mysite.cnyy.mybatis.mapper.SkillMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class SkillService {
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
        int ret = skillMapper.deleteByExample(skillExample);
        return ret > 0 ? ret : -1;
    }

    /**
     * 更新
     */
    public Integer update(Skill skill) {

        int ret = skillMapper.updateByPrimaryKeySelective(skill);
        return ret > 0 ? ret : -1;
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

    public List<Skill> getAllSkill()
    {
        SkillExample skillExample=new SkillExample();
        skillExample.or().andSkillIdIsNotNull();
        return  skillMapper.selectByExample(skillExample);
    }

    public PageInfo<Skill> getAllSkillPage(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        PageInfo<Skill> pageInfo = new PageInfo<>(getAllSkill());

        return pageInfo;
    }
}

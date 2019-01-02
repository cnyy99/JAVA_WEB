package com.chennan.mysite.cnyy.mybatis.service;

import com.chennan.mysite.cnyy.mybatis.entity.Award;
import com.chennan.mysite.cnyy.mybatis.entity.AwardExample;
import com.chennan.mysite.cnyy.mybatis.mapper.AwardMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AwardService {

    @Autowired(required = false)
    private AwardMapper awardMapper;

    /**
     * 新增
     */
    public Integer insert(Award award) {

        // valid
        if (award == null) {
            return -1;
        }
        return awardMapper.insert(award);
    }

    /**
     * 删除
     */
    public Integer delete(String name) {
        AwardExample awardExample = new AwardExample();
        awardExample.or().andAwardNameEqualTo(name);
        int ret = awardMapper.deleteByExample(awardExample);
        return ret > 0 ? ret : -1;
    }

    /**
     * 更新
     */
    public Integer update(Award award) {

        int ret = awardMapper.updateByPrimaryKeySelective(award);
        return ret > 0 ? ret : -1;
    }

    /**
     * Load查询
     */
    public Award selectById(Integer id) {
        return awardMapper.selectByPrimaryKey(id);
    }

    public Award selectByName(String name) {
        AwardExample userExample = new AwardExample();
        userExample.or().andAwardNameEqualTo(name);
        List<Award> userList = awardMapper.selectByExample(userExample);
        if (userList.size() == 0) {
            return null;
        } else {
            return userList.get(0);
        }
    }

    public List<Award> getAllAward()
    {
        AwardExample awardExample=new AwardExample();
        awardExample.or().andAwardIdIsNotNull();
        return  awardMapper.selectByExample(awardExample);
    }

    public PageInfo<Award> getAllAwardPage(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        PageInfo<Award> pageInfo = new PageInfo<>(getAllAward());

        return pageInfo;
    }

}
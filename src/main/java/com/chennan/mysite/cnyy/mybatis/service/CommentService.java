package com.chennan.mysite.cnyy.mybatis.service;

import com.chennan.mysite.cnyy.mybatis.entity.Comment;
import com.chennan.mysite.cnyy.mybatis.entity.CommentExample;
import com.chennan.mysite.cnyy.mybatis.mapper.CommentMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class CommentService {
    @Autowired(required = false)
    private CommentMapper commentMapper;

    /**
     * 新增
     */
    public Integer insert(Comment comment) {

        // valid
        if (comment == null) {
            return -1;
        }
        return commentMapper.insert(comment);
    }

    /**
     * 删除
     */
    public Integer deleteById(Integer id) {
        int ret = commentMapper.deleteByPrimaryKey(id);
        return ret > 0 ? ret : -1;
    }

    /**
     * 更新
     */
    public Integer update(Comment comment) {

        int ret = commentMapper.updateByPrimaryKeySelective(comment);
        return ret > 0 ? ret : -1;
    }

    /**
     * Load查询
     */
    public Comment selectById(Integer id) {
        return commentMapper.selectByPrimaryKey(id);
    }
    public List<Comment> getCommentsById(Integer id) {
        List<Comment> commentList=new ArrayList<>();
        CommentExample commentExample=new CommentExample();
        commentExample.or().andCommentPidEqualTo(id);
        commentList=commentMapper.selectByExample(commentExample);
        commentList.add(0,commentMapper.selectByPrimaryKey(id));
        return commentList;
    }

//    public Comment selectByName(String name) {
//        CommentExample userExample = new CommentExample();
//        userExample.or().andCommentNameEqualTo(name);
//        List<Comment> userList = commentMapper.selectByExample(userExample);
//        if (userList.size() == 0) {
//            return null;
//        } else {
//            return userList.get(0);
//        }
//    }

    public List<Comment> getAllComment()
    {
        CommentExample commentExample=new CommentExample();
        commentExample.or().andCommentIdIsNotNull();
        return  commentMapper.selectByExample(commentExample);
    }

    public PageInfo<Comment> getAllCommentPage(int pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        PageInfo<Comment> pageInfo = new PageInfo<>(getAllComment());

        return pageInfo;
    }
}

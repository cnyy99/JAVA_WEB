package com.chennan.mysite.cnyy.model;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.Data;

import java.util.Date;
@Data
public class FastjsonTest {
    private Integer id;
    private String string;
    /**
     * 格式化日期
     */
    @JSONField(format = "yyyy-MM-dd HH:mm:ss")
    private Date date;

    /**
     * 转换为json时不包括该属性
     */
    @JSONField(serialize = false)
    private String ignore;



}
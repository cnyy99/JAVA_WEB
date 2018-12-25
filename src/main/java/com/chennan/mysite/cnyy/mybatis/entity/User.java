package com.chennan.mysite.cnyy.mybatis.entity;

import lombok.Data;

import javax.persistence.Id;
import javax.persistence.Table;
@Data
@Table(name = "tbl_user")
public class User {
    @Id
    private Long userId;
    private String userName;
    private Integer userAge;
}

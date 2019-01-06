package com.chennan.mysite.cnyy.util;

import com.chennan.mysite.cnyy.mybatis.entity.Skill;
import com.chennan.mysite.cnyy.mybatis.service.SkillService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpSession;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import static com.chennan.mysite.cnyy.controller.WebSecurityConfig.SKILL_KEY;

public class DataHelper {
    /**
     * @param paramArray:被抽取数组
     * @param count:抽取元素的个数
     * @function:从数组中随机抽取若干不重复元素
     * @return:由抽取元素组成的新数组
     */
    public static Object[] getRandomArray(Object[] paramArray, int count) {
        if (paramArray.length < count) {
            return paramArray;
        }
        Object[] newArray = new Object[count];
        Random random = new Random();
        int temp = 0;//接收产生的随机数
        List<Integer> list = new ArrayList<Integer>();
        for (int i = 1; i <= count; i++) {
            temp = random.nextInt(paramArray.length);//将产生的随机数作为被抽数组的索引
            if (!(list.contains(temp))) {
                newArray[i - 1] = paramArray[temp];
                list.add(temp);
            } else {
                i--;
            }
        }
        return newArray;
    }

    /**
     * @param paramList:被抽取list
     * @param count:抽取元素的个数
     * @function:从list中随机抽取若干不重复元素
     * @return:由抽取元素组成的新list
     */
    public static List getRandomList(List paramList, int count) {
        if (paramList.size() < count) {
            return paramList;
        }
        Random random = new Random();
        List<Integer> tempList = new ArrayList<Integer>();
        List<Object> newList = new ArrayList<Object>();
        int temp = 0;
        for (int i = 0; i < count; i++) {
            temp = random.nextInt(paramList.size());//将产生的随机数作为被抽list的索引
            if (!tempList.contains(temp)) {
                tempList.add(temp);
                newList.add(paramList.get(temp));
            } else {
                i--;
            }
        }
        return newList;
    }

    public static String MD5(String message) {
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

}

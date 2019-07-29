package com.aaa.dao;

import com.aaa.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserDao {
    @Select("select * from userinfo where telphone=#{telphone} and pwd=#{pwd}")
    public UserInfo login(UserInfo info);
}

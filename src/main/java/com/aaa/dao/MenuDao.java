package com.aaa.dao;

import com.aaa.entity.TreeMenu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface MenuDao {
    //根据不同的用户获取不同的权限
    @Select("select tf.* from tab_function tf\n" +
            "join tab_fun_role tfr on tf.funid=tfr.funid\n" +
            "join tab_role tr on tr.roleid=tfr.roleid\n" +
            "join userinfo u on u.roleid=tr.roleid\n" +
            "where userid=#{userid}")
  public List<Map> query(Integer userid);
}

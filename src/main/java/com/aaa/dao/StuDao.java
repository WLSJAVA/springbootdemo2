package com.aaa.dao;

import com.aaa.entity.Stu;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface StuDao {
    //1.不用考虑两个表之间的到底是一对多还是多对一
    //2.不用考虑实体类的属性是否和数据库列名是否一致
    @Select(" select * from stu left join clazz on stu.claid=clazz.claid")
    public List<Map> selectStu();
    @Insert("insert into stu values(#{stuid},#{sname},#{claid})")
    public void addStu(Stu stu);
    @Delete("delete from stu where stuid=#{id}")
    public void delStu(int id);
    @Update("update stu set sname=#{sname},claid=#{claid} where stuid=#{stuid}")
    public void updateStu(Stu stu);
    

}

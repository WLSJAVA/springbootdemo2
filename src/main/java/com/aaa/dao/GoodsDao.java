package com.aaa.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface GoodsDao {
    @Select("select * from product_info join product_type on product_info.typeNo=product_type.typeNo")
    public List<Map> queryGoods();

}

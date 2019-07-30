package com.aaa.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface OrderDao {

    public int getCount();
    //向总表进行添加
    public int addPurchaseMaster(Map map);
    //向详情表中进行添加
    public int addPurchaseDetail(List<Map> list);

}

package com.aaa.service;

import com.aaa.dao.GoodsDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements  GoodsService{
    @Resource
    private GoodsDao goodsDao;

    @Override
    public List<Map> queryGoods() {
        return goodsDao.queryGoods();
    }
}

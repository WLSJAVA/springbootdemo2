package com.aaa.service;

import com.aaa.dao.OrderDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {
    @Resource
    private OrderDao orderDao;
    @Override
    public int getCount() {
        return orderDao.getCount();
    }
    //需要同时向两个表进行添加，是一个业务单元，要不同时成功，要不同时失败，事务管理
    @Override
    public boolean addApplyOrder(Map map) {
      int num=  orderDao.addPurchaseMaster(map);//添加总表
        //添加详情表
       List<Map> list= (List<Map>)map.get("goods");
     int num2=   orderDao.addPurchaseDetail(list);
     if(num>0 && num2>0){
         return  true;

     }
        return false;
    }
}

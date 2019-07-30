package com.aaa.controller;

import com.aaa.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource
    private OrderService orderService;
    @RequestMapping("/getNo")
    @ResponseBody
    public String getNo(){
        String orderid=null;
      int count=  orderService.getCount();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        if(count==0){
            orderid="NO"+sdf.format(new Date())+"001";
        }else
      if(count<10){
          orderid="NO"+sdf.format(new Date())+"00"+count;
      }else if(count<100){
          orderid="NO"+sdf.format(new Date())+"0"+count;
      }else{
          orderid="NO"+sdf.format(new Date())+count;
      }
      return  orderid;
    }

    @RequestMapping("/applyOrder")
    @ResponseBody//向客户端响应一个json数据
    public String applyOrder(@RequestBody Map map){//从客户端接收一个数据
        boolean flag=orderService.addApplyOrder(map);
        if(flag)
            return "true";
        else
             return "false";
    }
}

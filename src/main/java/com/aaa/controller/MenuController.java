package com.aaa.controller;

import com.aaa.entity.UserInfo;
import com.aaa.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class MenuController {
    @Resource
    private MenuService menuService;
    @RequestMapping("/menu")
    @ResponseBody
    public List<Map> query(HttpSession session){
      UserInfo info=(UserInfo) session.getAttribute("userInfo");
          return menuService.query(info.getUserid());

    }
    //跳转到采购页面
    @RequestMapping("/toBuyIn")
    public String toRe(){
        return "houtai/buyIn";

    }
}

package com.aaa.controller;

import com.aaa.entity.UserInfo;
import com.aaa.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {
  @Resource
    private UserService userService;
  @RequestMapping("/login")
    @ResponseBody
    public String login(UserInfo info, HttpSession session){
     UserInfo userInfo= userService.login(info);
     if(userInfo!=null){
         //将登录人信息保存在session
         session.setAttribute("userInfo",userInfo);
         return "true";
     }else
       return "false";
  }
  //页面跳转
  @RequestMapping("/toback")
  public String toBackIndex(){
     return "houtai/backIndex";

  }

}

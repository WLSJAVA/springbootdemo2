package com.aaa.service;

import com.aaa.dao.UserDao;
import com.aaa.entity.UserInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;
    @Override
    public UserInfo login(UserInfo info) {
        return userDao.login(info);
    }
}

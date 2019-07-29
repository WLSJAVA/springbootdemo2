package com.aaa.service;

import com.aaa.dao.ClaDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class ClaServiceImpl implements ClaService {
    @Resource
    private ClaDao ClaDao;
    @Override
    public List<Map> queryCla() {
        return ClaDao.queryCla();
    }
}

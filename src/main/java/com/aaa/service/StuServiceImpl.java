package com.aaa.service;

import com.aaa.dao.StuDao;
import com.aaa.entity.Stu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class StuServiceImpl implements StuService {
    @Resource
    private StuDao stuDao;
    @Override
    public List<Map> selectStu() {
        return stuDao.selectStu();
    }
    public void addStu(Stu stu){
          stuDao.addStu(stu);

    }
    public void delStu(int id){
        stuDao.delStu(id);
    }

    @Override
    public void updateStu(Stu stu) {
        stuDao.updateStu(stu);
    }
}

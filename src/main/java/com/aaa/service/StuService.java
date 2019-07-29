package com.aaa.service;

import com.aaa.entity.Stu;

import java.util.List;
import java.util.Map;

public interface StuService {
    public List<Map> selectStu();
    public void addStu(Stu stu);
    public void delStu(int id);
    public void updateStu(Stu stu);

}

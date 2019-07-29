package com.aaa.service;

import com.aaa.dao.MenuDao;
import com.aaa.entity.TreeMenu;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class MenuServiceImpl implements MenuService {
    @Resource
    private MenuDao menuDao;
    @Override
    public List<Map> query(Integer userid) {
       /* List<TreeMenu> menuList=menuDao.query();
        List<TreeMenu> parentMenu=new ArrayList<TreeMenu>();
        for(TreeMenu tree : menuList ){
              TreeMenu trees=new TreeMenu();
              trees.setId(tree.getId());
              trees.setName(tree.getName());
              trees.setHref(tree.getHref());
              trees.setSuperId(tree.getSuperId());
              trees.setSuperName(tree.getSuperName());
              tree.setSpread(tree.isSpread());
            parentMenu.add(trees);
        }
        return null;*/
       return menuDao.query(userid);

    }
}

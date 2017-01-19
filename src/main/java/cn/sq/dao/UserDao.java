package cn.sq.dao;

import cn.sq.domain.User;

import java.io.Serializable;
import java.util.List;

/**
 * Created by qianzhihao on 2017/1/17.
 */
public interface UserDao extends Dao<User>{
    int add(User user);

    int del(User user);

    int update(User user);

    User findOneById(Serializable Id);

    List<User> findAll();
}

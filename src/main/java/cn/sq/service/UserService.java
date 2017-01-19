package cn.sq.service;

import cn.sq.domain.User;

/**
 * Created by qianzhihao on 2017/1/17.
 */
public interface UserService extends BaseService<User>{
    void add(User user)throws Exception;

    User findUser(User user)throws Exception;
}

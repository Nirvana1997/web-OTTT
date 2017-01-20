package cn.sq.mvc.controller;

import cn.sq.domain.ResponseObj;
import cn.sq.domain.User;
import cn.sq.service.serviceImpl.UserServiceImpl;
import cn.sq.utils.GsonUtils;
import com.alibaba.druid.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户请求相关控制器
 * Created by qianzhihao on 2017/1/19.
 */
@Controller
@RequestMapping("/userAction")
public class UserController {
    @Autowired
    private UserServiceImpl userService;    //自动载入Service对象
    private ResponseObj responseObj;    //bean对象


    /**
     * 为什么返回值是一个ModelAndView，ModelAndView代表一个web页面<br/>
     * setViewName是设置一个jsp页面的名称
     * @param req   http请求
     * @param user  发起请求后，spring接收到请求，然后封装的bean数据
     * @return  返回一个web页面
     * @throws Exception
     */
    @RequestMapping(value = "/reg", method = RequestMethod.POST)
    public ModelAndView reg(HttpServletRequest req, User user) throws Exception{
        ModelAndView mav = new ModelAndView();
        mav.setViewName("home");
        System.out.println(user.toString());
        if(null==user){
            mav.addObject("message", "用户信息不能为空！");  //加入提示信息，在jsp中我们直接使用${对象名称}就能获取对应的内容
            return mav; //返回页面
        }
        if (StringUtils.isEmpty(user.getName()) || StringUtils.isEmpty(user.getPwd())) {
            mav.addObject("message", "用户名或密码不能为空！");
            return mav;
        }
        if (null != userService.findUser(user)) {
            mav.addObject("message", "用户已经存在！");
            return mav;
        }
        try {
            userService.add(user);
        } catch (Exception e) {
            e.printStackTrace();
            mav.addObject("message", "错误：用户其他信息错误");
            return mav;
        }
        mav.addObject("code", 110);
        mav.addObject("message", "恭喜。注册成功");
        req.getSession().setAttribute("user", user);
        return mav;
    }

    /**
     * 登录接口
     * @param req
     * @param user
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = {
            "application/json; charset=utf-8"})
    @ResponseBody
    public ModelAndView login(HttpServletRequest req, User user) throws Exception {
        ModelAndView mav = new ModelAndView("home");
        String result;
        if (null == user) {
            responseObj = new ResponseObj<User>();
            responseObj.setCode(ResponseObj.EMPUTY);
            responseObj.setMsg("登录信息不能为空");
            result = GsonUtils.gson.toJson(responseObj);    //转换的json数据
            mav.addObject("result", result);
            return mav; //返回页面
        }
        if (StringUtils.isEmpty(user.getLoginId()) || StringUtils.isEmpty(user.getPwd())) {
            responseObj = new ResponseObj<User>();
            responseObj.setCode(ResponseObj.FAILED);
            responseObj.setMsg("用户名或密码不能为空");
            result = GsonUtils.gson.toJson(responseObj);
            mav.addObject("result", result);
            return mav;
        }
        //查找用户
        User user1 = userService.findUser(user);
        if (null == user1) {
            responseObj = new ResponseObj<User>();
            responseObj.setCode(ResponseObj.EMPUTY);
            responseObj.setMsg("未找到该用户");
            result = GsonUtils.gson.toJson(responseObj);
        } else {
            if (user.getPwd().equals(user1.getPwd())) {
                responseObj = new ResponseObj<User>();
                responseObj.setCode(ResponseObj.OK);
                responseObj.setMsg(ResponseObj.OK_STR);
                result = GsonUtils.gson.toJson(responseObj);
            } else {
                responseObj = new ResponseObj<User>();
                responseObj.setCode(ResponseObj.FAILED);
                responseObj.setMsg("用户密码错误");
                result = GsonUtils.gson.toJson(responseObj);
            }
        }
        mav.addObject("result", result);
        return mav;
    }
}

package com.fxh.hs.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fxh.hs.entity.User;
import com.fxh.hs.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	//登录
	@RequestMapping("/login.service")
	public String login(User loginuser,HttpServletRequest httpHttpServletRequest){
		if (httpHttpServletRequest.getSession().getAttribute("loginuser")==null) {
			List<User> user0=userService.login(loginuser);
			if (user0.size()>0) {
				/**
				 * 成功
				 * 将用户存入session
				 */
				httpHttpServletRequest.getSession().setAttribute("loginuser", user0.get(0));
			}else{
				httpHttpServletRequest.getSession().setAttribute("message", "请输入正确的账号密码");
				return "error.jsp";
			}
		}
		return "homeLoading.service";
	}
	//登出
	@RequestMapping("/logout.service")
	public String logout(HttpServletRequest httpHttpServletRequest){
		httpHttpServletRequest.getSession().invalidate();
		return "homeLoading.service";
	}
}

package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.opensymphony.xwork2.ActionSupport;


import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;

import pojo.User;

import service.UserService;
import util.HibernateSessionFactory;

public class Login extends ActionSupport implements ServletRequestAware{
	HttpServletRequest request;
	private String message;
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String execute() throws Exception {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(username.isEmpty() || password.isEmpty()) {
			setMessage("输入有空不能登录");
			return ERROR;
		}
		
		user = UserService.getUser(username);
		
		if(user != null && user.getPassword().equals(password)) {
			//
			request.getSession().setAttribute("user",user);
			setMessage("欢迎你登录成功");
			return SUCCESS;
		}
		else {
			setMessage("用户名或者密码错误");
			return ERROR;
		}
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	

}

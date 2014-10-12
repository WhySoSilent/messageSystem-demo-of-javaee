package controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import pojo.User;

import service.UserService;

import com.opensymphony.xwork2.ActionSupport;

public class Register extends ActionSupport implements ServletRequestAware{
	HttpServletRequest request;
	private String message;
	private User user;
	
	public String execute() throws Exception {
		String username = request.getParameter("username");
		String realname = request.getParameter("realname");
		String password = request.getParameter("password");
		String repeat_password = request.getParameter("repeat-password");
		
		if(username.isEmpty() || realname.isEmpty() || password.isEmpty() || repeat_password.isEmpty()) {
			setMessage("输入有空不能注册");
			return ERROR;
		}
		
		if(password.equals(repeat_password)) {
			User newUser = new User(username,realname,password);
			if(UserService.addUser(newUser)) {
				request.getSession().setAttribute("user",UserService.getUser(username));
				user = newUser;
				setMessage("注册成功,欢迎您使用留言系统");
				return SUCCESS;
			}
			else{
				setMessage("用户名 " + newUser.getUsername() + "已经存在");
				return ERROR;
			}
		}
		else {
			setMessage("两次输入的密码不一致！");
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

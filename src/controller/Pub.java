package controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import pojo.Msg;
import pojo.User;

import service.MsgService;

import com.opensymphony.xwork2.ActionSupport;

public class Pub extends ActionSupport implements ServletRequestAware{
	HttpServletRequest request;
	private String message;
	
	public String execute() throws Exception {
		String msg = request.getParameter("msgs");
		User user = (User)request.getSession().getAttribute("user");
		MsgService.add(new Msg(user.getId(),user.getRealname(),msg));
		setMessage("留言发表成功");
		return SUCCESS;
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

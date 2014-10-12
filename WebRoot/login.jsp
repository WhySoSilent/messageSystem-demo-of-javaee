<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
	if(session.getAttribute("user")!=null)
		response.sendRedirect("index");
%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>留言系统</title>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="css/bootstrap-responsive.min.css" />
	<link type="text/css" rel="stylesheet"  href="css/common.css">
  </head>
  <body>
 	<div>
		<div id="header" class="navbar navbar-inverse navbar-fixed-top">
			<div class="justAnBox navbar-inner">
				<div class="container">
					<a class="brand" href="index">留言系统</a>
					<div class="nav-collapse"><ul class="nav">
						<li><a href="register">注册</a></li>
					</ul></div>
				</div>
			</div>
		</div>
		<!-- begging... -->
		<div class="container">
			<s:if test="message != null">
				<!-- 消息位置 -->
				<div class="alert alert-error">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<s:property value="message" />
				</div>
			</s:if>
			
			<form class="form-horizontal" action="Login" method="post">
				<legend>用户登录</legend>
				<div class="control-group">
					<label class="control-label" for="username">用户名</label>
					<div class="controls">
						<input type="text" name="username" id="username" class="input-xlarge" placeholder="">
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="password">密码</label>
					<div class="controls">
						<input type="password" name="password" id="password" class="input-xlarge">
					</div>
				</div>
				<div class="form-actions">
					<button type="submit" class="btn btn-primary">登录</button>
				</div>
			</form>
		</div>
		<footer>
			<p>2013 @苏州</p>
		</footer>
	</div>
	
	<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="js/mustache.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
  </body>
</html>

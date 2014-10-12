<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="pojo.*,service.*" %>
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<jsp:useBean id="msgs" scope="session" class="service.MsgService" />

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
					<s:if test="#session['user']==null">
						<li><a href="login">登录</a></li>
						<li><a href="register">注册</a></li>
					</s:if>
					<s:if test="#session['user']!=null">
						<li><a href="Logout">退出</a></li>
					</s:if>
					</ul></div>
					<s:if test="#session['user']!=null">
					<ul id="user-links" class="nav pull-right">
						<div class="btn-group btn-mini pull-right">
							<button class="btn btn-warning"><i class="icon-user icon-white"></i><s:property value="#session['user'].realname" /></button>
							<button class="btn btn-warning dropdown-toggle" data-toggle="dropdown">
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="Logout">注销</a></li>
							</ul>
						</div>
					</ul>
					</s:if>
				</div>
			</div>
		</div>
		<!-- begging... -->
		<div class="container">
			<!-- 消息位置 -->
			<s:if test="message != null">
				<div class="alert alert-success">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<s:property value="message"/>
				</div>
			</s:if>
			<!-- 未登录不可见 -->
			<s:if test="#session['user']==null">
				<div class="hero-unit">
					<h1>欢迎来到留言系统</h1>
					<p>这是一个小型留言系统，快来说说最近都有哪些新鲜事吧</p>
					<a class="btn btn-primary btn-large" href="login">登录</a>
					<a class="btn btn-large" href="register">注册</a>
				</div>
			</s:if>
			<!-- 登录后可见 -->
			<s:if test="#session['user']!=null">
				<div class="hero-unit">
					<form method="post" action="new" class="well form-inline center" style="text-align:center;">
						<input type="text" class="span8" name="msgs" placeholder="最近有什么新鲜事？">
						<button type="submit" class="btn btn-success"><i class="icon-comment icon-white"></i>&nbsp;&nbsp;留言</button>
					</form>
				</div>
			</s:if>
			<div class="row">
			<%
			  	List<Msg> msgList = msgs.getAll();
			  	Iterator it = msgList.iterator();
			  	
			  	while(it.hasNext()) {
			  		Msg temp = (Msg) it.next();
			  		String realname = temp.getRealname();
			  		String content = temp.getContent();
			 %>
			 	<div class="span3 box-white">
					<h3><%= realname%> 说：</h3>
					<p><%= content%></p>
				</div>
			 
			 <%
			  	}
			 %>

					

				
				

			</div>


		</div>
	</div>
	
	<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="js/mustache.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
  </body>
</html>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp" %>
<%
	String reqmsg = (String)request.getAttribute("reqmsg");
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link href="<%=webroot%>/resources/common/css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=webroot%>/resources/system/css/login.css" rel="stylesheet" type="text/css" />
<link href="<%=webroot%>/resources/images/logo.png" rel="icon" type="image/png" sizes="16x16" >
<title>登录</title>
</head>
<body>
	<div id="hair">浪漫被岁月滴水穿石散落却从来都没发觉沉默的你呀 我们能懂得什么都不说如果这生命如同一段旅程总要走过后才完整谁不曾 疑过 等待过有过都值得多幸运有你为伴每个挫折纵流过眼泪又如何我想象 的未来 是有你怎么都不换 曾有的经过若我爱你的方式已不同开始不如我们变换下位置看一看原来它的样子我害怕那种坚持无声的休止浪漫被岁月滴水穿石散落却从来都没发觉沉默的你呀 我们能懂得</div>
	<div class="container">
		<div id="login-div">
			<form action="<%=webroot%>/user/login" method="post">
				<div id="tip"><%= reqmsg == null ? "&nbsp;" : reqmsg%></div><br>
				账号：<input id="email" type="text" name="email" placeholder="email"><br><br>
				密码：<input id="password" type="password" name="password" placeholder="password"><br><br>
				&emsp;&emsp;&emsp;<input type='submit' value="^o^起飞"><br><br>
				&emsp;&emsp;&emsp;<a class="a" href="user/register">还没有？注册一个咯-。-</a><br>
			</form>
		</div>
		<div id="login-ad"></div>
	</div>
	<div id="shoe">TWOBYTES V1.0~  最开始你只能记2字节数据  <br>
	</div>
</body>
</html>

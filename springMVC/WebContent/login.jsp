<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
		<form action="login" method="post">
		姓名：<input type="text" name="userName" />
		密码：<input type="password" name="pwd"/>
		<input type="submit" value="登录"/>
		</form>
</body>
</html>
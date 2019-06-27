<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh">
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>用户登录</title>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css">
	<link rel="stylesheet" type="text/css" href="css/login.css"/>
</head>
<body>
	<div class="htmleaf-container">

		<div class="demo form-bg" style="padding: 200px 0;">
		        <div class="container">
		            <div class="row">
		                <div class="col-md-offset-3 col-md-6">
		                    <form class="form-horizontal" action="user/login" method="post">
		                        <span class="heading">用户登录</span>
		                        <div class="form-group">
		                            <input type="text" class="form-control" id="inputEmail3" name="userName" placeholder="请输入用户名">
		                            <i class="fa fa-user"></i>
		                        </div>
		                        <div class="form-group help">
		                            <input type="password" class="form-control" id="inputPassword3" name="pwd" placeholder="请输入密码">
		                            <i class="fa fa-lock"></i>
		                            <a href="#" class="fa fa-question-circle"></a>
		                        </div>
		                        <div class="form-group">
		                            <div class="main-checkbox">
		                                <input type="checkbox" value="None" id="checkbox1" name="check"/>
		                                <label for="checkbox1"></label>
		                            </div>
		                            <span class="text">记住我</span>
		                            <button type="submit" class="btn btn btn-primary">登录</button>
		                            <a href="registere.jsp"><input type="button" class="btn btn btn-primary" name="registere" value="注册"></a>
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
	
	</div>
	
</body>
</html>
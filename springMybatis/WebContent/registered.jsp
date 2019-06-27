<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title></title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css">
  	<link rel="stylesheet" href="css/main.css">
	<script src="js/jquery-3.4.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
  </head>
  <body>
  	<div class="container container-small">
  	
		<form action="registereServlet.do"  method="post">
	      <div class="form-group">
	        <label>手机</label>
	        <input type="text" class="form-control">
	      </div>
	      <div class="form-group">
	        <label>验证码</label>
	        <div class="input-group">
	          <input type="text" class="form-control">
	          <div class="input-group-btn">
	            <div class="btn btn-default">获取验证码</div>
	          </div>
	        </div>
	      </div>
				<div class="form-group">
				  <label>昵称</label>
				  <input type="text" class="form-control" id="username" name="username">
				</div>
	      <div class="form-group">
	        <label>密码</label>
	        <input type="password" class="form-control" id="password" name="password">
	      </div>
	      <div class="form-group">
        <button class="btn btn-primary btn-block" type="submit">注册</button>
      </div>
     
		</form>
  
  </div>
  </body>
</html>

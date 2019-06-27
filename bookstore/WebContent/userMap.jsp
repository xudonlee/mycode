<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-3.4.1.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
	<style type="text/css">
		.top{
			position:absolute;
			 background-color:rgba(182, 136, 20, 0.42);
			 top:0px;
			 left:0px;
			 width:100%;
			 height:10%;
			 border: 1px solid;
			}
		#left{
		position:absolute;
		background-color:#dbdbdb;
			 top:10%;
			 left:0px;
			 width:10%;
			 height:100%;
			 border: 1px solid;
			 }
		.right{ 
			 position:absolute;
			 top:20%;
			 left:15%;
			 width:80%;
			 height:100%;
			 border: 1px solid;
		}
	</style>
  </head>
  <body>
  	<div class="par">
  		<div class="top" align="center">
	 		<h1>欢迎${loginUser.userName }登录&nbsp;&nbsp;<a href="userlogin.jsp" style="color: red;font-size: 16px; text-decoration: none;">退出系统</a></h1>
  		</div>
    	<div id="left" class="dropdown">
    	 <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">权限管理</button>
    		<div class="dropdown-menu">
    			<c:forEach items="${loginUser.role.powers }" var="p">
    				<a class="dropdown-item" href="${p.url }" target="right">${p.powerName }</a><p>
    			</c:forEach>
    		</div>
    	</div>
    	<div class="right">
    		<iframe name="right"  frameborder="0"  height="100%" width="100%">
    		</iframe>
    	</div>
    </div>
  </body>
</html>

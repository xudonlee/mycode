<%@page import="com.itzl.pojo.FenYe"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itzl.pojo.Query"%>
<%@page import="com.itzl.pojo.News"%>

<%@page import="com.itzl.dao.NewsDao"%>
<%@page import="com.itzl.pojo.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>今日新闻</title>
   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="<%=basePath%>/ckeditor/ckeditor.js"></script>
  	<script type="text/javascript" src="<%=basePath%>/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript">
	
	
	function allSelect(check_v, checkname)
    {
    var v_item = document.getElementsByName(check_v);
    var items = document.getElementsByName(checkname);
    for (var i = 0; i < items.length; ++i)
    {
        if (v_item[0].checked)
        {
            items[i].checked = true;
        }
        else
        {
            items[i].checked = false;
        }
    }
}

function singleSelect(check_v, checkname)
    {
    var v_item = document.getElementsByName(check_v);
    var items = document.getElementsByName(checkname);
    var childStatus = true;
    for (var i = 0; i < items.length; ++i)
    {
        childStatus = (childStatus && items[i].checked);
    }
    if (childStatus)
    {
        v_item[0].checked = true;
    }
    else
    {
        v_item[0].checked = false;
    }
}
	
	
	
	</script>
  </head>
  <body>
  		<!-- 新闻页面 -->
  		<div align="center">
  		
  		
  				<form action="newsListServlet.do" method="get">
  				新闻标题:<input type="text" id="news_title" name="qNewsTitle" value="${fy.query.qNewsTitle}"/>
  				开始时间:<input type="text" id="news_date" name="qNewsDateStart" onclick="WdatePicker()" class="Wdate" readonly="readonly" value="<fmt:formatDate value='${fy.query.qNewsDateStart }' pattern='yyyy-MM-dd'/>"/>
  				结束时间:<input type="text" id="news_date" name="qNewsDateEnd" onclick="WdatePicker()" class="Wdate" readonly="readonly" value="<fmt:formatDate value='${fy.query.qNewsDateEnd }' pattern='yyyy-MM-dd'/>"/>
  					<input type="submit" value="搜索"/><p>
				</form>
  			
  			<form action="deleteNewsServlet.do" method="post" onsubmit="return confirm('是否全部删除')">
  				<table align="center" border="1px" bordercolor="black" cellspacing="0px">
  					<tr  align="center">
  						<td><input type="checkbox"  value="yes" name="checkbox_v" onclick="allSelect('checkbox_v', 'checkbox1')"/>全选</td>
  						<td>新闻编号</td>
  						<td>新闻标题</td>
  						<td>新闻内容</td>
  						<td>新闻作者</td>
  						<td>新闻日期</td>
  						<td>新闻图片</td>
  						<td>删除新闻</td>
  						<td>修改新闻</td>
  					</tr>
  					<c:forEach items="${news}" var="n">
  					<tr align="center">
						<td><input type="checkbox"  value="${n.id }" name="checkbox1" onclick="singleSelect('checkbox_v', 'checkbox1')"/></td>
						<td>${n.newId }</td>
						<td>${n.newTitle }</td>
						<td>${n.newContext }</td>
						<td>${n.newEditor }</td>
						<td><fmt:formatDate value='${n.newDate }' pattern='yyyy-MM-dd'/></td>
						<td>${n.newPic }</td>
						<td><a href="deleteNewsServlet.do?checkbox1=${n.id }" onclick="return confirm('是否确定删除')">删除</a></td>
						<td><a href="returnUpdateNewsServlet.do?ids=${n.id }">修改</a></td>
					</tr>
  				</c:forEach>
  					
  					
  				</table>
  				<p>
  				<input type="submit" value="全部删除"/>
  				<a href="addNews.jsp"><input type="button" value="添加新闻"/></a><p>
  				
  				<c:url var="newsPath" value="newsListServlet.do?">
  					<c:param name="qNewsTitle" value="${fy.query.qNewsTitle }"></c:param>
  					<c:param name="qNewsDateStart">
  						<fmt:formatDate value="${fy.query.qNewsDateStart }" pattern='yyyy-MM-dd'/>
  					
  					</c:param>
  					<c:param name="qNewsDateEnd">
  						<fmt:formatDate value="${fy.query.qNewsDateEnd }" pattern='yyyy-MM-dd'/>
  					</c:param>
  				</c:url>
  				
  				
  				<a href="${newsPath }&pg=1">首页</a>
  				
  				<c:choose>
  					<c:when test="${fy.page==1 }">上一页</c:when>
  					<c:otherwise>
  						<a href="${newsPath }&pg=${fy.page-1}">上一页</a>
  					</c:otherwise>
  				</c:choose>
  				
  				<c:choose>
  					<c:when test="${fy.page>=fy.pageCount }">下一页</c:when>
  					<c:otherwise>
  						<a href="${newsPath }&pg=${fy.page+1}">下一页</a>
  					</c:otherwise>
  				</c:choose>
  				
  				
  				
  				<a href="${newsPath }&pg=${fy.pageCount}">尾页</a>
  				
  				当前第${fy.page }页,一共${fy.pageCount }页
  			</form>
  		</div>	
  	
  		
  </body>
</html>

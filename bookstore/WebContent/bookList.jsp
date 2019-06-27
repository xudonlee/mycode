<%@page import="com.itzl.pojo.FenYe"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itzl.pojo.Query"%>
<%@page import="com.itzl.pojo.Books"%>

<%@page import="com.itzl.dao.BooksDao"%>
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
	 <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-3.4.1.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
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
function del(obj){
	var flag=confirm('是否确定删除这本书??');
	if(!flag){
		return false;
	}
	$("#f2").attr("method","post");
	$("#f2").attr("action","book");
	$("#heiddenIds").val(obj.value);
	//设置_method对应的value值
	$("#_method").val("delete");
	//提交表单
	$("#f2").submit();
}
function allDel(){
	var flag=confirm('是否确定全部删除??');
	if(!flag){
		return false;
	}
	$("#heiddenIds").remove();
	$("#f2").attr("method","post");
	$("#_method").val("delete");
	$("#f2").attr("action","book");
	$("#f2").submit();
}
function upd(obj){
	$("#_method").remove();
	$("#f2").attr("method","get");
	$("#f2").attr("action","book/"+obj.value);
	$("#f2").submit();
}
	

	
	</script>
  </head>
  <body>
  		<!-- 新闻页面 -->
  		<div align="center">
  				<form id="f1" action="book" method="get">
  				书名:<input type="text"  name="qbookName" value="${fenYe.query.qbookName}"/>
  				<select id="st" name="query.qbookType">
  					<option value="">请选择</option>
  					<c:forEach items="${bts}" var="b">
					  <option value="${b.typeId }">${b.typeName }</option>
					 </c:forEach>
				</select>
  				开始时间:<input type="text"  name="qbookDayStrat" onclick="WdatePicker()" class="Wdate" readonly="readonly" value="<fmt:formatDate value='${fenYe.query.qbookDayStrat }' pattern='yyyy-MM-dd'/>"/>
  				结束时间:<input type="text"  name="qbookDayEnd" onclick="WdatePicker()" class="Wdate" readonly="readonly" value="<fmt:formatDate value='${fenYe.query.qbookDayEnd }' pattern='yyyy-MM-dd'/>"/>
  					<input type="submit" value="搜索"/><p>
				</form>
				
				
				
  		
  			<form id="f2" action="book" method="post">
  				<input type="hidden" id="_method" name="_method" value="delete"/>
  				<input type="hidden" name="ids" id="heiddenIds">
  				<table class="table table-striped table-dark">
  				 <thead>
  					<tr>
  						<th scope="col"><input type="checkbox"  value="yes" name="checkbox_v" onclick="allSelect('checkbox_v', 'checkbox1')"/>全选</th>
  						<th scope="col">图书编码</th>
  						<th scope="col">图书名字</th>
  						<th scope="col">图书作者</th>
  						<th scope="col">出版社</th>
  						<th scope="col">出版日期</th>
  						<th scope="col">图书类型</th>
  						<th scope="col">图书库存</th>
  						<th scope="col">删除图书</th>
  						<th scope="col">修改图书</th>
  					</tr>
  				</thead>
  					<c:forEach items="${books}" var="n">
  				<tbody>
  					<tr align="center">
						<th scope="row"><input type="checkbox"  value="${n.bookId }" name="checkbox1" onclick="singleSelect('checkbox_v', 'checkbox1')"/></th>
						<td>${n.bookId}</td>
						<td>${n.bookName }</td>
						<td>${n.bookAuthor }</td>
						<td>${n.bookPress }</td>
						<td><fmt:formatDate value='${n.bookDay }' pattern='yyyy-MM-dd'/></td>
						<td>${n.bt.typeName }</td>
						<td>${n.bookStock }</td>
						<td><button type="button" class="btn btn-dark" value="${n.bookId}" onclick="return del(this)">删除</button></td>
						<td><button type="button" class="btn btn-dark" value="${n.bookId }" onclick="upd(this)">修改</button></td>
					</tr>
				</tbody>
  				</c:forEach>
  					
  					
  				</table>
  				<p>
  				<button type="button" class="btn btn-primary" onclick="return allDel()">全部删除</button>
  				<a href="book/toAddBook"><button type="button" class="btn btn-primary">添加图书</button></a><p>
  				
  				<c:url var="newsPath" value="book">
  					<c:param name="query.qbookName" value="${fenYe.query.qbookName }"></c:param>
  					<c:param name="query.qbookType" value="${fenYe.query.qbookType }"></c:param>
  					<c:param name="query.qbookDayStrat">
  						<fmt:formatDate value="${fenYe.query.qbookDayStrat }" pattern='yyyy-MM-dd'/>
  					
  					</c:param>
  					<c:param name="query.qbookDayEnd">
  						<fmt:formatDate value="${fenYe.query.qbookDayEnd }" pattern='yyyy-MM-dd'/>
  					</c:param>
  				</c:url>
  				
  				
  				<a href="${newsPath }&pg=1">首页</a>
  				
  				<c:choose>
  					<c:when test="${fenYe.page==1 }">上一页</c:when>
  					<c:otherwise>
  						<a href="${newsPath }&pg=${fenYe.page-1}">上一页</a>
  					</c:otherwise>
  				</c:choose>
  				
  				<c:choose>
  					<c:when test="${fenYe.page>=fenYe.pageCount }">下一页</c:when>
  					<c:otherwise>
  						<a href="${newsPath }&pg=${fenYe.page+1}">下一页</a>
  					</c:otherwise>
  				</c:choose>
  				
  				
  				
  				<a href="${newsPath }&pg=${fenYe.pageCount}">尾页</a>
  				
  				当前第${fenYe.page }页,一共${fenYe.pageCount }页
  			</form>
  		</div>	
  	
  		
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
  <head>
    <title>top</title>
    <!-- Bootstrap -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	
	<style type="text/css">
		*{
			padding: 0px;
			margin: 0px;
		}
		body {
			background: #4682B4;
			color:#fff;
		}
	</style>
  </head>
  
  <body>
	<div id="main">
		<div style="text-align: center; font-size: 30px; width: 200px; float: left; padding-left: 3px; padding-top: 12px">网上图书商城</div>
		<div style="font-size: 10pt; text-align: right; padding-right: 12px; padding-top: 16px" class="content">
				<c:choose>
					<c:when test="${!empty sessionScope.correctUser}">
						<button type="button" class="btn btn-info">您好：${sessionScope.correctUser.username}</button>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a class="btn btn-warning" role="button" href="<c:url value='/jsps/cart/list.jsp'/>" target="body">
							<span class="glyphicon glyphicon-shopping-cart"></span> 我的购物车</a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a class="btn btn-success" role="button" href="<c:url value='/OrderServlet?method=myOrders'/>" target="body">
							<span class="glyphicon glyphicon-list-alt"></span> 我的订单</a>&nbsp;&nbsp;|&nbsp;&nbsp;
						<a class="btn btn-danger" role="button" href="<c:url value='/UserServlet?method=quit'/>" target="_parent">
							<span class="glyphicon glyphicon-log-out"></span> 退出</a>
					</c:when>
					
					<c:otherwise>
						<a class="btn btn-success" role="button" href="<c:url value='/jsps/user/login.jsp'/>" target="_parent">
							<span class="glyphicon glyphicon-log-in"></span> 登录</a> |&nbsp;
						<a class="btn btn-warning" role="button" href="<c:url value='/jsps/user/regist.jsp'/>" target="_parent">
							<span class="glyphicon glyphicon-tasks"></span> 注册</a>
					</c:otherwise>
				</c:choose>
		</div>
	</div>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
  <head>
    <title>top</title>
    <base target="body"/>
    <!-- Bootstrap -->
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
	
	<style type="text/css">
		*{
			font-size:10pt;
			text-align: center;
		}
		div {
			margin: 3px; 
			padding: 3px;
		}
		a {
			text-decoration: none;
		}
	</style>
  </head>
  
  <body>
	<div style="padding-top: 10px">
		<a class="btn btn-primary" role="button" href="<c:url value='/BookServlet?method=findAll'/>">
						<span class="glyphicon glyphicon-tags"></span> 全部分类</a>
	</div>
	
	<c:forEach items="${categoryList}" var="category">
		<div>
			<c:choose>
				<c:when test="${category.item%4 eq 3}">
					<a class="btn btn-danger" role="button" href="<c:url value='/BookServlet?method=findByCategory&cid=${category.cid}'/>">
						<span class="glyphicon glyphicon-tag"></span> ${category.cname}</a>
				</c:when>
				<c:when test="${category.item%4 eq 1}">
					<a class="btn btn-success" role="button" href="<c:url value='/BookServlet?method=findByCategory&cid=${category.cid}'/>">
						<span class="glyphicon glyphicon-tag"></span> ${category.cname}</a>
				</c:when>
				<c:when test="${category.item%4 eq 2}">
					<a class="btn btn-info" role="button" href="<c:url value='/BookServlet?method=findByCategory&cid=${category.cid}'/>">
						<span class="glyphicon glyphicon-tag"></span> ${category.cname}</a>
				</c:when>
				<c:when test="${category.item%4 eq 0}">
					<a class="btn btn-warning" role="button" href="<c:url value='/BookServlet?method=findByCategory&cid=${category.cid}'/>">
						<span class="glyphicon glyphicon-tag"></span> ${category.cname}</a>
				</c:when>
			</c:choose>
		</div>
	</c:forEach>
  </body>
</html>

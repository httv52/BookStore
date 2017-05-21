<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<!-- Bootstrap -->
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
	
	<style type="text/css">
		td{
			padding: 7px;
		}
	</style>
</head>
  
  <body>
    <div style="padding: 10px 40px;">
    <div  style="padding: 0px 50px;">
    	<c:choose>
    		<c:when test="${msgCode eq 1}">
    			<div class="alert alert-success alert-dismissible" role="alert" >
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <strong>信息提示：</strong>${msg }
				</div>
    		</c:when>
    		<c:when test="${msgCode eq 2}">
    			<div class="alert alert-danger alert-dismissible" role="alert" >
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <strong>错误提示：</strong>${msg }
				</div>
    		</c:when>
    	</c:choose>
	</div>
    <h2 style="text-align: center;">分类列表</h2>
		<table align="center" class="table table-bordered table-hover">
			<tr id="th" bordercolor="rgb(78,78,78)">
				<th>分类名称</th>
				<th style="vertical-align: middle; align:center;">操作</th>
			</tr>
			
			<c:forEach items="${categoryList}" var="categoryList">
				<tr bordercolor="rgb(78,78,78)">
					<td align="left" style="vertical-align: middle;">${categoryList.cname}</td>
					<td align="center" style="vertical-align: middle;">
						<a class="btn btn-success btn-sm" role="buttton" href="<c:url value='/admin/AdminCategoryServlet?method=editPre&cid=${categoryList.cid }'/>">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"> 编辑</span></a>　　
						<a class="btn btn-danger btn-sm"  role="buttton" onclick="return confirm('是否删除 ${categoryList.cname} 分类')" 
							href="<c:url value='/admin/AdminCategoryServlet?method=deleteCategory&cid=${categoryList.cid }'/>">
							<span class="glyphicon glyphicon-trash" aria-hidden="true"> 删除</span></a>
					</td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
	
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
  </body>
</html>

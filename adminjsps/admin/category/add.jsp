<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<!-- Bootstrap -->
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
  </head>
  
  <body>
    <div style="padding: 20px 0px">
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
    	<div style="text-align: center; "><h1>添加分类</h1></div>
    </div>
    
    <form action="<c:url value='/admin/AdminCategoryServlet?method=addCategory'/>" method="post" class="form-horizontal" role="form">
		<div class="form-group">
			<label class="col-sm-2 control-label">分类名称</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" placeholder="分类名称" name="cname"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input class="btn btn-success" type="submit" value="添加分类"/>
			</div>
		</div>
    </form>
    
    
    
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
  </body>
</html>

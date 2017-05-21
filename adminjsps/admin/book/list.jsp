<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书列表</title>
<!-- Bootstrap -->
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

<style type="text/css">
body {
	font-size: 10pt;
}

.col-sm-2 {
	width: 20%;
	padding-top: 7px;
	padding-left: 10px;
	padding-right: 0px;
}

.thumbnail {
	text-align: center;
	height: 360px;
	padding-top: 20px;
	padding-left: 10px;
}

img {
	border: 1px solid #cccccc;
	border-radius: 8px;
	/*阴影抬升*/
	box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.5);
	/*凹陷文本*/
	text-shadow: -1px 0 0 rgba(0, 0, 0, 0.3), 0 -1px 0 rgba(0, 0, 0, 0.3),
		0px 1px 0 rgba(255, 255, 255, 0.5), -1px -1px 0 rgba(25., 151, 3, 0.5);
}

.m-sidebar {
	position: fixed;
	top: 0;
	right: 0;
	background: #000;
	z-index: 2000;
	width: 35px;
	height: 100%;
	font-size: 12px;
	color: #fff;
}

.row{
 padding-right: 20px;
} 
</style>

</head>

<body>

	<div class="mian" style="height:100vh;overflow:auto">
		<div  style="padding: 10px 50px 0px 50px;">
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
		
		<div class="row">
			<c:forEach items="${booklist}" var="books">
				<div class="col-sm-2 box">
					<div class="thumbnail">
						<a
							href="<c:url value='/admin/AdminBookServlet?method=editPre&bid=${books.bid}'/>">
							<img src="<c:url value='/${books.image}'/>" alt="${books.bname}" style="height: 152px">
						</a>
						<div class="caption">
							<a
								href="<c:url value='/admin/AdminBookServlet?method=editPre&bid=${books.bid}'/>"><h5>${books.bname}</h5></a>
							<p>作者：${books.author}</p>
							<p>分类：${books.category.cname}</p>
							<p>单价：￥${books.price}</p>
							<p>
								<a
									href="<c:url value='/admin/AdminBookServlet?method=editPre&bid=${books.bid}'/>"
									class="btn btn-default" role="button"><span
									class="glyphicon glyphicon-send"> 详情</span></a>
								<!--  -->
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
</body>

</html>


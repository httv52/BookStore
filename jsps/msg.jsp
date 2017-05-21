<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<!-- Bootstrap -->
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

</head>

<body>
	<div style="padding: 20px 100px;">
		<c:choose>
			<c:when test="${msgCode eq 1}">
				<div class="alert alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>信息提示：</strong>${msg }
				</div>
			</c:when>
			<c:when test="${msgCode eq 2}">
				<div class="alert alert-danger alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>错误提示：</strong>${msg }
				</div>
			</c:when>
		</c:choose>
	</div>
	<ul>
		<li><a href="<c:url value='/index.jsp'/>">主页</a></li>
		<li><a href="<c:url value='/jsps/user/login.jsp'/>">登录</a></li>
		<li><a href="<c:url value='/jsps/user/regist.jsp'/>">注册·</a></li>
	</ul>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
</body>
</html>

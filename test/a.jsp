<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>a.html</title>
<meta charset="utf-8">

<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

<style type="text/css">
.demo{
	height: 100%;
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

.cart {
	color: #fff;
	text-align: center;
	line-height: 20px;
	padding: 200px 0 0 0px;
}

.cart span {
	display: block;
	width: 20px;
	margin: 0 auto;
}

.cart i {
	width: 35px;
	height: 35px;
	display: block;
	background: url(car.png) no-repeat;
}

#msg {
	position: fixed;
	top: 300px;
	right: 35px;
	z-index: 10000;
	width: 1px;
	height: 52px;
	line-height: 52px;
	font-size: 20px;
	text-align: center;
	color: #fff;
	background: #360;
	display: none
}

.u-flyer {
	display: block;
	width: 50px;
	height: 50px;
	border-radius: 50px;
	position: fixed;
	z-index: 9999;
}
</style>

</head>

<body>
	<div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">Panel title</h3>
      </div>
      <div class="panel-body">
        Panel content
      </div>
    </div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
</body>
</html>

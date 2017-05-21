<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>图书详情</title>
	<!-- Bootstrap -->
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
	
	<style type="text/css">
		body {
			font-size: 10pt;
		}
		.thumbnail{
			text-align:center;
			margin-top:20px;
			padding-top: 20px;
			height: 490px;	
		}
		a {
			background: url(<c:url value='/images/all.png'/>) no-repeat;
			display: inline-block;
			
			background-position: 0 -70px;
			margin-left: 30px;
			height: 36px;
			width: 146px;
		}
		a:HOVER {
			background: url(<c:url value='/images/all.png'/>) no-repeat;
			display: inline-block;
			
			background-position: 0 -106px;
			margin-left: 30px;
			height: 36px;
			width: 146px;
		}
		.input-group{
			padding-bottom: 10px;
		}
		img,#img {
			border: 1px solid #cccccc;
			border-radius: 10px;
			/*阴影抬升*/
			box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.5);
			/*凹陷文本*/
			text-shadow: -1px 0 0 rgba(0, 0, 0, 0.3), 0 -1px 0 rgba(0, 0, 0, 0.3),
				0px 1px 0 rgba(255, 255, 255, 0.5), -1px -1px 0 rgba(25., 151, 3, 0.5);
		}
	</style>
	
	<%-- <script type="text/javascript" src="<c:url value='/jquery/jquery.js'/>"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$(".addcar").click(function(){
				$("#msg").show().animate({width: '250px'}, 200).fadeOut(1000);
			});
		});
	</script> --%>
	
  </head>
  
  <body>
	<div class="col-md-4 col-md-offset-4" class="divbox">
		<div class="thumbnail" id="img">
			<img src="<c:url value='/${book.image}'/>" alt="${book.bname}"
				width="50%">
			<div class="caption">
				<p>书名：${book.bname}</p>
				<p>作者：${book.author}</p>
				<p>分类：${book.category.cname}</p>
				<p>单价：￥${book.price}</p>
				<form id="form" action="<c:url value='/CartServlet'/>" method="post">
					<input type="hidden" name="method" value="add" /> <input
						type="hidden" name="bid" value="${book.bid}" />

					<div class="input-group">
						<input type="number" size="3" name="count" value="1"
							class="form-control" placeholder="购买本数"> <span
							class="input-group-addon">本</span>
					</div>
				</form>
				<a href="javascript:document.getElementById('form').submit();" class="addcar"></a>
			</div>
		</div>
	</div>
</body>
</html>

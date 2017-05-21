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
	height: 350px;
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
	background: url(<c:url value='/images/car.png'/>) no-repeat;
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
.row{
 padding-right: 40px;
}
</style>

<script type="text/javascript"
	src="<c:url value='/ajax_util/ajaxUtil.js'/>"></script>

<script type="text/javascript" src="<c:url value='/jquery/jquery.js'/>"></script>

<script src="<c:url value='/jquery/jquery.fly.min.js'/>"></script>
<!--[if lte IE 9]>
	<script src="requestAnimationFrame.js"></script>
	<![endif]-->
<script>
	$(function() {
		var offset = $("#end").offset();
		$(".addcar").click(function(event) {
			var addcar = $(this);
			var img = addcar.parent().parent().prev().find('img').attr('src');
			var flyer = $('<img class="u-flyer" src="' + img + '">');
			flyer.fly({
				start : {
					left : event.pageX-40,
					top : event.pageY
				},
				end : {
					left : offset.left + 10,
					top : offset.top + 10,
					width : 0,
					height : 0
				},
				onEnd : function() {
					$("#msg").show().animate({
						width : '340px'
					}, 200).fadeOut(1000);
				}
			});
		});

	});
</script>

<script type="text/javascript">
	function js_method(bid,bname) {
		ajax(
			{
				url : "<c:url value='/CartServlet?method=buyBook&bid=" + bid + "'/>",
				type : "text",
				callback : function(data) {
					document.getElementById("msg").innerHTML = "成功购买《"+bname+"》";
				}
			}
		);
	}
</script>

</head>

<body>

	<div class="mian" style="height:100vh;overflow:auto">
		<div class="row">
			<c:forEach items="${booklist}" var="books">
				<div class="col-sm-2 box">
					<div class="thumbnail">
						<a
							href="<c:url value='/BookServlet?method=findBookById&bid=${books.bid}'/>">
							<img src="<c:url value='/${books.image}'/>" alt="${books.bname}" style="height: 152px;">
						</a>
						<div class="caption">
							<a
								href="<c:url value='/BookServlet?method=findBookById&bid=${books.bid}'/>"><h5>${books.bname}</h5></a>
							<p>作者：${books.author}</p>
							<p>分类：${books.category.cname}</p>
							<p>单价：￥${books.price}</p>
							<p>
								<a
									href="<c:url value='/BookServlet?method=findBookById&bid=${books.bid}'/>"
									class="btn btn-default" role="button"><span
									class="glyphicon glyphicon-send"> 详情</span></a>&ensp; 
								<a ahref="javascript:void(0);" onclick='js_method("${books.bid}","${books.bname}")'
									class="btn btn-default addcar" role="button"><span
									class="glyphicon glyphicon-flag"> 购买</span></a>
								<!--  -->
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</div>

		<div class="m-sidebar">
			<a href="<c:url value='/jsps/cart/list.jsp'/>"><div class="cart">
				<i id="end"></i><span>购物车</span>
			</div></a>
		</div>
		<div id="msg"></div>

	</div>
</body>

</html>


<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>
<!-- Bootstrap -->
<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">

<style type="text/css">
* {
	font-size: 11pt;
}

li {
	margin: 10px;
}

#buy {
	background: url(< c : url value = '/images/all.png'/ >) no-repeat;
	display: inline-block;
	background-position: 0 -902px;
	margin-left: 30px;
	height: 36px;
	width: 146px;
}

#buy:HOVER {
	background: url(< c : url value = '/images/all.png'/ >) no-repeat;
	display: inline-block;
	background-position: 0 -938px;
	margin-left: 30px;
	height: 36px;
	width: 146px;
}

img {
	border: 1px solid #cccccc;
	border-radius: 4px;
	/*阴影抬升*/
	box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.5);
	/*凹陷文本*/
	text-shadow: -1px 0 0 rgba(0, 0, 0, 0.3), 0 -1px 0 rgba(0, 0, 0, 0.3),
		0px 1px 0 rgba(255, 255, 255, 0.5), -1px -1px 0 rgba(25., 151, 3, 0.5);
}
</style>
</head>

<body>
	<h1>&nbsp;我的订单</h1>

	<table border="1" width="100%" cellspacing="0" background="black"
		class="table table-bordered">

		<!-- 遍历订单 -->
		<c:forEach items="${orderlist}" var="orders">
			<tr class="active">
				<td colspan="6">订单编号：${orders.oid }　　成交时间：${orders.ordertime }　　
				金额： <span class="badge"><b>${orders.total }</b></span>　　　　　　
					<c:choose>
						<c:when test="${orders.state eq 1}">
							<a href="<c:url value='/OrderServlet?method=loadOrder&oid=${orders.oid}'/>" class="btn btn-warning btn-sm" role="button">
								<span class="glyphicon glyphicon-paperclip"> 点击付款</span></a></c:when>
						<c:when test="${orders.state eq 2}">
							<button type="button" class="btn btn-info btn-sm " disabled="disabled">
								<span class="glyphicon glyphicon-leaf"> 待发货</span></button></c:when>
						<c:when test="${orders.state eq 3}">
							<a href="<c:url value='/OrderServlet?method=updateOrderState&oid=${orders.oid}'/>" class="btn btn-primary btn-sm" role="button">
								<span class="glyphicon glyphicon-gift"> 确认收货</span></a></c:when>
						<c:when test="${orders.state eq 4}">
							<button type="button" class="btn btn-success btn-sm" disabled="disabled">
								<span class="glyphicon glyphicon-flag"> 交易成功</span></button></c:when>
					</c:choose>
				</td>
			</tr>

			<!-- 遍历订单项 -->
			<c:forEach items="${orders.orderItems}" var="orderitem">
				<tr align="center">
					<td width="20%">
							<div>
								<img src="<c:url value='/${orderitem.book.image }'/>" height="75" />
							</div>
					</td>
					<td align="center" style="vertical-align: middle;">书名：${orderitem.book.bname }</td>
					<td align="center" style="vertical-align: middle;">单价：${orderitem.book.price }元</td>
					<td align="center" style="vertical-align: middle;">作者：${orderitem.book.author }</td>
					<td align="center" style="vertical-align: middle;">数量：${orderitem.count }</td>
					<td align="center" style="vertical-align: middle;">小计：${orderitem.subtotal }元</td>
				</tr>
			</c:forEach>
			
		</c:forEach>
	</table>
	
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
</body>
</html>

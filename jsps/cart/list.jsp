<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
		
		#buy {
			background: url(<c:url value='/images/all.png'/>) no-repeat;
			display: inline-block;
			background-position: 0 -902px;
			margin-left: 30px;
			height: 36px;
			width: 146px;
		}
		
		#buy:HOVER {
			background: url(<c:url value='/images/all.png'/>) no-repeat;
			display: inline-block;
			background-position: 0 -938px;
			margin-left: 30px;
			height: 36px;
			width: 146px;
		}
		
		#img {
			border: 1px solid #cccccc;
			border-radius: 8px;
			/*阴影抬升*/
			box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.5);
			/*凹陷文本*/
			text-shadow: -1px 0 0 rgba(0, 0, 0, 0.3), 0 -1px 0 rgba(0, 0, 0, 0.3),
				0px 1px 0 rgba(255, 255, 255, 0.5), -1px -1px 0 rgba(25., 151, 3, 0.5);
		}
	</style>
</head>
  
  <body>
	<c:choose>
		<%-- 如果没有车，或车的内容集合为0长 --%>
		<c:when test="${empty sessionScope.cart or fn:length(sessionScope.cart.cartItems) eq 0}">
			<div style="width:400px; margin: 0 auto;">
				<a href="<c:url value='/BookServlet?method=findAll' />"><h2>购物车为空,返回商品列表</h2></a>
				<img src="<c:url value='/images/cart.png'/>" width="300"/>
			</div>
		</c:when>
		
		<c:otherwise>
			<h1>购物车</h1>
		
			<table border="1" width="100%" cellspacing="0" background="black" class="table table-bordered table-hover">
				<tr>
					<td colspan="7" align="right" style="font-size: 15pt; font-weight: 900" class="warning">
						<a class="btn btn-danger" role="button" href="<c:url value='/CartServlet?method=clear' />">
							<span class="glyphicon glyphicon-off"> 清空购物车</span></a>
					</td>
				</tr>
				<tr>
					<th width="30%">图片</th>
					<th width="15%">书名</th>
					<th align="center">作者</th>
					<th align="center">单价</th>
					<th align="center">数量</th>
					<th align="center">小计</th>
					<th align="center" width="10%">操作</th>
				</tr>
				<c:forEach items="${sessionScope.cart.cartItems}" var="cartItem">
					<tr>
						<td align="center" style="vertical-align: middle;"><div><img id="img" width="71px" src="<c:url value='/${cartItem.book.image}'/>"/></div></td>
						<td align="center" style="vertical-align: middle;">${cartItem.book.bname}</td>
						<td align="center" style="vertical-align: middle;">${cartItem.book.author}</td>
						<td align="center" style="vertical-align: middle;">${cartItem.book.price}元</td>
						<td align="center" style="vertical-align: middle;">${cartItem.count}</td>
						<td align="center" style="vertical-align: middle;">${cartItem.subtotal}元</td>
						<td align="center" style="vertical-align: middle;"><a class="btn btn-danger" role="button" href="<c:url value='/CartServlet?method=delete&bid=${cartItem.book.bid}' />">
							<span class="glyphicon glyphicon-trash"> 删除</span></a></td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="7" align="right" style="font-size: 15pt; font-weight: 900" class="info">
						合计：${sessionScope.cart.total }元
					</td>
				</tr>
				<tr>
					<td colspan="7" align="right" style="font-size: 15pt; font-weight: 900">
						<a id="buy" href="<c:url value='/OrderServlet?method=addOrder'/>"></a>
					</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
  </body>
</html>

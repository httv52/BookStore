<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		/* .img {
			border: solid 2px gray;
			width: 75px;
			height: 75px;
			text-align: center;
		} */
		li {
			margin: 10px;
		}
		#addr,#addr2{
			padding: 0px;
			margin: 0px 20px;
		}
		#offset,#offset2{
			padding-left: 55px;
			
		}
		.col-sm-3,#addr2{
			padding-top: 10px
		}
		
		#pay {
			background: url(<c:url value='/images/all.png'/>) no-repeat;
			display: inline-block;
			
			background-position: 0 -412px;
			margin-left: 30px;
			height: 36px;
			width: 146px;
		}
		#pay:HOVER {
			background: url(<c:url value='/images/all.png'/>) no-repeat;
			display: inline-block;
			
			background-position: 0 -448px;
			margin-left: 30px;
			height: 36px;
			width: 146px;
		}
		#img_pic {
			border: 1px solid #cccccc;
			border-radius: 8px;
			/*阴影抬升*/
			box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.5);
			/*凹陷文本*/
			text-shadow: -1px 0 0 rgba(0, 0, 0, 0.3), 0 -1px 0 rgba(0, 0, 0, 0.3),
				0px 1px 0 rgba(255, 255, 255, 0.5), -1px -1px 0 rgba(25., 151, 3, 0.5);
		}
	</style>
  
  	<script type="text/javascript" src="<c:url value='/ajax_util/ajaxUtil.js'/>"></script>
  	
	<script type="text/javascript">
		window.onload = function() {
			var pro = document.getElementById("p");
			var citySelect = document.getElementById("c");
			var address = document.getElementById("address");
			var province_name;
			var city_name;
			var text;
			/*
				1. 获取省
				*/
			ajax(
				{
					url : "<c:url value='/ProvinceServlet'/>",
					type : "json",
					callback : function(data) {
						var provinces = data;
						for (var i = 0; i < provinces.length; i++) {
							var province = provinces[i];
							var op = document.createElement("option"); //创建一个指名名称元素
							op.value = province.pid;
							var textNode = document.createTextNode(province.name); //创建文本节点
							op.appendChild(textNode); //把文本子节点添加到op元素中，指定其显示值
							pro.appendChild(op);
						}
					}
				}
			);////获取省份结束
	
			/*
			2.获取城市
			*/
			pro.onchange = function() {
				province_name = pro.options[pro.value].text + " ";
				text = province_name;
				address.value = text;
				ajax(
					{
						url : "<c:url value='/CityServlet'/>",
						method : "POST",
						params : "pid=" + pro.value,
						type : "json",
						callback : function(data) {
							/*
							把select中的所有option移除（除了请选择）
							*/
							// 获取其所有子元素
							var optionEleList = citySelect.getElementsByTagName("option");
							// 循环遍历每个option元素，然后在citySelect中移除
							while (optionEleList.length > 1) { //子元素的个数如果大于1就循环，等于1就不循环了！
								citySelect.removeChild(optionEleList[1]); //总是删除1下标，因为1删除了，2就变成1了！
							}
	
							var cities = data;
							for (var i = 0; i < cities.length; i++) {
								var city = cities[i];
								var op = document.createElement("option"); //创建一个指名名称元素
								op.value = city.name;
								var textNode = document.createTextNode(city.name); //创建文本节点
								op.appendChild(textNode); //把文本子节点添加到op元素中，指定其显示值
	
								citySelect.appendChild(op);
							}
						}
					}
				);
			}//获取城市结束
	
	
			citySelect.onchange = function() {
				text = province_name + citySelect.value + " ";
				address.value = text;
			}
		}
	</script>
</head>
  
  <body>
	<h1>当前订单</h1>

	<table border="1" width="100%" cellspacing="0" background="black"
		class="table table-bordered">
		<tr class="active">
			<td colspan="6">订单编号：${order.oid }　　
				下单时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.ordertime }"/>　　
					金额： <span class="badge"><b>${order.total }</b></span>
			</td>
		</tr>

		<c:forEach items="${order.orderItems }" var="orderitem">
			<tr align="center">
				<td width="15%">
					<div id="img">
						<img id="img_pic" src="<c:url value='/${orderitem.book.image }'/>" height="75" />
					</div>
				</td>
				<td style="vertical-align: middle;">书名：${orderitem.book.bname }</td>
				<td>单价：${orderitem.book.price }元</td>
				<td>作者：${orderitem.book.author }</td>
				<td>数量：${orderitem.count }</td>
				<td>小计：${orderitem.subtotal }元</td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<form method="post" action="javascript:alert('别点了，再点就去银行页面了！');"
		id="form" target="_parent">
		<div class="form-group col-sm-12">
			<label class="col-sm-1 control-label" id="addr">收货地址：</label>
			<div class="col-sm-2">
				<select class="form-control" name="province" id="p">
					<option value="">===请选择省份===</option>
				</select>
			</div>
			<div class="col-sm-2">
				<select class="form-control" name="city" id="c">
					<option value="">===请选择城市===</option>
				</select>
			</div>
			<div class="col-sm-4">
				<input type="text" name="address" placeholder="详细地址"
					class="form-control col-sm-2" id="address"/><br />
			</div>
		</div><br/>

		<div class="form-group col-sm-12">
			<label class="col-sm-1 control-label" id="addr2">选择银行：</label>
			<div class="col-sm-3">
				<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C"
					checked="checked" /> <img
					src="<c:url value='/bank_img/icbc.bmp'/>" align="middle" />
			</div>
			<div class="col-sm-3">
				<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"
					class="ol-sm-2" /> <img src="<c:url value='/bank_img/bc.bmp'/>"
					align="middle" />
			</div>
			<div class="col-sm-3">
				<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"
					class="ol-sm-2" /> <img src="<c:url value='/bank_img/abc.bmp'/>"
					align="middle" />
			</div>
			<div class="col-sm-offset-1 col-sm-3" id="offset">
				<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"
					class="ol-sm-2" /> <img src="<c:url value='/bank_img/ccb.bmp'/>"
					align="middle" />
			</div>
			<div class="col-sm-3" id="offset2">
				<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"
					class="ol-sm-2" /> <img src="<c:url value='/bank_img/bcc.bmp'/>"
					align="middle" />
			</div>
		</div>

	</form>
	<div style="text-align: right; padding-bottom: 200px; padding-right: 100px;"><a id="pay" href="javascript:document.getElementById('form').submit();"></a></div>

  </body>
</html>


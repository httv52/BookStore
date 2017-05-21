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
		.divbox,.thumbnail{
			text-align:center;
			width: 500px;
			height: 475px;
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
		.form-group{
			padding-top: 30px;
		} 
	</style>
	
	<script type="text/javascript">
		function setMethod(method){
			var ele = document.getElementById("method");
			ele.value = method;
		}
	</script>
  </head>
  	
  
  <body>
	<div style="text-align: center;">
		<p style="font-weight: 900; color: red ;font-size: 20px">${msg }</p>
	</div>
	<div class="col-md-4 col-md-offset-4 divbox">
		<div class="thumbnail" id="img">
			<img src="<c:url value='/${book.image}'/>" alt="${book.bname}"
				width="30%">
			<form id="form" action="<c:url value='/admin/AdminBookServlet'/>" method="post">
				<input type="hidden" name="method" value="" id="method" />
				<input type="hidden" name="bid" value="${book.bid}" />
				<div class="caption">
					<div class="form-group">
						<label class="col-sm-3 control-label">图书名称：</label>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								placeholder="${book.bname}" name="bname" value="${book.bname}" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">图书作者：</label>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								placeholder="${book.author}" name="author"
								value="${book.author}" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">图书单价：</label>
						<div class="col-sm-9">
							<input type="text" class="form-control"
								placeholder="￥${book.price}" name="price" value="${book.price}" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">图书分类：</label>
						<div class="col-sm-9">
							<select class="form-control" name="cid">
								<c:forEach items="${categorylist}" var="c">
									<option value="${c.cid}" 
										<c:if test="${c.cid eq book.category.cid}">selected="selected"</c:if> >${c.cname}</option>
								</c:forEach>
								
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-3">
							<input type="submit" value="　修改　" class="btn btn-primary" type="submit" onclick="setMethod('edit')" />
						</div>
						<div class="col-sm-offset-1 col-sm-3">
							<input type="submit" class="btn btn-primary" type="submit" value="　删除　" onclick="setMethod('deleteBook')" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>

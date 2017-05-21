<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>添加图书</title>
	<!-- Bootstrap -->
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
	
	<style type="text/css">
		.form-group{
			padding-top: 30px;
		} 
	</style>
  </head>
  
  <body>
    <div style="padding-bottom:0px">
	    <div  style="padding: 10px 50px;">
    		<c:if test="${msgCode eq 2}">
    			<div class="alert alert-danger alert-dismissible" role="alert" >
				  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				  <strong>错误提示：</strong>${msg }
				</div>
			</c:if>
	 
		</div>
    	<div style="text-align: center; "><h1>添加图书</h1></div>
    </div>
    
    <form action="<c:url value='/admin/AdminAddBookServlet'/>" method="post" enctype="multipart/form-data">
    	<div class="caption" style="padding-left: 50px; padding-right: 200px;">
			<div class="form-group">
				<label class="col-sm-2 control-label">图书名称：</label>
				<div class="col-sm-10">
					<input type="text" class="form-control"
						placeholder="图书名称" name="bname" value="${book.bname }"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">图书图片：</label>
				<div class="col-sm-10">
					<input type="file" name="image" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">图书作者：</label>
				<div class="col-sm-10">
					<input type="text" class="form-control"
						placeholder="图书作者" name="author" value="${book.author }"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">图书单价：</label>
				<div class="col-sm-10">
					<div class=" input-group">
						
					<span class="input-group-addon" id="basic-addon2">￥</span>
					<input type="text" class="form-control"
						placeholder="图书单价" name="price" value="${book.price }"/>
					<span class="input-group-addon" id="basic-addon2">元</span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">图书分类：</label>
				<div class="col-sm-10">
					<select class="form-control" name="cid">
						<c:forEach items="${categorylist}" var="c">
							<option value="${c.cid}">${c.cname}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="col-sm-12" style="padding-top: 15px;">
				<div style="text-align: right;">
  						<input class="btn btn-primary" type="submit" value="添加图书"/>
				</div>
			</div>
		</div>
    </form>
    
     
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
  </body>
</html>

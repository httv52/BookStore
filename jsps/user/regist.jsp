<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
	<meta charset="UTF-8">
	<title>注册界面</title>
	<!-- Bootstrap -->
	<link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet">
	
	<style type="text/css">
		body{
			color: #fff;
			font-family: "微软雅黑";
			background: #3CB371;
		}
		a{
				text-decoration: none;
				color: #fff;
				font-weight: bold;
		}
		a:hover{
				text-decoration: none;
				color: #F37254;
				
			}
		.form_control,.form_control_2,.form_control_3{
			color: #555555; 
			font-size: 14px; 
			padding: 6px 12px; 
			line-height: 1.428571429;
			vertical-align: middle; 
			background-color: #ffffff; 
			border: 1px solid #cccccc; 
			border-radius: 4px; 
			-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075); 
			box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075); 
			-webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s; 
			transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s; 
		}
		.form_control{
			width: 30%; 
			display: block;
			height: 34px;
			margin: 2px auto;
		}
		.form_control_2,.form_control_3{
			font-size: 20px;
			width: 15%;
			height: 46px; 
			margin: 0px auto;
			border: 1px solid #cccccc; 
			border-radius: 5px;
			/*阴影抬升*/
			box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.5); 
			/*凹陷文本*/
			text-shadow: -1px 0 0 rgba(0,0,0,0.3), 0 -1px 0 rgba(0,0,0,0.3),
			0px 1px 0 rgba(255,255,255,0.5), -1px -1px 0 rgba(25.,151,3,0.5);
		}
		.form_control:focus { 
			border-color: #66afe9; 
			outline: 0; 
			-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6); 
			box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, 0.6); 
		}
		.form_control_2{
			background: #F37254;
			color: #fff;
		}
		.form_control_3{
			background: #3f3f3f;
			color: #fff;
		}
		.form_control_2:hover{
			background: transparent;
			color:#fff;
			font-weight: bold;
		}
		.form_control_3:hover{
			background: transparent;
			color:#fff;
			font-weight: bold;
		}
		.img{
			border: 1px solid #cccccc; 
			border-radius: 8px;
			/*阴影抬升*/
			box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.5); 
			/*凹陷文本*/
			text-shadow: -1px 0 0 rgba(0,0,0,0.3), 0 -1px 0 rgba(0,0,0,0.3),
			0px 1px 0 rgba(255,255,255,0.5), -1px -1px 0 rgba(25.,151,3,0.5);
		}
	</style>
	
	<script type="text/javascript" src="<c:url value='/ajax_util/ajaxUtil.js'/>"></script>
	<script type="text/javascript">
		window.onload = function() {
			/* 用户名校验 */
			var usernameEle = document.getElementById("username");
			usernameEle.onblur = function() {
				/*
				1. ajax
				*/
				ajax(
					{
						method:"POST",
						url:"<c:url value='/CheckServlet?method=checkUsername'/>",
						params:"username="+usernameEle.value,
						type:"json",
						callback:function(data) {
							document.getElementById("usernameErr").innerHTML = data.err;
						}
					}
				);
			};
			
			/* 密码校验 */
			var passwordEle = document.getElementById("password");
			passwordEle.onblur = function() {
				alert(${errors.password});
				/*
				1. ajax
				*/
				ajax(
					{
						method:"POST",
						url:"<c:url value='/CheckServlet?method=checkPassword'/>",
						params:"password="+passwordEle.value,
						type:"json",
						callback:function(data) {
							document.getElementById("passwordErr").innerHTML = data.err;
						}
					}
				);
			};
			
			/* 邮箱校验 */
			var emailEle = document.getElementById("email");
			emailEle.onblur = function() {
				/*
				1. ajax
				*/
				ajax(
					{
						method:"POST",
						url:"<c:url value='/CheckServlet?method=checkEmail'/>",
						params:"email="+emailEle.value,
						type:"json",
						callback:function(data) {
							document.getElementById("emailErr").innerHTML = data.err;
						}
					}
				);
			};
			
			/* 验证码校验 */
			var verifyCodeEle = document.getElementById("verifyCode");
			verifyCodeEle.onblur = function() {
				/*
				1. ajax
				*/
				ajax(
					{
						method:"POST",
						url:"<c:url value='/CheckServlet?method=checkVerifyCode'/>",
						params:"verifyCode="+verifyCodeEle.value,
						type:"json",
						callback:function(data) {
							document.getElementById("verifyCodeErr").innerHTML = data.err;
						}
					}
				);
			};
			
		};
	</script>
	
	<script type="text/javascript">
		function _change(){
			var imgEle = document.getElementById("img_verifyCode");
			imgEle.src="<c:url value='/VerifyCodeServlet' />?xxx="+new Date().getTime();
		}
	</script>

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
    <div style="padding-top: 60px;text-align: center;">
    	<form action='<c:url value="/UserServlet"/>' method="post">
    	<input type="hidden" name="method" value="regist" />
    	<input type="text" placeholder="填写用户名" name="username" id="username" class="form_control" value="${user.username}">
    	　　<b id="usernameErr" style="background: #F37254; color:white;">${errors.username}</b><br/>
    	<input type="password" placeholder="填写密码" name="password" id="password" class="form_control"  value="${user.password}" >
    	　　<b id="passwordErr" style="background: #F37254; color:white;">${errors.password }</b><br/>
    	<input type="text" placeholder="填写邮箱" name="email" id="email" class="form_control"  value="${user.email}" >
    	　　<b id="emailErr" style="background: #F37254; color:white;">${errors.email}</b><br/>
    	<input type="text" size="3" placeholder="填写验证码" class="form_control" name="verifyCode" id="verifyCode">
    		<b id="verifyCodeErr" style="background: #F37254; color:white;">${errors.verifyCode }</b><br/><br/>
    		<img id="img_verifyCode" width="11%" class="img" src="<c:url value='/VerifyCodeServlet' />"/>
    		<a href="javascript:_change()">　　看不清，换一张</a><br/><br/>
    	<input type="submit" value="注册"  class="form_control_2">
    	<input type="reset" class="form_control_3" value="取消" />
    	</form>
    </div>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<c:url value='/js/jquery-3.1.1.min.js'/>"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
  </body>
</html>

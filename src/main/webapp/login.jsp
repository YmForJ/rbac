<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keys" content="">
<meta name="author" content="">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/login.css">
<style>
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<div>
					<a class="navbar-brand" href="index.html" style="font-size: 32px;">平台</a>
				</div>
			</div>
		</div>
	</nav>

	<div class="container">

		<form class="form-signin" role="form" action="login" method="post">
			<h2 class="form-signin-heading">
				<i class="glyphicon glyphicon-user"></i> 用户登录
			</h2>
			<div class="form-group has-success has-feedback">
				<input type="text" class="form-control" id="inputSuccess4"
					placeholder="请输入登录账号" autofocus name="uaccount"> <span
					class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<input type="password" class="form-control" id="inputSuccess4"
					placeholder="请输入登录密码" style="margin-top: 10px;" name="upwd">
				<span class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>

			<button class="btn btn-lg btn-success btn-block"> 登录</button>
		</form>
	</div>
	<script src="jquery/jquery-2.1.1.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="layer/layer.js"></script>
	<script>
		$(function() {
			var msg = '${msg}';
			if (msg != "") {
				layer.msg(msg);
			}
		})
	</script>
</body>
</html>
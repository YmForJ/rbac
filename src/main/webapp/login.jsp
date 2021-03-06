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
<link rel="stylesheet" href="${base}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${base}/css/font-awesome.min.css">
<link rel="stylesheet" href="${base}/css/login.css">
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

		<form class="form-signin" role="form" action="${base}/login"
			method="post" id="loginForm">
			<h2 class="form-signin-heading">
				<i class="glyphicon glyphicon-user"></i> 用户登录
			</h2>
			<div class="form-group has-success has-feedback">
				<input type="text" class="form-control" id="inputSuccess4"
					placeholder="请输入登录账号" autofocus name="uaccount" id="uaccount">
				<span class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>
			<div class="form-group has-success has-feedback">
				<input type="password" class="form-control" id="inputSuccess4"
					placeholder="请输入登录密码" style="margin-top: 10px;" name="upwd"
					id="upwd"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>

			<button class="btn btn-lg btn-success btn-block" type="button"
				onclick="login()">登录</button>
		</form>
	</div>
	<script src="${base}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${base}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${base}/layer/layer.js"></script>
	<script>
		$(function() {
			var msg = '${msg}';
			if (msg != "") {
				layer.msg(msg);
			}
			;
		})
		function login() {
			var accountVal = $("#uaccount").val();
			var pwdVal = $("#upwd").val();
			var zza = /^[a-zA-z]\w{3,11}$/;
			var zzp = /^\w{6,12}$/;
			if (!zza.test(accountVal) ) {
				layer.msg("账号格式错误");
				return;
			}
			if (!zza.test(pwdVal)) {
				layer.msg("密码格式错误");
				return;
			}
			$("#loginForm").submit();
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="GB18030">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="${base}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${base}/css/font-awesome.min.css">
<link rel="stylesheet" href="${base}/css/main.css">
<link rel="stylesheet" href="${base}/css/doc.min.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}
</style>
</head>

<body>
	<!-- 引入头部页面 -->
	<jsp:include page="${base}/header.jsp"></jsp:include>

	<div class="container-fluid">
		<div class="row">
			<!-- 引入左侧导航栏 -->
			<jsp:include page="${base}/left.jsp"></jsp:include>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
					<li><a href="#">首页</a></li>
					<li><a href="#">数据列表</a></li>
					<li class="active">新增</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-heading">
						表单数据
						<div style="float: right; cursor: pointer;" data-toggle="modal"
							data-target="#myModal">
							<i class="glyphicon glyphicon-question-sign"></i>
						</div>
					</div>
					<div class="panel-body">
						<form role="form" action="${base}/user/addDo" method="post"
							id="regForm">
							<div class="form-group">
								<label for="exampleInputPassword1">登陆账号</label> <input
									type="text" class="form-control" id="uaccount" name="uaccount"
									placeholder="请输入登陆账号">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">用户名称</label> <input
									type="text" class="form-control" id="uname" name="uname"
									placeholder="请输入用户名称">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">密码</label> <input
									type="password" class="form-control" id="upwd" name="upwd"
									placeholder="请输入用户密码">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">确认密码</label> <input
									type="password" class="form-control" id="surepwd"
									name="surepwd" placeholder="请再次输入密码">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">邮箱地址</label> <input type="email"
									class="form-control" id="umail" name="umail"
									placeholder="请输入邮箱地址">
								<p class="help-block label label-warning">请输入合法的邮箱地址, 格式为：
									xxxx@xxxx.com</p>
							</div>
							<button type="button" class="btn btn-success" onclick="addUser()">
								<i class="glyphicon glyphicon-plus"></i> 新增
							</button>
							<button type="button" class="btn btn-danger">
								<i class="glyphicon glyphicon-refresh"></i> 重置
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">帮助</h4>
				</div>
				<div class="modal-body">
					<div class="bs-callout bs-callout-info">
						<h4>测试标题1</h4>
						<p>测试内容1，测试内容1，测试内容1，测试内容1，测试内容1，测试内容1</p>
					</div>
					<div class="bs-callout bs-callout-info">
						<h4>测试标题2</h4>
						<p>测试内容2，测试内容2，测试内容2，测试内容2，测试内容2，测试内容2</p>
					</div>
				</div>
				<!--
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary">Save changes</button>
		  </div>
		  -->
			</div>
		</div>
	</div>
	<script src="${base}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${base}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${base}/script/docs.min.js"></script>
	<script src="${base}/layer/layer.js"></script>
	<script type="text/javascript">
		$(function() {
			var msg='${msg}';
			if(msg!=""){
				layer.msg(msg,{time:1500,icon:1});
			}
			$(".list-group-item").click(function() {
				if ($(this).find("ul")) {
					$(this).toggleClass("tree-closed");
					if ($(this).hasClass("tree-closed")) {
						$("ul", this).hide("fast");
					} else {
						$("ul", this).show("fast");
					}
				}
			});

		});
		function addUser() {
			var uaccountVal = $("#uaccount").val();
			var unameVal = $("#uname").val();
			var upwdVal = $("#upwd").val();
			var surepwdVal = $("#surepwd").val();
			var umailVal = $("#umail").val();
			var zza = /^[a-z]\w{3,15}$/;
			var zzn = /^\w{2,8}$/;
			var zzp = /^\w{6,12}$/;
			var zzm = /^\w+.*\w+@\w+.\w+$/;
			if (!zza.test(uaccountVal)) {
				layer.msg("账号:字母开头,4-16位", {
					time : 2000,
					icon : 5
				});
				return;
			}
			if (!zzn.test(unameVal)) {
				layer.msg("昵称:2-8位", {
					time : 2000,
					icon : 5
				});
				return;
			}
			if (!zzp.test(upwdVal)) {
				layer.msg("密码:6-12位", {
					time : 2000,
					icon : 5
				});
				return;
			}
			if (upwdVal != surepwdVal) {
				layer.msg("两次输入的密码不一致", {
					time : 2000,
					icon : 5
				});
				return;
			}
			if (!zzm.test(umailVal)) {
				layer.msg("邮箱格式不正确", {
					time : 2000,
					icon : 5
				});
				return;
			}

			$("#regForm").submit();

		}
	</script>
</body>
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
						<form role="form"  method="post"
							id="regForm">
							<div class="form-group">
								<label for="exampleInputPassword1">角色名</label> <input
									type="text" class="form-control" id="rname" name="rname"
									placeholder="请输入登陆账号">
							</div>
							<button type="button" class="btn btn-success" id="addBtn">
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
			
			$("#addBtn").click(function(){
				$.ajax({
					url:"${base}/role/addDo",
					type:"post",
					data:$("#regForm").serialize(),
					success:function(res){
									if(res.result){
										layer.msg("角色增加成功,即将跳转角色列表页",{time:2000,icon:6},function(){
											location.href="${base}/role/init";
										})
									}else{
										layer.msg("角色增加失败,请重试",{time:2000,icon:5});
									}						
					}
				})
			})

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>角色分配</title>
<link rel="stylesheet" href="${base}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${base}/css/font-awesome.min.css">
<link rel="stylesheet" href="${base}/css/main.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

table tbody tr:nth-child(odd) {
	background: #F4F4F4;
}

table tbody td:nth-child(even) {
	color: #C00;
}
</style>
</head>

<body>

	<jsp:include page="${base}/header.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
			<jsp:include page="${base}/left.jsp"></jsp:include>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<ol class="breadcrumb">
					<li><a href="#">首页</a></li>
					<li><a href="#">数据列表</a></li>
					<li class="active">分配角色</li>
				</ol>
				<div class="panel panel-default">
					<div class="panel-body">
						<form role="form" class="form-inline" id="roleForm">
							<input type="hidden" id="uid" name="uid" value="${uid}" />
							<div class="form-group">
								<label for="exampleInputPassword1">未分配角色列表</label><br> <select
									class="form-control" multiple size="10"
									style="width: 100px; overflow-y: auto;" id="unAssignRoleArea" name="rids">
								</select>
							</div>
							<div class="form-group">
								<ul>
									<li class="btn btn-default glyphicon glyphicon-chevron-right"
										id="assignRoleBtn"></li>
									<br>
									<li class="btn btn-default glyphicon glyphicon-chevron-left"
										style="margin-top: 20px;" id="unAssignRoleBtn"></li>
								</ul>
							</div>
							<div class="form-group" style="margin-left: 40px;">
								<label for="exampleInputPassword1">已分配角色列表</label><br> <select
									class="form-control" multiple size="10"
									style="width: 100px; overflow-y: auto;" id="assignRoleArea" name="rids2">
								</select>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="${base}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${base}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${base}/layer/layer.js"></script>
	<script src="${base}/script/docs.min.js"></script>
	<script src="${base}/js/template-web.js"></script>

	<!-- 使用template创建未分配角色列表 -->
	<script type="text/html" id="unAssignRoleTemplate">
{{each roleList role index}}
<option value="{{role.rid}}">{{role.rname}}</option>
{{/each}}
</script>
	<!-- 角色信息创建结束 -->
	<!-- 创建分页按钮 -->
	<script type="text/html" id="assignRoleTemplate">
{{each roleList role index}}
<option value="{{role.rid}}">{{role.rname}}</option>
{{/each}}
</script>
	<script type="text/javascript">
		$(function() {
			var msg = '${msg}';
			if (msg != "") {
				layer.msg(msg, {
					time : 1500,
					icon : 1
				});
			}
			initAssignRole();
/* 分配权限 */
			$("#assignRoleBtn").click(function() {
				$.ajax({
					url : "${base}/userrole/assignRoleDo",
					type : "post",
					data : $("#roleForm").serialize(),
					success : function(res) {
						if (res.result=="ok") {
							layer.msg("分配权限成功", {
								time : 1500,
								icon : 6
							}, function() {
								initAssignRole();
							})
						} else if(res.result=="no") {
							layer.msg("分配权限失败", {
								time : 1500,
								icon : 5
							}, function() {
							})

						}else{
							layer.msg("请先登录", {
								time : 1500,
								icon : 5
							}, function() {
								location.href="${base}/login.jsp"
							})
						}
					}
				})
			})
			/* 收回权限 */
			$("#unAssignRoleBtn").click(function() {
				$.ajax({
					url : "${base}/userrole/unAssignRoleDo",
					type : "post",
					data : $("#roleForm").serialize(),
					success : function(res) {
						if (res.result=="ok") {
							layer.msg("收回权限成功", {
								time : 1500,
								icon : 6
							}, function() {
								initAssignRole();
							})
						} else if(res.result=="no") {
							layer.msg("收回权限失败", {
								time : 1500,
								icon : 5
							}, function() {
							})

						}else{
							layer.msg("请先登录", {
								time : 1500,
								icon : 5
							}, function() {
								window.location.href="${base}/login.jsp";
							})
						}
					}
				})
			})

		});/* load结束 */
		/* 初始化分配列表 */
		function initAssignRole() {
			$.ajax({
				url : "${base}/role/assignRole",
				type : "post",
				data : {
					"uid" : $("#uid").val()
				},
				success : function(res) {
					if (res.result) {
						var unassignRoleHtml = template("unAssignRoleTemplate",
								{
									"roleList" : res.unAssignRoleList,
								});
						$("#unAssignRoleArea").html(unassignRoleHtml);
						var assignRoleHtml = template("assignRoleTemplate", {
							"roleList" : res.assignRoleList,
						})
						$("#assignRoleArea").html(assignRoleHtml);
					}
				}

			})
		};/* 初始化分配列表结束 */
	</script>
</body>
</html>

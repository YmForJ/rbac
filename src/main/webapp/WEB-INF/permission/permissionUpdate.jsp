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
						权限修改
						<div style="float: right; cursor: pointer;" data-toggle="modal"
							data-target="#myModal">
							<i class="glyphicon glyphicon-question-sign"></i>
						</div>
					</div>
					<div class="panel-body">
						<form role="form" action="${base}/user/addDo" method="post"
							id="updateForm">
							<input  id="pid" name="pid" type="hidden" value="${pid}"/>
							<div class="form-group">
								<label for="exampleInputPassword1">权限名称</label> <input
									type="text" class="form-control" id="pname" name="pname" >
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">所属类别</label> <select
									 class="form-control" id="parentid" name="parentid"></select>
							</div>
				<div class="form-group">
								<label for="exampleInputPassword1">链接地址</label> <input
									type="text" class="form-control" id="url"
									name="url" placeholder="请输入链接地址">
							</div>
				
							<button type="button" class="btn btn-success" onclick="updateDo()">
								<i class="glyphicon glyphicon-plus"></i> 修改
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
	<script src="${base}/js/template-web.js"></script>
	<script type="text/javascript">
		$(function() {
			var msg = '${msg}';
			if (msg != "") {
				layer.msg(msg, {
					time : 1500,
					icon : 1
				});
			}
			
			$.ajax({
				url:"${base}/permission/showUpdate",
				type:"post",
				data:{"pid":$("#pid").val()},
				success:function(res){
					if(res.result){
						$("#pname").val(res.permission.pname);
						$("#url").val(res.permission.url);
						var pidsHtml="";
						$.each(res.permissionList,function(index,obj){
							pidsHtml+="<option  "+(obj.pid==res.permission.parentid?'selected':'')+" value="+(obj.pid)+">"+(obj.pname)+"</option>";
						}) 
						$("#parentid").html(pidsHtml);
					}
				}
			})
			

		});
		
		function updateDo(){
			$.ajax({
				url:"${base}/permission/updateDo",
				type:"post",
				data:$("#updateForm").serialize(),
				success:function(res){
					if(res.result){
						layer.msg("修改成功，即将跳转至权限列表",{time:2000,icon:6},function(){
							window.location.href="${base}/permission/init";
						})
					}
				}
			})
		}

	</script>
	
</body>
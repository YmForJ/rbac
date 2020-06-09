<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							<i class="glyphicon glyphicon-th"></i> 数据列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input class="form-control has-success" type="text"
										placeholder="请输入查询条件">
								</div>
							</div>
							<button type="button" class="btn btn-warning">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" class="btn btn-danger"
							style="float: right; margin-left: 10px;">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button type="button" class="btn btn-primary"
							style="float: right;"
							onclick="window.location.href='${base}/user/add'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>
						<br>
						<hr style="clear: both;">
						<div class="table-responsive">
							<!-- 用户数据表格 -->
							<table class="table  table-bordered">
								<thead>
									<tr>
										<th width="30">#</th>
										<th width="30"><input type="checkbox"></th>
										<th>账号</th>
										<th>名称</th>
										<th>邮箱地址</th>
										<th width="100">操作</th>
									</tr>
								</thead>
								<tbody id="tbody">
								
								</tbody>
								<tfoot  >
									<tr>
										<td colspan="6" align="center">
											<ul class="pagination" id="pageArea">
										
											</ul>
										</td>
									</tr>

								</tfoot>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 用户更新模态框 -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">用户更新</h4>
				</div>
				<div class="modal-body">
					<form id="updateForm">
						<input id="uid" name="uid" type="hidden" />
						<div class="form-group">
							<label for="exampleInputPassword1">账号</label> <input type="text"
								class="form-control" id="uaccount" name="uaccount">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">密码</label> <input type="text"
								class="form-control" id="upwd" name="upwd">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">昵称</label> <input type="text"
								class="form-control" id="uname" name="uname">
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">邮箱</label> <input type="text"
								class="form-control" id="umail" name="umail">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button class="btn btn-success" id="doupdateBtn">update</button>
					<button class="btn btn-danger">reset</button>
				</div>

			</div>
		</div>

	</div>
	<!-- 用户更新模态框结束  -->

	<script src="${base}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${base}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${base}/layer/layer.js"></script>
	<script src="${base}/script/docs.min.js"></script>
	<script type="text/javascript">
		$(function() {
			var msg = '${msg}';
			if (msg != "") {
				layer.msg(msg, {
					time : 1500,
					icon : 1
				});
			}
			/* 初始化列表页 */
			showByPage(1);
			
			
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
			$("#doupdateBtn").click(function(){
					$.ajax({
						url:"${base}/user/updateDo",
						type:"post",
						data:$("#updateForm").serialize(),
						success:function(res){
							if(res.msg=="ok"){
								window.location.href="${base}/user/list";
							}
						}
					})
			})
			
			$(".updateBtn").click(function(){
				$.ajax({
					url:"${base}/user/update",
					type:"post",
					data:{"uid":$(this).val()},
					success:function(res){
						if(res.msg=="ok"){
							$("#uid").val(res.user.uid);
							$("#uaccount").val(res.user.uaccount);
							$("#upwd").val(res.user.upwd);
							$("#uname").val(res.user.uname);
							$("#umail").val(res.user.umail);
						}else{
							window.location.href="${base}/login.jsp";
						}
					}
					
				});
			});
		});/* load结束 */
		
		function showByPage(page){
			$.ajax({
				url:"${base}/user/listDo",
				type:"post",
				data:{"pageNum":page},
				success:function(res){
					var ContentStr="";
					$.each(res.userList,function(index,user){
					ContentStr+='<tr>';
					ContentStr+='<td>'+(index+1)+'</td>';
					ContentStr+='<td><input type="checkbox" value="'+user.uid+'"  name="uid"></td>';
					ContentStr+='<td>'+user.uaccount+'</td>';
					ContentStr+='<td>'+user.uname+'</td>';
					ContentStr+='<td>'+user.umail+'</td>';
					ContentStr+='<td>';
					ContentStr+='<button type="button" class="btn btn-success btn-xs">';
					ContentStr+='<i class=" glyphicon glyphicon-check"></i>';
					ContentStr+='</button>';
					ContentStr+='<button type="button"';
					ContentStr+='class="btn btn-primary btn-xs updateBtn "';
					ContentStr+='value="'+user.uid+'" data-toggle="modal"';
					ContentStr+='data-target="#updateModal">';
					ContentStr+='<i class=" glyphicon glyphicon-pencil"></i>';
					ContentStr+='</button>';
					ContentStr+='<button type="button" class="btn btn-danger btn-xs"';
					ContentStr+='onclick="deleteOne('+user.uid+')">';
					ContentStr+='<i class=" glyphicon glyphicon-remove"></i>';
					ContentStr+='</button>';
					ContentStr+='</td>';
					ContentStr+='</tr>';
					});
					$("#tbody").html(ContentStr);
					var pageStr="";
					pageStr+='<li class="'+(res.pageInfo.isFirstPage?"disabled":" ")+'"><a onclick="showByPage('+res.pageInfo.prePage+')"  href="#">上一页</a></li>';
					for(var i=1;i<=res.pageInfo.pages;i++){
					pageStr+='<li class="'+(res.pageInfo.page==i?"active":"")+'"><a onclick="showByPage('+i+')"  href="#">'+i+'<span class="sr-only">(current)</span></a></li>';
					}
					pageStr+='<li  class="'+(res.pageInfo.isLastPage?"disabled":" ")+'"><a onclick="showByPage('+res.pageInfo.nextPage+')"   href="#">下一页</a></li>';
					
					$("#pageArea").html(pageStr);
				}
			})
		}

		
		function deleteOne(no){
			$.ajax({
				url:"${base}/user/deleteDo",
				method:"post",
				data: {"uid":no},
				success:function(res){
					if(res.msg=="ok"){
						layer.msg("删除成功!",{time:2000,icon:1},function(){
							window.location.href="${base}/user/list";
						});
					}else{
						layer.msg("${msg}",{time:2000,icon:2},function(){
							location.reload();
						});
					}
				},
				
			})
		}
	</script>
</body>
</html>

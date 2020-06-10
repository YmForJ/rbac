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
							<i class="glyphicon glyphicon-th"></i> 角色列表
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-inline" role="form" style="float: left;"
							id="searchForm">
							<div class="form-group has-feedback">
								<div class="input-group">
									<div class="input-group-addon">查询条件</div>
									<input class="form-control has-success" type="text"
										placeholder="请输入查询条件" id="searchCondition">
								</div>
							</div>
							<!-- 隐藏域存储页码信息 -->
							<input type="hidden" name="pageNum" id="pageNum" />
							<button type="button" class="btn btn-warning" id="searchBtn">
								<i class="glyphicon glyphicon-search"></i> 查询
							</button>
						</form>
						<button type="button" class="btn btn-danger"
							style="float: right; margin-left: 10px;" id="deleteAllBtn">
							<i class=" glyphicon glyphicon-remove"></i> 删除
						</button>
						<button type="button" class="btn btn-primary"
							style="float: right;"
							onclick="window.location.href='${base}/role/add'">
							<i class="glyphicon glyphicon-plus"></i> 新增
						</button>

						<br>

						<hr style="clear: both;">
						<div class="table-responsive">
							<button type="button" class="btn btn-primary" id="checkAllBtn"
								style="float: left;">
								<i class="glyphicon glyphicon-check"></i> 全选
							</button>
							<button type="button" class="btn btn-danger" id="uncheckAllBtn"
								style="float: left;">
								<i class="glyphicon glyphicon-unchecked"></i> 全不选
							</button>
							<button type="button" class="btn btn-warning" id="recheckAllBtn"
								style="float: left;">
								<i class="glyphicon glyphicon-flash"></i> 反选
							</button>
							<br>
							<!-- 用户数据表格 -->
							<form id="deleteForm">
								<table class="table  table-bordered">
									<thead>
										<tr>
											<th width="30">#</th>
											<th width="60">选择</th>
											<th>名称</th>
											<th width="150">操作</th>
										</tr>
									</thead>

									<tbody id="tbody">

									</tbody>

									<tfoot>
										<tr>
											<td colspan="6" align="center">
												<ul class="pagination" id="pageArea">

												</ul>
											</td>
										</tr>

									</tfoot>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 角色更新模态框 -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">角色更新</h4>
				</div>
				<div class="modal-body">
					<form id="updateForm">
						<input id="rid" name="rid" type="hidden" />
						<div class="form-group">
							<label for="exampleInputPassword1">角色名称</label> <input
								type="text" class="form-control" id="rname" name="rname">
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
	<script src="${base}/js/template-web.js"></script>

	<!-- 使用template创建role内容 -->
	<script type="text/html" id="roleContextTemplate">
{{each roleList role index}}
<tr>
<input type="hidden" name="rid" id="rid" value="{{role.rid}}">
<td> {{index +1+((pageInfo.pageSize)*(pageInfo.prePage))}} </td>
<td><input type="checkbox" ></td>
<td>{{role.rname}}</td>
<td>	
<button type="button" class="btn btn-success btn-xs"   onclick="toAssignRole({{role.rid}})"><i class=" glyphicon glyphicon-check"></i></button>
<button type="button" class="btn btn-primary btn-xs updateBtn"
value="{{role.rid}}" onclick="initUpdateModal({{role.rid}})" data-toggle="modal"
data-target="#updateModal"><i class=" glyphicon glyphicon-pencil"></i></button>
<button type="button" class="btn btn-danger btn-xs" onclick="deleteOne({{role.rid}})">
<i class=" glyphicon glyphicon-remove"></i>
</button>
</td>
</tr>
{{/each}}
</script>
	<!-- 角色信息创建结束 -->
	<!-- 创建分页按钮 -->
	<script type="text/html" id="pageContextTemplate">
					<li class="{{pageInfo.isFirstPage?'disabled':''}}"><a onclick="showByPage({{pageInfo.prePage}})"  href="#">上一页</a></li>
					{{each pageInfo.navigatepageNums  page}}
					<li class="{{pageInfo.page == page? 'active':''}}"><a onclick="showByPage({{page}})"  href="#">{{page}}<span class="sr-only">(current)</span></a>;
					{{/each}}
					<li  class="{{pageInfo.isLastPage?'disabled':''}}"><a onclick="showByPage({{pageInfo.nextPage}})"   href="#">下一页</a></li>
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

			$("#checkAllBtn").click(function() {
				$(".checkBtn").attr({
					"checked" : true
				});
			})
			$("#uncheckAllBtn").click(function() {
				$(".checkBtn").attr({
					"checked" : false
				});
			})
			$("#recheckAllBtn").click(function() {
				$(".checkBtn").each(function() {
					$(this).prop("checked", !$(this).prop("checked"));
				})
			})

			$("#deleteAllBtn").click(function() {
				console.log($("#deleteForm").serialize());
				$.ajax({
					url : "${base}/role/deleteDo",
					method : "post",
					data : $("#deleteForm").serialize(),
					success : function(res) {
						if (res.msg == "ok") {
							layer.msg("删除成功!", {
								time : 2000,
								icon : 1
							}, function() {
								showByPage(1);
							});
						} else {
							layer.msg("${msg}", {
								time : 2000,
								icon : 2
							}, function() {
							});
						}
					},

				})

			})
			/* 初始化列表页 */
			showByPage(1);

			$("#doupdateBtn").click(function() {
				$.ajax({
					url : "${base}/role/updateDo",
					type : "post",
					data : $("#updateForm").serialize(),
					success : function(res) {
						if (res.msg == "ok") {
							layer.msg("修改角色成功", {
								time : 1500,
								icon : 6
							}, function() {
								window.location.href = "${base}/role/index";
							});
						} else if (res.msg == "no") {
							layer.msg("角色更新失败,请稍后再试");
						} else if (res.msg == "login") {
							window.location.href = "${base}/login.jsp";
						}
					}
				})
			});

			$("#searchBtn").click(function() {
				showByPage(1);
			})
		});/* load结束 */
		/* 根据页码查询数据的函数 */
		function showByPage(page) {
			$.ajax({
				url : "${base}/role/listDo",
				type : "post",
				data : {
					"pageNum" : page,
					"condition" : $("#searchCondition").val()
				},
				success : function(res) {
					/* 声明一个template对userList数据进行转化 */
					var roleListHtml = template('roleContextTemplate', {
						"roleList" : res.roleList,
						"pageInfo" : res.pageInfo
					});
					$("#pageNum").val(res.pageInfo.page);
					$("#tbody").html(roleListHtml);
					/* 声明一个template对pageList进行转换 */
					var pageListHtml = template('pageContextTemplate', {
						"pageInfo" : res.pageInfo,
					});
					$("#pageArea").html(pageListHtml);
					/* 串字符串创建表格内容 */
					/* 	var ContentStr = "";
						$.each(res.userList,function(index, user) {
										ContentStr += '<tr>';
										ContentStr += '<td>'+ (index + 1) + '</td>';
										ContentStr += '<td><input type="checkbox" value="'+user.uid+'"  name="uid"></td>';
										ContentStr += '<td>'+ user.uaccount+ '</td>';
										ContentStr += '<td>'+ user.uname + '</td>';
										ContentStr += '<td>'+ user.umail + '</td>';
										ContentStr += '<td>';
										ContentStr += '<button type="button" class="btn btn-success btn-xs">';
										ContentStr += '<i class=" glyphicon glyphicon-check"></i>';
										ContentStr += '</button>';
										ContentStr += '<button type="button"';
										ContentStr+='class="btn btn-primary btn-xs updateBtn"';
										ContentStr+='value="'+user.uid+'" onclick="initUpdateModal('+user.uid+')" data-toggle="modal"';
										ContentStr+='data-target="#updateModal">';
										ContentStr += '<i class=" glyphicon glyphicon-pencil"></i>';
										ContentStr += '</button>';
										ContentStr += '<button type="button" class="btn btn-danger btn-xs"';
										ContentStr += 'onclick="deleteOne('+ user.uid + ')">';
										ContentStr += '<i class=" glyphicon glyphicon-remove"></i>';
										ContentStr += '</button>';
										ContentStr += '</td>';
										ContentStr += '</tr>';
										});
								$("#pageNum").val(res.pageInfo.page);
								$("#tbody").html(ContentStr);
						var pageStr = "";
						pageStr += '<li class="'+ (res.pageInfo.isFirstPage ? "disabled": " ")+ '"><a onclick="showByPage('+ res.pageInfo.prePage+ ')"  href="#">上一页</a></li>';
						for (var i = 1; i <= res.pageInfo.pages; i++) {
							pageStr += '<li class="'+ (res.pageInfo.page == i ? "active":"")+ '"><a onclick="showByPage('+ i+ ')"  href="#">'+ i+ '<span class="sr-only">(current)</span></a></li>';
						}
						pageStr += '<li  class="'+ (res.pageInfo.isLastPage ? "disabled": " ")+ '"><a onclick="showByPage('+ res.pageInfo.nextPage+ ')"   href="#">下一页</a></li>';
						$("#pageArea").html(pageStr);
					 */

				}
			})
		}/* 根据页码查询结束 */

		function deleteOne(no) {
			$.ajax({
				url : "${base}/role/deleteDo",
				method : "post",
				data : {
					"rid" : no
				},
				success : function(res) {
					if (res.msg == "ok") {
						layer.msg("删除成功!", {
							time : 2000,
							icon : 1
						}, function() {
							showByPage(1);
						});
					} else {
						layer.msg("${msg}", {
							time : 2000,
							icon : 2
						}, function() {
						});
					}
				},

			})
		};

		function initUpdateModal(no) {
			$.ajax({
				url : "${base}/role/update",
				type : "post",
				data : {
					"rid" : no
				},
				success : function(res) {
					if (res.msg == "ok") {
						$("#rid").val(res.role.rid);
						$("#rname").val(res.role.rname);
					} else if (res.msg == "login") {
						window.location.href = "${base}/login.jsp";
					} else {
						layer.msg("角色更新失败,请稍后再试");
					}
				}

			});
		};

		/* 跳转到assignRole页面 */
		function toAssignRole(uid) {
			window.location.href = "${base}/role/assignRoleInit?uid=" + uid;
		}
	</script>
</body>
</html>

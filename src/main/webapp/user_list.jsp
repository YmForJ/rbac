<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>用户列表</title>
</head>
<body>
	<table>
		<caption>
			<h3>用户管理</h3>
		</caption>

		<tr>
			<th>#</th>
			<th>昵称</th>
			<th>密码</th>
			<th>邮箱</th>
			<th>操作</th>
		</tr>

		<c:forEach items="${userList }" varStatus="status" var="user">
			<tr>
				<th><input type="checkbox" name="uid" value="${user.uid }"></th>
				<th>${user.uname }</th>
				<th>${user.upwd }</th>
				<th>${user.umail }</th>
				<th><a href="#">赋予权限</a> <a href="#">修改</a>
					<a class="deleteBtn" value="${uer.uid}" href="#">删除</a></th>
			</tr>
		</c:forEach>
	</table>

</body>
<script type="text/javascript">
	$(function() {
		$(".deleteBtn").click(function() {
			alert($(this).val());
		})
	});
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录</title>
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
	
</script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
#loginblock {
	margin-top: 80px;
}
</style>
</head>
<body class="bg-info">
	<div class="panel col-md-4 col-md-offset-4" id="loginblock">
		<div class="panel-heading text-center bg-primary">
			<h3>登录页面</h3>
		</div>

		<div class="panel-body">
			<!--表单提交-->


			<table class="table table-bordered table-hover table-striped">

				<thead>
				</thead>
				<tbody>
					<form action="login" method="post">
						<div class="form-group">
							<label for="account"><span class="input-group-addon"><span
									class="glyphicon glyphicon-user"></span>用户名 </span> <input type=""
								name="uaccount" id="uaccount" class="form-control" /></label>
						</div>
						<div class="form-group">
							<label for="password"><span class="input-group-addon"><span
									class="glyphicon glyphicon-lock"></span>密码 </span> <input
								type="password" name="upwd" id="upwd" class="form-control" /></label>
						</div>
						<div class="text-center">
							<button class="btn btn-success" id="loginbtn">
								<span class="glyphicon glyphicon-log-in"></span>登录
							</button>
							<button type="reset" class="btn btn-warning">
								<span class="glyphicon glyphicon-edit"></span>重置
							</button>
						</div>
					</form>
				</tbody>
				<tfoot>

				</tfoot>

			</table>

		</div>
		<div class="panel-footer">
			<div class="text-center">&copy;购物指南</div>
		</div>

	</div>
</body>
</html>

<script type="text/javascript">

	
</script>

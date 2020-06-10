<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/main.css">
<style>
.tree li {
	list-style-type: none;
	cursor: pointer;
}

.tree-closed {
	height: 40px;
}

.tree-expanded {
	height: auto;
}
</style>
</head>

<body>

	<jsp:include page="${base}/header.jsp"></jsp:include>
	<jsp:include page="${base}/left.jsp"></jsp:include>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h1 class="page-header">控制面板</h1>

		<div class="row placeholders">
			<div class="col-xs-6 col-sm-3 placeholder">
				<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
					alt="Generic placeholder thumbnail">
				<h4>Label</h4>
				<span class="text-muted">woniuxy</span>
			</div>
			<div class="col-xs-6 col-sm-3 placeholder">
				<img data-src="holder.js/200x200/auto/vine" class="img-responsive"
					alt="Generic placeholder thumbnail">
				<h4>Label</h4>
				<span class="text-muted">woniuxy</span>
			</div>
			<div class="col-xs-6 col-sm-3 placeholder">
				<img data-src="holder.js/200x200/auto/sky" class="img-responsive"
					alt="Generic placeholder thumbnail">
				<h4>Label</h4>
				<span class="text-muted">woniuxy</span>
			</div>
			<div class="col-xs-6 col-sm-3 placeholder">
				<img data-src="holder.js/200x200/auto/vine" class="img-responsive"
					alt="Generic placeholder thumbnail">
				<h4>Label</h4>
				<span class="text-muted">woniuxy</span>
			</div>
		</div>
	</div>

	<script src="${base}/jquery/jquery-2.1.1.min.js"></script>
	<script src="${base}/bootstrap/js/bootstrap.min.js"></script>
	<script src="${base}/script/docs.min.js"></script>
	<script type="text/javascript">
		$(function() {
		});
	</script>
</body>
</html>

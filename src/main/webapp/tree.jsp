<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${base }/ztree/css/demo.css">
<link rel="stylesheet" href="${base }/ztree/css/zTreeStyle/zTreeStyle.css">
<script src="http://apps.bdimg.com/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="${base}/ztree/js/jquery.ztree.all-3.5.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="zTreeDemoBackground left">
<ul id="tree" class="ztree">
</ul>
</div>


</body>
<script type="text/javascript">
var setting={
		async: {
			enable: true,
			url:"${base}/permission/initTree",
			autoParam:["id", "name=n", "level=lv"],
		/* 	
			otherParam:{"otherParam":"zTreeAsyncTest"},
			
			 */
		}
};


$(function(){
	$.fn.zTree.init($("#tree"), setting);
})
</script>
</html>
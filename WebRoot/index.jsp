<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>




<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 	<link rel="shortcut icon" href="/images/favpng.png" />  -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/main.css?1">
<script src="./resources/js/jQuery1.11.2.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/respond.min.js"></script>
<script src="./resources/js/subhd2.min.js"></script>

<meta name="application-name" content="&nbsp;" />
<meta name="msapplication-TileColor" content="#FFFFFF" />

<title>图书推荐</title>
</head>


<body>

	<nav class="navbar navbar-inverse" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./">图书推荐</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="./">首页</a></li>
					<li><a href="./New">最新</a></li>
					<li><a href="./Hot">热门</a></li>
					<li><a href="./Recommend">我要推荐</a></li>
				</ul>
				<%
					session.setAttribute("isLogin", "default");
				%>

				<ul class="nav navbar-nav navbar-right navbar_user">
					<div class="hum">


						<%
							if (session.getAttribute("username") == null) {
						%>
						<a href="./login">登录</a> <a href="./reg">注册</a>
						<%
							} else {
								out.print("<a href=\"./profile\">"
										+ (String) session.getAttribute("username")
										+ "</a> <a href=\"./user_logout\">注销</a>");
							}
						%>


					</div>
				</ul>
			</div>
		</div>
	</nav>

	<div class="index_back">
		<img src="./images/back/index_back.jpg">
	</div>

	<div class="container" style="height:550px;">

		<div class="text-center">
			<h1 style="padding-top:100px;color:white;">图书推荐</h1>
		</div>


		<form action="SearchBook" name="SearchindexForm" method="POST">
			<div class="input-group btn-group"
				style="width:530px;margin:0 auto;padding-top:50px;">
				<input type="text" name="searchitem"
					class="form-control dropdown-toggle" id="sn" style="height:42px;"
					placeholder="图书名称">
				<ul class="dropdown-menu dropdown-menu-search" role="menu">
				</ul>
				<span class="input-group-btn">
					<button type="submit" class="btn btn-default" id="searchbutton"
						style="height:42px;">搜索图书</button>
				</span>
			</div>
		</form>



		<div class="text-center f12" style="color:#ddd;padding:10px 0 0 0;}">
			<span
				style="background:url(./images/back/index_back.png);padding:3px 5px;border-radius:3px;">本网站仅供网友交流阅读体会，请不要发布违法内容。</span>
		</div>


		<div style="clear:both;margin-bottom:100px;"></div>
	</div>

	</div>





</body>
</html>




<div style="clear:both;margin-bottom:190px;"></div>



<div id="footer">
	<div class="container">
		<div class="row">
			<div class="col-md-8 hidden-xs">
				<a href="./" target="_blank">图书推荐-qiaowen0</a> 创建于2015.8.1
			</div>
			<div class="col-md-4 text-right">
				<a href="mailto:qiaowen0@live.com" target="_blank">联系我们</a>
			</div>
		</div>
	</div>
</div>




</body>
</html>
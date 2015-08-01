<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<link rel="stylesheet" href="./resources/css/subhd2.css?1">
<script src="./resources/js/jQuery1.11.2.js"></script>
<script src="./resources/js/bootstrap.min.js"></script>
<script src="./resources/js/respond.min.js"></script>
<script src="./resources/js/subhd2.min.js?1"></script>
<script src="./resources/js/jquery.tooltipster.min.js"></script>
<link rel="stylesheet" href="./resources/css/tooltipster.css">



<meta name="application-name" content="&nbsp;" />
<meta name="msapplication-TileColor" content="#FFFFFF" />

<title>图书管理系统</title>
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

					<li><a href="./">首页</a></li>
					<li><a href="./new.jsp">最新</a></li>
					<li><a href="./hot.jsp">热门</a></li>
					<li><a href="./recommend.jsp">我要推荐</a></li>
				</ul>




				<div class="navbar-form navbar-left" role="search">
					<div class="input-group input-group-sm btn-group">
						<input type="text" class="form-control" style="width:180px"
							id="sn" placeholder="图书名称">
						<ul class="dropdown-menu dropdown-menu-search2" role="menu"></ul>
						<span class="input-group-btn">
							<button type="button" class="btn btn-default btn-sm"
								id="searchbutton" onclick="javascript:search()">搜索图书</button>
						</span>
					</div>
				</div>


				<ul class="nav navbar-nav navbar-right navbar_user">
					<div class="hum">
						<a href="./Login.jsp">登录</a> <a href="./reg.jsp">注册</a>
					</div>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container">

		<h2 class="text-center" style="padding-top:30px;">登录</h2>


		<form class="form-horizontal form-login" role="form">
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="email" id="email"
						placeholder="登录邮箱地址">
				</div>
			</div>
			<div class="form-group">
				<label for="pwd" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pwd" name="pwd"
						id="pwd" placeholder="登录密码">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
				
					<button class="btn btn-primary btn-sm" type="button"
						onclick="javascript:login()">登录</button>
						
				</div>
			</div>
			<div class="form-group" style="padding-top:20px;">
				<div class="col-sm-offset-2 col-sm-10">
					<p>
						<a href="./reg.jsp">没有账号？注册一个</a>
					</p>
					<p>
						<a href="mailto:qiaowen0@live.com">忘记密码？请发邮件给我。</a>
					</p>
				</div>
			</div>
		</form>

	</div>


	<div style="clear:both;margin-bottom:120px;"></div>


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
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
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
<title>图书推荐系统</title>
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
	
		<table width="800">
		<tr>
			<th>书名</th>
			<th>作者</th>
			<th>推荐人</th>
		</tr>
		<s:iterator value="booklist" var="books" status="st">
			<tr>
				<td><a
					href="./BookDetails?bookid=<s:property value="#books.bookid"/>"><s:property
							value="#books.bookname" /></a></td>
				<td><a
					href="./BookAuthor?bookauthor=<s:property value="#books.bookauthor"/>"><s:property
							value="#books.bookauthor" /></a></td>
				<td><a
					href="./Recommenduser?recommenduser=<s:property value="#books.recommenduser"/>"><s:property
							value="#books.recommenduser" /></a></td>
			</tr>
		</s:iterator>
	</table>


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
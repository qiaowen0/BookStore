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

				<form action="SearchBook" name="SearchrowForm" method="POST">
					<div class="navbar-form navbar-left" role="search">
						<div class="input-group input-group-sm btn-group">
							<input type="text" name="searchitem" class="form-control"
								style="width:180px" id="sn" placeholder="图书名称">
							<ul class="dropdown-menu dropdown-menu-search2" role="menu"></ul>
							<span class="input-group-btn">
								<button type="submit" class="btn btn-default btn-sm"
									id="searchbutton">搜索图书</button>
							</span>
						</div>
					</div>
				</form>

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
	<img src="./images/upload/${bookdetails.imgname}" alt="封面"
		style="max-width:25%;
	max-height:25%;
	width:auto;
	height:auto
	" />
	<table width="800">
		<tr>
			<th>书名</th>
			<th>作者</th>
			<th>推荐人</th>
		</tr>

		<tr>
			<td>${bookdetails.bookname}</td>
			<td><a href="./BookAuthor?bookauthor=${bookdetails.bookauthor}">${bookdetails.bookauthor}</a></td>
			<td><a
				href="./Recommenduser?recommenduser=${bookdetails.recommenduser}">${bookdetails.recommenduser}</a></td>
		</tr>
	</table>
	<BR>
	<BR>
	<span style="font-weight:bold;">推荐理由：</span> ${bookdetails.comment}



	<div class="container">
		<h2 class="text-center" style="padding-top:30px;">修改内容</h2>
		<form class="form-horizontal form-login" name="modify" role="form"
			action="confirmEdit" method="POST" id="recformtosubmit"
			enctype="multipart/form-data">
			<div class="form-group">
				<label class="col-sm-3 control-label">图书编号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" name="bookid" id="bookid"
						value="${bookdetails.bookid}" readonly="readonly"> <span
						class="help-block">不可修改</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">书名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" name="bookname"
						id="bookname" placeholder="书名"> <span class="help-block">请尽量输入完整的书名</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">作者</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" name="bookauthor"
						id="bookauthor" placeholder="作者">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">推荐理由</label>
				<div class="col-sm-9">
					<textarea rows="10" cols="30" name="comment"></textarea>
					<span class="help-block">请不要使用半角符号!</span>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">书籍封面</label>
				<div class="col-sm-9">
					<input type="file" name="upload" /><span class="help-block">仅支持jpg/png格式，文件大小不超过2M</span>
				</div>
			</div>
			<div class="form-group" style="margin-top:50px;">
				<div class="col-sm-offset-3 col-sm-9">
					<button class="btn btn-primary btn-sm" style="width:100%;"
						name="btnsub" type="button" id="recommendb"
						onclick="javascript:checkPicture()">提交录入</button>
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

	<Script language="JavaScript">
		function checkPicture() {
			if (document.modify.bookname.value == "") {
				alert("请添加书名");
				document.modify.bookname.focus();
			}
			if (document.modify.bookauthor.value == "") {
				alert("请添加作者");
				document.modify.bookauthor.focus();
			}
			if (document.modify.comment.value == "") {
				alert("请添加推荐理由");
				document.modify.comment.focus();
			}
			if (document.modify.upload.value == "") {
				alert("请添加封面");
			} else {
				document.modify.submit();
			}
		}
	</Script>

</body>
</html>
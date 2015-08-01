<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
<meta name="application-name" content="&nbsp;"/>
<meta name="msapplication-TileColor" content="#FFFFFF" />
	<title>图书推荐</title>
</head>

<script type="text/javascript"> 

$(document).ready(function(){
  
  $("#sn").on('input',function(e){  
	var send = {con:""};
	send.con = $("#sn").val(); 
	
	if(send.con=="") {
		$('.dropdown-menu').hide();
	}
	
	$.ajax({
       type: "POST",
       url: "/ajax/search_ajax",
       cache:true,
       dataType:"json",
       data:send,
       success: function(data){
         if(data.success == true){
	         if(data.text!="") {
		         $('.dropdown-menu').show();
		         $('.dropdown-menu').html(data.text);
		     } else {
			     $('.dropdown-menu').hide();
		     }
  		 }else{   
  		 }
       }
      });	
  });  

  $("#sn").blur(function(){
    $('.dropdown-menu').delay(100).hide(100);
  });
});

</script>

<body>

	<nav class="navbar navbar-inverse" role="navigation">
	  <div class="container">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="/">图书推荐</a>
	    </div>
	
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="./">首页</a></li>
	        <li ><a href="./subs">最新</a></li>
	        <li ><a href="./subs/top">热门</a></li>
	        <li ><a href="./forum">讨论区</a></li>
	      </ul>
	      
	      <ul class="nav navbar-nav navbar-right navbar_user">
	        <div class="hum">
		        					<a href="/set/login/">登录</a>　<a href="/set/reg/">注册</a>
							</div>
	      </ul>
	    </div>
	  </div>
	</nav>
	
	<div class="index_back">
		<img src="/images/back/rickandmorty.jpg">
	</div>
	
	<div class="container" style="height:550px;">
		
		<div class="text-center">
			<h1 style="padding-top:100px;color:white;">Sub HD 字幕站</h1>	
		</div>
		
			<div class="input-group btn-group" style="width:530px;margin:0 auto;padding-top:50px;">
				<input type="text" class="form-control dropdown-toggle" id="sn" style="height:42px;" placeholder="影视名称">
				
				<ul class="dropdown-menu dropdown-menu-search" role="menu">
				</ul>
					
				<span class="input-group-btn">
					<button type="button" class="btn btn-default" id="searchbutton" style="height:42px;" onclick="javascript:search()">搜索字幕</button>
				</span>
	        </div>
	    
			<div class="text-center f12" style="color:#ddd;padding:10px 0 0 0;}"><span style="background:url(/images/back/index_back.png);padding:3px 5px;border-radius:3px;">字幕仅作语言学习之用，版权归片方所有，本站禁止发布任何非法盗版资源下载地址</span></div>
			
			<div style="margin:0 auto;">
				
<!--				<div class="text-center f12" style="padding:10px 0 0 0;">
 					<a href="mailto:subhdinfo@gmail.com" class="black" style="color:white;">寻PHP开发人员，有兴趣的同学请来信</a> 
				</div> -->
				<div class="text-center f12" style="padding-top:200px;">
					<span style="background:white;padding:3px 5px;border-radius:3px;color:#ed1c24;"><a href="mailto:subhdinfo@gmail.com">诚招设计师加盟</a></span>
<!-- 						<span style="background:url(/images/back/index_back.png);padding:3px 5px;border-radius:3px;"><a href="/d/25837700" style="color: #ddd;">本期主题：真探 第二季 True Detective</a></span> -->
				</div>
			</div>
			
		<div style="clear:both"></div>
	
	</div>
	
	<div style="padding-top:80px;background: white;">

	<div class="container">

		<script src="/www/js/jquery.tooltipster.min.js"></script>
		<link rel="stylesheet" href="/www/css/tooltipster.css">
	
		<div style="text-align:center;"><h4>热门影视</h4></div>
	
		<ul class="hotl">
					<li>
				<a href="/d/25794212"><img src="/sub/poster/l/p2246877123.jpg" class="tooltips" title="分歧者2：绝地反击"></a>
			</li>
					<li>
				<a href="/d/25827399"><img src="/sub/poster/l/p2232213126.jpg" class="tooltips" title="别惹得州"></a>
			</li>
					<li>
				<a href="/d/23761370"><img src="/sub/poster/l/p2233706697.jpg" class="tooltips" title="速度与激情7"></a>
			</li>
					<li>
				<a href="/d/25977198"><img src="/sub/poster/l/p2232190921.jpg" class="tooltips" title="冰雪奇缘：生日惊喜"></a>
			</li>
					<li>
				<a href="/d/26281899"><img src="/sub/poster/l/p2222034495.jpg" class="tooltips" title="解除好友"></a>
			</li>
					<li>
				<a href="/d/24716045"><img src="/sub/poster/l/p2235684794.jpg" class="tooltips" title="远离尘嚣"></a>
			</li>
					<li>
				<a href="/d/10546665"><img src="/sub/poster/l/p2245482904.jpg" class="tooltips" title="真实故事"></a>
			</li>
					<li>
				<a href="/d/3319744"><img src="/sub/poster/l/p2219150117.jpg" class="tooltips" title="法国战恋曲"></a>
			</li>
					<li>
				<a href="/d/25713420"><img src="/sub/poster/l/p2224452276.jpg" class="tooltips" title="钟馗伏魔：雪妖魔灵"></a>
			</li>
					<li>
				<a href="/d/2363942"><img src="/sub/poster/l/p2232866868.jpg" class="tooltips" title="44号孩子"></a>
			</li>
							<li>
				<a href="/d/25837700"><img src="/sub/poster/l/p2239847546.jpg" class="tooltips" title="真探 第二季"></a>
			</li>
					<li>
				<a href="/d/25955694"><img src="/sub/poster/l/p2248573935.jpg" class="tooltips" title="血族 第二季"></a>
			</li>
					<li>
				<a href="/d/25969151"><img src="/sub/poster/l/p2248573857.jpg" class="tooltips" title="末日孤舰 第二季"></a>
			</li>
					<li>
				<a href="/d/26336714"><img src="/sub/poster/l/p2244184319.jpg" class="tooltips" title="暴君 第二季"></a>
			</li>
					<li>
				<a href="/d/26290409"><img src="/sub/poster/l/p2246829544.jpg" class="tooltips" title="黑客军团 第一季"></a>
			</li>
					<li>
				<a href="/d/26170816"><img src="/sub/poster/l/p2258277245.jpg" class="tooltips" title="真实的人类"></a>
			</li>
					<li>
				<a href="/d/25975302"><img src="/sub/poster/l/p2198341799.jpg" class="tooltips" title="陨落星辰 第五季"></a>
			</li>
					<li>
				<a href="/d/26292133"><img src="/sub/poster/l/p2246239809.jpg" class="tooltips" title="黑暗物质 第一季"></a>
			</li>
					<li>
				<a href="/d/26108398"><img src="/sub/poster/l/p2242010692.jpg" class="tooltips" title="穹顶之下 第三季"></a>
			</li>
					<li>
				<a href="/d/26425496"><img src="/sub/poster/l/p2251007040.jpg" class="tooltips" title="圣域 第二季"></a>
			</li>
				</ul>
	    
		
		<div style="clear:both;margin-bottom:100px;"></div>
			
				<div style="margin-bottom:50px;">
			<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
			
			<ins class="adsbygoogle"
			     style="display:inline-block;width:970px;height:90px"
			     data-ad-client="ca-pub-0665364311298141"
			     data-ad-slot="3843325533"></ins>
			<script>
			(adsbygoogle = window.adsbygoogle || []).push({});
			</script>
		</div>
				
	</div>
	
	</div>

	<div style="padding-top:20px;padding-bottom:50px;background:#f8f8f8;">
		
	<div class="container" style="padding-top:50px;">
		
		<div class="row">
			
		<div class="col-md-6">
	
			<b>一周字幕达人</b>
			
			<ul class="r_slist" style="margin-bottom:20px;padding-right:50px;">
									<li>
						<img class="img-circle" style="width:22px" src="/sub/user/006227.s.jpg"> <a href="/u/matin" target="_blank">matin</a>
																		<div class="pull-right gray" style="padding-top:3px;">13158</div>
					</li>
									<li>
						<img class="img-circle" style="width:22px" src="/sub/user/019240.s.jpg"> <a href="/u/风吹来的那片云" target="_blank">风吹来的那片云</a>
																		<div class="pull-right gray" style="padding-top:3px;">4166</div>
					</li>
									<li>
						<img class="img-circle" style="width:22px" src="/sub/user/013842.s.jpg"> <a href="/u/FIX字幕侠" target="_blank">FIX字幕侠</a>
													<a href="/sup" target="_blank"><img src="/images/s_30.png" width="16px" class="tooltips" title="认证原创字幕翻译"></a>
												 @ <a href="/zu/28">F.I.X字幕侠</a>						<div class="pull-right gray" style="padding-top:3px;">3193</div>
					</li>
									<li>
						<img class="img-circle" style="width:22px" src="/sub/user/014434.s.jpg"> <a href="/u/小滔" target="_blank">小滔</a>
													<a href="/sup" target="_blank"><img src="/images/s_30.png" width="16px" class="tooltips" title="认证原创字幕翻译"></a>
												 @ <a href="/zu/2">深影字幕组</a>						<div class="pull-right gray" style="padding-top:3px;">2861</div>
					</li>
									<li>
						<img class="img-circle" style="width:22px" src="/sub/user/005392.s.jpg"> <a href="/u/狗狗" target="_blank">狗狗</a>
																		<div class="pull-right gray" style="padding-top:3px;">2785</div>
					</li>
									<li>
						<img class="img-circle" style="width:22px" src="/sub/user/021595.s.jpg"> <a href="/u/随尘飘雨" target="_blank">随尘飘雨</a>
																		<div class="pull-right gray" style="padding-top:3px;">2170</div>
					</li>
									<li>
						<img class="img-circle" style="width:22px" src="/images/head.s.jpg"> <a href="/u/不良人" target="_blank">不良人</a>
													<a href="/sup" target="_blank"><img src="/images/s_30.png" width="16px" class="tooltips" title="认证原创字幕翻译"></a>
												 @ <a href="/zu/45">EF字幕组</a>						<div class="pull-right gray" style="padding-top:3px;">2043</div>
					</li>
									<li>
						<img class="img-circle" style="width:22px" src="/images/head.s.jpg"> <a href="/u/深影字幕组" target="_blank">深影字幕组</a>
													<a href="/sup" target="_blank"><img src="/images/s_30.png" width="16px" class="tooltips" title="认证原创字幕翻译"></a>
												 @ <a href="/zu/2">深影字幕组</a>						<div class="pull-right gray" style="padding-top:3px;">1644</div>
					</li>
									<li>
						<img class="img-circle" style="width:22px" src="/sub/user/000420.s.jpg"> <a href="/u/SSK字幕组" target="_blank">SSK字幕组</a>
													<a href="/sup" target="_blank"><img src="/images/s_30.png" width="16px" class="tooltips" title="认证原创字幕翻译"></a>
												 @ <a href="/zu/8">SSK字幕组</a>						<div class="pull-right gray" style="padding-top:3px;">1193</div>
					</li>
									<li>
						<img class="img-circle" style="width:22px" src="/images/head.s.jpg"> <a href="/u/dopeman" target="_blank">dopeman</a>
												 @ <a href="/zu/9">SLOMO字幕组</a>						<div class="pull-right gray" style="padding-top:3px;">1092</div>
					</li>
									<li>
						<img class="img-circle" style="width:22px" src="/images/head.s.jpg"> <a href="/u/snowsnows" target="_blank">snowsnows</a>
																		<div class="pull-right gray" style="padding-top:3px;">1085</div>
					</li>
									<li>
						<img class="img-circle" style="width:22px" src="/images/head.s.jpg"> <a href="/u/生煎" target="_blank">生煎</a>
																		<div class="pull-right gray" style="padding-top:3px;">872</div>
					</li>
							</ul>
	
		</div>
		
		<div class="col-md-6">
			
			<b>字幕组</b>
			
			<ul class="zulist">
									<li><a href="/zu/14" target="_blank">YYeTs字幕组</a></li>
									<li><a href="/zu/1" target="_blank">伊甸园字幕组</a></li>
									<li><a href="/zu/6" target="_blank">风软字幕组</a></li>
									<li><a href="/zu/2" target="_blank">深影字幕组</a></li>
									<li><a href="/zu/48" target="_blank">ZiMuZu字幕组</a></li>
									<li><a href="/zu/28" target="_blank">F.I.X字幕侠</a></li>
									<li><a href="/zu/19" target="_blank">圣城家园SCG字幕组</a></li>
									<li><a href="/zu/8" target="_blank">SSK字幕组</a></li>
									<li><a href="/zu/3" target="_blank">破烂熊字幕组</a></li>
									<li><a href="/zu/7" target="_blank">电波字幕组</a></li>
									<li><a href="/zu/25" target="_blank">UnIon字幕组</a></li>
									<li><a href="/zu/41" target="_blank">大家字幕组</a></li>
									<li><a href="/zu/13" target="_blank">极光字幕组</a></li>
									<li><a href="/zu/4" target="_blank">TLF字幕组</a></li>
									<li><a href="/zu/45" target="_blank">EF字幕组</a></li>
									<li><a href="/zu/21" target="_blank">第三樓字幕網臺灣站</a></li>
									<li><a href="/zu/20" target="_blank">迪幻字幕组</a></li>
									<li><a href="/zu/11" target="_blank">GA字幕组</a></li>
									<li><a href="/zu/52" target="_blank">COD字幕组</a></li>
									<li><a href="/zu/23" target="_blank">衣柜字幕组</a></li>
									<li><a href="/zu/44" target="_blank">CMCT字幕组</a></li>
									<li><a href="/zu/49" target="_blank">花火字幕组</a></li>
									<li><a href="/zu/33" target="_blank">MAET字幕组</a></li>
									<li><a href="/zu/5" target="_blank">夏末秋字幕组</a></li>
									<li><a href="/zu/15" target="_blank">同志肥皂盒字幕组</a></li>
									<li><a href="/zu/56" target="_blank">牛斯特洛夫斯基小分队</a></li>
									<li><a href="/zu/16" target="_blank">耐卡影音论坛</a></li>
									<li><a href="/zu/40" target="_blank">ClassicWho字幕组</a></li>
									<li><a href="/zu/27" target="_blank">果然字幕组</a></li>
									<li><a href="/zu/26" target="_blank">LFG小字幕组</a></li>
									<li><a href="/zu/35" target="_blank">幕雨字幕组</a></li>
									<li><a href="/zu/18" target="_blank">H-SGDK字幕组</a></li>
									<li><a href="/zu/22" target="_blank">树屋字幕组</a></li>
									<li><a href="/zu/43" target="_blank">零点字幕组</a></li>
									<li><a href="/zu/36" target="_blank">火星字幕组</a></li>
									<li><a href="/zu/38" target="_blank">BTM字幕组</a></li>
									<li><a href="/zu/31" target="_blank">TopGear字幕组</a></li>
									<li><a href="/zu/39" target="_blank">迷影翻译字幕组</a></li>
									<li><a href="/zu/32" target="_blank">CHD字幕组</a></li>
									<li><a href="/zu/17" target="_blank">TLF水渠修改部</a></li>
									<li><a href="/zu/10" target="_blank">纪录片之家字幕组</a></li>
									<li><a href="/zu/30" target="_blank">VM美劇線上看字幕組</a></li>
									<li><a href="/zu/12" target="_blank">TalkShowCN字幕组</a></li>
									<li><a href="/zu/54" target="_blank">果酱字幕组</a></li>
									<li><a href="/zu/42" target="_blank">诸神字幕组</a></li>
							</ul>
		
		</div>
		
		<div style="clear:both;padding-top:50px;"></div>
				
			
		<div class="col-md-3">
			
			<b>时间表</b>
			
			<ul class="r_slist" style="margin-bottom:20px;">
			
			<li><a href="http://bluray.highdefdigest.com/releasedates.html" target="_blank">蓝光发售时间表</a></li>
			<li><a href="http://huo360.com/calendar" target="_blank">美剧英剧播出时间表</a></li>
			
			</ul>
		
		</div>
		
		<div class="col-md-3">
			
			<b>字幕站</b>
			
			<ul class="r_slist" style="margin-bottom:20px;">
				
			<li><a href="http://www.addic7ed.com/" target="_blank">addic7ed</a></li>
			<li><a href="http://www.opensubtitles.org/" target="_blank">opensubtitles</a></li>
				
			</ul>
		
		</div>
		
		<div class="col-md-3">
			
			<b>电影资讯</b>
			
			<ul class="r_slist" style="margin-bottom:20px;">
				
			<li><a href="http://weibo.com/movieview" target="_blank">《看电影》杂志官方微博</a></li>
			<li><a href="http://weibo.com/206494942" target="_blank">直桃桃淘电影</a></li>
				
			</ul>
			
		</div>
		
		<div class="col-md-3">
			
			<b>电视资讯</b>
			
			<ul class="r_slist">
				
			<li><a href="http://huo360.com/" target="_blank">火星360 huo360.com</a></li>
			<li><a href="http://tvfantasy.net/" target="_blank">天涯小筑 tvfantasy.net</a></li>
			<li><a href="http://chaofan86.com/" target="_blank">炒饭网 chaofan86.com</a></li>
				
			</ul>
		
		</div>
		
		</div>
	
	</div>
		
	</div>
	
	<div class="gub"><a href="/forum/418">问题反馈</a></div>

		
		<script>
	        $(document).ready(function() {
	            $('.tooltips').tooltipster();
	        });
	    </script>
	    
</body>
</html>
						<script>
					        $(document).ready(function() {
					            $('.tooltips').tooltipster();
					        });
					    </script>
					    
<script>
	        $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
	    </script>
	    
	    <div style="clear:both;margin-bottom:120px;"></div>

<div style="background:#f8f8f8;padding-top:10px;padding-bottom:5px;">
<div class="container">
<div>
	<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
	<!-- subhd - footer -->
	<ins class="adsbygoogle"
	     style="display:inline-block;width:970px;height:90px"
	     data-ad-client="ca-pub-0665364311298141"
	     data-ad-slot="6995694333"></ins>
	<script>
	(adsbygoogle = window.adsbygoogle || []).push({});
	</script>
</div>
</div>
</div>

<div id="footer">
<div class="container">
<div class="row">
	<div class="col-md-8 hidden-xs"><a href="http://subhd.com" target="_blank">SubHD.com</a> 成立于2014年11月 0.0068</div>
	<div class="col-md-4 text-right"><a href="/feed" target="_blank">RSS订阅</a>[<a href="/feed/feedmovie" target="_blank">电影</a>|<a href="/feed/feedtv" target="_blank">电视</a>] | <a href="mailto:subhdinfo@gmail.com" target="_blank">联系我们</a></div>
</div>
</div>
</div>

<script type="text/javascript" src="http://tajs.qq.com/stats?sId=48520004" charset="UTF-8"></script>
<div style="display:none">
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F36f45ef10337991c93242d418c95baa3' type='text/javascript'%3E%3C/script%3E"));
</script>
</div>

</body>
</html>

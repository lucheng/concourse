<%@ page contentType="text/html; charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title> 发现喜欢 - 逛，发现喜欢</title>
		<meta name="keywords" content=" 发现喜欢,逛,逛网,逛逛,逛街,网购,guang">
		<meta name="description" content="这里有逛小编们精心挑选出来 的各种潮品，我们只推荐优质的商品，帮助找到最适合你的宝贝。来逛，我们一起发现喜欢！">
		<link rel="icon" href="/favicon.ico" type="image/x-icon">
		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
		<link href="web/css/ui/base.css?t=20120519.css" rel="stylesheet" type="text/css">
		<link href="web/css/ui/global.css?t=20120519.css" rel="stylesheet" type="text/css">
		<link href="web/css/ui/goods.css?t=20120519.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<!--header-->
		<div class="header " id="header">
			<div class="m-head">
				<div class="layout960 clearfix">
					<h1 class="g-logo">
						<a href="http://guang.com">逛，发现喜欢</a>
					</h1>
					<a class="logo_xihuo" href="http://guang.com/huodong/event2" target="_blank">你喜欢 逛买单</a>
					<div class="g-slogan clearfix">
						<a class="gz-btn gz-weibo" href="http://weibo.com/guang" target="_blank">加关注</a>
						<a class="gz-btn gz-qzong" href="http://user.qzone.qq.com/2408899511" target="_blank">加关注</a>
						<a class="fl" href="http://blog.guang.com/" target="_blank" title="和好友一起“逛”">和好友一起“逛”</a>
					</div>
				</div>
			</div>
			<div class="m-nav">
				<div class="layout960 clearfix pos-r">
					<ul class="channel clearfix">
						<li class="first"><a href="/">首页</a></li>
						<li>
							<dl class="clearfix">
								<dt><a class=" on " href="/xihuan">发现喜欢</a></dt>
								<dd><a class="" href="/xihuan/gallery/美容美体">美容美体</a></dd>
								<dd><a class="" href="/xihuan/gallery/母婴家庭">母婴家庭</a></dd>
								<dd><a class="" href="/xihuan/gallery/旅行美食">旅行美食</a></dd>
							</dl>
						</li>
						<li>
							<a class="" href="/jie">主题街</a>
						</li>
						<li>
							<a class="" href="/pinpai">品牌汇</a>
						</li>
						<li>
							<a class="" href="/f">好友逛</a>
						</li>
						<li class="last">
							<a class="" href="/jianding">求鉴定</a>
						</li>
					</ul>
					<a rel="signIn" class="btn-signIn fr" href="javascript:;">签到</a>
					<a rel="shareGoods" class="btn-sg fr" href="javascript:;">+ 分享宝贝</a>
									<div class="regLogin fr clearfix">
						<a href="/login">登录</a><span class="vline5">|</span><a href="/signup">注册</a>
						<span class="arrow-dn"></span>
						<ul class="share-link login-dropdown">
							<li><a class="s-qq" href="/snsLogin?snsType=4&amp;backType=1">QQ登录</a></li>
							<li><a class="s-sina" href="/snsLogin?snsType=3&amp;backType=1">新浪微博登录</a></li>
							<li><a class="s-tao" href="/snsLogin?snsType=8&amp;backType=1">淘宝登录</a></li>
							<li><a class="s-alipay" href="/snsLogin?snsType=9&amp;backType=1">支付宝登录</a></li>
							<li><a class="s-tencent" href="/snsLogin?snsType=5&amp;backType=1">腾讯微博登录</a></li>
							<li><a class="s-douban" href="/snsLogin?snsType=6&amp;backType=1">豆瓣登录</a></li>
							<li><a class="s-renren" href="/snsLogin?snsType=7&amp;backType=1">人人网登录</a></li>
						</ul>
					</div>
								</div>
			</div>
				</div>	<div id="wrap">
			<div id="container">
				
				  	<div class="category-nav">
		<div class="nav-base">
			<ul class="nav-bar clearfix">
				<li class="on">
	                <a href="/xihuan">发现喜欢</a>
	            </li>
	            	        <li>
		        	<a href="/xihuan/gallery/美容美体">美容美体</a>
		        </li>
	            	        <li>
		        	<a href="/xihuan/gallery/母婴家庭">母婴家庭</a>
		        </li>
	            	        <li>
		        	<a href="/xihuan/gallery/旅行美食">旅行美食</a>
		        </li>
	            	        <li>
		        	<a href="/xihuan/gallery/宠物爱好">宠物爱好</a>
		        </li>
	            	        <li>
		        	<a href="/xihuan/gallery/居家生活">居家生活</a>
		        </li>
	            	        <li>
		        	<a href="/xihuan/gallery/运动健康">运动健康</a>
		        </li>
	                        <i></i>
			</ul>
		</div>	
	</div>
	<div class="scene">
			
			<div class="scene-scroll">
				<!-- "previous page" action -->
							<a class="prev browse disabled"></a> 
							<!-- root element for scrollable -->
				<div class="scrollable" id="scrollable">
				<!-- root element for the items -->
				  <div class="items clearfix">
																	<div>
										<a class="pic-unit" href="/xihuan/scene/酒的盛宴">
												<img src="http://img.guang.com/scenario/116/116_1337682953845.jpg" alt="酒的盛宴" width="150px" height="100px">
												<span>酒的盛宴&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/我也要大美腿">
												<img src="http://img.guang.com/scenario/118/118_1337678614237.jpg" alt="我也要大美腿" width="150px" height="100px">
												<span>我也要大美腿&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/高尔夫装备">
												<img src="http://img.guang.com/scenario/115/115_1337589270270.jpg" alt="高尔夫装备" width="150px" height="100px">
												<span>高尔夫装备&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/怀孕这样补">
												<img src="http://img.guang.com/scenario/114/114_1337588842116.jpg" alt="怀孕这样补" width="150px" height="100px">
												<span>怀孕这样补&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/办公室三点一刻">
												<img src="http://img.guang.com/scenario/113/113_1337583939946.jpg" alt="办公室三点一刻" width="150px" height="100px">
												<span>办公室三点一刻&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/再见大油田">
												<img src="http://img.guang.com/scenario/112/112_1337571742006.jpg" alt="再见大油田" width="150px" height="100px">
												<span>再见大油田&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/我家小鬼会书法">
												<img src="http://img.guang.com/scenario/108/108_1337407173091.jpg" alt="我家小鬼会书法" width="150px" height="100px">
												<span>我家小鬼会书法&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/驰骋绿茵场">
												<img src="http://img.guang.com/scenario/111/111_1337496698520.jpg" alt="驰骋绿茵场" width="150px" height="100px">
												<span>驰骋绿茵场&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/美丽小帮手">
												<img src="http://img.guang.com/scenario/110/110_1337484971608.jpg" alt="美丽小帮手" width="150px" height="100px">
												<span>美丽小帮手&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/带宝宝去动物园">
												<img src="http://img.guang.com/scenario/101/101_1337404758103.jpg" alt="带宝宝去动物园" width="150px" height="100px">
												<span>带宝宝去动物园&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/羽毛球训练">
												<img src="http://img.guang.com/scenario/109/109_1337419789398.jpg" alt="羽毛球训练" width="150px" height="100px">
												<span>羽毛球训练&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/身体护理">
												<img src="http://img.guang.com/scenario/107/107_1337407721631.jpg" alt="身体护理" width="150px" height="100px">
												<span>身体护理&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/乒乓球装备">
												<img src="http://img.guang.com/scenario/106/106_1337332870532.jpg" alt="乒乓球装备" width="150px" height="100px">
												<span>乒乓球装备&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/闻香识人">
												<img src="http://img.guang.com/scenario/105/105_1337333920016.jpg" alt="闻香识人" width="150px" height="100px">
												<span>闻香识人&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/骑行装备">
												<img src="http://img.guang.com/scenario/104/104_1337238837639.jpg" alt="骑行装备" width="150px" height="100px">
												<span>骑行装备&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/美齿护理">
												<img src="http://img.guang.com/scenario/103/103_1337228062575.jpg" alt="美齿护理" width="150px" height="100px">
												<span>美齿护理&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/宝宝学游泳（室内）">
												<img src="http://img.guang.com/scenario/100/100_1337070584969.jpg" alt="宝宝学游泳（室内）" width="150px" height="100px">
												<span>宝宝学游泳（室内）&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/户外装备">
												<img src="http://img.guang.com/scenario/102/102_1337162786107.jpg" alt="户外装备" width="150px" height="100px">
												<span>户外装备&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/宝宝防暑">
												<img src="http://img.guang.com/scenario/99/99_1337069049997.jpg" alt="宝宝防暑" width="150px" height="100px">
												<span>宝宝防暑&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/带宝宝坐飞机">
												<img src="http://img.guang.com/scenario/98/98_1336982611494.jpg" alt="带宝宝坐飞机" width="150px" height="100px">
												<span>带宝宝坐飞机&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/美发护理">
												<img src="http://img.guang.com/scenario/97/97_1336978374574.jpg" alt="美发护理" width="150px" height="100px">
												<span>美发护理&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/喵星人联盟">
												<img src="http://img.guang.com/scenario/96/96_1336983314928.jpg" alt="喵星人联盟" width="150px" height="100px">
												<span>喵星人联盟&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/轮滑装备">
												<img src="http://img.guang.com/scenario/95/95_1336904486382.jpg" alt="轮滑装备" width="150px" height="100px">
												<span>轮滑装备&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/宝宝安全">
												<img src="http://img.guang.com/scenario/94/94_1336888432794.jpg" alt="宝宝安全" width="150px" height="100px">
												<span>宝宝安全&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/宝宝安睡">
												<img src="http://img.guang.com/scenario/93/93_1336803767734.jpg" alt="宝宝安睡" width="150px" height="100px">
												<span>宝宝安睡&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/运动配件">
												<img src="http://img.guang.com/scenario/92/92_1336814486009.jpg" alt="运动配件" width="150px" height="100px">
												<span>运动配件&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/优雅天鹅颈">
												<img src="http://img.guang.com/scenario/91/91_1336727615202.jpg" alt="优雅天鹅颈" width="150px" height="100px">
												<span>优雅天鹅颈&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/宫崎骏映画馆">
												<img src="http://img.guang.com/scenario/90/90_1336727502563.jpg" alt="宫崎骏映画馆" width="150px" height="100px">
												<span>宫崎骏映画馆&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/小脸美人">
												<img src="http://img.guang.com/scenario/89/89_1336643868242.jpg" alt="小脸美人" width="150px" height="100px">
												<span>小脸美人&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/游泳装备">
												<img src="http://img.guang.com/scenario/88/88_1336638458010.jpg" alt="游泳装备" width="150px" height="100px">
												<span>游泳装备&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/我不要大眼袋">
												<img src="http://img.guang.com/scenario/87/87_1336557054265.jpg" alt="我不要大眼袋" width="150px" height="100px">
												<span>我不要大眼袋&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/孝敬长辈">
												<img src="http://img.guang.com/scenario/86/86_1336550952825.jpg" alt="孝敬长辈" width="150px" height="100px">
												<span>孝敬长辈&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/雀斑去无踪">
												<img src="http://img.guang.com/scenario/85/85_1336466252080.jpg" alt="雀斑去无踪" width="150px" height="100px">
												<span>雀斑去无踪&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/学与玩">
												<img src="http://img.guang.com/scenario/84/84_1336446109511.jpg" alt="学与玩" width="150px" height="100px">
												<span>学与玩&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/抗衰老保卫战">
												<img src="http://img.guang.com/scenario/83/83_1336384511273.jpg" alt="抗衰老保卫战" width="150px" height="100px">
												<span>抗衰老保卫战&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/怀孕期">
												<img src="http://img.guang.com/scenario/82/82_1336373314799.jpg" alt="怀孕期" width="150px" height="100px">
												<span>怀孕期&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/网球装备">
												<img src="http://img.guang.com/scenario/81/81_1336366856192.jpg" alt="网球装备" width="150px" height="100px">
												<span>网球装备&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/足部护理">
												<img src="http://img.guang.com/scenario/77/77_1336066337629.jpg" alt="足部护理" width="150px" height="100px">
												<span>足部护理&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/月子期">
												<img src="http://img.guang.com/scenario/78/78_1336113409664.jpg" alt="月子期" width="150px" height="100px">
												<span>月子期&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/学龄期（3~6岁）">
												<img src="http://img.guang.com/scenario/79/79_1336124612749.jpg" alt="学龄期（3~6岁）" width="150px" height="100px">
												<span>学龄期（3~6岁）&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/眼部护理">
												<img src="http://img.guang.com/scenario/75/75_1336040545334.jpg" alt="眼部护理" width="150px" height="100px">
												<span>眼部护理&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/幼儿期（1~3岁）">
												<img src="http://img.guang.com/scenario/74/74_1336039692879.jpg" alt="幼儿期（1~3岁）" width="150px" height="100px">
												<span>幼儿期（1~3岁）&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/美甲攻略">
												<img src="http://img.guang.com/scenario/73/73_1336032784635.jpg" alt="美甲攻略" width="150px" height="100px">
												<span>美甲攻略&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/唇部护理">
												<img src="http://img.guang.com/scenario/71/71_1335951148535.jpg" alt="唇部护理" width="150px" height="100px">
												<span>唇部护理&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/防晒隔离区">
												<img src="http://img.guang.com/scenario/69/69_1335584687635.jpg" alt="防晒隔离区" width="150px" height="100px">
												<span>防晒隔离区&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/备孕期">
												<img src="http://img.guang.com/scenario/72/72_1336110395558.jpg" alt="备孕期" width="150px" height="100px">
												<span>备孕期&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/婴儿期（0~1岁）">
												<img src="http://img.guang.com/scenario/70/70_1335581368462.jpg" alt="婴儿期（0~1岁）" width="150px" height="100px">
												<span>婴儿期（0~1岁）&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/睡前保养">
												<img src="http://img.guang.com/scenario/68/68_1335614428691.jpg" alt="睡前保养" width="150px" height="100px">
												<span>睡前保养&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/与“痘”之战">
												<img src="http://img.guang.com/scenario/67/67_1335522715621.jpg" alt="与“痘”之战" width="150px" height="100px">
												<span>与“痘”之战&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/待产清单">
												<img src="http://img.guang.com/scenario/66/66_1335518728255.jpg" alt="待产清单" width="150px" height="100px">
												<span>待产清单&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/过家家">
												<img src="http://img.guang.com/scenario/61/61_1335428959178.jpg" alt="过家家" width="150px" height="100px">
												<span>过家家&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/去踏青">
												<img src="http://img.guang.com/scenario/65/65_1335517352216.jpg" alt="去踏青" width="150px" height="100px">
												<span>去踏青&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/男人们的聚会">
												<img src="http://img.guang.com/scenario/57/57_1335342189865.jpg" alt="男人们的聚会" width="150px" height="100px">
												<span>男人们的聚会&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/日本动漫">
												<img src="http://img.guang.com/scenario/64/64_1335523254788.jpg" alt="日本动漫" width="150px" height="100px">
												<span>日本动漫&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/家有爱犬">
												<img src="http://img.guang.com/scenario/58/58_1335346616784.jpg" alt="家有爱犬" width="150px" height="100px">
												<span>家有爱犬&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/黑头去光光">
												<img src="http://img.guang.com/scenario/62/62_1335444272354.jpg" alt="黑头去光光" width="150px" height="100px">
												<span>黑头去光光&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/二人世界">
												<img src="http://img.guang.com/scenario/63/63_1335434164435.jpg" alt="二人世界" width="150px" height="100px">
												<span>二人世界&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/篮球装备">
												<img src="http://img.guang.com/scenario/60/60_1335431111056.jpg" alt="篮球装备" width="150px" height="100px">
												<span>篮球装备&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/轻松卸妆">
												<img src="http://img.guang.com/scenario/59/59_1335344026435.jpg" alt="轻松卸妆" width="150px" height="100px">
												<span>轻松卸妆&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/宝宝音乐启蒙">
												<img src="http://img.guang.com/scenario/56/56_1335333741550.jpg" alt="宝宝音乐启蒙" width="150px" height="100px">
												<span>宝宝音乐启蒙&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/再见红血丝">
												<img src="http://img.guang.com/scenario/55/55_1335257757746.jpg" alt="再见红血丝" width="150px" height="100px">
												<span>再见红血丝&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/瑜伽美人">
												<img src="http://img.guang.com/scenario/54/54_1335260858398.jpg" alt="瑜伽美人" width="150px" height="100px">
												<span>瑜伽美人&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/出发，去看海">
												<img src="http://img.guang.com/scenario/53/53_1335245769195.jpg" alt="出发，去看海" width="150px" height="100px">
												<span>出发，去看海&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/哺乳期必备">
												<img src="http://img.guang.com/scenario/52/52_1335258964127.jpg" alt="哺乳期必备" width="150px" height="100px">
												<span>哺乳期必备&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/将美白进行到底">
												<img src="http://img.guang.com/scenario/51/51_1335171089491.jpg" alt="将美白进行到底" width="150px" height="100px">
												<span>将美白进行到底&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/海边游泳">
												<img src="http://img.guang.com/scenario/50/50_1336111310251.jpg" alt="海边游泳" width="150px" height="100px">
												<span>海边游泳&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/进口食品总汇">
												<img src="http://img.guang.com/scenario/49/49_1335172983034.jpg" alt="进口食品总汇" width="150px" height="100px">
												<span>进口食品总汇&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/天才小画家">
												<img src="http://img.guang.com/scenario/48/48_1335167283912.jpg" alt="天才小画家" width="150px" height="100px">
												<span>天才小画家&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/打造水嫩美肌">
												<img src="http://img.guang.com/scenario/47/47_1334906074317.jpg" alt="打造水嫩美肌" width="150px" height="100px">
												<span>打造水嫩美肌&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/春天自驾去看花">
												<img src="http://img.guang.com/scenario/43/43_1334812011330.jpg" alt="春天自驾去看花" width="150px" height="100px">
												<span>春天自驾去看花&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/新生儿">
												<img src="http://img.guang.com/scenario/46/46_1334814279593.jpg" alt="新生儿" width="150px" height="100px">
												<span>新生儿&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/钓鱼俱乐部">
												<img src="http://img.guang.com/scenario/44/44_1334823089146.jpg" alt="钓鱼俱乐部" width="150px" height="100px">
												<span>钓鱼俱乐部&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/新车装饰">
												<img src="http://img.guang.com/scenario/45/45_1334814763150.jpg" alt="新车装饰" width="150px" height="100px">
												<span>新车装饰&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/手部护理">
												<img src="http://img.guang.com/scenario/13/13_1334370145790.jpg" alt="手部护理" width="150px" height="100px">
												<span>手部护理&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/姐妹们的聚会">
												<img src="http://img.guang.com/scenario/22/22_1334369313832.jpg" alt="姐妹们的聚会" width="150px" height="100px">
												<span>姐妹们的聚会&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/清新的早晨">
												<img src="http://img.guang.com/scenario/32/32_1334370227884.jpg" alt="清新的早晨" width="150px" height="100px">
												<span>清新的早晨&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/我爱洗澡皮肤好好">
												<img src="http://img.guang.com/scenario/4/4_1334370248298.jpg" alt="我爱洗澡皮肤好好" width="150px" height="100px">
												<span>我爱洗澡皮肤好好&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/狗狗爱洗澡">
												<img src="http://img.guang.com/scenario/40/40_1334370103978.jpg" alt="狗狗爱洗澡" width="150px" height="100px">
												<span>狗狗爱洗澡&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/组个车队去远方">
												<img src="http://img.guang.com/scenario/18/18_1334370163911.jpg" alt="组个车队去远方" width="150px" height="100px">
												<span>组个车队去远方&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/周末去露营">
												<img src="http://img.guang.com/scenario/16/16_1334369857211.jpg" alt="周末去露营" width="150px" height="100px">
												<span>周末去露营&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/约会装扮">
												<img src="http://img.guang.com/scenario/42/42_1334370309442.jpg" alt="约会装扮" width="150px" height="100px">
												<span>约会装扮&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/脱毛计">
												<img src="http://img.guang.com/scenario/15/15_1334370127945.jpg" alt="脱毛计" width="150px" height="100px">
												<span>脱毛计&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/女孩的公主梦">
												<img src="http://img.guang.com/scenario/21/21_1334370266355.jpg" alt="女孩的公主梦" width="150px" height="100px">
												<span>女孩的公主梦&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/午夜电影院">
												<img src="http://img.guang.com/scenario/5/5_1334369781642.jpg" alt="午夜电影院" width="150px" height="100px">
												<span>午夜电影院&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/小玩具大聪明">
												<img src="http://img.guang.com/scenario/36/36_1334370021853.jpg" alt="小玩具大聪明" width="150px" height="100px">
												<span>小玩具大聪明&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/那些年抢过的糖果">
												<img src="http://img.guang.com/scenario/33/33_1334369826244.jpg" alt="那些年抢过的糖果" width="150px" height="100px">
												<span>那些年抢过的糖果&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/为他下厨做西餐">
												<img src="http://img.guang.com/scenario/41/41_1334370211101.jpg" alt="为他下厨做西餐" width="150px" height="100px">
												<span>为他下厨做西餐&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/产后瘦身">
												<img src="http://img.guang.com/scenario/2/2_1334369907323.jpg" alt="产后瘦身" width="150px" height="100px">
												<span>产后瘦身&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/漫展特工队">
												<img src="http://img.guang.com/scenario/30/30_1334369984050.jpg" alt="漫展特工队" width="150px" height="100px">
												<span>漫展特工队&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/小小艺术家">
												<img src="http://img.guang.com/scenario/35/35_1334370039275.jpg" alt="小小艺术家" width="150px" height="100px">
												<span>小小艺术家&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/游戏死忠饭">
												<img src="http://img.guang.com/scenario/31/31_1334369338531.jpg" alt="游戏死忠饭" width="150px" height="100px">
												<span>游戏死忠饭&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/宝宝去上学">
												<img src="http://img.guang.com/scenario/24/24_1334370182337.jpg" alt="宝宝去上学" width="150px" height="100px">
												<span>宝宝去上学&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/四川美食带回家">
												<img src="http://img.guang.com/scenario/14/14_1334370061049.jpg" alt="四川美食带回家" width="150px" height="100px">
												<span>四川美食带回家&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/忘不掉的童年美食">
												<img src="http://img.guang.com/scenario/28/28_1334369751330.jpg" alt="忘不掉的童年美食" width="150px" height="100px">
												<span>忘不掉的童年美食&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/面试妆容攻略">
												<img src="http://img.guang.com/scenario/7/7_1334369722216.jpg" alt="面试妆容攻略" width="150px" height="100px">
												<span>面试妆容攻略&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/小宝贝去春游">
												<img src="http://img.guang.com/scenario/25/25_1334369954986.jpg" alt="小宝贝去春游" width="150px" height="100px">
												<span>小宝贝去春游&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/地球糖果总店">
												<img src="http://img.guang.com/scenario/34/34_1334369696526.jpg" alt="地球糖果总店" width="150px" height="100px">
												<span>地球糖果总店&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/海绵宝宝主题生活">
												<img src="http://img.guang.com/scenario/29/29_1334369670661.jpg" alt="海绵宝宝主题生活" width="150px" height="100px">
												<span>海绵宝宝主题生活&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/宝宝要出门">
												<img src="http://img.guang.com/scenario/26/26_1334370087061.jpg" alt="宝宝要出门" width="150px" height="100px">
												<span>宝宝要出门&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/丰胸大作战">
												<img src="http://img.guang.com/scenario/11/11_1334369883688.jpg" alt="丰胸大作战" width="150px" height="100px">
												<span>丰胸大作战&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/Party queen">
												<img src="http://img.guang.com/scenario/19/19_1334369620854.jpg" alt="Party queen" width="150px" height="100px">
												<span>Party queen&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/姐妹下午茶">
												<img src="http://img.guang.com/scenario/27/27_1334370000227.jpg" alt="姐妹下午茶" width="150px" height="100px">
												<span>姐妹下午茶&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/给宝宝洗澡">
												<img src="http://img.guang.com/scenario/20/20_1334369581192.jpg" alt="给宝宝洗澡" width="150px" height="100px">
												<span>给宝宝洗澡&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/洁面大作战">
												<img src="http://img.guang.com/scenario/8/8_1334369528047.jpg" alt="洁面大作战" width="150px" height="100px">
												<span>洁面大作战&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/内分泌调理记">
												<img src="http://img.guang.com/scenario/23/23_1334369555744.jpg" alt="内分泌调理记" width="150px" height="100px">
												<span>内分泌调理记&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/迪斯尼的童话世界">
												<img src="http://img.guang.com/scenario/6/6_1334369602460.jpg" alt="迪斯尼的童话世界" width="150px" height="100px">
												<span>迪斯尼的童话世界&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/宝岛特产大体验">
												<img src="http://img.guang.com/scenario/17/17_1334369504590.jpg" alt="宝岛特产大体验" width="150px" height="100px">
												<span>宝岛特产大体验&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/挑战“冻龄”美女">
												<img src="http://img.guang.com/scenario/38/38_1334369410886.jpg" alt="挑战“冻龄”美女" width="150px" height="100px">
												<span>挑战“冻龄”美女&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/生理期美肌">
												<img src="http://img.guang.com/scenario/37/37_1334369458535.jpg" alt="生理期美肌" width="150px" height="100px">
												<span>生理期美肌&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	<div>
										<a class="pic-unit" href="/xihuan/scene/带着狗狗去溜弯">
												<img src="http://img.guang.com/scenario/39/39_1334369378617.jpg" alt="带着狗狗去溜弯" width="150px" height="100px">
												<span>带着狗狗去溜弯&nbsp;&nbsp;&nbsp;</span>
												<i></i>
										</a>
									</div>
																	
								</div>
							</div>
							<!-- "next page" action -->
													<a class="next browse"><div style="width:35px;text-align:center;margin-left:3px;"><span id="scene-start">1</span>/<span id="scene-end">19</span></div></a>
												</div>
									
						<!-- 发现喜欢 end -->
		</div>
				<div class="goods-title">
										<h2>热门</h2>	
									<div class="hd-info">
		 				<div class="share fr">						
							<span class="fl l20">叫上好友一起逛：</span>	
							<a class="s-sina" href="javascript:void((function(){var title=encodeURIComponent('这些宝贝真不错，推荐！ ');var link=encodeURIComponent(window.location.href);var pic=document.getElementsByTagName('img').length>0?encodeURIComponent(document.getElementsByTagName('img')[1].src):'';window.open('http://service.t.sina.com.cn/share/share.php?appkey=1207757825&title='+title+'&pic='+pic+'&url='+link);})())" alt="分享到新浪微博"></a>	
							<a class="s-tencent" href="javascript:void((function(){var title=encodeURIComponent('这些宝贝真不错，推荐！ ');var link=encodeURIComponent(window.location.href);window.open('http://v.t.qq.com/share/share.php?appkey=801128565&url='+link+'&title='+title+'&pic=&site='+link);})())" alt="分享到腾讯微博"></a>	
							<a class="s-douban" href="javascript:void((function(){var title=encodeURIComponent('这些宝贝真不错，推荐！ ');var link=encodeURIComponent(window.location.href);window.open('http://www.douban.com/recommend/?url='+link+'&title='+title);})())" alt="分享到豆瓣"></a>		
							<a class="s-qzone" href="javascript:void((function(){var title=encodeURIComponent('这些宝贝真不错，推荐！ ');var link=encodeURIComponent(window.location.href);window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+link);})())" alt="分享到QQ空间"></a>	
							<a class="s-renren" href="javascript:void((function(){var title=encodeURIComponent('这些宝贝真不错，推荐！ ');var link=encodeURIComponent(window.location.href);window.open('http://share.renren.com/share/buttonshare.do?link='+link+'&title='+title);})())" alt="分享到人人网"></a>
							<a class="s-163" href="javascript:void((function(){var title=encodeURIComponent('这些宝贝真不错，推荐！ ');var link=encodeURIComponent(window.location.href);window.open('http://t.163.com/article/user/checkLogin.do?link='+link+'&source=&info='+title+'&images=');})());" alt="分享到网易微博"></a>
						</div>
		        	</div>
				</div>
				<div class="goods-wall" id="J_GoodsWall" style="height: 1950px; ">
					<div class="tag-book" style="top: 5px; left: 0px;">
						<div class="hd">
						</div>
						<ul class="tag-list tag-link clearfix">
								           						<li class="on"><a href="/xihuan">热门</a></li>
	           					           				           					           						<li><a href="/xihuan/cag/美妆">美妆</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/母婴">母婴</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/运动户外">运动户外</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/美食">美食</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/家居">家居</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/配饰">配饰</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/宠物">宠物</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/数码">数码</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/玩具">玩具</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/鞋子">鞋子</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/箱包">箱包</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/车品">车品</a></li>
	           						        			           					           						<li><a href="/xihuan/cag/其它">其它</a></li>
	           						        								</ul>
						<div class="bd">
							<span class="card-exit"></span>
						</div>
						<div class="sub-tag" style="position: relative; height: 165px; ">
							<div class="sub-tag-list J_CardExit1 J_CurDiv" style="top: 0px; ">
								<ul class="clearfix">
												           							           								  												           						<li><a href="/xihuan/tag/美白#noanchor">美白</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/防晒#noanchor">防晒</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/去黑眼圈#noanchor">去黑眼圈</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/隔离霜#noanchor">隔离霜</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/面膜#noanchor">面膜</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/遮阳伞#noanchor">遮阳伞</a></li>
					           								           									        						           								  											           							<li class="focus"><a href="/xihuan/tag/比基尼#noanchor">比基尼</a></li>
					           								           									        						           								  											           							<li class="focus"><a href="/xihuan/tag/太阳镜#noanchor">太阳镜</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/收纳箱#noanchor">收纳箱</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/面部精华#noanchor">面部精华</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/加湿器#noanchor">加湿器</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/驱蚊#noanchor">驱蚊</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/手表#noanchor">手表</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/啤酒#noanchor">啤酒</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/纤体#noanchor">纤体</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/沙滩鞋#noanchor">沙滩鞋</a></li>
					           								           									        						           								  												           						<li><a href="/xihuan/tag/凉鞋#noanchor">凉鞋</a></li>
					           								           									        							        			<!--			           				 -->
								</ul>
							</div>
						</div>
					</div>
					<!--tag-book end-->
					<!--first 20 goods begin--> 
					<div class="goods-container">
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									</div>
					<!--first 20 goods end-->   
					
				<div class="goods-block" style="opacity: 1; "><div class="goods" style="top: 0px; left: 243px; color: rgb(153, 153, 153); box-shadow: rgba(34, 25, 25, 0.199219) 0px 1px 3px; -webkit-box-shadow: rgba(34, 25, 25, 0.199219) 0px 1px 3px; ">
						<div class="goods-pic" style="height:207px">            
							<a href="/baobei/1436865" title="方形笑脸安全桌角保护套" target="_blank">                
								<img src="http://s4.img.guang.com/product/2012/05/10047/07/34/470734_0104044124046_305X301.jpg_210X207.jpg" title="方形笑脸安全桌角保护套" alt="方形笑脸安全桌角保护套" height="207px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436865" style="display: none; ">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">62 </em></span>
							<span class="fr ml5">评论: 1</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					方形笑脸安全桌角保护套 
	安装在桌子和家具的棱角处，防止宝宝撞痛。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 0px; left: 486px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436870" title="春夏婴儿睡袋" target="_blank">                
								<img src="http://s1.img.guang.com/product/61/71/130/1307161_7537468111219_310X310.jpg_210X210.jpg" title="春夏婴儿睡袋" alt="春夏婴儿睡袋" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436870" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">45 </em></span>
												</div>  
											<ul class="comments">  
			  		 		<li>
		       					春夏婴儿睡袋
	竹纤维四层纱布,可调节,可卸袖,薄款,春夏用着正好。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 0px; left: 729px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436850" title="手工创意翻糖饼干" target="_blank">                
								<img src="http://s9.img.guang.com/product/2012/05/10047/66/99/476699_3489632298559_1000X1000.jpg_210X210.jpg" title="手工创意翻糖饼干" alt="手工创意翻糖饼干" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436850" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">123 </em></span>
							<span class="fr ml5">评论: 4</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					这一对饼干，叫“幸福约定”，是不是有浪漫的气息呢？
		       				</li>
						</ul>
										</div><div class="goods" style="top: 327px; left: 243px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436873" title="艾娜骑士 婴儿连体衣" target="_blank">                
								<img src="http://s1.img.guang.com/product/91/70/130/1307091_8284305535530_310X310.jpg_210X210.jpg" title="艾娜骑士 婴儿连体衣" alt="艾娜骑士 婴儿连体衣" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436873" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">59 </em></span>
												</div>  
											<ul class="comments">  
			  		 		<li>
		       					艾娜骑士婴儿连体衣  新生婴儿彩棉系带蝴蝶衣，夏天穿着最舒服。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 330px; left: 486px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436849" title="Clinique倩碧 眼影腮红彩妆盘套装" target="_blank">                
								<img src="http://s7.img.guang.com/product/77/00/129/1290077_4944272358834_310X310.jpg_210X210.jpg" title="Clinique倩碧 眼影腮红彩妆盘套装" alt="Clinique倩碧 眼影腮红彩妆盘套装" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436849" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">98 </em></span>
							<span class="fr ml5">评论: 2</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					倩碧的眼影和腮红一直在业界非常的出名。这款彩妆盘，蜜糖风格的眼影加上缤纷风格的腮红，轻松营造出桃花妆容，让你的桃花运HOLD不住的放肆而来。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 330px; left: 729px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436875" title="艾娜骑士 宝宝帽子" target="_blank">                
								<img src="http://s2.img.guang.com/product/22/73/130/1307322_6301627536648_310X310.jpg_210X210.jpg" title="艾娜骑士 宝宝帽子" alt="艾娜骑士 宝宝帽子" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436875" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">62 </em></span>
							<span class="fr ml5">评论: 3</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					艾娜骑士 宝宝帽子 
	优雅针织花边帽，防风遮阳。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 353px; left: 0px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436855" title="cake pops棒棒蛋糕愤怒的小鸟" target="_blank">                
								<img src="http://s0.img.guang.com/product/2012/05/10046/02/60/460260_3726894275411_400X400.jpg_210X210.jpg" title="cake pops棒棒蛋糕愤怒的小鸟" alt="cake pops棒棒蛋糕愤怒的小鸟" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436855" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">100 </em></span>
							<span class="fr ml5">评论: 2</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					一款棒棒蛋糕，是愤怒的小鸟的样子哦。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 657px; left: 243px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436851" title="久久丫甜辣鸭舌" target="_blank">                
								<img src="http://s1.img.guang.com/product/2012/05/10046/01/91/460191_9203579519493_800X800.jpg_210X210.jpg" title="久久丫甜辣鸭舌" alt="久久丫甜辣鸭舌" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436851" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">135 </em></span>
							<span class="fr ml5">评论: 10</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					细腻爽滑，酱香味浓，口味微甜，很有弹性。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 660px; left: 729px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436876" title="德国代购TOMMEE TIPPEE可爱小奶瓶" target="_blank">                
								<img src="http://s1.img.guang.com/product/2012/05/10046/64/71/466471_3690155388567_310X310.jpg_210X210.jpg" title="德国代购TOMMEE TIPPEE可爱小奶瓶" alt="德国代购TOMMEE TIPPEE可爱小奶瓶" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436876" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">92 </em></span>
							<span class="fr ml5">评论: 4</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					德国 TOMMEE TIPPEE 可爱小奶瓶。材质非常环，灵活性高，形状和对母亲的乳房模型一样，更易喂养。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 683px; left: 0px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436871" title="艾娜骑士婴儿凉枕 亚麻草竹炭茶叶枕席" target="_blank">                
								<img src="http://s1.img.guang.com/product/41/71/130/1307141_2257360501998_310X310.jpg_210X210.jpg" title="艾娜骑士婴儿凉枕 亚麻草竹炭茶叶枕席" alt="艾娜骑士婴儿凉枕 亚麻草竹炭茶叶枕席" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436871" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">90 </em></span>
							<span class="fr ml5">评论: 2</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					艾娜骑士婴儿凉枕 亚麻草竹炭茶叶枕席 夏天小宝宝的头最容易热了，一定要有一款凉枕哦。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 714px; left: 486px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436847" title="倩碧美盈持久滋润唇膏" target="_blank">                
								<img src="http://s3.img.guang.com/product/43/01/129/1290143_9464225291309_310X310.jpg_210X210.jpg" title="倩碧美盈持久滋润唇膏" alt="倩碧美盈持久滋润唇膏" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436847" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">81 </em></span>
												</div>  
											<ul class="comments">  
			  		 		<li>
		       					该款口红颜色适合任何场合，也适合娴静成熟的你。它不宜渗过唇线或残留于樱唇上，任何时刻色彩依然真实，持久不变。大方的色彩配合柔媚的你，回头率一定倍增！
		       				</li>
						</ul>
										</div><div class="goods" style="top: 987px; left: 243px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436866" title="艾娜骑士竹纤维纱布浴巾" target="_blank">                
								<img src="http://s5.img.guang.com/product/95/69/130/1306995_8979963993563_310X310.jpg_210X210.jpg" title="艾娜骑士竹纤维纱布浴巾" alt="艾娜骑士竹纤维纱布浴巾" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436866" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">47 </em></span>
							<span class="fr ml5">评论: 2</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					艾娜骑士竹纤维纱布浴巾  多种用途啊，夏天当午睡毯，外出挡风毯，很实用。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 1008px; left: 729px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436867" title="艾娜骑士 婴儿裤子宝宝长裤" target="_blank">                
								<img src="http://s0.img.guang.com/product/10/70/130/1307010_8062157060168_310X310.jpg_210X210.jpg" title="艾娜骑士 婴儿裤子宝宝长裤" alt="艾娜骑士 婴儿裤子宝宝长裤" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436867" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">48 </em></span>
							<span class="fr ml5">评论: 2</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					艾娜骑士 婴儿裤子
	宝宝长裤，纯棉的。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 1031px; left: 0px; ">
						<div class="goods-pic" style="height:311px">            
							<a href="/baobei/1436848" title="德国慕尼黑Paulaner小麦白啤酒" target="_blank">                
								<img src="http://s1.img.guang.com/product/2012/05/10046/03/31/460331_0680423777235_600X888.jpg_210X311.jpg" title="德国慕尼黑Paulaner小麦白啤酒" alt="德国慕尼黑Paulaner小麦白啤酒" height="311px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436848" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">69 </em></span>
							<span class="fr ml5">评论: 11</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					浓浓的麦芽香结合果味和淡淡的柠檬酸味。与众不同的云雾状是柏龙小麦啤酒明显区别于其它小麦啤酒的一大特点，其浓浓的麦芽香结合果味和淡淡的柠檬酸味，色泽金黄，呈乳状，泡沫丰富，细腻。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 1098px; left: 486px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436846" title="德国瓦伦丁骑士纯麦啤酒" target="_blank">                
								<img src="http://s6.img.guang.com/product/2012/05/10046/03/46/460346_9815312283845_700X700.jpg_210X210.jpg" title="德国瓦伦丁骑士纯麦啤酒" alt="德国瓦伦丁骑士纯麦啤酒" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436846" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">71 </em></span>
							<span class="fr ml5">评论: 6</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					本款骑士纯麦啤酒采用欧洲古老的发酵工艺——艾尔工艺，从上到下发酵，不过滤、不灭菌进行第二次发酵，酿出的酒：酒体浑浊，泡沫细腻，口感柔和，麦香味醇厚。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 1335px; left: 243px; ">
						<div class="goods-pic" style="height:165px">            
							<a href="/baobei/1436877" title="日本betta贝塔宝石系列玻璃奶瓶240ML" target="_blank">                
								<img src="http://s7.img.guang.com/product/2012/05/10046/59/27/465927_8857368722142_310X244.jpg_210X165.jpg" title="日本betta贝塔宝石系列玻璃奶瓶240ML" alt="日本betta贝塔宝石系列玻璃奶瓶240ML" height="165px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436877" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">50 </em></span>
							<span class="fr ml5">评论: 1</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					Betta 贝塔奶瓶，色彩搭配得很舒服，瓶身流线型设计让长时间喂奶变得更轻松，防噎防胀气。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 1338px; left: 729px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436874" title="艾娜骑士初生婴儿连体衣" target="_blank">                
								<img src="http://s8.img.guang.com/product/18/70/130/1307018_2558321378998_310X310.jpg_210X210.jpg" title="艾娜骑士初生婴儿连体衣" alt="艾娜骑士初生婴儿连体衣" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436874" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">44 </em></span>
							<span class="fr ml5">评论: 1</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					艾娜骑士初生婴儿连体衣  宝宝哎，你要不要这么可爱啊。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 1482px; left: 486px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436852" title="儿童吹泡泡玩具 海豚泡泡枪" target="_blank">                
								<img src="http://s6.img.guang.com/product/2012/05/10047/65/46/476546_7636200886371_310X310.jpg_210X210.jpg" title="儿童吹泡泡玩具 海豚泡泡枪" alt="儿童吹泡泡玩具 海豚泡泡枪" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436852" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">98 </em></span>
							<span class="fr ml5">评论: 1</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					儿童吹泡泡玩具 海豚泡泡枪  给宝宝一个美好的童年~
		       				</li>
						</ul>
										</div><div class="goods" style="top: 1534px; left: 0px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436872" title="艾娜骑士 慢回弹哺乳枕" target="_blank">                
								<img src="http://s6.img.guang.com/product/96/70/130/1307096_5226153410320_310X310.jpg_210X210.jpg" title="艾娜骑士 慢回弹哺乳枕" alt="艾娜骑士 慢回弹哺乳枕" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436872" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">52 </em></span>
												</div>  
											<ul class="comments">  
			  		 		<li>
		       					艾娜骑士 慢回弹哺乳枕 既可以当哺乳枕，也可以直接给宝宝当枕头。
		       				</li>
						</ul>
										</div><div class="goods" style="top: 1638px; left: 243px; ">
						<div class="goods-pic" style="height:210px">            
							<a href="/baobei/1436853" title="手工趣味白兔饼干" target="_blank">                
								<img src="http://s7.img.guang.com/product/57/04/107/1070457_7821182099476_450X450.jpg_210X210.jpg" title="手工趣味白兔饼干" alt="手工趣味白兔饼干" height="210px">
							</a>
							<a class="ilike-m" href="javascript:void(0);" data-type="0" data-proid="1436853" style="display:none;">喜欢</a>
						</div>      
						<div class="goods-stat clearfix">
							<span class="like-num">喜欢: <em class="like-count">102 </em></span>
							<span class="fr ml5">评论: 4</span>					</div>  
											<ul class="comments">  
			  		 		<li>
		       					微笑的兔子，很可爱吧。
		       				</li>
						</ul>
										</div></div></div>
				<!--goods-wall end-->
				<div class="goods-loading">&nbsp;</div>
				
				<div class="page-box">
					<div class="pagin inlineblock clearfix" id="J_Pagination"><span class="current prev">上一页</span><span class="current">1</span><a href="/xihuan/?p=2">2</a><a href="/xihuan/?p=3">3</a><a href="/xihuan/?p=4">4</a><span>...</span><a href="/xihuan/?p=49">49</a><a href="/xihuan/?p=50">50</a><a href="/xihuan/?p=2" class="next">下一页<i class="pagin-scene"></i></a></div>
				</div>
			</div><!--container end-->
		</div>
			<div class="footer" id="footer">
			<a class="guangLink" href="http://guang.com/"></a>
			<div class="footer-nav clearfix">
				<dl class="about">
					<dt>关于我们</dt>
					<dd><a href="http://guang.com/aboutus" target="_blank">关于逛</a></dd>
					<dd><a href="http://blog.guang.com/joinus/" target="_blank">加入我们</a></dd>
					<dd><a href="http://guang.com/contact" target="_blank">合作联系</a></dd>
					<dd><a href="http://site.douban.com/widget/board/5901738/" target="_blank">提建议</a></dd>
				</dl>
				<dl class="followus">
					<dt>关注我们</dt>
					<dd><a class="f-Qzone" href="http://user.qzone.qq.com/2408899511" target="_blank">QQ空间</a></dd>
					<dd><a class="f-sina" href="http://weibo.com/guang" target="_blank">新浪微博</a></dd>
					<dd><a class="f-tencent" href="http://t.qq.com/iguang2011" target="_blank">腾讯微博</a></dd>
					<dd><a class="f-douban" href="http://site.douban.com/134349/" target="_blank">豆瓣</a></dd>
				</dl>
				<dl class="friendlinks">
					<dt>友情链接<a class="ml10 fs12" href="/common/friends" target="_blank">更多…</a></dt>
							<dd><a href="http://www.ny1988.com/" target="_blank">女友网</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://guoku.com/" target="_blank">果库</a></dd>
							<dd><a href="http://www.duitang.com/" target="_blank">堆糖网</a></dd> 
							<dd style="position: absolute; left: -4000px; "><a href="http://donews.com/" target="_blank">Donews</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://www.5w.com/" target="_blank">5W网</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://hitao.com/" target="_blank">嗨淘网</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://www.19lou.com/" target="_blank">19lou</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://info.china.alibaba.com/" target="_blank">阿里巴巴</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://zj.sina.com.cn/" target="_blank">新浪浙江</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://www.yupsky.com/" target="_blank">潮人网</a></dd>			
							<dd><a href="http://www.1626.com/" target="_blank">1626潮流网</a></dd>
							<dd><a href="http://www.julemai.com/" target="_blank">聚乐买</a></dd>
							<dd><a href="http://www.onlylady.com/" target="_blank">Onlylady女人志</a></dd>
							<dd><a href="http://www.womai.com/" target="_blank">中粮我买网</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://www.chenguangblog.com/" target="_blank">晨光博客</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://www.poboo.com/" target="_blank">poboo</a></dd>
							<dd><a href="http://www.tuolar.com/" target="_blank">拖拉网</a></dd>
							<dd><a href="http://www.maichawang.com/" target="_blank">买茶网</a></dd>
							<dd><a href="http://www.nvsheng.com/" target="_blank">女生闺蜜坊</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://www.q68.com/" target="_blank">丰胸方法</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://www.sahu.net/" target="_blank">啥狐女人网</a></dd>
							<dd><a href="http://www.meiguici.com/" target="_blank">玫瑰刺女性网</a></dd>
							<dd style="position: absolute; left: -4000px; "><a href="http://www.baixiangxiang.com/" target="_blank">白相相</a></dd>	
							<dd><a href="http://beauty.familydoctor.com.cn/" target="_blank">家庭医生美容</a></dd>						 
							<dd style="position: absolute; left: -4000px; "><a href="http://www.memejie.com/" target="_blank">服饰搭配</a></dd>						 
							<dd><a href="http://www.qianjiao.cn/" target="_blank">千娇女性网</a></dd>						 
				</dl>
			</div>
			<p class="cp">Copyright ©2011-2012 Guang.com, All Rights Reserved. 浙ICP备11008561-3</p>
		</div>
		<a id="returnTop" href="javascript:;" style="display: none; ">回到顶部</a>
		
	
	<script type="text/javascript">
		var photo = "";
		if(photo == ""){
			photo = "web/images/user/photo/avatar-50.png";
		}else{
			photo = "http://img.guang.com/"+photo;
		}
		GUANGER = { 
			userId:"",
			userPhoto:photo,
			nick:"",
			path:"",
			isBlack: "",
			checkInTotalScore: "", 
			checkInDays: "",
			referer : ""
		}
					
	</script>
	
	<script src="web/js/ui/jquery-1.6.4.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="web/js/ui/jquery.tools.min.js"></script>
	<script type="text/javascript" src="web/js/ui/localstorage.js?t=20120519.js"></script>
	<script type="text/javascript" src="web/js/ui/guang-min.js?t=20120519.js"></script>
	<script type="text/javascript" src="web/js/ui/shareGuang.js?t=20120519.js"></script>
	<script>
	<!--友情链接随机显示-->
	$(function() {	
		var friendlinks = $(".friendlinks dd")
		var randomlink = function(){
			var pickNum = Math.floor(friendlinks.length*Math.random());
			var pickOne = friendlinks.slice(pickNum,pickNum+1);
			friendlinks = friendlinks.not(pickOne[0]);
			return pickOne;
		}
		//将剩下的链接隐藏
		for(var i=0;i<12;i++){
			randomlink();
		}
		friendlinks.css({
			position:"absolute",left:"-4000px"
			});
	})
	
	//授权登录后关注逛逛弹出层
	function followGuang(site,flag,refresh){	
		var site = parseInt(site);
		if((site!=3 && site!=4 && site!=5) || flag || jQuery.cookie("noMoreTip")=="n"){
			if(refresh){
				window.location.reload();
			}
			return false;
		}
		var bdClass = "",
		frameHtml = "";
		if(site==3){
			bdClass = "sinaBd";
			frameHtml = '<iframe width="63" height="24" frameborder="0" allowtransparency="true" marginwidth="0" marginheight="0" scrolling="no" border="0" src="http://widget.weibo.com/relationship/followbutton.php?language=zh_cn&width=63&height=24&uid=2439301091&style=1&btn=red&dpc=1"></iframe>';
		}else if(site==4){
			bdClass = "qzoneBd";
			frameHtml = '<iframe src="http://open.qzone.qq.com/like?url=http%3A%2F%2Fuser.qzone.qq.com%2F2408899511&type=button&width=400&height=30&style=2" allowtransparency="true" scrolling="no" border="0" frameborder="0" style="width:65px;height:30px;border:none;overflow:hidden;"></iframe>';
		}else if(site==5){
			bdClass = "tencentBd";
			frameHtml = '<iframe src="http://follow.v.t.qq.com/index.php?c=follow&a=quick&name=iguang2011&style=5&t=1336569088774&f=0" frameborder="0" scrolling="auto" width="125" height="24" marginwidth="0" marginheight="0" allowtransparency="true"></iframe>';
		}
		if(!$("#followDialog")[0]){
			var html = '<div id="followDialog" class="g-dialog">';
			html +=	'<div class="dialog-content">';
			html +=	'<div class="hd"><h3></h3></div>';
			html +=	'<div class="bd clearfix '+bdClass+'">';
			html +=	'<div class="btnFrame">';
			html +=	frameHtml;		
			html +=	'</div>';
			html +=	'</div>';
			html +=	'<i></i>';
			html +=	'<label><input type="checkbox" class="check" name="noMore" />不再提示</label>';
			html +=	'<a class="close" href="javascript:;"></a>';
			html +=	'</div>';
			html +=	'</div>';
			$("body").append(html);
			if($("#loginDialog:visible")[0]){
				$("#loginDialog").empty().remove();
				$("#exposeMask").empty().remove();
			}
			$("#followDialog").overlay({
				top: 'center',
				mask: {
					color: '#000',
					loadSpeed: 200,
					opacity: 0.3
				},
				closeOnClick: false,
				load: true			
			});
			$("#followDialog").overlay().getClosers().bind("click",function(){
				if($("input[name=noMore]")[0].checked){
					jQuery.cookie("noMoreTip","n");
				}
				if(refresh){
					window.location.reload();
				}
			});
		}
		
	}
	</script>
	 
	 <script type="text/javascript" src="web/js/ui/shareGuang.js"></script>	
	 <script type="text/javascript" src="web/js/ui/jquery.pagination.js"></script>	
	<script type="text/javascript">
	var goodsPage = {
		sumGoodsNum : 5636,
		curPageNum : 1,
		pagePath : '',
		pageUrl : "/xihuan/"
	}
	
	jQuery(function() {	
		var curSubTag = jQuery(".J_CurDiv");
		jQuery(".sub-tag").css("height",curSubTag.outerHeight());
				jQuery.guang.goods.conf.colArray = [jQuery(".tag-book").outerHeight()+18,0,0,0];
			if(goodsPage.sumGoodsNum > 0){
			jQuery.guang.goods.conf.page = 2;
			jQuery.guang.goods.conf.ajaxData.bpage = "1";
			jQuery.guang.goods.conf.ajaxData.cateId = "";
			jQuery.guang.goods.conf.ajaxData.tagId = "";
			jQuery.guang.goods.conf.ajaxData.pubTime = "2012-05-23 10:15:00";
			jQuery.guang.goods.init();
		}
		if(jQuery(".sub-tag li").hasClass("on"))return;
		curSubTag.css("top",-curSubTag.outerHeight());
		setTimeout(function(){
		jQuery(".J_CurDiv").animate({
				top:"0px"
		},300)},300);
	})
	
	</script>
	<script type="text/javascript" src="web/js/ui/goods.js"></script>
	<%--<%@ include file="../inc/guide.jsp"%>
--%></body>
</html>
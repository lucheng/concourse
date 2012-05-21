<%@ page contentType="text/html; charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>SHOP++官方网站 - 网店系统|商城系统|独立网店|购物系统|开店程序|电子商务系统|网上开店|网上购物系统|网上商城系统</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<meta name="keywords" content="网店系统,商城系统,独立网店,购物系统,开店程序,电子商务系统,网上开店,网上购物系统,网上商城系统">
<meta name="description" content="SHOP++网店系统是基于JAVA技术的企业级电子商务管理软件，是国内最具影响力和技术实力的商城系统、网上商城系统、网上商店系统、独立网店系统、独立商城系统、购物系统、网上购物系统、开店系统、开店程序，为您打造最优秀的电子商务系统平台，是您网上开店的最佳选择。">
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link href="/template/common/css/base.css" rel="stylesheet" type="text/css">
<link href="/template/home/css/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/template/common/js/jquery.js"></script>
<script type="text/javascript" src="/template/common/js/jquery.tools.js"></script>
<script type="text/javascript" src="/template/home/js/index.js"></script>
<script type="text/javascript" src="/template/home/js/header.js"></script>
<script type="text/javascript" src="/template/home/js/friend_link.js"></script>
<!--[if lte IE 6]>
	<script type="text/javascript" src="/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
</head>
<body class="index">
<link href="/template/home/css/header.css" rel="stylesheet" type="text/css">
<div class="header">
	<div class="headerTop">
		<div class="headerLogo">
			<a href="/"><img src="/upload/image/logo.gif" title="SHOP++官方网站 - 网店系统|商城系统|独立网店|购物系统|开店程序|电子商务系统|网上开店|网上购物系统|网上商城系统"></a>
		</div>
		<span class="phoneTile">咨询热线：</span><span class="phone">400-000-7477</span>
		<a href="/license.html">
			<span class="certificateIcon">&nbsp;</span>授权查询
		</a>
		<a href="/service.html">
			<span class="serviceIcon">&nbsp;</span>客服中心
		</a>
		<a href="/help.html">
			<span class="helpIcon">&nbsp;</span>帮助中心
		</a>
	</div>
	<div class="headerNavigation belatedPNG">
		<ul>
				<li>
					<a href="/">首页</a>
				</li>
				<li>
					<a href="/home/article!list.action?id=402881862c3dca7d012c3dd91a760003">新闻中心</a>
				</li>
				<li>
					<a href="/download.html">产品下载</a>
				</li>
				<li>
					<a href="/business.html">商业购买</a>
				</li>
				<li>
					<a href="/home/article!list.action?id=402881862c3dca7d012c3ddbd3d90006">模板风格</a>
				</li>
				<li>
					<a href="/idc.html">商务合作</a>
				</li>
				<li>
					<a href="http://demo.shopxx.net" target="_blank">在线演示</a>
				</li>
		</ul>
		<a class="bbsNavigation" href="http://bbs.shopxx.net"></a>
		<form id="headerSearchForm" action="/home/article!search.action" method="get">
			<div class="searchFormText"><input type="text" id="headerSearchKeyword" name="pager.keyword" value="请输入搜索关键词"></div><input type="submit" class="searchFormButton" value="">
		</form>
	</div>
</div>	<div class="body">
		<div class="bodyLeft">
			<div class="slider">
				<div id="sliderScrollable" class="scrollable">
					<div class="items" style="left: -2136px; "><div class="cloned">
							<a href="/html/article_content/201011/alipay.html">
								<img src="/upload/image/banner3.jpg" alt="SHOP++携手支付通，共同打造在线支付便捷通道"> 							</a>
						</div>
						<div>
						        <a href="/html/article_content/201105/d039bfd015344c4c809177390478a6b7.html">
								<img src="/upload/image/banner_2011_5_23.jpg">
							</a>
						</div>
						<div>
							<a href="/html/article_content/201012/tenpay.html">
								<img src="/upload/image/banner2.jpg" alt="SHOP++携手财付通，打造优质支付通道"> 							</a>
						</div>
						<div>
							<a href="/html/article_content/201011/alipay.html">
								<img src="/upload/image/banner3.jpg" alt="SHOP++携手支付通，共同打造在线支付便捷通道"> 							</a>
						</div>
					<div class="cloned">
						        <a href="/html/article_content/201105/d039bfd015344c4c809177390478a6b7.html">
								<img src="/upload/image/banner_2011_5_23.jpg">
							</a>
						</div></div>
					<div class="navi"><a href="#0" class=""></a><a href="#1" class=""></a><a href="#2" class="active"></a></div>
					<div class="prevNext">
						<a class="prev browse left"></a>
						<a class="next browse right"></a>
					</div>
				</div>
			</div>
			<div class="blank"></div>
			<div class="about">
				<div class="left"></div>
				<div class="middle">
					<div class="productIcon belatedPNG"></div>
					<div class="description">
						SHOP++是基于JAVA技术的电子商务管理软件，以其安全稳定、强大易用、高效专业等优势赢得了用户的广泛好评。SHOP++为大、中、小企业提供一个安全、高效、强大的电子商务解决方案，协助企业快速构建、部署和管理其电子商务平台，拓展企业销售渠道，突显电子商务商业价值，致力于推动J2EE技术和电子商务技术的发展而不断努力。
					</div>
					<a href="/about.html" class="detail">详细介绍</a>
				</div>
				<div class="right"></div>
			</div>
			<div class="blank"></div>
			<div class="advantage">
				<div class="top">SHOP++<span class="icon"> </span>大优势 <span>Advantage</span></div>
				<div class="bottom">
					<table>
						<tbody><tr>
							<td class="left">
								<div class="openIcon belatedPNG" title="完全开源的网店系统"></div>
								<div class="content">
									<strong>开放源代码</strong>
									<p>开放源代码并提供完整注释，更好的满足您的二次开发需求</p>
								</div>
							</td>
							<td class="right">
								<div class="efficientIcon belatedPNG" title="高效稳定的商城系统"></div>
								<div class="content">
									<strong>高效稳定</strong>
									<p>采用HTML静态页面生成技术和多级缓存技术，使得系统的响应速度和负载能力大大提升</p>
								</div>
							</td>
						</tr>
						<tr>
							<td class="left">
								<div class="securityIcon belatedPNG" title="安全可靠的独立网店"></div>
								<div class="content">
									<strong>安全可靠</strong>
									<p>强大的管理权限控制机制，多重安全拦截保护技术，有效的保障您的数据和系统安全</p>
								</div>
							</td>
							<td class="right">
								<div class="transplantationIcon belatedPNG" title="跨平台/跨数据库的购物系统"></div>
								<div class="content">
									<strong>跨平台/数据库机制</strong>
									<p>强大的跨平台特性，让您的系统的部署更简单；特有的多数据库支持，让您的数据迁移不再困难</p>
								</div>
							</td>
						</tr>
						<tr>
							<td class="left">
								<div class="seoIcon belatedPNG" title="支持SEO优化设置的网购系统"></div>
								<div class="content">
									<strong>SEO优化</strong>
									<p>全站生成HTML静态页面搜索引擎收录更容易，强大的SEO设置使您的搜索排名更靠前</p>
								</div>
							</td>
							<td class="right">
								<div class="templateIcon belatedPNG" title="拥有强大的模板引擎的网店程序"></div>
								<div class="content">
									<strong>强大的模板引擎</strong>
									<p>采用MVC架构模式，强大的模板管理引擎，使得您在系统风格修改方面也能得心应手</p>
								</div>
							</td>
						</tr>
					</tbody></table>
				</div>
			</div>
			<div class="blank"></div>
			<div class="business">
				<div class="certificate">
					<div class="title" title="SHOP++网店系统商业授权">SHOP++商业授权</div>
					<div class="content">SHOP++商业运营授权许可证，经过认证后您将拥有商业授权用户身份，标识了用户商业运营的合法性</div>
				</div>
				<div class="service">
					<div class="title" title="SHOP++网店系统商业服务">SHOP++商业服务</div>
					<div class="content">SHOP++商业服务提供多项技术支持和定制服务，为用户网店的快速稳定发展提供更多保障</div>
				</div>
			</div>
		</div>
		<div class="bodyRight">
			<div class="contact">
				<div class="top"></div>
				<div class="middle">
					<ul>
						<li>
							咨询热线: <strong>400-000-7477</strong>
						</li>
						<li>
							<span>(周一至周六8:30 - 17:30)</span>
						</li>
						<li>
							客服邮箱: service@shopxx.net
						</li>
					</ul>
				</div>
				<div class="bottom"></div>
			</div>
			<div class="blank"></div>
			<div class="news">
				<div class="top">
					<a href="/home/article!list.action?id=402881862c3dca7d012c3ddb638b0004">活动公告</a>
				</div>
				<div class="middle">
					<ul>
							<li class="number1">
									<a href="/html/article_content/201204/07d773ffa2134e4ba6f120052fb70e38.html" title="五一放假通知" target="_blank">五一放假通知</a><span class="date">04-27</span>
							</li>
							<li class="number2">
									<a href="/html/article_content/201204/7bc07b02d2234b01903ac858d0e24230.html" title="SHOP++ '五一' 优惠活动" target="_blank">SHOP++ '五一' 优惠活动</a><span class="date">04-25</span>
							</li>
							<li class="number3">
									<a href="/html/article_content/201203/5fb4a027fcff484e9ad8ddce6d03313a.html" title="清明节放假通知" target="_blank">清明节放假通知</a><span class="date">03-26</span>
							</li>
							<li class="number4">
									<a href="/html/article_content/201201/9bb1da5e0c794e7ea46890777dfbf79f.html" title="SHOP++交流论坛全面更新" target="_blank">SHOP++交流论坛全面更新</a><span class="date">01-11</span>
							</li>
							<li class="number5">
									<a href="/html/article_content/201201/c0bf1640cb5d4f02ab906d4f11b69ef6.html" title="SHOP++交流论坛升级公告" target="_blank">SHOP++交流论坛升级公告</a><span class="date">01-09</span>
							</li>
							<li class="number6">
									<a href="/html/article_content/201112/b4ec7df5db7f494ca3595df93f5448b2.html" title="在线咨询服务变更通知" target="_blank">在线咨询服务变更通知</a><span class="date">12-30</span>
							</li>
					</ul>
				</div>
				<div class="bottom"></div>
			</div>
			<div class="blank"></div>
			<div class="news">
				<div class="top">
					<a href="/home/article!list.action?id=402881862c3dca7d012c3dd91a760003">新闻中心</a>
				</div>
				<div class="middle">
					<ul>
							<li class="number1">
									<a href="/html/article_content/201205/86105f5b672e4195b2171eccb48dbf59.html" title="腾讯一季度进账96亿 马化腾更像二次创业" target="_blank">腾讯一季度进账96亿 马化腾更像</a><span class="date">05-18</span>
							</li>
							<li class="number2">
									<a href="/html/article_content/201205/72d6541931454826bc35f411b78c0e03.html" title="2012谷歌Android系统仍将主导智能手机市场" target="_blank">2012谷歌Android系统仍</a><span class="date">05-18</span>
							</li>
							<li class="number3">
									<a href="/html/article_content/201205/e21177b459274afe84b1b190a565aec9.html" title="家电业春光乍泄：补贴265亿拉动销售2000亿" target="_blank">家电业春光乍泄：补贴265亿拉动</a><span class="date">05-18</span>
							</li>
							<li class="number4">
									<a href="/html/article_content/201205/84f8181192f04d9ea11982b99025e0d5.html" title="工信部副部长尚冰：全国3G用户达1.52亿" target="_blank">工信部副部长尚冰：全国3G用户达</a><span class="date">05-18</span>
							</li>
							<li class="number5">
									<a href="/html/article_content/201205/32956e8030334da48942757432dfa619.html" title="电子发票试点月底前启动申报 电商成本加大" target="_blank">电子发票试点月底前启动申报 电商</a><span class="date">05-17</span>
							</li>
							<li class="number6">
									<a href="/html/article_content/201205/4d4a8370efad4ebb9ab45963da5a9470.html" title="腾讯明日公布架构调整 核心战略直指移动互联网" target="_blank">腾讯明日公布架构调整 核心战略直</a><span class="date">05-17</span>
							</li>
							<li class="number7">
									<a href="/html/article_content/201205/e97c620dabfa4308841fd6cc6e4d704e.html" title="互联网“右脑化”：女人主导的感性新王国" target="_blank">互联网“右脑化”：女人主导的感性</a><span class="date">05-17</span>
							</li>
							<li class="number8">
									<a href="/html/article_content/201205/8eb11099312b4d299ef58a4f6dcee27f.html" title="天猫当当升级配送服务 物流或成电商终极战场" target="_blank">天猫当当升级配送服务 物流或成电</a><span class="date">05-16</span>
							</li>
					</ul>
				</div>
				<div class="bottom"></div>
			</div>
			<div class="blank"></div>
			<div class="news">
				<div class="top">
					<a href="/home/article!list.action?id=402881862c3dca7d012c3ddca6aa0007">开店指南</a>
				</div>
				<div class="middle">
					<ul>
							<li class="number1">
									<a href="/html/article_content/201205/6125b67088584c639fb611c45af6d53a.html" title="多购模式引来2千万美元融资 电商或将进入新纪元" target="_blank">多购模式引来2千万美元融资 电商</a><span class="date">05-18</span>
							</li>
							<li class="number2">
									<a href="/html/article_content/201205/00a181c69beb46da8677862d941e5542.html" title="中国电信称已在南方21省普遍覆盖8M带宽接入" target="_blank">中国电信称已在南方21省普遍覆盖</a><span class="date">05-18</span>
							</li>
							<li class="number3">
									<a href="/html/article_content/201205/384d65bb666e432eb92065e9e0ae7746.html" title="腾讯重组分拆电商业务 或欲打造中国版亚马逊" target="_blank">腾讯重组分拆电商业务 或欲打造中</a><span class="date">05-18</span>
							</li>
							<li class="number4">
									<a href="/html/article_content/201205/8890f06ebb8a49b0ba7e7bacee1a2354.html" title="中国成全球最大智能手机市场 发货量超过美国" target="_blank">中国成全球最大智能手机市场 发货</a><span class="date">05-17</span>
							</li>
							<li class="number5">
									<a href="/html/article_content/201205/fb7a03cff51441aea1d0c4044ba32204.html" title="联通20元3G套餐卡今日开售 电商渠道转型加速" target="_blank">联通20元3G套餐卡今日开售 电</a><span class="date">05-17</span>
							</li>
							<li class="number6">
									<a href="/html/article_content/201205/12675728b23e449eb658dc9276e92a62.html" title="当当网向一淘开放数据 接入一账通支持全网比价" target="_blank">当当网向一淘开放数据 接入一账通</a><span class="date">05-16</span>
							</li>
							<li class="number7">
									<a href="/html/article_content/201205/471ade43857d43028e6eff1eba758365.html" title="互联网企业“混战”低价智能机" target="_blank">互联网企业“混战”低价智能机</a><span class="date">05-16</span>
							</li>
							<li class="number8">
									<a href="/html/article_content/201205/2d714eb2902d4a598d3e446b460eecd6.html" title="苹果联合创始人：无论价格多高都会买Facebook股票" target="_blank">苹果联合创始人：无论价格多高都会</a><span class="date">05-15</span>
							</li>
					</ul>
				</div>
				<div class="bottom"></div>
			</div>
		</div>
		<script type="text/javascript">
			eval(unescape('document.write%28%27%3Cdiv%20style%3D%22display%3A%20none%22%3E%27%29%3B'));
		</script><div style="display: none">
		<div id="shopKeywords">
			<ul>
				<li>
					<a href="/home/article!list.action?id=2fe680f62c85a54d012c8758b7f2000a"><strong>名词解释：</strong></a>
				</li>
					<li>
						<h1>
							<a href="/html/article_content/201101/331e353dff1948c79e66657c91e87f99.html" title="网上开店" target="_blank"><strong>网上开店</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201101/018b75d576514aac81b98afcc99e92e8.html" title="网上商城系统" target="_blank"><strong>网上商城系统</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/5d389cfc78934a579e1a9478cbb1c059.html" title="网店程序" target="_blank"><strong>网店程序</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/1d59635614774aee8b7e7f3383caf31f.html" title="B2C系统" target="_blank"><strong>B2C系统</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/d0c81e564bb143c3acb9bb4a555d1bf6.html" title="商城系统" target="_blank"><strong>商城系统</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/f58625a22207430a97758732b5fa9257.html" title="购物系统" target="_blank"><strong>购物系统</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/816675f258b64970bad42e62082fb39b.html" title="开店程序" target="_blank"><strong>开店程序</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/e789e5e372404f07ab6291a9ad5073a5.html" title="网购系统" target="_blank"><strong>网购系统</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/3802590356634b5e80ee4887ba5a7be1.html" title="电子商务系统" target="_blank"><strong>电子商务系统</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/4c095edbafbf440997f223ee95af9932.html" title="独立网店" target="_blank"><strong>独立网店</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/60a0a85bbbda4613b1b5e76d375f181e.html" title="网上商城" target="_blank"><strong>网上商城</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/6d0aebbe212a418a8fd84d71ae721477.html" title="电子商务" target="_blank"><strong>电子商务</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/0f68770be379477c9a83ef2a66542325.html" title="网上购物系统" target="_blank"><strong>网上购物系统</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/d232842d8d5b41ada1b16e24dd168f94.html" title="网店模板" target="_blank"><strong>网店模板</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/fb42232005f04b7f9bdc8bf4006cc1df.html" title="开源网店系统" target="_blank"><strong>开源网店系统</strong></a>
						</h1>
					</li>
					<li>
						<h1>
							<a href="/html/article_content/201011/ac564fceb4314c69a552edc38eff60c1.html" title="网店" target="_blank"><strong>网店</strong></a>
						</h1>
					</li>
				<li>
					<a href="/home/article!list.action?id=2fe680f62c85a54d012c8758b7f2000a"><strong>更多</strong></a>
				</li>
			</ul>
		</div>
		<script type="text/javascript">var yctouProtocol = (("https:" == document.location.protocol) ? "https://" : "http://");document.write(unescape("%3Cscript src='" + yctouProtocol + "www.oray.com/yctou/yctou.php?style=3' type='text/javascript'%3E%3C/script%3E"));</script><script src="http://www.oray.com/yctou/yctou.php?style=3" type="text/javascript"></script><a href="http://www.oray.com/yctou/" target="_blank"><img src="http://www.oray.com/yctou/icon/icon_3.gif" style="border:none"></a>
		<script type="text/javascript">
			eval(unescape('document.write%28%22%3C/div%3E%22%29%3B'));
		</script></div>
		<div class="blank"></div>
<link href="/template/home/css/friend_link.css" type="text/css" rel="stylesheet">
<div class="friendLink">
	<div class="pictureFriendLink">
		<div class="left prev disabled"></div>
		<div id="pictureFriendLinkScrollable" class="middle scrollable">
			<ul class="items">
					<li>
						<a href="http://demo.shopxx.net" target="_blank" title="SHOP++体验商城" style="opacity: 0.5; ">
							<img src="/upload/image/db0758b985b24e2f936e5a279d702b62.png">
						</a>
					</li>
					<li>
						<a href="http://www.shopxx.net" target="_blank" title="淘宝网" style="opacity: 0.5; ">
							<img src="/upload/image/802391020b7d4ecd9a442d89569e4b32.png">
						</a>
					</li>
					<li>
						<a href="http://www.shopxx.net" target="_blank" title="快钱" style="opacity: 0.5; ">
							<img src="/upload/image/e031800c927440da85e19a879b2ff2e3.gif">
						</a>
					</li>
					<li>
						<a href="http://www.shopxx.net" target="_blank" title="支付宝" style="opacity: 0.5; ">
							<img src="/upload/image/aee40e6e802844ac9f1298d55f25b7ac.png">
						</a>
					</li>
					<li>
						<a href="http://www.shopxx.net" target="_blank" title="财付通" style="opacity: 0.5; ">
							<img src="/upload/image/563e652d5d61444aa5e53910fb876269.png">
						</a>
					</li>
					<li>
						<a href="http://www.shopxx.net" target="_blank" title="腾讯网" style="opacity: 0.5; ">
							<img src="/upload/image/42a5edb5185f42ceb4467752203f411e.png">
						</a>
					</li>
					<li>
						<a href="http://www.shopxx.net" target="_blank" title="手机支付" style="opacity: 0.5; ">
							<img src="/upload/image/d31dccedee60496d9d3f61394d0b9482.gif">
						</a>
					</li>
			</ul>
		</div>
		<div class="right next"></div>
	</div>
	<div class="textFriendLink">
		<div class="left"></div>
		<div class="middle">
			<ul>
					<li>
						<a href="http://demo.shopxx.net" target="_blank" title="SHOP++体验商城">SHOP++体验商城</a>
					</li>
					<li>
						<a href="http://bbs.shopxx.net" target="_blank" title="SHOP++官方论坛">SHOP++官方论坛</a>
					</li>
					<li>
						<a href="http://www.17daili.com" target="_blank" title="网店代理货源网">网店代理货源网</a>
					</li>
					<li>
						<a href="http://www.lapss.com" target="_blank" title="商城系统">商城系统</a>
					</li>
					<li>
						<a href="http://www.hxsk.net" target="_blank" title="遮天">遮天</a>
					</li>
					<li>
						<a href="http://www.shopxx.net" target="_blank" title="中国工商银行">中国工商银行</a>
					</li>
					<li>
						<a href="http://www.shopxx.net" target="_blank" title="中国建设银行">中国建设银行</a>
					</li>
					<li>
						<a href="http://www.shopxx.net" target="_blank" title="支付宝">支付宝</a>
					</li>
					<li>
						<a href="http://www.shopxx.net" target="_blank" title="财付通">财付通</a>
					</li>
					<li>
						<a href="http://b.qq.com/" target="_blank" title="腾讯企业QQ">腾讯企业QQ</a>
					</li>
					<li>
						<a href="http://www.shopxx.net" target="_blank" title="快钱">快钱</a>
					</li>
			</ul>
		</div>
		<div class="right"></div>
	</div>
</div>	</div>
	<div class="blank"></div>
<link href="/template/home/css/footer.css" type="text/css" rel="stylesheet">
<div class="footer">
	<div class="footerInfo">
		<ul>
			<li><a href="/about.html">产品介绍</a> | </li>
			<li><a href="/company.html">公司简介</a> | </li>
			<li><a href="/contact.html">联系我们</a> | </li>
			<li><a href="/hr.html">诚聘英才</a> | </li>
			<li><a href="/pay.html">支付方式</a> | </li>
			<li><a href="/legal.html">法律声明</a> | </li>
			<li><a href="/license/">许可协议</a> | </li>
			<li><a href="/link.html">友情链接</a></li>
		</ul>
		<p>ICP备案许可证号: 湘ICP备10003747号&nbsp;&nbsp;&nbsp;&nbsp;Copyright 2011 SHOP++. All Rights Reserved.   长沙鼎诚软件有限公司</p>
		<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F96cff931eaf40ae9073c5935cb9ae3b3' type='text/javascript'%3E%3C/script%3E"));
		</script><script src=" http://hm.baidu.com/h.js?96cff931eaf40ae9073c5935cb9ae3b3" type="text/javascript"></script>
		<span style="display: none;">
			<script type="text/javascript">
				var locationUrl = escape(document.location.href);     document.write(unescape("%3Cscript")+" charset='utf-8' src='http://union.rising.com.cn//InfoManage/TrojanInspect.aspx?p1=N2PmKkcKwdKdHNynIYMiCzO1ARPSeGLH&p2=R9CB3KuISh4=&p3=N2PmKkcKwdKdHNynIYMiCxS3Cb5M9fu4&url="+ locationUrl  + "' type='text/javascript'"+unescape("%3E%3C/script%3E"));
			</script><script charset="utf-8" src="http://union.rising.com.cn//InfoManage/TrojanInspect.aspx?p1=N2PmKkcKwdKdHNynIYMiCzO1ARPSeGLH&amp;p2=R9CB3KuISh4=&amp;p3=N2PmKkcKwdKdHNynIYMiCxS3Cb5M9fu4&amp;url=http%3A//www.shopxx.net/" type="text/javascript"></script><a target="_blank" href="http://union.rising.com.cn/InfoManage/attestation.aspx?p0=N2PmKkcKwdKdHNynIYMiCzO1ARPSeGLH"><img src="http://union.rising.com.cn/images/tdflagx1.gif" alt="您访问的网站目前没有发现被挂马行为" title="您访问的网站目前没有发现被挂马行为" style="border:0px;"></a>
		</span>
		<p>
			<a href="http://www.51honest.org/fiveIndex.credit?action=preLevel&amp;creditCode=9992324110143099" target="_blank">
				<img src="/upload/image/51honest.gif" alt="国家商务部授权预评级">
			</a>
			<a href="http://open.soft.360.cn/zhengshu.htm?id=140281" target="_blank">
				<img src="/upload/image/360.gif" alt="360软件安全认证">
			</a>
			<a href="http://union.rising.com.cn/InfoManage/attestation.aspx?p0=N2PmKkcKwdKdHNynIYMiCzO1ARPSeGLH" target="_blank">
				<img src="/upload/image/rising.gif" alt="瑞星云安全网站联盟认证">
			</a>
			<a href="http://net.china.com.cn" target="_blank">
				<img src="/upload/image/china.gif" alt="中国互联网违法和不良信息举报中心">
			</a>
		</p>
	</div>
</div>
<script type="text/javascript" src="http://static.b.qq.com/account/bizqq/js/wpa.js?type=13&amp;kfuin=4000007477&amp;ws=www.shopxx.net&amp;title=&amp;cot1=%E5%91%A8%E4%B8%80%20%E8%87%B3%20%E5%91%A8%E5%85%AD%0A08%3A30%20-%2017%3A30&amp;btn1=%E7%AB%8B%E5%88%BB%E5%92%A8%E8%AF%A2&amp;fsty=0&amp;fposX=2&amp;fposY=1&amp;tx=2&amp;aty=0&amp;a=" tag="isInit"></script><div style="z-index: 88888888; left: auto; right: 8px; margin-left: 0px; bottom: auto; position: absolute; margin-top: 0px; display: block; top: 177.5px; "><iframe id="__WPA_Iframe__" frameborder="0" scrolling="no" width="138" height="320" src="http://static.b.qq.com/account/bizqq/wpa/wpa_b04.html?type=13&amp;kfuin=4000007477&amp;ws=www.shopxx.net&amp;title=&amp;cot1=%E5%91%A8%E4%B8%80%20%E8%87%B3%20%E5%91%A8%E5%85%AD%0A08%3A30%20-%2017%3A30&amp;btn1=%E7%AB%8B%E5%88%BB%E5%92%A8%E8%AF%A2&amp;fsty=0&amp;fposX=2&amp;fposY=1&amp;tx=2&amp;aty=0&amp;a="></iframe><div id="__WPA_CLOSEBTN__" style="display: block; width: 39px; height: 18px; position: absolute; top: 6px; right: 10px; cursor: pointer; "></div></div>
</body></html>
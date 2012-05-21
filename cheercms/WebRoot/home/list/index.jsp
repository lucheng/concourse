<%@ page contentType="text/html; charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>电脑整机 商品列表 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<link href="<%=path%>/shop/css/base.css" rel="stylesheet" type="text/css">
<link href="<%=path%>/shop/css/shop.css" rel="stylesheet" type="text/css">
<!--[if lte IE 6]>
	<script type="text/javascript" src="/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
</head>
<body class="goodsList">
<div id="header" class="header belatedPNG">
	<div class="headerTop belatedPNG">
		<div class="headerTopContent">
			<div class="headerLoginInfo">
				您好<span id="headerLoginMemberUsername"></span>, 欢迎来到SHOP++演示商城!
				<a href="javascript: void(0);" id="headerShowLoginWindow" style="display: inline; ">登录</a>
				<a href="/shop/member_center!index.action" id="headerMemberCenter" style="display: none; ">会员中心</a>
				<a href="javascript: void(0);" id="headerShowRegisterWindow" style="display: inline; ">注册</a>
				<a href="/shop/member!logout.action" id="headerLogout" style="display: none; ">[退出]</a>
			</div>
			<div class="headerTopNav">
						<a href="javascript: addFavorite('http://localhost','SHOP++演示商城')">收藏本站
						</a>
						|
						<a href="/shop/article_list/about_us.htm">关于我们
						</a>
						|
						<a href="/shop/article_list/help.htm">帮助中心
						</a>
						|
						<a href="http://bbs.shopxx.net" target="_blank">SHOP++论坛
						</a>
						|
						<a href="http://www.shopxx.net" target="_blank">SHOP++网站
						</a>
						
			</div>
		</div>
	</div>
	<div class="headerMiddle">
		<div class="headerInfo">
				7×24小时服务热线: <strong>400-8888888</strong>
		</div>
		<div class="headerLogo">
			<a href="/"><img class="belatedPNG" src="<%=path %>/shop/images/logo.jpg" alt="SHOP++演示商城"></a>
		</div>
		<div class="headerSearch belatedPNG">
			<form id="goodsSearchForm" action="/shop/goods!search.action" method="post">
				<div class="headerSearchText">
					<input type="text" id="goodsSearchKeyword" name="pager.keyword" value="请输入关键词...">
				</div>
				<input type="submit" class="headerSearchButton" value="">
				<div class="hotKeyword">
					热门关键词: 
						<a href="/shop/goods!search.action?pager.keyword=%E8%8B%B9%E6%9E%9C">苹果</a>
						<a href="/shop/goods!search.action?pager.keyword=%E6%9D%BE%E4%B8%8B">松下</a>
						<a href="/shop/goods!search.action?pager.keyword=%E7%B4%A2%E5%B0%BC">索尼</a>
						<a href="/shop/goods!search.action?pager.keyword=%E4%B8%89%E6%98%9F">三星</a>
						<a href="/shop/goods!search.action?pager.keyword=%E8%AF%BA%E5%9F%BA%E4%BA%9A">诺基亚</a>
						<a href="/shop/goods!search.action?pager.keyword=%E6%B5%B7%E5%B0%94">海尔</a>
						<a href="/shop/goods!search.action?pager.keyword=%E6%83%A0%E6%99%AE">惠普</a>
						<a href="/shop/goods!search.action?pager.keyword=%E4%B8%9C%E8%8A%9D">东芝</a>
						<a href="/shop/goods!search.action?pager.keyword=LG">LG</a>
						<a href="/shop/goods!search.action?pager.keyword=%E8%81%94%E6%83%B3">联想</a>
				</div>
			</form>
		</div>
	</div>
	<div class="headerBottom">
		<input type="button" class="cartItemListButton" value="" onclick="window.open('/shop/cart_item!list.action')">
		<input type="button" class="orderButton" value="" onclick="window.open('/shop/cart_item!list.action')">
		<div class="headerMiddleNav">
			<div class="headerMiddleNavLeft belatedPNG"></div>
			<ul class="headerMiddleNavContent belatedPNG">
						<li>
							<a href="/">首页
							</a>
						</li>
						<li>
							<a href="/shop/goods_list/office_computer.htm">电脑办公
							</a>
						</li>
						<li>
							<a href="/shop/goods_list/mobile_digita.htm">手机数码
							</a>
						</li>
						<li>
							<a href="/shop/goods_list/fashion_video.htm">时尚影音
							</a>
						</li>
						<li>
							<a href="/shop/goods_list/home_appliances.htm">家用电器
							</a>
						</li>
						<li>
							<a href="/shop/article_list/help.htm">帮助中心
							</a>
						</li>
						<li>
							<a href="/shop/leave_message.htm">在线留言
							</a>
						</li>
			</ul>
			<div class="headerMiddleNavRight belatedPNG"></div>
		</div>
	</div>
</div>	<div class="body">
		<div class="bodyLeft">
			<div class="goodsCategory">
            	<div class="top">商品分类</div>
            	<div class="middle">
            		<ul id="goodsCategoryMenu" class="menu">
	            				<li class="mainCategory">
									<a href="/shop/goods_list/office_computer.htm">电脑办公</a>
								</li>
										<li>
											<a href="/shop/goods_list/computer_circcity.htm">
												<span class="icon">&nbsp;</span>电脑整机
											</a>
										</li>
										<li>
											<a href="/shop/goods_list/computer_accessories.htm">
												<span class="icon">&nbsp;</span>电脑配件
											</a>
										</li>
										<li>
											<a href="/shop/goods_list/office_equipment.htm">
												<span class="icon">&nbsp;</span>办公设备
											</a>
										</li>
										<li>
											<a href="/shop/goods_list/office_fallen.htm">
												<span class="icon">&nbsp;</span>办公耗材
											</a>
										</li>
	            				<li class="mainCategory">
									<a href="/shop/goods_list/mobile_digita.htm">手机数码</a>
								</li>
										<li>
											<a href="/shop/goods_list/mobile_communication.htm">
												<span class="icon">&nbsp;</span>手机通讯
											</a>
										</li>
										<li>
											<a href="/shop/goods_list/mobile_phone_accessories.htm">
												<span class="icon">&nbsp;</span>手机配件
											</a>
										</li>
										<li>
											<a href="/shop/goods_list/digital_imaging.htm">
												<span class="icon">&nbsp;</span>数码影像
											</a>
										</li>
										<li>
											<a href="/shop/goods_list/digital_accessories.htm">
												<span class="icon">&nbsp;</span>数码配件
											</a>
										</li>
	            				<li class="mainCategory">
									<a href="/shop/goods_list/fashion_video.htm">时尚影音</a>
								</li>
										<li>
											<a href="/shop/goods_list/mp3mp4.htm">
												<span class="icon">&nbsp;</span>MP3/MP4
											</a>
										</li>
										<li>
											<a href="/shop/goods_list/apple_accessories.htm">
												<span class="icon">&nbsp;</span>苹果配件
											</a>
										</li>
										<li>
											<a href="/shop/goods_list/audio_instruments.htm">
												<span class="icon">&nbsp;</span>音频乐器
											</a>
										</li>
										<li>
											<a href="/shop/goods_list/electronic_dictionary.htm">
												<span class="icon">&nbsp;</span>电子词典
											</a>
										</li>
					</ul>
            	</div>
                <div class="bottom"></div>
			</div>
			<div class="blank"></div>
			<div class="hotGoods">
				<div class="top">热销排行</div>
				<div class="middle">
					<ul>
								<li class="number1">
									<span class="icon">&nbsp;</span>
									<a href="<%=path%>/shop/imsges/98969b4400b14a0ba8b1c13190b2d20d.html" title="苹果 MacBook Air MC504CH/A">苹果 MacBook Air MC504CH...</a>
								</li>
								<li class="number2">
									<span class="icon">&nbsp;</span>
									<a href="<%=path%>/shop/images/5b234054ff9a43bc9551d40ac475c826.html" title="三星 NP-RV520-S01CN">三星 NP-RV520-S01CN</a>
								</li>
								<li class="number3">
									<span class="icon">&nbsp;</span>
									<a href="<%=path%>/shop/images/18da31776b5e4fcaaf25cac1b080cb0a.html" title="戴尔 Inspiron 13R">戴尔 Inspiron 13R</a>
								</li>
								<li class="number4">
									<span class="icon">&nbsp;</span>
									<a href="<%=path%>/shop/images/38f00f0a26694a5290c62e66782fa1be.html" title="联想 Y560D">联想 Y560D</a>
								</li>
					</ul>
				</div>
				<div class="bottom"></div>
			</div>
			<div class="blank"></div>
			<div id="goodsHistory" class="goodsHistory">
				<div class="top">浏览记录</div>
				<div class="middle">
					<ul id="goodsHistoryListDetail"></ul>
				</div>
				<div class="bottom"></div>
			</div>
		</div>
		<div class="bodyRight">
			<form id="goodsListForm" action="/shop/goods_list/computer_circcity.htm" method="post">
				<input type="hidden" name="id" value="4028918130316046013031b32d720011">
				<input type="hidden" id="viewType" name="viewType" value="pictureType">
				<input type="hidden" id="pageNumber" name="pager.pageNumber" value="1">
				<input type="hidden" id="brandId" name="brand.id" value="">
				<div class="listBar">
					<div class="left"></div>
					<div class="middle">
						<div class="path">
							<a href="/" class="shop"><span class="icon">&nbsp;</span>首页</a> &gt;
								<a href="/shop/goods_list/office_computer.htm">电脑办公</a> &gt;
								<a href="/shop/goods_list/computer_circcity.htm">电脑整机</a> &gt;
						</div>
						<div class="total">共计: 12 款商品</div>
					</div>
					<div class="right"></div>
				</div>
					<div class="blank"></div>
					<div id="filter" class="filter">
							<dl>
								<dt>商品分类: </dt>
								<dd>
									<div>
										<a href="/shop/goods_list/computer_circcity.htm" class="current">全部</a>
									</div>
										<div>
											<a href="/shop/goods_list/tablet_personal_computer.htm">平板电脑</a>
										</div>
										<div>
											<a href="/shop/goods_list/portable_computer.htm">笔记本</a>
										</div>
										<div>
											<a href="/shop/goods_list/desktop_computer.htm">台式机</a>
										</div>
										<div>
											<a href="/shop/goods_list/servers.htm">服务器</a>
										</div>
								</dd>
							</dl>
						<div class="clear"></div>
					</div>
				<div class="blank"></div>
				<div class="operateBar">
					<div class="left"></div>
					<div class="middle">
						<span class="tableIcon">&nbsp;</span><a id="tableType" class="tableType" href="#">列表</a>
						<span class="pictureDisabledIcon">&nbsp;</span>图片
						<span class="separator">&nbsp;</span>
						<select id="orderType" name="orderType">
							<option value="default">默认排序</option>
							<option value="priceAsc">价格从低到高</option>
							<option value="priceDesc">价格从高到低</option>
							<option value="dateAsc">按上架时间排序</option>
	                    </select>
	                    <span class="separator">&nbsp;</span> 显示数量: 
						<select name="pager.pageSize" id="pageSize">
							<option value="12">
								12
							</option>
							<option value="20" selected="selected">
								20
							</option>
							<option value="60">
								60
							</option>
							<option value="120">
								120
							</option>
						</select>
					</div>
					<div class="right"></div>
				</div>
				<div class="blank"></div>
				<div class="goodsPictureList">
					<ul class="goodsListDetail">
							<li>
								<a href="<%=path%>/shop/images/000f24dab0804470974a154900a94b5d.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/66fdf3ee55514149bd4095c178de1089.jpg" alt="摩托罗拉MZ606">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/000f24dab0804470974a154900a94b5d.html" alt="摩托罗拉MZ606" target="_blank">
										摩托罗拉MZ606
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥5180.00元</span>
											<span class="marketPrice">￥6216.00元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/000f24dab0804470974a154900a94b5d.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="402891813033eec501303469394e0001" hidefocus="">
									</div>
								</div>
							</li>
							<li>
								<a href="<%=path%>/shop/images/3b3c9b0f235b469885c6c0b4665caa03.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/f2963d187c3749888caa8f1481cb1845.jpg" alt="苹果ipad 4代">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/3b3c9b0f235b469885c6c0b4665caa03.html" alt="苹果ipad 4代" target="_blank">
										苹果ipad 4代
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥4500.00元</span>
											<span class="marketPrice">￥5400.00元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/3b3c9b0f235b469885c6c0b4665caa03.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="40289181303478af013034af303e0017" hidefocus="">
									</div>
								</div>
							</li>
							<li>
								<a href="<%=path%>/shop/images/01065a4e46fa44a79af00514c497daa3.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/1e76a6ae7d044443af75dc36a5d89afa.jpg" alt="三星P1000 GALAXY">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/01065a4e46fa44a79af00514c497daa3.html" alt="三星P1000 GALAXY" target="_blank">
										三星P1000 GALAXY
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥3980.00元</span>
											<span class="marketPrice">￥4776.00元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/01065a4e46fa44a79af00514c497daa3.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="40289181303478af013034be14700027" hidefocus="">
									</div>
								</div>
							</li>
							<li class="end">
								<a href="<%=path%>/shop/images/beff02f06ad9454aa925e4a86d1d1389.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/5fdacad7d3e64dff9b78e99608983c7f.jpg" alt="汉王 TouchPad">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/beff02f06ad9454aa925e4a86d1d1389.html" alt="汉王 TouchPad" target="_blank">
										汉王 TouchPad
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥5100.00元</span>
											<span class="marketPrice">￥6120.00元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/beff02f06ad9454aa925e4a86d1d1389.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="40289181303478af013034c8a8700030" hidefocus="">
									</div>
								</div>
							</li>
							<li>
								<a href="<%=path%>/shop/images/cdd9372b40ac4730854a5478d44701ce.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/48aec23f7c7841cbb32e589ba0ca7f48.jpg" alt="联想 新圆梦F318">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/cdd9372b40ac4730854a5478d44701ce.html" alt="联想 新圆梦F318" target="_blank">
										联想 新圆梦F318
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥3999.00元</span>
											<span class="marketPrice">￥0.00元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/cdd9372b40ac4730854a5478d44701ce.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="40289181303478af0130356d7c390045" hidefocus="">
									</div>
								</div>
							</li>
							<li>
								<a href="<%=path%>/shop/images/04fccfe751754d99a82e9d52825bef24.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/e2d955b235364aca80d29cd9349aed88.jpg" alt="惠普 CQ3300CX">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/04fccfe751754d99a82e9d52825bef24.html" alt="惠普 CQ3300CX" target="_blank">
										惠普 CQ3300CX
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥2999.00元</span>
											<span class="marketPrice">￥3598.80元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/04fccfe751754d99a82e9d52825bef24.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="40289181303478af0130357b1c50004c" hidefocus="">
									</div>
								</div>
							</li>
							<li>
								<a href="<%=path%>/shop/images/d8308e45574741dfad5bf9d80faf6e91.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/68bc2b19f39c411aa042802be37f5117.jpg" alt="戴尔 V230SR-456">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/d8308e45574741dfad5bf9d80faf6e91.html" alt="戴尔 V230SR-456" target="_blank">
										戴尔 V230SR-456
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥3600.00元</span>
											<span class="marketPrice">￥4320.00元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/d8308e45574741dfad5bf9d80faf6e91.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="40289181303478af0130358206e10050" hidefocus="">
									</div>
								</div>
							</li>
							<li class="end">
								<a href="<%=path%>/shop/images/2ab83ffc384849ec8210a9887d6db686.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/3440939579404cb3a989425fed09e706.jpg" alt="宏碁 AM3660">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/2ab83ffc384849ec8210a9887d6db686.html" alt="宏碁 AM3660" target="_blank">
										宏碁 AM3660
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥5999.00元</span>
											<span class="marketPrice">￥7198.80元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/2ab83ffc384849ec8210a9887d6db686.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="40289181303478af01303589c2190052" hidefocus="">
									</div>
								</div>
							</li>
							<li>
								<a href="<%=path%>/shop/images/38f00f0a26694a5290c62e66782fa1be.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/556f44fec7934b37adaeda5c2880d4f9.jpg" alt="联想 Y560D">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/38f00f0a26694a5290c62e66782fa1be.html" alt="联想 Y560D" target="_blank">
										联想 Y560D
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥6999.00元</span>
											<span class="marketPrice">￥8398.80元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/38f00f0a26694a5290c62e66782fa1be.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="40289181303478af0130359a0f42005b" hidefocus="">
									</div>
								</div>
							</li>
							<li>
								<a href="<%=path%>/shop/images/18da31776b5e4fcaaf25cac1b080cb0a.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/3f55d96c7c9d46a6933020125440c75d.jpg" alt="戴尔 Inspiron 13R">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/18da31776b5e4fcaaf25cac1b080cb0a.html" alt="戴尔 Inspiron 13R" target="_blank">
										戴尔 Inspiron 13R
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥4999.00元</span>
											<span class="marketPrice">￥5998.80元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/18da31776b5e4fcaaf25cac1b080cb0a.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="40289181303478af013035a454000061" hidefocus="">
									</div>
								</div>
							</li>
							<li>
								<a href="<%=path%>/shop/images/5b234054ff9a43bc9551d40ac475c826.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/505730b3adf6450e8b481265a201f6c6.jpg" alt="三星 NP-RV520-S01CN">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/5b234054ff9a43bc9551d40ac475c826.html" alt="三星 NP-RV520-S01CN" target="_blank">
										三星 NP-RV520-S01CN
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥5999.00元</span>
											<span class="marketPrice">￥7198.80元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/5b234054ff9a43bc9551d40ac475c826.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="40289181303478af013035a881d80065" hidefocus="">
									</div>
								</div>
							</li>
							<li class="end">
								<a href="<%=path%>/shop/images/98969b4400b14a0ba8b1c13190b2d20d.html" class="goodsImage" target="_blank">
									<img src="<%=path%>/shop/images/f8152caf7a054092a2c3f3b48bc783b6.jpg" alt="苹果 MacBook Air MC504CH/A">
								</a>
								<div class="goodsTitle">
									<a href="<%=path%>/shop/images/98969b4400b14a0ba8b1c13190b2d20d.html" alt="苹果 MacBook Air MC504CH/A" target="_blank">
										苹果 MacBook Air MC504CH
									</a>
								</div>
								<div class="goodsBottom">
									<div class="goodsPrice">
										<span class="price">￥12999.00元</span>
											<span class="marketPrice">￥15598.80元</span>
									</div>
									<div class="buttonArea">
										<a href="<%=path%>/shop/images/98969b4400b14a0ba8b1c13190b2d20d.html" class="addCartItemButton">购买</a>
										<input type="button" class="addFavoriteButton addFavorite" value="收藏" goodsid="40289181303478af013035b990d2006c" hidefocus="">
									</div>
								</div>
							</li>
					</ul>
					<div class="blank"></div>
				</div>
			</form>
		</div>
		<div class="blank"></div>
<div id="friendLink" class="friendLink">
	<div class="pictureFriendLink">
		<div class="left"></div>
		<div class="middle">
			<ul>
										<li>
							<a href="http://www.shopxx.net" title="SHOP++官方网站" target="_blank">
								<img src="<%=path%>/shop/images/1a1b183f3c124b2dae0e9d83818628d9.png">
							</a>
						</li>
						<li>
							<a href="https://www.tenpay.com" title="财付通" target="_blank">
								<img src="<%=path%>/shop/images/64f5f4313c834b1caa7181deda4075c1.gif">
							</a>
						</li>
						<li>
							<a href="https://cmpay.10086.cn" title="手机支付" target="_blank">
								<img src="<%=path%>/shop/images/a52ee3e2af9c46fda95127a4029bdaa0.gif">
							</a>
						</li>
						<li>
							<a href="http://www.icbc.com.cn" title="中国工商银行" target="_blank">
								<img src="<%=path%>/shop/images/3fbb0969f70d4c0e8a47cf9684a6e821.gif">
							</a>
						</li>
						<li>
							<a href="https://www.alipay.com" title="支付宝" target="_blank">
								<img src="<%=path%>/shop/images/ea773d0bf3b34c3faa9d7abb5bb8f16a.png">
							</a>
						</li>
						<li>
							<a href="http://bbs.shopxx.net" title="SHOP++官方论坛" target="_blank">
								<img src="<%=path%>/shop/images/216a503ffc1c48fa97ab5a9430ec4d75.png">
							</a>
						</li>
						<li>
							<a href="http://www.boc.cn" title="中国银行" target="_blank">
								<img src="<%=path%>/shop/images/3e2a5e38765342a3b9aa485cc118897b.gif">
							</a>
						</li>
						<li>
							<a href="https://www.99bill.com" title="快钱" target="_blank">
								<img src="<%=path%>/shop/images/1cd7d017e6a843f081363ece98eef31f.gif">
							</a>
						</li>
			</ul>
		</div>
		<div class="right"></div>
	</div>
	<div class="textFriendLink">
		<div class="left"></div>
		<div class="middle">
			<ul>
						<li>
							<a href="http://www.shopxx.net" title="SHOP++官方网站" target="_blank">SHOP++官方网站</a>
						</li>
						<li>
							<a href="http://bbs.shopxx.net" title="SHOP++官方论坛" target="_blank">SHOP++官方论坛</a>
						</li>
						<li>
							<a href="http://www.pbc.gov.cn" title="中国人民银行" target="_blank">中国人民银行</a>
						</li>
						<li>
							<a href="http://www.ccb.com" title="中国建设银行" target="_blank">中国建设银行</a>
						</li>
						<li>
							<a href="http://www.icbc.com.cn" title="中国工商银行" target="_blank">中国工商银行</a>
						</li>
						<li>
							<a href="https://www.tenpay.com" title="财付通" target="_blank">财付通</a>
						</li>
						<li>
							<a href="https://cmpay.10086.cn" title="移动手机支付" target="_blank">移动手机支付</a>
						</li>
						<li>
							<a href="https://www.99bill.com" title="快钱" target="_blank">快钱</a>
						</li>
						<li>
							<a href="https://www.alipay.com" title="支付宝" target="_blank">支付宝</a>
						</li>
						<li>
							<a href="http://www.ct10000.com" title="中国电信" target="_blank">中国电信</a>
						</li>
			</ul>
		</div>
		<div class="right"></div>
	</div>
</div>	</div>
	<div class="blank"></div>
<div class="footer">
	<div class="bottomNavigation">
							<dl>
					<dd>
						<a href="/shop/article_list/questions.htm">常见问题</a>
					</dd>
					<dd>
						<a href="/shop/article_list/privacy.htm">隐私申明</a>
					</dd>
					<dd>
						<a href="/shop/article_list/terms.htm">交易条款</a>
					</dd>
					</dl>
					<dl>
					<dd>
						<a href="/shop/article_list/newbie.htm">新手上路</a>
					</dd>
					<dd>
						<a href="/shop/article_list/payment.htm">支付方式</a>
					</dd>
					<dd>
						<a href="/shop/article_list/shipping_method.htm">配送方式</a>
					</dd>
					</dl>
					<dl>
					<dd>
						<a href="/shop/article_list/service.htm">售后服务</a>
					</dd>
					<dd>
						<a href="/shop/article_list/service_guarantee.htm">服务保证</a>
					</dd>
					<dd>
						<a href="/shop/article_list/website_system.htm">网站制度</a>
					</dd>
					</dl>
					<dl>
					<dd>
						<a href="/shop/article_list/about_us.htm">关于我们</a>
					</dd>
					<dd>
						<a href="/shop/article_list/help.htm">帮助中心</a>
					</dd>
					<dd>
						<a href="/shop/article_list/shopping_guide.htm">购物指南</a>
					</dd>
					</dl>
	</div>
	<div class="footerInfo">
		<ul>
			<li><a href="#">关于商城</a>|</li>
			<li><a href="#">帮助中心</a>|</li>
			<li><a href="#">网站地图</a>|</li>
			<li><a href="#">诚聘英才</a>|</li>
			<li><a href="#">联系我们</a>|</li>
			<li><a href="#">版权说明</a></li>
		</ul>
		<p>Copyright © 2011 SHOP++. All rights reserved. 长沙鼎诚软件有限公司</p>
			<p>Powered by <a class="systemName" href="http://www.shopxx.net" target="_blank">SHOP<span>++</span> V2.0</a></p>
	</div>
</div>	<script type="text/javascript" src="<%=path%>/shop/js/jquery.js"></script>
	<script type="text/javascript" src="<%=path%>/shop/js/jquery.tools.js"></script>
	<script type="text/javascript" src="<%=path%>/shop/js/base.js"></script>
	<script type="text/javascript" src="<%=path%>/shop/js/shop.js"></script>

 <div id="instantMessagingLayer" class="instantMessagingLayer rightInstantMessagingLayer" style="display: block; top: 155px; "> <div id="instantMessagingMin" class="instantMessagingMin"></div> <div id="instantMessagingMain" class="instantMessagingMain"> <div class="top"></div> <div class="middle"> <dl> <dt>7 × 24小时服务</dt> <dd> <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=在线客服1&amp;site=SHOPXX_NET&amp;menu=yes" target="_blank"> <img src="http://wpa.qq.com/pa?p=2:在线客服1:45" alt="QQ在线客服" align="absmiddle"> 在线客服1 </a> </dd> <dd> <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=在线客服2&amp;site=SHOPXX_NET&amp;menu=yes" target="_blank"> <img src="http://wpa.qq.com/pa?p=2:在线客服2:45" alt="QQ在线客服" align="absmiddle"> 在线客服2 </a> </dd> <dd> <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=在线客服3&amp;site=SHOPXX_NET&amp;menu=yes" target="_blank"> <img src="http://wpa.qq.com/pa?p=2:在线客服3:45" alt="QQ在线客服" align="absmiddle"> 在线客服3 </a> </dd> <dd> <a href="msnim:chat?contact=在线客服4" target="_blank"> <img src="<%=path%>/shop/images/instant_messaging_msn.gif" alt="MSN在线客服" align="absmiddle"> 在线客服4 </a> </dd> <dd> <a href="msnim:chat?contact=在线客服5" target="_blank"> <img src="<%=path%>/shop/images/instant_messaging_msn.gif" alt="MSN在线客服" align="absmiddle"> 在线客服5 </a> </dd> <dd> <a href="http://amos1.taobao.com/msg.ww?v=2&amp;uid=在线客服6&amp;s=2" target="_blank"> <img src="<%=path%>/shop/images/instant_messaging_wangwang.gif" alt="旺旺在线客服" align="absmiddle"> 在线客服6 </a> </dd> <dd> <a href="callto://在线客服7" target="_blank"> <img src="<%=path%>/shop/images/instant_messaging_skype.gif" alt="Skype在线客服" align="absmiddle"> 在线客服7 </a> </dd> </dl> </div> <div id="closeInstantMessagingMain" class="bottom" title="关 闭"></div> </div> </div></body></html>
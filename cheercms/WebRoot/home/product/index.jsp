<%@ page contentType="text/html; charset=UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>摩托罗拉MZ606 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<link href="<%=path %>/shop/css/jquery.zoomimage.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/shop/css/base.css" rel="stylesheet" type="text/css">
<link href="<%=path %>/shop/css/shop.css" rel="stylesheet" type="text/css">
<!--[if lte IE 6]>
	<script type="text/javascript" src="/template/common/js/belatedPNG.js"></script>
	<script type="text/javascript">
		// 解决IE6透明PNG图片BUG
		DD_belatedPNG.fix(".belatedPNG");
	</script>
<![endif]-->
</head>
<body id="goodsContent" class="goodsContent">
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
					</ul>
				</div>
				<div class="bottom"></div>
			</div>
			<div class="blank"></div>
			<div id="goodsHistory" class="goodsHistory">
				<div class="top">浏览记录</div>
				<div class="middle">
					<ul id="goodsHistoryListDetail"><li><span class="icon">&nbsp;</span><a href="<%=path%>/shop/images/01065a4e46fa44a79af00514c497daa3.html">三星P1000 GALAXY</a></li><li><span class="icon">&nbsp;</span><a href="<%=path%>/shop/images/000f24dab0804470974a154900a94b5d.html">摩托罗拉MZ606</a></li></ul>
				</div>
				<div class="bottom"></div>
			</div>
		</div>
		<div class="bodyRight">
			<div class="listBar">
				<div class="left"></div>
				<div class="middle">
					<div class="path">
						<a href="/" class="shop"><span class="icon">&nbsp;</span>首页</a> &gt;
							<a href="/shop/goods_list/office_computer.htm">电脑办公</a> &gt;
							<a href="/shop/goods_list/computer_circcity.htm">电脑整机</a> &gt;
							<a href="/shop/goods_list/tablet_personal_computer.htm">平板电脑</a> &gt;
					</div>
				</div>
				<div class="right"></div>
			</div>
			<div class="blank"></div>
			<div class="goodsTop">
				<div class="goodsTopLeft">
					<div class="goodsImage">
		                		<a href="<%=path%>/shop/images/66fdf3ee55514149bd4095c178de1089.jpg" class="tabContent zoom" style="display: inline; " zoomimage="1836" zoomimagebox="zoomimage_1733" id="zoomimage_1733_trigger">
									<img src="<%=path%>/shop/images/66fdf3ee55514149bd4095c178de1089.jpg" alt="点击放大">
								</a>
		                		<a href="<%=path%>/shop/images/fb2bae5dcb5d4dca98b746f7d053febb.jpg" class="tabContent zoom nonFirst" style="display: none; " zoomimage="1836" zoomimagebox="zoomimage_897" id="zoomimage_897_trigger">
									<img src="<%=path%>/shop/images/fb2bae5dcb5d4dca98b746f7d053febb.jpg" alt="点击放大">
								</a>
		                		<a href="<%=path%>/shop/images/e180bb957f43466ca089555f120da966.jpg" class="tabContent zoom nonFirst" style="display: none; " zoomimage="1836" zoomimagebox="zoomimage_1238" id="zoomimage_1238_trigger">
									<img src="<%=path%>/shop/images/e180bb957f43466ca089555f120da966.jpg" alt="点击放大">
								</a>
		                		<a href="<%=path%>/shop/images/9587889f78c946ceb8ae3a5ed7297cef.jpg" class="tabContent zoom nonFirst" style="display: none; " zoomimage="1836" zoomimagebox="zoomimage_1194" id="zoomimage_1194_trigger">
									<img src="<%=path%>/shop/images/9587889f78c946ceb8ae3a5ed7297cef.jpg" alt="点击放大">
								</a>
		                		<a href="<%=path%>/shop/images/e79072b79edf48d08d1c6dc31750987d.jpg" class="tabContent zoom nonFirst" style="display: none; " zoomimage="1836" zoomimagebox="zoomimage_416" id="zoomimage_416_trigger">
									<img src="<%=path%>/shop/images/e79072b79edf48d08d1c6dc31750987d.jpg" alt="点击放大">
								</a>
		                		<a href="<%=path%>/shop/images/b0b269c4d6b7428fbb170bad51a04e42.jpg" class="tabContent zoom nonFirst" style="display: none; " zoomimage="1836" zoomimagebox="zoomimage_1666" id="zoomimage_1666_trigger">
									<img src="<%=path%>/shop/images/b0b269c4d6b7428fbb170bad51a04e42.jpg" alt="点击放大">
								</a>
		                		<a href="<%=path%>/shop/images/000efd088cb04137ad6dbe5e6bc8784c.jpg" class="tabContent zoom nonFirst" style="display: none; " zoomimage="1836" zoomimagebox="zoomimage_1151" id="zoomimage_1151_trigger">
									<img src="<%=path%>/shop/images/000efd088cb04137ad6dbe5e6bc8784c.jpg" alt="点击放大">
								</a>
                	</div>
					<div class="thumbnailGoodsImage">
						<a class="prev browse disabled" href="javascript: void(0);" hidefocus=""></a>
						<div id="thumbnailGoodsImageScrollable" class="scrollable">
							<ul id="goodsImageTab" class="items goodsImageTab">
										<li class="current"><img src="<%=path%>/shop/images/66fdf3ee55514149bd4095c178de1089.jpg" alt=""></li>
										<li class=""><img src="<%=path%>/shop/images/fb2bae5dcb5d4dca98b746f7d053febb.jpg" alt=""></li>
										<li class=""><img src="<%=path%>/shop/images/e180bb957f43466ca089555f120da966.jpg" alt=""></li>
										<li class=""><img src="<%=path%>/shop/images/9587889f78c946ceb8ae3a5ed7297cef.jpg" alt=""></li>
										<li class=""><img src="<%=path%>/shop/images/e79072b79edf48d08d1c6dc31750987d.jpg" alt=""></li>
										<li class=""><img src="<%=path%>/shop/images/b0b269c4d6b7428fbb170bad51a04e42.jpg" alt=""></li>
										<li class=""><img src="<%=path%>/shop/images/000efd088cb04137ad6dbe5e6bc8784c.jpg" alt=""></li>
							</ul>
						</div>
						<a class="next browse" href="javascript: void(0);" hidefocus=""></a>
					</div>
				</div>
				<div class="goodsTopRight">
					<h1 class="title">摩托罗拉MZ606</h1>
					<ul class="goodsAttribute">
						<li>商品编号: SN_43494C6487AF</li>
						<li>货品编号: <span id="productSn">SN_2B71D4AD7E25</span></li>
	                    		<li>尺寸: 10.1英寸</li>
	                    		<li>硬盘容量: 32G</li>
	                    		<li>操作系统: Androidios系统</li>
	                    		<li>配件类别: 保护套</li>
					</ul>
					<div class="blank"></div>
					<div class="goodsPrice">
						<div class="left"></div>
						<div class="right">
							<div class="top">
								销 售 价:
								<span id="price" class="price">￥5180.00元</span>
							</div>
							<div class="bottom">
								市 场 价:
									<span id="marketPrice" class="marketPrice">￥6216.00元</span>
							</div>
						</div>
					</div>
					<div class="blank"></div>
					<table id="buyInfo" class="buyInfo">
							<tbody><tr class="specificationTips">
								<th id="tipsTitle">请选择:</th>
								<td>
									<div id="tipsContent" class="tipsContent">
											版本 
									</div>
									<div id="closeHighlight" class="closeHighlight" title="关闭"></div>
								</td>
							</tr>
									<tr class="text">
										<th>版本:</th>
										<td>
											<ul>
														<li class="f9b0bf9ea63b45cc92dfc48cabfc47ad" title="16G" specificationvalueid="f9b0bf9ea63b45cc92dfc48cabfc47ad">
															16G
															<span title="点击取消选择"></span>
														</li>
														<li class="5589152af067407ebf34d06444372d66" title="32G" specificationvalueid="5589152af067407ebf34d06444372d66">
															32G
															<span title="点击取消选择"></span>
														</li>
														<li class="2689c0faa1f545e499c8905c7199c8b9" title="64G" specificationvalueid="2689c0faa1f545e499c8905c7199c8b9">
															64G
															<span title="点击取消选择"></span>
														</li>
											</ul>
										</td>
									</tr>
						<tr>
							<th>购买数量:</th>
							<td>
								<input type="text" id="quantity" value="1">
							</td>
						</tr>
						<tr>
							<th>&nbsp;</th>
							<td>
									<input type="button" id="goodsButton" class="addCartItemButton" value="" hidefocus="">
								 <input type="button" id="addFavorite" class="addFavoriteButton" goodsid="402891813033eec501303469394e0001" hidefocus="">
							</td>
						</tr>
					</tbody></table>
				</div>
			</div>
			<div class="blank"></div>
			<div class="goodsBottom">
				<ul id="goodsParameterTab" class="goodsParameterTab">
					<li>
						<a href="javascript: void(0);" class="" hidefocus="">商品介绍</a>
					</li>
					<li>
						<a href="javascript: void(0);" name="goodsAttribute" hidefocus="" class="">商品参数</a>
					</li>
						<li>
							<a href="javascript: void(0);" hidefocus="" class="current">商品评论</a>
						</li>
				</ul>
				<div class="tabContent goodsIntroduction" style="display: none; ">
					<img border="0" alt="" src="http://demo.image.shopxx.net/201101/29c72811a21c43ba9da2563b243ddf4b.png"><br>
				</div>
				<div class="tabContent goodsAttribute" style="display: none; ">
					<table class="goodsParameterTable">
								<tbody><tr>
									<th>
										上市时间
									</th>
									<td>
										2011
									</td>
								</tr>
								<tr>
									<th>
										操作系统
									</th>
									<td>
										Android 3.0 Honeycomb
									</td>
								</tr>
								<tr>
									<th>
										处理器
									</th>
									<td>
										NVIDIA Tegra 2
									</td>
								</tr>
								<tr>
									<th>
										存储设备
									</th>
									<td>
										扩展支持 Micro SD 可扩展容量 32GB
									</td>
								</tr>
								<tr>
									<th>
										显示屏
									</th>
									<td>
										10.1英寸
									</td>
								</tr>
								<tr>
									<th>
										屏幕分辨率
									</th>
									<td>
										1280x800
									</td>
								</tr>
								<tr>
									<th>
										屏幕描述
									</th>
									<td>
										电容式触摸屏
									</td>
								</tr>
								<tr>
									<th>
										摄像头
									</th>
									<td>
										前置200万像素  后置500万像素
									</td>
								</tr>
								<tr>
									<th>
										无线网卡 WIFI无线上网
									</th>
									<td>
										有
									</td>
								</tr>
								<tr>
									<th>
										支持蓝牙
									</th>
									<td>
										支持
									</td>
								</tr>
								<tr>
									<th>
										声音系统
									</th>
									<td>
										立体声扬声器
									</td>
								</tr>
								<tr>
									<th>
										音频接口
									</th>
									<td>
										3.5毫米OMTP标准耳机插口
									</td>
								</tr>
								<tr>
									<th>
										读卡器 支持MicroSD卡
									</th>
									<td>
										支持
									</td>
								</tr>
								<tr>
									<th>
										指取设备
									</th>
									<td>
										多点电容触摸
									</td>
								</tr>
								<tr>
									<th>
										电池类型
									</th>
									<td>
										锂电池
									</td>
								</tr>
								<tr>
									<th>
										续航时间
									</th>
									<td>
										10小时待机，具体视使用环境所定
									</td>
								</tr>
								<tr>
									<th>
										外形尺寸
									</th>
									<td>
										249.1×167.8×12.9mm
									</td>
								</tr>
								<tr>
									<th>
										产品重量
									</th>
									<td>
										0.73Kg
									</td>
								</tr>
								<tr>
									<th>
										机壳材质
									</th>
									<td>
										电镀合金材质
									</td>
								</tr>
								<tr>
									<th>
										机壳颜色
									</th>
									<td>
										黑色/灰褐色
									</td>
								</tr>
					</tbody></table>
				</div>
					<div id="comment" class="tabContent comment" style="display: block; ">
								<div class="commentItem" id="commentItem297e3f233638d1960136a6df29670364">
									<p><span class="red">123dfdsf</span> 2012-04-12 22: 05 <a href="#commentForm" class="commentReply" forcommentid="297e3f233638d1960136a6df29670364">[回复此评论]</a></p>
									<p></p><pre>weqwe</pre><p></p>
								</div>
									<div class="blank"></div>
								<div class="commentItem" id="commentItem297e3f233638d196013697c4839d0302">
									<p><span class="red">哈哈哈</span> 2012-04-09 23: 41 <a href="#commentForm" class="commentReply" forcommentid="297e3f233638d196013697c4839d0302">[回复此评论]</a></p>
									<p></p><pre>FH F</pre><p></p>
											<div class="reply">
												<p><span class="red">q460058471</span> 2012-04-19 15: 56</p>
												<p></p><pre>123</pre><p></p>
											</div>
											<div class="reply">
												<p><span class="red">admin</span> 2012-04-23 15: 45</p>
												<p></p><pre>as</pre><p></p>
											</div>
								</div>
									<div class="blank"></div>
								<div class="commentItem" id="commentItem297e3f23343cf1e101345e9a966200da">
									<p><span class="red">ququdan</span> 2011-12-21 11: 11 <a href="#commentForm" class="commentReply" forcommentid="297e3f23343cf1e101345e9a966200da">[回复此评论]</a></p>
									<p></p><pre>很不错</pre><p></p>
								</div>
								<div class="info">
									<a href="/shop/comment_list/402891813033eec501303469394e0001.htm">查看所有评论&gt;&gt;</a>
								</div>
						<form id="commentForm" name="commentForm" method="post">
							<input type="hidden" name="comment.goods.id" value="402891813033eec501303469394e0001">
							<input type="hidden" id="forCommentId" name="forCommentId">
							<table class="sendTable">
								<tbody><tr class="title">
									<td width="100">
										<span id="sendTitle">发表评论</span>
									</td>
									<td>
										<a href="javascript: void(0);" id="sendComment" class="sendComment">切换到发表新评论&gt;&gt;</a>
									</td>
								</tr>
								<tr>
									<th>
										评论内容: 
									</th>
									<td>
										<textarea id="commentContent" name="comment.content" class="formTextarea"></textarea>
									</td>
								</tr>
								<tr>
									<th>
										联系方式: 
									</th>
									<td>
										<input type="text" name="comment.contact" class="formText">
									</td>
								</tr>
									<tr>
					                	<th>
					                		验证码: 
					                	</th>
					                    <td>
					                    	<input type="text" id="commentCaptcha" name="j_captcha" class="formText captcha">
					                    	<img id="commentCaptchaImage" class="captchaImage" src="/captcha.jpeg" alt="换一张">
					                    </td>
					                </tr>
								<tr>
									<th>
										&nbsp;
									</th>
									<td>
										<input type="submit" class="formButton" value="提交评论">
									</td>
								</tr>
							</tbody></table>
						</form>
					</div>
			</div>
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
</div>	<script type="text/javascript" src="<%=path %>/shop/js/jquery.js"></script>
	<script type="text/javascript" src="<%=path %>/shop/js/jquery.tools.js"></script>
	<script type="text/javascript" src="<%=path %>/shop/js/jquery.zoomimage.js"></script>
	<script type="text/javascript" src="<%=path %>/shop/js/base.js"></script>
	<script type="text/javascript" src="<%=path %>/shop/js/shop.js"></script>
	<script type="text/javascript">
	$().ready( function() {
	
		$productSn = $("#productSn");
		$price = $("#price");
		$marketPrice = $("#marketPrice");
		$buyInfo = $("#buyInfo");
		$tipsTitle = $("#tipsTitle");
		$tipsContent = $("#tipsContent");
		$closeHighlight = $("#closeHighlight");
		$specificationValue = $("#buyInfo li");
		$quantity = $("#quantity");
		$goodsButton = $("#goodsButton");
	
		// 添加商品浏览记录
		$.addGoodsHistory("摩托罗拉MZ606", "<%=path%>/shop/images/000f24dab0804470974a154900a94b5d.html");
		
			var productDatas = {};
					productDatas['40289181303478af0130349a10ca0006'] = {
						productSn: "SN_2B71D4AD7E25",
						price: "￥5180.00元",
						marketPrice: "￥6216.00元",
						isOutOfStock: false
					};
					productDatas['40289181303478af0130349a11080007'] = {
						productSn: "SN_CC1D0A0ADB7E",
						price: "￥6200.00元",
						marketPrice: "￥7440.00元",
						isOutOfStock: false
					};
					productDatas['40289181303478af0130349a11470008'] = {
						productSn: "SN_E02EE0B9F8CB",
						price: "￥4500.00元",
						marketPrice: "￥5400.00元",
						isOutOfStock: false
					};
			
			var specificationValueDatas = {};
					specificationValueDatas['40289181303478af0130349a10ca0006'] = new Array("5589152af067407ebf34d06444372d66");
					specificationValueDatas['40289181303478af0130349a11080007'] = new Array("2689c0faa1f545e499c8905c7199c8b9");
					specificationValueDatas['40289181303478af0130349a11470008'] = new Array("f9b0bf9ea63b45cc92dfc48cabfc47ad");
			
			var specificationValueSelecteds = new Array();
			var selectedProductId = null;
			
			$specificationValue.click(function () {
				var $this = $(this);
				if ($this.hasClass("notAllowed")) {
					return false;
				}
				
				if ($this.hasClass("selected")) {
					$this.removeClass("selected");
				} else {
					$this.addClass("selected");
				}
				$this.siblings("li").removeClass("selected");
				$specificationValue.addClass("notAllowed");
				
				var $specificationValueSelected = $("#buyInfo li.selected");
				if ($specificationValueSelected.length == 1) {
					$specificationValueSelected.siblings("li").removeClass("notAllowed");
				}
				
				var specificationValueSelecteds = new Array();
				selectedProductId = null;
				var tipsContentText = "";
				$specificationValueSelected.each(function(i) {
					var $this = $(this);
					tipsContentText += $this.attr("title") + " ";
					specificationValueSelecteds.push($this.attr("specificationValueId"));
				});
				if (tipsContentText != "") {
					$tipsTitle.text("已选择: ");
					$tipsContent.text(tipsContentText);
				} else {
					$tipsTitle.text("请选择: ");
					$tipsContent.text("版本 ");
				}
				$.each(specificationValueDatas, function(i) {
					if (arrayContains(specificationValueDatas[i], specificationValueSelecteds)) {
						for (var j in specificationValueDatas[i]) {
							$("." + specificationValueDatas[i][j]).removeClass("notAllowed");
						}
					}
					if (arrayEqual(specificationValueDatas[i], specificationValueSelecteds)) {
						$productSn = $productSn.text(productDatas[i].productSn);
						$price = $price.text(productDatas[i].price);
						$marketPrice = $marketPrice.text(productDatas[i].marketPrice);
						selectedProductId = i;
						$buyInfo.removeClass("highlight");
						if (productDatas[i].isOutOfStock) {
							$goodsButton.addClass("goodsNotifyButton");
							$goodsButton.removeClass("addCartItemButton");
						} else {
							$goodsButton.addClass("addCartItemButton");
							$goodsButton.removeClass("goodsNotifyButton");
						}
					}
				});
			});
			
			// 添加商品至购物车/到货通知
			$goodsButton.click(function () {
				var $this = $(this);
				if (selectedProductId != null) {
					if ($this.hasClass("addCartItemButton")) {
						$.addCartItem(selectedProductId, $quantity.val());
					} else {
						location.href = '/shop/goods_notify!add.action?product.id=' + selectedProductId;
					}
				} else {
					$buyInfo.addClass("highlight");
					$tipsTitle.text('系统提示:');
					$tipsContent.text('请选择商品信息!');
				}
			});
			
			// 关闭购买信息提示
			$closeHighlight.click(function () {
				$buyInfo.removeClass("highlight");
				$tipsTitle.html("请选择: ");
				$tipsContent.html("版本 ");
			});
			
			// 判断数组是否包含另一个数组中所有元素
			function arrayContains(array1, array2) {
				if(!(array1 instanceof Array) || !(array2 instanceof Array)) {
					return false;
				}
				if(array1.length < array2.length) {
					return false;
				}
				for (var i in array2) {
					if ($.inArray(array2[i], array1) == -1) {
						return false;
					}
				}
				return true;
			}
			
			// 判断两个数组中的所有元素是否相同
			function arrayEqual(array1, array2) {
				if(!(array1 instanceof Array) || !(array2 instanceof Array)) {
					return false;
				}
				if(array1.length != array2.length) {
					return false;
				}
				for (var i in array2) {
					if ($.inArray(array2[i], array1) == -1) {
						return false;
					}
				}
				return true;
			}
	
	})
	</script>

<div class="zoomimage " id="zoomimage_1733" zoomimage="zoomimage_1733_trigger"><div class="zoomimage_s"><div class="zoomimage_st"><div class="zoomimage_stl belatedPNG"></div><div class="zoomimage_stc belatedPNG"></div><div class="zoomimage_str belatedPNG"></div></div><div class="zoomimage_sc"><div class="zoomimage_scl belatedPNG"></div><div class="zoomimage_scc belatedPNG"></div><div class="zoomimage_scr belatedPNG"></div></div><div class="zoomimage_sb"><div class="zoomimage_sbl belatedPNG"></div><div class="zoomimage_sbc belatedPNG"></div><div class="zoomimage_sbr belatedPNG"></div></div></div><img src=""><div class="zoomimage_controls" style="opacity: 0.6; "><a href="#" class="zoomimage_prev belatedPNG"></a><a href="#" class="zoomimage_next belatedPNG"></a></div><div class="zoomimage_caption" style="opacity: 0.6; "><p></p></div><div class="zoomimage_loading" style="opacity: 0.6; "></div></div><div class="zoomimage " id="zoomimage_897" zoomimage="zoomimage_897_trigger"><div class="zoomimage_s"><div class="zoomimage_st"><div class="zoomimage_stl belatedPNG"></div><div class="zoomimage_stc belatedPNG"></div><div class="zoomimage_str belatedPNG"></div></div><div class="zoomimage_sc"><div class="zoomimage_scl belatedPNG"></div><div class="zoomimage_scc belatedPNG"></div><div class="zoomimage_scr belatedPNG"></div></div><div class="zoomimage_sb"><div class="zoomimage_sbl belatedPNG"></div><div class="zoomimage_sbc belatedPNG"></div><div class="zoomimage_sbr belatedPNG"></div></div></div><img src=""><div class="zoomimage_controls" style="opacity: 0.6; "><a href="#" class="zoomimage_prev belatedPNG"></a><a href="#" class="zoomimage_next belatedPNG"></a></div><div class="zoomimage_caption" style="opacity: 0.6; "><p></p></div><div class="zoomimage_loading" style="opacity: 0.6; "></div></div><div class="zoomimage " id="zoomimage_1238" zoomimage="zoomimage_1238_trigger"><div class="zoomimage_s"><div class="zoomimage_st"><div class="zoomimage_stl belatedPNG"></div><div class="zoomimage_stc belatedPNG"></div><div class="zoomimage_str belatedPNG"></div></div><div class="zoomimage_sc"><div class="zoomimage_scl belatedPNG"></div><div class="zoomimage_scc belatedPNG"></div><div class="zoomimage_scr belatedPNG"></div></div><div class="zoomimage_sb"><div class="zoomimage_sbl belatedPNG"></div><div class="zoomimage_sbc belatedPNG"></div><div class="zoomimage_sbr belatedPNG"></div></div></div><img src=""><div class="zoomimage_controls" style="opacity: 0.6; "><a href="#" class="zoomimage_prev belatedPNG"></a><a href="#" class="zoomimage_next belatedPNG"></a></div><div class="zoomimage_caption" style="opacity: 0.6; "><p></p></div><div class="zoomimage_loading" style="opacity: 0.6; "></div></div><div class="zoomimage " id="zoomimage_1194" zoomimage="zoomimage_1194_trigger"><div class="zoomimage_s"><div class="zoomimage_st"><div class="zoomimage_stl belatedPNG"></div><div class="zoomimage_stc belatedPNG"></div><div class="zoomimage_str belatedPNG"></div></div><div class="zoomimage_sc"><div class="zoomimage_scl belatedPNG"></div><div class="zoomimage_scc belatedPNG"></div><div class="zoomimage_scr belatedPNG"></div></div><div class="zoomimage_sb"><div class="zoomimage_sbl belatedPNG"></div><div class="zoomimage_sbc belatedPNG"></div><div class="zoomimage_sbr belatedPNG"></div></div></div><img src=""><div class="zoomimage_controls" style="opacity: 0.6; "><a href="#" class="zoomimage_prev belatedPNG"></a><a href="#" class="zoomimage_next belatedPNG"></a></div><div class="zoomimage_caption" style="opacity: 0.6; "><p></p></div><div class="zoomimage_loading" style="opacity: 0.6; "></div></div><div class="zoomimage " id="zoomimage_416" zoomimage="zoomimage_416_trigger"><div class="zoomimage_s"><div class="zoomimage_st"><div class="zoomimage_stl belatedPNG"></div><div class="zoomimage_stc belatedPNG"></div><div class="zoomimage_str belatedPNG"></div></div><div class="zoomimage_sc"><div class="zoomimage_scl belatedPNG"></div><div class="zoomimage_scc belatedPNG"></div><div class="zoomimage_scr belatedPNG"></div></div><div class="zoomimage_sb"><div class="zoomimage_sbl belatedPNG"></div><div class="zoomimage_sbc belatedPNG"></div><div class="zoomimage_sbr belatedPNG"></div></div></div><img src=""><div class="zoomimage_controls" style="opacity: 0.6; "><a href="#" class="zoomimage_prev belatedPNG"></a><a href="#" class="zoomimage_next belatedPNG"></a></div><div class="zoomimage_caption" style="opacity: 0.6; "><p></p></div><div class="zoomimage_loading" style="opacity: 0.6; "></div></div><div class="zoomimage " id="zoomimage_1666" zoomimage="zoomimage_1666_trigger"><div class="zoomimage_s"><div class="zoomimage_st"><div class="zoomimage_stl belatedPNG"></div><div class="zoomimage_stc belatedPNG"></div><div class="zoomimage_str belatedPNG"></div></div><div class="zoomimage_sc"><div class="zoomimage_scl belatedPNG"></div><div class="zoomimage_scc belatedPNG"></div><div class="zoomimage_scr belatedPNG"></div></div><div class="zoomimage_sb"><div class="zoomimage_sbl belatedPNG"></div><div class="zoomimage_sbc belatedPNG"></div><div class="zoomimage_sbr belatedPNG"></div></div></div><img src=""><div class="zoomimage_controls" style="opacity: 0.6; "><a href="#" class="zoomimage_prev belatedPNG"></a><a href="#" class="zoomimage_next belatedPNG"></a></div><div class="zoomimage_caption" style="opacity: 0.6; "><p></p></div><div class="zoomimage_loading" style="opacity: 0.6; "></div></div><div class="zoomimage " id="zoomimage_1151" zoomimage="zoomimage_1151_trigger"><div class="zoomimage_s"><div class="zoomimage_st"><div class="zoomimage_stl belatedPNG"></div><div class="zoomimage_stc belatedPNG"></div><div class="zoomimage_str belatedPNG"></div></div><div class="zoomimage_sc"><div class="zoomimage_scl belatedPNG"></div><div class="zoomimage_scc belatedPNG"></div><div class="zoomimage_scr belatedPNG"></div></div><div class="zoomimage_sb"><div class="zoomimage_sbl belatedPNG"></div><div class="zoomimage_sbc belatedPNG"></div><div class="zoomimage_sbr belatedPNG"></div></div></div><img src=""><div class="zoomimage_controls" style="opacity: 0.6; "><a href="#" class="zoomimage_prev belatedPNG"></a><a href="#" class="zoomimage_next belatedPNG"></a></div><div class="zoomimage_caption" style="opacity: 0.6; "><p></p></div><div class="zoomimage_loading" style="opacity: 0.6; "></div></div> <div id="instantMessagingLayer" class="instantMessagingLayer rightInstantMessagingLayer" style="display: block; top: 155px; "> <div id="instantMessagingMin" class="instantMessagingMin"></div> <div id="instantMessagingMain" class="instantMessagingMain"> <div class="top"></div> <div class="middle"> <dl> <dt>7 × 24小时服务</dt> <dd> <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=在线客服1&amp;site=SHOPXX_NET&amp;menu=yes" target="_blank"> <img src="http://wpa.qq.com/pa?p=2:在线客服1:45" alt="QQ在线客服" align="absmiddle"> 在线客服1 </a> </dd> <dd> <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=在线客服2&amp;site=SHOPXX_NET&amp;menu=yes" target="_blank"> <img src="http://wpa.qq.com/pa?p=2:在线客服2:45" alt="QQ在线客服" align="absmiddle"> 在线客服2 </a> </dd> <dd> <a href="http://wpa.qq.com/msgrd?v=3&amp;uin=在线客服3&amp;site=SHOPXX_NET&amp;menu=yes" target="_blank"> <img src="http://wpa.qq.com/pa?p=2:在线客服3:45" alt="QQ在线客服" align="absmiddle"> 在线客服3 </a> </dd> <dd> <a href="msnim:chat?contact=在线客服4" target="_blank"> <img src="<%=path%>/shop/images/instant_messaging_msn.gif" alt="MSN在线客服" align="absmiddle"> 在线客服4 </a> </dd> <dd> <a href="msnim:chat?contact=在线客服5" target="_blank"> <img src="<%=path%>/shop/images/instant_messaging_msn.gif" alt="MSN在线客服" align="absmiddle"> 在线客服5 </a> </dd> <dd> <a href="http://amos1.taobao.com/msg.ww?v=2&amp;uid=在线客服6&amp;s=2" target="_blank"> <img src="<%=path%>/shop/images/instant_messaging_wangwang.gif" alt="旺旺在线客服" align="absmiddle"> 在线客服6 </a> </dd> <dd> <a href="callto://在线客服7" target="_blank"> <img src="<%=path%>/shop/images/instant_messaging_skype.gif" alt="Skype在线客服" align="absmiddle"> 在线客服7 </a> </dd> </dl> </div> <div id="closeInstantMessagingMain" class="bottom" title="关 闭"></div> </div> </div></body></html>
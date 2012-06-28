
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8">
		<title>商品列表 - Powered By SHOP++</title>
		<meta name="Author" content="SHOP++ Team">
		<meta name="Copyright" content="SHOP++">
		<link href="<%=path %>/web/css/ui/global.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<div class="dialog-content">
			<div class="hd">
				<h3>嗯~ 就是它吧</h3>
			</div>
			<div class="bd clearfix">
				<form id="J_GoodsPubForm" action="/product/save" method="POST">
				<div class="form-row">
					<label>宝贝名称：</label>
					<span class="goodsNm">正品牌迪士尼儿童手表 卡通米奇女孩学生手表 韩国时尚皮带水钻表</span>
				</div>
				<div class="form-row">
					<label>评论一下：</label>
					<textarea class="base-txa" name="proComment" placeholder="喜欢它什么呢？"></textarea>
				</div>
				<div class="form-row">
					<label>宝贝标签：</label>
					<div class="inlineblock">
						<input type="text" class="base-input" name="tags" value="">
						<p class="pt5 gc">多个标签用空格、中文或英文逗号隔开</p>
					</div>
				</div>
				<div class="form-row clearfix">
					<label>宝贝图片：</label>
					<div class="goods-gallery">
						<div class="gallery-bd">
							<div class="items">
								<ul>
									<li><a href="javascript:;"><img src="http://img01.taobaocdn.com/bao/uploaded/i1/T1QO9lXjJcXXcFlxHX_115418.jpg" alt=""></a><i></i></li>
									<li><a href="javascript:;"><img src="http://img04.taobaocdn.com/bao/uploaded/i4/116775574/T2FSlTXhlcXXXXXXXX_!!116775574.jpg" alt=""></a><i></i></li>
									<li><a href="javascript:;"><img src="http://img01.taobaocdn.com/bao/uploaded/i1/116775574/T2NSlTXhXcXXXXXXXX_!!116775574.jpg" alt=""></a><i></i></li>
									<li><a href="javascript:;"><img src="http://img03.taobaocdn.com/bao/uploaded/i3/116775574/T2KklpXeNNXXXXXXXX_!!116775574.jpg" alt=""></a><i></i></li>
									<li><a href="javascript:;"><img src="http://img04.taobaocdn.com/bao/uploaded/i4/116775574/T2_mXLXm8cXXXXXXXX_!!116775574.jpg" alt=""></a><i></i></li>
								</ul>
							</div>
						</div>
						<div class="gallery-ft clearfix">
							<span class="status">已选 <em>0</em> 张</span>
							<span class="errc"></span>
							<div class="gallery-pagin">
								<a href="javascript:;" class="sgr-btn prev disabled">上页</a>
								<span class="num-box"><em class="curP">1</em>/<em class="totalP">1</em></span>
								<a href="javascript:;" class="sgr-btn next disabled">下页</a>
							</div>
							<a href="javascript:;" id="J_AddPicBtn" class="ap-btn sgr-btn" style="display: none; ">上传本地图片</a>
						</div>
					</div>
				</div>
				<div class="goods-act">
					<div class="clearfix">
						<a class="bbl-btn" id="J_GoodsPub" href="javascript:;">发布</a>
						<label class="fl mt15 ml15 gc6"><input type="checkbox" name="tomyfav"> 加入我喜欢的宝贝</label>
					</div>
					<div class="errc mt10"></div>
				</div>
			</form>
		</div>
		<a class="close" href="javascript:;"></a>
	</div>
	</body>
</html>
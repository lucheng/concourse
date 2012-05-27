<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>系统设置 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<script type="text/javascript" src="<%=path %>/js/jquery.tools.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=path %>/js/jquery.validate.methods.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $validateErrorContainer = $("#validateErrorContainer");
	var $validateErrorLabelContainer = $("#validateErrorContainer ul");
	var $validateForm = $("#validateForm");
	
	var $tab = $("#tab");
	var $isLoginFailureLockInput = $(".isLoginFailureLock");
	var $loginFailureLockCountTr = $("#loginFailureLockCountTr");
	var $loginFailureLockTimeTr = $("#loginFailureLockTimeTr");
	var $smtpFromMail = $("#smtpFromMail");
	var $smtpHost = $("#smtpHost");
	var $smtpPort = $("#smtpPort");
	var $smtpUsername = $("#smtpUsername");
	var $smtpPassword = $("#smtpPassword");
	var $smtpToMailWrap = $("#smtpToMailWrap");
	var $smtpToMail = $("#smtpToMail");
	var $smtpTest = $("#smtpTest");
	var $smtpTestStatus = $("#smtpTestStatus");
	var $scoreType = $(".scoreType");
	var $scoreScaleTr = $("#scoreScaleTr");
	var $scoreScale = $("#scoreScale");
	
	// Tab效果
	$tab.tabs(".tabContent", {
		tabs: "input"
	});
	
	$isLoginFailureLockInput.click( function() {
		var $this = $(this);
		if($this.val() == "true") {
			$loginFailureLockCountTr.show();
			$loginFailureLockTimeTr.show();
		} else {
			$loginFailureLockCountTr.hide();
			$loginFailureLockTimeTr.hide();
		}
	});
	
	// 邮箱测试
	$smtpTest.click( function() {
		var $this = $(this);
		if ($this.val() == "邮箱测试") {
			$this.val("发送邮件");
			$smtpToMailWrap.show();
		} else {
			if ($.trim($smtpFromMail.val()) == "") {
				$.dialog({type: "warn", content: "请输入发件人邮箱!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if (!/^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/.test($.trim($smtpFromMail.val()))) {
				$.dialog({type: "warn", content: "发件人邮箱格式错误!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($smtpHost.val()) == "") {
				$.dialog({type: "warn", content: "请输入SMTP服务器地址!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($smtpPort.val()) == "") {
				$.dialog({type: "warn", content: "请输入SMTP服务器端口!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if (!/^[0-9]+$/.test($.trim($smtpPort.val()))) {
				$.dialog({type: "warn", content: "SMTP服务器端口格式错误!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($smtpUsername.val()) == "") {
				$.dialog({type: "warn", content: "请输入SMTP用户名!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($smtpPassword.val()) == "") {
				$.dialog({type: "warn", content: "请输入SMTP密码!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if ($.trim($smtpToMail.val()) == "") {
				$.dialog({type: "warn", content: "请输入收件人邮箱!", modal: true, autoCloseTime: 3000});
				return false;
			}
			if (!/^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/.test($.trim($smtpToMail.val()))) {
				$.dialog({type: "warn", content: "收件人邮箱格式错误!", modal: true, autoCloseTime: 3000});
				return false;
			}
			
			$.ajax({
				url: "setting!ajaxSendSmtpTest.action",
				data: {"setting.smtpFromMail": $smtpFromMail.val(), "setting.smtpHost": $smtpHost.val(), "setting.smtpPort": $smtpPort.val(), "setting.smtpUsername": $smtpUsername.val(), "setting.smtpPassword": $smtpPassword.val(), "smtpToMail": $smtpToMail.val()},
				type: "POST",
				dataType: "json",
				cache: false,
				beforeSend: function(data) {
					$smtpTestStatus.html('<span class="loadingIcon">&nbsp;</span>正在发送测试邮件,请稍后...');
					$this.attr("disabled", true);
				},
				success: function(data) {
					$smtpTestStatus.empty();
					$this.attr("disabled", false);
					$.dialog({type: data.status, content: data.message, width: 400, ok: "确 定", modal: true});
				}
			});
		}
	});
	
	// 根据积分获取方式显示/隐藏“积分换算比率”
	$scoreType.click( function() {
		$this = $(this);
		if($this.val() == "orderAmount") {
			$scoreScale.removeClass("ignoreValidate");
			$scoreScaleTr.show();
		} else {
			$scoreScale.val("0");
			$scoreScale.addClass("ignoreValidate");
			$scoreScaleTr.hide();
		}
	});
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		ignore: ".ignoreValidate",
		rules: {
			"setting.shopName": "required",
			"setting.shopUrl": "required",
			"shopLogo": "imageFile",
			"setting.email": "email",
			"setting.bigGoodsImageWidth": {
				required: true,
				positiveInteger: true
			},
			"setting.bigGoodsImageHeight": {
				required: true,
				positiveInteger: true
			},
			"setting.smallGoodsImageWidth": {
				required: true,
				positiveInteger: true
			},
			"setting.smallGoodsImageHeight": {
				required: true,
				positiveInteger: true
			},
			"setting.thumbnailGoodsImageWidth": {
				required: true,
				positiveInteger: true
			},
			"setting.thumbnailGoodsImageHeight": {
				required: true,
				positiveInteger: true
			},
			"defaultBigGoodsImage": "imageFile",
			"defaultSmallGoodsImage": "imageFile",
			"defaultThumbnailGoodsImage": "imageFile",
			"watermarkImage": "imageFile",
			"setting.watermarkAlpha": {
				required: true,
				digits: true
			},
			"setting.defaultMarketPriceNumber": {
				required: true,
				number: true
			},
			"setting.loginFailureLockCount": {
				required: true,
				positiveInteger: true
			},
			"setting.loginFailureLockTime": {
				required: true,
				digits: true
			},
			"setting.smtpFromMail": {
				required: true,
				email: true
			},
			"setting.smtpHost": "required",
			"setting.smtpPort": {
				required: true,
				digits: true
			},
			"setting.smtpUsername": "required",
			"setting.currencyType": "required",
			"setting.currencySign": "required",
			"setting.currencyUnit": "required",
			"setting.storeAlertCount": {
				required: true,
				digits: true
			},
			"setting.scoreScale": {
				required: true,
				min: 0
			},
			"setting.buildHtmlDelayTime": {
				required: true,
				digits: true
			}
		},
		messages: {
			"setting.shopName": "请填写网店名称",
			"setting.shopUrl": "请填写网店网址",
			"shopLogo": "网店LOGO格式错误",
			"setting.email": "E-mail格式不正确",
			"setting.bigGoodsImageWidth": {
				required: "请填写商品图片(大)的宽度",
				positiveInteger: "商品图片(大)的宽度必须为正整数"
			},
			"setting.bigGoodsImageHeight": {
				required: "请填写商品图片(大)的高度",
				positiveInteger: "商品图片(大)的高度必须为正整数"
			},
			"setting.smallGoodsImageWidth": {
				required: "请填写商品图片(小)的宽度",
				positiveInteger: "商品图片(小)的宽度必须为正整数"
			},
			"setting.smallGoodsImageHeight": {
				required: "请填写商品图片(小)的高度",
				positiveInteger: "商品图片(小)的高度必须为正整数"
			},
			"setting.thumbnailGoodsImageWidth": {
				required: "请填写商品缩略图的宽度",
				positiveInteger: "商品缩略图的宽度必须为正整数"
			},
			"setting.thumbnailGoodsImageHeight": {
				required: "请填写商品缩略图的高度",
				positiveInteger: "商品缩略图的高度必须为正整数"
			},
			"defaultBigGoodsImage": "默认商品图片(大)格式错误",
			"defaultSmallGoodsImage": "默认商品图片(小)格式错误",
			"defaultThumbnailGoodsImage": "默认缩略图格式错误",
			"watermarkImage": "水印图片格式错误",
			"setting.watermarkAlpha": {
				required: "请填写水印透明度",
				digits: "水印透明度必须为零或正整数"
			},
			"setting.defaultMarketPriceNumber": {
				required: "请填写默认市场价运算基数",
				number: "默认市场价运算基数必须为数字"
			},
			"setting.loginFailureLockCount": {
				required: "请填写连续登录失败最大次数",
				positiveInteger: "连续登录失败最大次数请输入合法的正整数"
			},
			"setting.loginFailureLockTime": {
				required: "请填写自动解锁时间",
				digits: "自动解锁时间必须为零或正整数"
			},
			"setting.smtpFromMail": {
				required: "请填写发件人邮箱",
				email: "发件人邮箱格式错误"
			},
			"setting.smtpHost": "请填写SMTP服务器地址",
			"setting.smtpPort": {
				required: "请填写SMTP服务器端口",
				digits: "SMTP服务器端口必须为零或正整数"
			},
			"setting.smtpUsername": "请填写SMTP用户名",
			"setting.currencyType": "请选择货币种类",
			"setting.currencySign": "请填写货币符号",
			"setting.currencyUnit": "请填写货币单位",
			"setting.storeAlertCount": {
				required: "请填写商品库存报警数量",
				digits: "商品库存报警数量必须为零或正整数"
			},
			"setting.scoreScale": {
				required: "请填写积分换算比率",
				min: "积分换算比率必须为零或正数"
			},
			"setting.buildHtmlDelayTime": {
				required: "请填写HTML自动生成延时",
				digits: "HTML自动生成延时必须为零或正整数"
			}
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
	
})
</script>
</head>
<body class="input">
	<div class="bar">
		系统设置
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" class="form" action="<%=path %>/setting/update" enctype="multipart/form-data" method="post">
			<ul id="tab" class="tab">
				<li>
					<input type="button" value="基本设置" hidefocus="" class="">
				</li>
				<li>
					<input type="button" value="显示设置" hidefocus="" class="">
				</li>
				<li>
					<input type="button" value="安全设置" hidefocus="" class="">
				</li>
				<li>
					<input type="button" value="邮件设置" hidefocus="" class="">
				</li>
				<li>
					<input type="button" value="其它设置" hidefocus="" class="current">
				</li>
			</ul>
			<table class="inputTable tabContent" style="display: none; ">
				<tbody><tr>
					<th>
						网店名称: 
					</th>
					<td>
						<input type="text" name="setting.shopName" class="formText" value="SHOP++演示商城">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						网店网址: 
					</th>
					<td>
						<input type="text" name="setting.shopUrl" class="formText" value="http://localhost">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						网店LOGO: 
					</th>
					<td>
						<input type="file" name="shopLogo">
						<a href="/images/logo.jpg?random=8654" target="_blank">查看</a>
					</td>
				</tr>
				<tr>
					<th>
						热门搜索关键词: 
					</th>
					<td>
						<input type="text" name="setting.hotSearch" class="formText" value="苹果,松下,索尼,三星,诺基亚,海尔,惠普,东芝,LG,联想" title="页面显示的热门搜索关键字,多个关键字请以 , 分隔">
					</td>
				</tr>
				<tr>
					<th>
						联系地址: 
					</th>
					<td>
						<input type="text" name="setting.address" class="formText" value="湖南长沙经济技术开发区">
					</td>
				</tr>
				<tr>
					<th>
						服务电话: 
					</th>
					<td>
						<input type="text" name="setting.phone" class="formText" value="400-8888888">
					</td>
				</tr>
				<tr>
					<th>
						邮编: 
					</th>
					<td>
						<input type="text" name="setting.zipCode" class="formText" value="400000">
					</td>
				</tr>
				<tr>
					<th>
						E-mail: 
					</th>
					<td>
						<input type="text" name="setting.email" class="formText" value="admin@shopxx.net">
					</td>
				</tr>
				<tr>
					<th>
						备案号: 
					</th>
					<td>
						<input type="text" name="setting.certtext" class="formText" value="湘ICP备10000000号" title="填写您在工信部备案管理网站申请的备案编号">
					</td>
				</tr>
				<tr>
					<th>
						首页页面关键词: 
					</th>
					<td>
						<input type="text" name="setting.metaKeywords" class="formText" value="SHOP++体验商城" title="多个关键字请以(,)分隔">
					</td>
				</tr>
				<tr>
					<th>
						首页页面描述: 
					</th>
					<td>
						<textarea name="setting.metaDescription" class="formTextarea">SHOP++是基于JAVA技术的开源网店系统，主要应用于电子商务领域内的网上购物、网上交易、交易信息发布等系统的构建。致力于为个人和企业提供安全、稳定、高效、强大的电子商务解决方案，并推进国内电子商务技术和开源技术的发展而不断努力。</textarea>
					</td>
				</tr>
			</tbody></table>
			<table class="inputTable tabContent" style="display: none; ">
				<tbody><tr>
					<th>
						商品图片(大): 
					</th>
					<td>
						<span class="fieldTitle">宽度: </span>
						<input type="text" name="setting.bigGoodsImageWidth" class="formText" value="500" style="width: 50px;" title="单位: 像素, 只允许输入正整数">
						<label class="requireField">*</label>
						<span class="fieldTitle">高度: </span>
						<input type="text" name="setting.bigGoodsImageHeight" class="formText" value="500" style="width: 50px;" title="单位: 像素, 只允许输入正整数">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						商品图片(小): 
					</th>
					<td>
						<span class="fieldTitle">宽度: </span>
						<input type="text" name="setting.smallGoodsImageWidth" class="formText" value="300" style="width: 50px;" title="单位: 像素, 只允许输入正整数">
						<label class="requireField">*</label>
						<span class="fieldTitle">高度: </span>
						<input type="text" name="setting.smallGoodsImageHeight" class="formText" value="300" style="width: 50px;" title="单位: 像素, 只允许输入正整数">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						商品缩略图: 
					</th>
					<td>
						<span class="fieldTitle">宽度: </span>
						<input type="text" name="setting.thumbnailGoodsImageWidth" class="formText" value="140" style="width: 50px;" title="单位: 像素, 只允许输入正整数">
						<label class="requireField">*</label>
						<span class="fieldTitle">高度: </span>
						<input type="text" name="setting.thumbnailGoodsImageHeight" class="formText" value="140" style="width: 50px;" title="单位: 像素, 只允许输入正整数">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						默认商品图片(大): 
					</th>
					<td>
						<input type="file" name="defaultBigGoodsImage">
						<a href="/images/default_big_goods_image.jpg?random=50734" target="_blank">查看</a>
					</td>
				</tr>
				<tr>
					<th>
						默认商品图片(小): 
					</th>
					<td>
						<input type="file" name="defaultSmallGoodsImage">
						<a href="/images/default_small_goods_image.jpg?random=60733" target="_blank">查看</a>
					</td>
				</tr>
				<tr>
					<th>
						默认缩略图: 
					</th>
					<td>
						<input type="file" name="defaultThumbnailGoodsImage">
						<a href="/images/default_thumbnail_goods_image.jpg?random=35669" target="_blank">查看</a>
					</td>
				</tr>
				<tr>
					<th>
						水印图片: 
					</th>
					<td>
						<input type="file" name="watermarkImage">
						<a href="/images/watermark.jpg?random=71748" target="_blank">查看</a>
					</td>
				</tr>
				<tr>
					<th>
						水印位置: 
					</th>
					<td>
							<label>
								<input type="radio" name="setting.watermarkPosition" value="no">
								无&nbsp;
							</label>
							<label>
								<input type="radio" name="setting.watermarkPosition" value="topLeft">
								左上&nbsp;
							</label>
							<label>
								<input type="radio" name="setting.watermarkPosition" value="topRight">
								右上&nbsp;
							</label>
							<label>
								<input type="radio" name="setting.watermarkPosition" value="center">
								居中&nbsp;
							</label>
							<label>
								<input type="radio" name="setting.watermarkPosition" value="bottomLeft">
								左下&nbsp;
							</label>
							<label>
								<input type="radio" name="setting.watermarkPosition" value="bottomRight" checked="">
								右下&nbsp;
							</label>
					</td>
				</tr>
				<tr>
					<th>
						水印透明度: 
					</th>
					<td>
						<input type="text" name="setting.watermarkAlpha" class="formText" value="50" title="取值范围: 0-100,  0代表完全透明">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						市场价显示设置: 
					</th>
					<td>
						<label>
							<input type="checkbox" name="setting.isShowMarketPrice" value="true" id="setting_isShowMarketPrice" checked="checked"><input type="hidden" id="__checkbox_setting_isShowMarketPrice" name="__checkbox_setting.isShowMarketPrice" value="true">前台是否显示市场价
						</label>
					</td>
				</tr>
				<tr>
					<th>
						默认市场价运算: 
					</th>
					<td>
						市场价 = 销售价
						<select name="setting.defaultMarketPriceOperator">
								<option value="add">
								加
								</option>
								<option value="subtract">
								减
								</option>
								<option value="multiply" selected="">
								乘
								</option>
								<option value="divide">
								除
								</option>
						</select>
						<input type="text" name="setting.defaultMarketPriceNumber" class="formText" value="1.2" style="width: 50px;">
					</td>
				</tr>
			</tbody></table>
			<table class="inputTable tabContent" style="display: none; ">
				<tbody><tr>
					<th>
						会员注册设置: 
					</th>
					<td>
						<label>
							<input type="checkbox" name="setting.isRegisterEnabled" value="true" id="setting_isRegisterEnabled" checked="checked"><input type="hidden" id="__checkbox_setting_isRegisterEnabled" name="__checkbox_setting.isRegisterEnabled" value="true">开放注册
						</label>
					</td>
				</tr>
				<tr>
					<th>
						是否自动锁定账号: 
					</th>
					<td>
						<label><input type="radio" name="setting.isLoginFailureLock" class="isLoginFailureLock" value="true" checked="">是</label>
						<label><input type="radio" name="setting.isLoginFailureLock" class="isLoginFailureLock" value="false">否</label>
					</td>
				</tr>
				<tr id="loginFailureLockCountTr">
					<th>
						连续登录失败最大次数: 
					</th>
					<td>
						<input type="text" name="setting.loginFailureLockCount" class="formText" value="5" title="只允许输入正整数,当连续登录失败次数超过设定值时,系统将自动锁定该账号">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr id="loginFailureLockTimeTr">
					<th>
						自动解锁时间: 
					</th>
					<td>
						<input type="text" name="setting.loginFailureLockTime" class="formText" value="5" title="只允许输入零或正整数,账号锁定后,自动解除锁定的时间,单位: 分钟,0表示永久锁定">
						<label class="requireField">*</label>
					</td>
				</tr>
			</tbody></table>
			<table class="inputTable tabContent" style="display: none; ">
				<tbody><tr>
					<th>
						发件人邮箱: 
					</th>
					<td>
						<input type="text" id="smtpFromMail" name="setting.smtpFromMail" class="formText" value="test@shopxx.net">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						SMTP服务器地址: 
					</th>
					<td>
						<input type="text" id="smtpHost" name="setting.smtpHost" class="formText" value="smtp.shopxx.net">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						SMTP服务器端口: 
					</th>
					<td>
						<input type="text" id="smtpPort" name="setting.smtpPort" class="formText" value="25" title="默认端口为25">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						SMTP用户名: 
					</th>
					<td>
						<input type="text" id="smtpUsername" name="setting.smtpUsername" class="formText" value="test">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						SMTP密码: 
					</th>
					<td>
						<input type="password" id="smtpPassword" name="setting.smtpPassword" class="formText" title="留空则不进行密码修改">
					</td>
				</tr>
				<tr>
					<th>
						邮箱配置测试: 
					</th>
					<td>
						<span id="smtpToMailWrap" class="hidden">
							<div>收件人邮箱: </div>
							<input type="text" id="smtpToMail" name="smtpToMail" class="formText">
						</span>
						<input type="button" id="smtpTest" class="formButton" value="邮箱测试" hidefocus="">
						<span id="smtpTestStatus"></span>
					</td>
				</tr>
			</tbody></table>
			<table class="inputTable tabContent" style="display: table; ">
				<tbody><tr>
					<th>
						货币种类: 
					</th>
					<td>
						<select id="currencyType" name="setting.currencyType">
							<option value="">请选择...</option>
								<option value="CNY" selected="">
									人民币
								</option>
								<option value="USD">
									美元
								</option>
								<option value="EUR">
									欧元
								</option>
								<option value="GBP">
									英磅
								</option>
								<option value="CAD">
									加拿大元
								</option>
								<option value="AUD">
									澳元
								</option>
								<option value="RUB">
									卢布
								</option>
								<option value="HKD">
									港币
								</option>
								<option value="TWD">
									新台币
								</option>
								<option value="KRW">
									韩元
								</option>
								<option value="SGD">
									新加坡元
								</option>
								<option value="NZD">
									新西兰元
								</option>
								<option value="JPY">
									日元
								</option>
								<option value="MYR">
									马元
								</option>
								<option value="CHF">
									瑞士法郎
								</option>
								<option value="SEK">
									瑞典克朗
								</option>
								<option value="DKK">
									丹麦克朗
								</option>
								<option value="PLZ">
									兹罗提
								</option>
								<option value="NOK">
									挪威克朗
								</option>
								<option value="HUF">
									福林
								</option>
								<option value="CSK">
									捷克克朗
								</option>
								<option value="MOP">
									葡币
								</option>
						</select>
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						货币符号: 
					</th>
					<td>
						<input type="text" name="setting.currencySign" class="formText" value="￥">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						货币单位: 
					</th>
					<td>
						<input type="text" name="setting.currencyUnit" class="formText" value="元">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						价格精确位数: 
					</th>
					<td>
						<select name="setting.priceScale">
							<option value="0">
								无小数位
							</option>
							<option value="1">
								1位小数
							</option>
							<option value="2" selected="">
								2位小数
							</option>
							<option value="3">
								3位小数
							</option>
							<option value="4">
								4位小数
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						价格精确方式: 
					</th>
					<td>
						<select name="setting.priceRoundType">
								<option value="roundHalfUp" selected="">
									四舍五入
								</option>
								<option value="roundUp">
									向上取整
								</option>
								<option value="roundDown">
									向下取整
								</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>
						商品库存报警数量: 
					</th>
					<td>
						<input type="text" name="setting.storeAlertCount" class="formText" value="5" title="只允许输入零或正整数">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						库存预占时间点: 
					</th>
					<td>
						<label title="设置库存预先扣除(占用)的时间点,而系统实际扣除库存点是发货操作">
							<select name="setting.storeFreezeTime" class="requireField">
									<option value="order" selected="">
										下订单
									</option>
									<option value="payment">
										订单支付
									</option>
									<option value="ship">
										订单发货
									</option>
							</select>
						</label>
					</td>
				</tr>
				<tr>
					<th>
						积分获取方式: 
					</th>
					<td>
							<label>
								<input type="radio" name="setting.scoreType" class="scoreType" value="disable">
								禁用积分获取&nbsp;
							</label>
							<label>
								<input type="radio" name="setting.scoreType" class="scoreType" value="orderAmount" checked="">
								按订单总额计算&nbsp;
							</label>
							<label>
								<input type="radio" name="setting.scoreType" class="scoreType" value="goodsSet">
								为商品单独设置&nbsp;
							</label>
					</td>
				</tr>
				<tr id="scoreScaleTr">
					<th>
						积分换算比率: 
					</th>
					<td>
						<input type="text" id="scoreScale" name="setting.scoreScale" class="formText" value="1" title="每消费1元可获得积分数">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						HTML自动生成延时: 
					</th>
					<td>
						<input type="text" name="setting.buildHtmlDelayTime" class="formText" value="30" title="单位: 秒,设置延时值过小可能会造成服务器压力过大">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						GZIP设置: 
					</th>
					<td>
						<label>
							<input type="checkbox" name="setting.isGzipEnabled" value="true" id="setting_isGzipEnabled"><input type="hidden" id="__checkbox_setting_isGzipEnabled" name="__checkbox_setting.isGzipEnabled" value="true">启用
						</label>
					</td>
				</tr>
				<tr>
					<th>
						
					</th>
					<td>
						<span class="warnInfo">若您的WEB服务器已启用了GZIP功能,请关闭此处的GZIP功能</span>
					</td>
				</tr>
			</tbody></table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus="">&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="">
			</div>
		</form>
	</div>
</body></html>
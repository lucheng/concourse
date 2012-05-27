<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>添加/编辑商品类型 - Powered By SHOP++</title>
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
	var $goodsAttributeTable = $("#goodsAttributeTable");
	var $addGoodsAttributeButton = $("#addGoodsAttributeButton");
	var $goodsParameterTable = $("#goodsParameterTable");
	var $addGoodsParameterButton = $("#addGoodsParameterButton");
	
	// Tab效果
	$tab.tabs(".tabContent", {
		tabs: "input"
	});
	
	// 增加商品属性
	var goodsAttributeIndex = 0;
	$addGoodsAttributeButton.click( function() {
	
var goodsAttributeTrHtml = '<tr class="goodsAttributeTr"> <td> <input type="text" name="goodsAttributeList[' + goodsAttributeIndex + '].name" class="formText goodsAttributeListName" /> </td> <td> <select name="goodsAttributeList[' + goodsAttributeIndex + '].attributeType" class="attributeType"> <option value="filter"> 筛选项 </option> <option value="input"> 输入项 </option> </select> </td> <td> <input type="text" name="goodsAttributeList[' + goodsAttributeIndex + '].optionText" class="formText optionText goodsAttributeListOptionText" title="多个可选值.请使用“,”分隔" /> </td> <td> <input type="text" name="goodsAttributeList[' + goodsAttributeIndex + '].orderList" class="formText goodsAttributeListOrderList" style="width: 30px;" /> </td> <td> <span class="deleteIcon deleteGoodsAttributeIcon" title="删 除">&nbsp;</span> </td> </tr>';		
		if ($goodsAttributeTable.find(".goodsAttributeTr").length >= 20) {
			$.dialog({type: "warn", content: "商品属性个数超出限制!", modal: true, autoCloseTime: 3000});
		} else {
			$goodsAttributeTable.append(goodsAttributeTrHtml);
			goodsAttributeIndex ++;
		}
	});
	
	// 修改商品属性类型
	$("#goodsAttributeTable .attributeType").live("click", function() {
		var $this = $(this);
		var $optionText = $this.parent().parent().find(".optionText")
		if ($this.val() == "filter") {
			$optionText.attr("disabled", false).show();
		} else {
			$optionText.attr("disabled", true).hide();
		}
	});
	
	// 删除商品属性
	$("#goodsAttributeTable .deleteGoodsAttributeIcon").live("click", function() {
		$(this).parent().parent().remove();
	});
	
	// 增加商品参数
	var goodsParameterIndex = 0;
	$addGoodsParameterButton.click( function() {
		
var goodsParameterTrHtml = '<tr class="goodsParameterTr"> <td> <input type="text" name="goodsParameterList[' + goodsParameterIndex + '].name" class="formText goodsParameterListName" /> </td> <td> <input type="text" name="goodsParameterList[' + goodsParameterIndex + '].orderList" class="formText goodsParameterListOrderList" style="width: 30px;" /> </td> <td> <span class="deleteIcon deleteGoodsParameterIcon" title="删 除">&nbsp;</span> </td> </tr>';		
		$goodsParameterTable.append(goodsParameterTrHtml);
		goodsParameterIndex ++;
	});
	
	// 删除商品参数
	$("#goodsParameterTable .deleteGoodsParameterIcon").live("click", function() {
		var $this = $(this);
		$this.parent().parent().remove();
	});
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"goodsType.name": {
				required: true
			}
		},
		messages: {
			"goodsType.name": {
				required: "请填写类型名称"
			}
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
	
	$.validator.addMethod("goodsAttributeListNameRequired", $.validator.methods.required, "请填写商品属性名称");
	$.validator.addMethod("goodsAttributeListOptionTextRequired", $.validator.methods.required, "请填写商品属性可选项");
	$.validator.addMethod("goodsAttributeListOrderListDigits", $.validator.methods.digits, "商品属性排序必须为零或正整数");
	$.validator.addMethod("goodsParameterListNameRequired", $.validator.methods.required, "请填写商品参数名称");
	$.validator.addMethod("goodsParameterListOrderListDigits", $.validator.methods.digits, "商品参数排序必须为零或正整数");
	
	$.validator.addClassRules("goodsAttributeListName", {
		goodsAttributeListNameRequired: true
	});
	$.validator.addClassRules("goodsAttributeListOptionText", {
		goodsAttributeListOptionTextRequired: true
	});
	$.validator.addClassRules("goodsAttributeListOrderList", {
		goodsAttributeListOrderListDigits: true
	});
	$.validator.addClassRules("goodsParameterListName", {
		goodsParameterListNameRequired: true
	});
	$.validator.addClassRules("goodsParameterListOrderList", {
		goodsParameterListOrderListDigits: true
	});

})
</script>
</head>
<body class="input goodsType">
	<div class="bar">
		添加商品类型
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="goods_type!save.action" method="post">
			<input type="hidden" name="id" value="">
			<ul id="tab" class="tab">
				<li>
					<input type="button" value="基本信息" hidefocus="" class="current">
				</li>
				<li>
					<input type="button" value="商品品牌" hidefocus="" class="">
				</li>
				<li>
					<input type="button" value="商品属性" hidefocus="" class="">
				</li>
				<li>
					<input type="button" value="商品参数" hidefocus="" class="">
				</li>
			</ul>
			<table class="inputTable tabContent" style="display: table; ">
				<tbody><tr>
					<th>
						类型名称: 
					</th>
					<td>
						<input type="text" name="goodsType.name" class="formText" value="">
						<label class="requireField">*</label>
					</td>
				</tr>
			</tbody></table>
			<table class="inputTable tabContent" style="display: none; ">
				<tbody><tr class="noneHover">
					<th>
						商品品牌: 
					</th>
					<td>
						<div class="brandSelect">
							<ul>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031d95ebc003c">戴尔
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031e327740059">柯达
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031e2ec240057">奥林巴斯
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031e2b0020056">富士施乐
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031e272620055">兄弟
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031e0f7ba0054">佳能
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031e0b54c0053">西门子
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031e077060052">松下
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031e034de0051">美的
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031e001ae0050">海尔
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031dfb5c4004e">TCL
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031df775c004d">夏普
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031df3a46004c">索尼
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031def96a004b">尼康
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031de70e6004a">富士
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031dd0c970049">宏碁
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031dcac3d0048">惠普
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031dc63e60047">联想
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031dc09f20046">索尼爱立信
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031dbc1bc0045">诺基亚
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031db7a320044">LG
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031db254c0042">汉王
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031dacd960041">苹果
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031da8fbc0040">摩托罗拉
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031da110a003f">飞利浦
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031d9da92003e">明基
										</label>
									</li>
									<li>
										<label>
											<input type="checkbox" name="brandList.id" value="4028918130316046013031d9a0b2003d">三星
										</label>
									</li>
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<th>
						&nbsp;
					</th>
					<td>
						<span class="warnInfo"><span class="icon">&nbsp;</span>未选择的商品品牌前台页面无法进行品牌筛选</span>
					</td>
				</tr>
			</tbody></table>
			<table id="goodsAttributeTable" class="inputTable tabContent" style="display: none; ">
				<tbody><tr class="noneHover">
					<td colspan="5">
						<input type="button" id="addGoodsAttributeButton" class="formButton" value="增加属性" hidefocus="">
					</td>
				</tr>
				<tr class="title">
					<th>
						属性名称
					</th>
					<th>
						属性类型
					</th>
					<th>
						可选项
					</th>
					<th>
						排序
					</th>
					<th>
						删除
					</th>
				</tr>
			</tbody></table>
			<table id="goodsParameterTable" class="inputTable tabContent" style="display: none; ">
				<tbody><tr class="noneHover">
					<td colspan="3">
						<input type="button" id="addGoodsParameterButton" class="formButton" value="增加参数" hidefocus="">
					</td>
				</tr>
				<tr class="title">
					<th>
						参数名称
					</th>
					<th>
						排序
					</th>
					<th>
						删除
					</th>
				</tr>
			</tbody></table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus="">
				&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="">
			</div>
		</form>
	</div>
</body>
</html>
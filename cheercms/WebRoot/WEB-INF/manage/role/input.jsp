<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>添加/编辑角色 - Powered By SHOP++</title>
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
	
	var $allChecked = $("#validateForm .allChecked");
	
	$allChecked.click( function() {
		var $this = $(this);
		var $thisCheckbox = $this.parent().parent().find(":checkbox");
		if ($thisCheckbox.filter(":checked").size() > 0) {
			$thisCheckbox.attr("checked", false);
		} else {
			$thisCheckbox.attr("checked", true);
		}
		return false;
	});
	
	// 表单验证
	$validateForm.validate({
		errorContainer: $validateErrorContainer,
		errorLabelContainer: $validateErrorLabelContainer,
		wrapper: "li",
		errorClass: "validateError",
		ignoreTitle: true,
		rules: {
			"role.name": "required"
		},
		messages: {
			"role.name": "请填写角色名称"
		},
		submitHandler: function(form) {
			$(form).find(":submit").attr("disabled", true);
			form.submit();
		}
	});
	
	$.validator.addMethod("roleAuthorityListRequired", $.validator.methods.required, "请选择管理权限");
	
	$.validator.addClassRules("roleAuthorityList", {
		roleAuthorityListRequired: true
	});
	
})
</script>
</head>
<body class="input role">
	<div class="bar">
		添加角色
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="role!save.action" method="post">
			<input type="hidden" name="id" value="">
			<table class="inputTable">
				<tbody><tr>
					<th>
						角色名称: 
					</th>
					<td>
						<input type="text" name="role.name" class="formText" value="">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						描述: 
					</th>
					<td>
						<textarea name="role.description" class="formTextarea"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						&nbsp;
					</td>
				</tr>
				<tr class="authorityList">
					<th>
						<a href="#" class="allChecked" title="点击全选此类权限">商品管理: </a>
					</th>
					<td>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_GOODS" checked="">商品管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_GOODS_NOTIFY" checked="">到货通知
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_GOODS_CATEGORY" checked="">商品分类管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_GOODS_TYPE" checked="">商品类型管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_SPECIFICATION" checked="">商品规格管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_BRAND" checked="">商品品牌管理
						</label>
					</td>
				</tr>
				<tr class="authorityList">
					<th>
						<a href="#" class="allChecked" title="点击全选此类权限">订单处理: </a>
					</th>
					<td>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_ORDER" checked="">订单管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_PAYMENT" checked="">收款管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_REFUND" checked="">退款管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_SHIPPING" checked="">发货管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_RESHIP" checked="">退货管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_DELIVERY_CENTER" checked="">发货点管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_DELIVERY_TEMPLATE" checked="">快递单模板管理
						</label>
					</td>
				</tr>
				<tr class="authorityList">
					<th>
						<a href="#" class="allChecked" title="点击全选此类权限">会员管理: </a>
					</th>
					<td>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_MEMBER" checked="">会员管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_MEMBER_RANK" checked="">会员等级管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_MEMBER_ATTRIBUTE" checked="">会员注册项管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_COMMENT" checked="">商品评论管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_LEAVE_MESSAGE" checked="">在线留言管理
						</label>
					</td>
				</tr>
				<tr class="authorityList">
					<th>
						<a href="#" class="allChecked" title="点击全选此类权限">页面内容管理: </a>
					</th>
					<td>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_NAVIGATION" checked="">导航管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_ARTICLEE" checked="">文章管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_ARTICLE_CATEGORY" checked="">文章分类管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_FRIEND_LINK" checked="">友情链接管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_PAGE_TEMPLATE" checked="">页面模板管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_MAIL_TEMPLATE" checked="">邮件模板管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_PRINT_TEMPLATE" checked="">打印模板管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_CACHE" checked="">缓存管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_BUILD_HTML" checked="">生成静态管理
						</label>
					</td>
				</tr>
				<tr class="authorityList">
					<th>
						<a href="#" class="allChecked" title="点击全选此类权限">管理员管理: </a>
					</th>
					<td>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_ADMIN" checked="">管理员管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_ROLE" checked="">角色管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_MESSAGE" checked="">站内消息管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_LOG" checked="">日志管理
						</label>
					</td>
				</tr>
				<tr class="authorityList">
					<th>
						<a href="#" class="allChecked" title="点击全选此类权限">网站设置: </a>
					</th>
					<td>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_SETTING" checked="">系统设置
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_INSTANT_MESSAGING" checked="">在线客服
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_PAYMENT_CONFIG" checked="">支付方式管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_DELIVERY_TYPE" checked="">配送方式管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_AREA" checked="">地区管理
						</label>
						<label>
							<input type="checkbox" name="role.authorityList" class="roleAuthorityList" value="ROLE_DELIVERY_CORP" checked="">物流公司管理
						</label>
					</td>
				</tr>
			</tbody></table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus="">&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="">
			</div>
		</form>
	</div>
</body>
</html>
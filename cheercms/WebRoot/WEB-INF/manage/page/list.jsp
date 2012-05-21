<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html>
<head>
	<title>文章分类列表 - Powered By SHOP++</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta name="Author" content="SHOP++ Team">
	<meta name="Copyright" content="SHOP++">
	<script type="text/javascript">
	$(document).ready(function() {
	
		var $deleteArticleCategory = $("#listTable .deleteArticleCategory");
		var $articleCategoryName = $("#listTable .articleCategoryName");
	
		// 删除商品分类
		$deleteArticleCategory.click( function() {
			if (confirm("您确定要删除此文章分类吗?") == false) {
				return false;
			}
		});
	
		// 树折叠
		$articleCategoryName.click( function() {
			var $this = $(this);
			var grade = $this.parent().attr("grade");
			var isHide;
			$this.parent().nextAll("tr").each(function(){
				$this = $(this);
				var thisLevel = $this.attr("grade");
				if(thisLevel <=  grade) {
					return false;
				}
				if(isHide == null) {
					if($this.is(":hidden")){
						isHide = true;
					} else {
						isHide = false;
					}
				}
				if(isHide) {
					$this.show();
				} else {
					$this.hide();
				}
			});
		});	
	})
	</script>
	</head>
	<body class="list">
		<div class="bar">
			文章分类列表&nbsp;总记录数: 12
		</div>
		<div class="body articleCategory">
			<form id="listForm" action="article_category!list.action" method="post">
				<div class="listBar">
					<input type="button" class="formButton" onclick="location.href='<%=path %>/category/add'" value="添加分类" hidefocus="">
				</div>
				<table id="listTable" class="listTable">
					<tbody><tr>
						<th>
							<span>分类名称</span>
						</th>
						<th>
							<span>排序</span>
						</th>
						<th>
							<span>操作</span>
						</th>
					</tr>
						<tr grade="0">
							<td class="articleCategoryName">
									<span class="pointer firstCategory" style="margin-left: 0px;">
										关于我们
									</span>
							</td>
							<td>
								8
							</td>
							<td>
								<a href="/shop/article_list/about_us.htm" target="_blank" title="浏览">[浏览]</a>
									<a href="article_category!delete.action?id=4028818330556c7c0130558322ad0015" class="deleteArticleCategory" title="删除">[删除]</a>
								<a href="article_category!edit.action?id=4028818330556c7c0130558322ad0015" title="编辑">[编辑]</a>
							</td>
						</tr>
						<tr grade="0">
							<td class="articleCategoryName">
									<span class="pointer firstCategory" style="margin-left: 0px;">
										网站制度
									</span>
							</td>
							<td>
								7
							</td>
							<td>
								<a href="/shop/article_list/website_system.htm" target="_blank" title="浏览">[浏览]</a>
									<a href="article_category!delete.action?id=402881833054c381013054ef39bf0006" class="deleteArticleCategory" title="删除">[删除]</a>
								<a href="article_category!edit.action?id=402881833054c381013054ef39bf0006" title="编辑">[编辑]</a>
							</td>
						</tr>
						<tr grade="0">
							<td class="articleCategoryName">
									<span class="pointer firstCategory" style="margin-left: 0px;">
										服务保证
									</span>
							</td>
							<td>
								6
							</td>
							<td>
								<a href="/shop/article_list/service_guarantee.htm" target="_blank" title="浏览">[浏览]</a>
									<a href="article_category!delete.action?id=402881833054a24b013054aff8e0000f" class="deleteArticleCategory" title="删除">[删除]</a>
								<a href="article_category!edit.action?id=402881833054a24b013054aff8e0000f" title="编辑">[编辑]</a>
							</td>
						</tr>
						<tr grade="0">
							<td class="articleCategoryName">
									<span class="pointer firstCategory" style="margin-left: 0px;">
										售后服务
									</span>
							</td>
							<td>
								5
							</td>
							<td>
								<a href="/shop/article_list/service.htm" target="_blank" title="浏览">[浏览]</a>
									<a href="article_category!delete.action?id=402881833054a24b013054b1eadd0015" class="deleteArticleCategory" title="删除">[删除]</a>
								<a href="article_category!edit.action?id=402881833054a24b013054b1eadd0015" title="编辑">[编辑]</a>
							</td>
						</tr>
						<tr grade="0">
							<td class="articleCategoryName">
									<span class="pointer firstCategory" style="margin-left: 0px;">
										配送方式
									</span>
							</td>
							<td>
								4
							</td>
							<td>
								<a href="/shop/article_list/shipping_method.htm" target="_blank" title="浏览">[浏览]</a>
									<a href="article_category!delete.action?id=402881833054a24b013054b1326a0011" class="deleteArticleCategory" title="删除">[删除]</a>
								<a href="article_category!edit.action?id=402881833054a24b013054b1326a0011" title="编辑">[编辑]</a>
							</td>
						</tr>
						<tr grade="0">
							<td class="articleCategoryName">
									<span class="pointer firstCategory" style="margin-left: 0px;">
										支付方式
									</span>
							</td>
							<td>
								3
							</td>
							<td>
								<a href="/shop/article_list/payment.htm" target="_blank" title="浏览">[浏览]</a>
									<a href="article_category!delete.action?id=402881833054a24b013054b18d5b0013" class="deleteArticleCategory" title="删除">[删除]</a>
								<a href="article_category!edit.action?id=402881833054a24b013054b18d5b0013" title="编辑">[编辑]</a>
							</td>
						</tr>
						<tr grade="0">
							<td class="articleCategoryName">
									<span class="pointer firstCategory" style="margin-left: 0px;">
										购物指南
									</span>
							</td>
							<td>
								2
							</td>
							<td>
								<a href="/shop/article_list/shopping_guide.htm" target="_blank" title="浏览">[浏览]</a>
									<span title="无法删除">[删除]</span>
								<a href="article_category!edit.action?id=402881833054a24b013054ae2818000d" title="编辑">[编辑]</a>
							</td>
						</tr>
						<tr grade="1">
							<td class="articleCategoryName">
									<span class="pointer category" style="margin-left: 20px;">
										新手上路
									</span>
							</td>
							<td>
								2
							</td>
							<td>
								<a href="/shop/article_list/newbie.htm" target="_blank" title="浏览">[浏览]</a>
									<a href="article_category!delete.action?id=402881833054a24b013054b43b26001a" class="deleteArticleCategory" title="删除">[删除]</a>
								<a href="article_category!edit.action?id=402881833054a24b013054b43b26001a" title="编辑">[编辑]</a>
							</td>
						</tr>
						<tr grade="1">
							<td class="articleCategoryName">
									<span class="pointer category" style="margin-left: 20px;">
										交易条款
									</span>
							</td>
							<td>
								1
							</td>
							<td>
								<a href="/shop/article_list/terms.htm" target="_blank" title="浏览">[浏览]</a>
									<a href="article_category!delete.action?id=402881833054a24b013054b33a010017" class="deleteArticleCategory" title="删除">[删除]</a>
								<a href="article_category!edit.action?id=402881833054a24b013054b33a010017" title="编辑">[编辑]</a>
							</td>
						</tr>
						<tr grade="0">
							<td class="articleCategoryName">
									<span class="pointer firstCategory" style="margin-left: 0px;">
										帮助中心
									</span>
							</td>
							<td>
								1
							</td>
							<td>
								<a href="/shop/article_list/help.htm" target="_blank" title="浏览">[浏览]</a>
									<span title="无法删除">[删除]</span>
								<a href="article_category!edit.action?id=402881833054a24b013054b63976001c" title="编辑">[编辑]</a>
							</td>
						</tr>
						<tr grade="1">
							<td class="articleCategoryName">
									<span class="pointer category" style="margin-left: 20px;">
										隐私申明
									</span>
							</td>
							<td>
								2
							</td>
							<td>
								<a href="/shop/article_list/privacy.htm" target="_blank" title="浏览">[浏览]</a>
									<a href="article_category!delete.action?id=402881833054a24b013054bb054e002a" class="deleteArticleCategory" title="删除">[删除]</a>
								<a href="article_category!edit.action?id=402881833054a24b013054bb054e002a" title="编辑">[编辑]</a>
							</td>
						</tr>
						<tr grade="1">
							<td class="articleCategoryName">
									<span class="pointer category" style="margin-left: 20px;">
										常见问题
									</span>
							</td>
							<td>
								1
							</td>
							<td>
								<a href="/shop/article_list/questions.htm" target="_blank" title="浏览">[浏览]</a>
									<a href="article_category!delete.action?id=402881833054a24b013054b928030025" class="deleteArticleCategory" title="删除">[删除]</a>
								<a href="article_category!edit.action?id=402881833054a24b013054b928030025" title="编辑">[编辑]</a>
							</td>
						</tr>
				</tbody></table>
			</form>
		</div>
	</body>
</html>
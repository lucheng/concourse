<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html>
<head>
	<base href="<%=basePath%>">
	<title>文章分类列表 - Powered By SHOP++</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
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
			<form id="listForm" action="articleCategory/list" method="post">
				<div class="listBar">
					<input type="button" class="formButton" onclick="location.href='articleCategory/add'" value="添加分类" hidefocus="">
				</div>
				<table id="listTable" class="listTable">
					<tbody>
						<tr>
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
						<c:forEach items="${entry}" var="entry">
						<tr grade="0">
							<td class="articleCategoryName">
									<span class="pointer firstCategory" style="margin-left: 0px;">
										${entry.name}
									</span>
							</td>
							<td>
								${entry.orderList}
							</td>
							<td>
								<a href="/shop/article_list/about_us.htm" target="_blank" title="浏览">[浏览]</a>
									<a href="articleCategory/delete/${entry.id}" class="deleteArticleCategory" title="删除">[删除]</a>
								<a href="articleCategory/edit/${entry.id}" title="编辑">[编辑]</a>
							</td>
						</tr>
							<c:forEach items="${entry.children}" var="child">
								<tr grade="1">
									<td class="articleCategoryName">
											<span class="pointer category" style="margin-left: 20px;">
												${child.name}
											</span>
									</td>
									<td>
										${child.orderList}
									</td>
									<td>
										<a href="/shop/article_list/terms.htm" target="_blank" title="浏览">[浏览]</a>
											<a href="articleCategory/delete/${child.id}" class="deleteArticleCategory" title="删除">[删除]</a>
										<a href="articleCategory/edit/${child.id}" title="编辑">[编辑]</a>
									</td>
								</tr>
							</c:forEach>
						</c:forEach>	
					</tbody>
				</table>
			</form>
		</div>
	</body>
</html>
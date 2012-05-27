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
		文章列表&nbsp;总记录数: 34 (共2页)
	</div>
	<div class="body">
		<form id="listForm" action="/article/list" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='<%=path %>/article/add'" value="添加文章" hidefocus="">
				&nbsp;&nbsp;
				<label>查找: </label>
				<select name="pager.searchBy">
					<option value="title">
						标题
					</option>
				</select>
				<input type="text" name="pager.keyword" value="">
				<input type="button" id="searchButton" class="formButton" value="搜 索" hidefocus="">
				&nbsp;&nbsp;
				<label>每页显示: </label>
				<select name="pager.pageSize" id="pageSize">
					<option value="10">
						10
					</option>
					<option value="20" selected="">
						20
					</option>
					<option value="50">
						50
					</option>
					<option value="100">
						100
					</option>
				</select>
			</div>
			<table id="listTable" class="listTable">
				<tbody><tr>
					<th class="check">
						<input type="checkbox" class="allCheck">
					</th>
					<th>
						<a href="#" class="sort" name="title" hidefocus="">标题</a>
					</th>
					<th>
						<a href="#" class="sort" name="articleCategory" hidefocus="">分类</a>
					</th>
					<th>
						<a href="#" class="sort" name="isPublication" hidefocus="">是否发布</a>
					</th>
					<th>
						<a href="#" class="sort" name="isRecommend" hidefocus="">作者</a>
					</th>
					<th>
						<a href="#" class="sort desc" name="createDate" hidefocus="">添加时间</a>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
				<c:forEach items="${entity}" var="article">
					<tr>
						<td>
							<input type="checkbox" name="ids" value="402881833054c381013054f0df410009">
						</td>
						<td>
							<span title="${article.title}">
								${article.title}
							</span>
						</td>
						<td>
							${article.categoryName}
						</td>
						<td>
							<span>${article.status}</span>
						</td>
						<td>
							<span>${article.author}</span>
						</td>
						<td>
							<span title="${article.createDate}">${article.createDate}</span>
						</td>
						<td>
							<a href="<%=path%>/article/edit/${article.id}" title="编辑">[编辑]</a>
								<a href="/html/201101/cab605b089cd44a5af83975915e55087.html" target="_blank" title="浏览">[浏览]</a>
						</td>
					</tr>
					</c:forEach>
			</tbody></table>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="article!delete.action" value="删 除" disabled="" hidefocus="">
					</div>
					<div class="pager">
<script type="text/javascript">
$().ready( function() {
	
	var $pager = $("#pager");
	
	$pager.pager({
		pagenumber: 1,
		pagecount: 2,
		buttonClickCallback: $.gotoPage
	});

})
</script>
<span id="pager"><ul class="pages"><li class="pgNext pgEmpty">首页</li><li class="pgNext pgEmpty">上一页</li><li class="page-number pgCurrent">1</li><li class="page-number">2</li><li class="pgNext">下一页</li><li class="pgNext">末页</li></ul></span>
<input type="hidden" name="pager.pageNumber" id="pageNumber" value="1">
<input type="hidden" name="pager.orderBy" id="orderBy" value="createDate">
<input type="hidden" name="pager.order" id="order" value="desc">					</div>
				<div>
		
	</div>

	</div>
	</form>
	</div>
</body>
</html>
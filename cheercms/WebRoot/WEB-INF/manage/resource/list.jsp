<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html>
<head>
	<base href="<%=basePath%>">
	<title>文章分类列表 - Powered By SHOP++</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<script type="text/javascript" src="<%=path %>/js/jquery.pager.js"></script>
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
	})
	</script>
	</head>
	<body class="list">
	<div class="bar">
		总记录数: ${pageView.totalrecord} (共${pageView.totalpage}页)
	</div>
	<div class="body">
		<form id="listForm" action="<%=path %>/resource/list" method="post">
		
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='<%=path %>/resource/add'" value="添加链接" hidefocus="">
				&nbsp;&nbsp;
				<label>查找: </label>
				<select name="searchBy">
					<option value="name" <c:if test="${pageparam.searchBy=='name'}">selected="selected"</c:if> >
						名称
					</option>
				</select>
				<input type="text" name="keyword" value="${pageparam.keyword}">
				<input type="button" id="searchButton" class="formButton" value="搜 索" hidefocus="" value="">
				&nbsp;&nbsp;
				<label>每页显示: </label>
				<select name="pageSize" id="pageSize">
					<option value="10" <c:if test="${pageSize==10}">selected="selected"</c:if>>
						10
					</option>
					<option value="20" <c:if test="${pageSize==20}">selected="selected"</c:if>>
						20
					</option>
					<option value="50" <c:if test="${pageSize==50}">selected="selected"</c:if>>
						50
					</option>
					<option value="100" <c:if test="${pageSize==100}">selected="selected"</c:if>>
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
						<a href="javascript:void(0);" class="sort<c:if test="${pageparam.orderBy == 'name'}"> ${pageparam.order}</c:if>" name="name" hidefocus="">资源名称</a>
					</th>
					<th>
						<a href="javascript:void(0);" class="sort<c:if test="${pageparam.orderBy == 'value'}"> ${pageparam.order}</c:if>" name="value" hidefocus="">资源标识</a>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
				<c:forEach items="${pageView.records}" var="entry">
					<tr>
						<td>
							<input type="checkbox" name="ids" value="${entry.id}">
						</td>
						<td>
							<span title="${entry.name}">
								${entry.name}
							</span>
						</td>
						<td>
							${entry.value}
						</td>
						
						<td>
							<a href="<%=path%>/resource/edit/${entry.id}" title="编辑">[编辑]</a>
							<a href="<%=path%>/resource/delete/${entry.id}" title="编辑">[删 除]</a>
						</td>
					</tr>
					</c:forEach>
			</tbody></table>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="<%=path %>/resource/delete" value="删 除" disabled="" hidefocus="">
					</div>
					<%@ include file="../common/pager.jsp"%>
				</div>
			</form>
		</div>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../inc/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>管理员列表 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<script type="text/javascript" src="<%=path %>/js/jquery.pager.js"></script>
</head>
<body class="list">
	<div class="bar">
		分类列表&nbsp;总记录数: 1 (共1页)
	</div>
	<div class="body">
		<form id="listForm" action="<%=path %>/admin/list" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='<%=path %>/category/add'" value="添加分类" hidefocus="">
				&nbsp;&nbsp;
				<select name="pager.searchBy">
					<option value="categoryName">
						用户名
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
				<tbody>
					<tr>
						<th class="check">
							<input type="checkbox" class="allCheck">
						</th>
						<th>
							<a href="#" class="sort" name="categoryname" hidefocus="">用户名</a>
						</th>
						<th>
							<a href="#" class="sort desc" name="createDate" hidefocus="">级别</a>
						</th>
						<th>
							<a href="#" class="sort desc" name="createDate" hidefocus="">操作</a>
						</th>
					</tr>
					<c:forEach items="${list}" var="entry">
					<tr>
						<td>
							<input type="checkbox" name="ids" value="0731dcsoft2010031200000000000017">
						</td>
						<td>
							${entry.name}
						</td>
						<td>
							${entry.parentID}
						</td>
						<td>
							<a href="<%=path %>/category/edit/${entry.id}" title="编辑">[编辑]</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="category!delete.action" value="删 除" disabled="" hidefocus="">
					</div>
					<div class="pager">
<script type="text/javascript">
$().ready( function() {
	
	var $pager = $("#pager");
	
	$pager.pager({
		pagenumber: 1,
		pagecount: 1,
		buttonClickCallback: $.gotoPage
	});

})
</script>
<span id="pager">
<ul class="pages">
	<li class="pgNext pgEmpty">首页</li>
	<li class="pgNext pgEmpty">上一页</li>
	<li class="page-number pgCurrent">1</li>
	<li class="pgNext pgEmpty">下一页</li>
	<li class="pgNext pgEmpty">末页</li>
</ul>
</span>
<input type="hidden" name="pager.pageNumber" id="pageNumber" value="1">
<input type="hidden" name="pager.orderBy" id="orderBy" value="createDate">
<input type="hidden" name="pager.order" id="order" value="desc"></div>
<div>
</div>
</div></form></div></body></html>
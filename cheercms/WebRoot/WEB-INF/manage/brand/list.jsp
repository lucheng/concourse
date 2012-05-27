
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>品牌列表 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
</head>
<body class="list">
	<div class="bar">
		品牌列表&nbsp;总记录数: 27 (共3页)
	</div>
	<div class="body">
		<form id="listForm" action="<%=path %>/brand/list" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='<%=path %>/brand/add'" value="添加品牌" hidefocus="">
				&nbsp;&nbsp;
				<label>查找: </label>
				<select name="pager.searchBy">
					<option value="name" selected="">
						名称
					</option>
				</select>
				<input type="text" name="keyword" value="">
				<input type="button" id="searchButton" class="formButton" value="搜 索" hidefocus="">
				&nbsp;&nbsp;
				<label>每页显示: </label>
				<select name="pageSize" id="pageSize">
					<option value="10" selected="">
						10
					</option>
					<option value="20">
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
							<a href="#" class="sort" name="name" hidefocus="">品牌名称</a>
						</th>
						<th>
							<a href="#" class="sort" name="url" hidefocus="">网址</a>
						</th>
						<th>
							<a href="#" class="sort" name="logoPath" hidefocus="">LOGO</a>
						</th>
						<th>
							<a href="#" class="sort asc" name="orderList" hidefocus="">排序</a>
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
							${entry.name}
						</td>
						<td>
							<a href="${entry.url}" target="_blank">${entry.url}</a>
						</td>
						<td>
								-
						</td>
						<td>
							${entry.orderList}
						</td>
						<td>
							<a href="<%=path %>/brand/edit/${entry.id}" title="编辑">[编辑]</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="<%=path %>/brand/delete" value="删 除" disabled="" hidefocus="">
					</div>
					<div class="pager">
<script type="text/javascript">
$().ready( function() {
	var $pager = $("#pager");
	$pager.pager({
		pagenumber: 2,
		pagecount: 3,
		buttonClickCallback: $.gotoPage
	});

})
</script>
<span id="pager"><ul class="pages"><li class="pgNext">首页</li><li class="pgNext">上一页</li><li class="page-number">1</li><li class="page-number pgCurrent">2</li><li class="page-number">3</li><li class="pgNext">下一页</li><li class="pgNext">末页</li></ul></span>
<input type="hidden" name="pager.pageNumber" id="pageNumber" value="2">
<input type="hidden" name="pager.orderBy" id="orderBy" value="orderList">
<input type="hidden" name="pager.order" id="order" value="asc">					</div>
				<div>
		
	</div>

</div></form></div></body></html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>角色列表 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<script type="text/javascript" src="<%=path %>/js/jquery.pager.js"></script>
</head>
<body class="list">
	<div class="bar">
		角色管理&nbsp;总记录数: 1 (共1页)
	</div>
	<div class="body">
		<form id="listForm" action="role!list.action" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='<%=path %>/role/add'" value="添加角色" hidefocus="">
				&nbsp;&nbsp;
				<label>查找: </label>
				<select name="pager.searchBy">
					<option value="name">
						角色名称
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
						<a href="#" class="sort" name="name" hidefocus="">角色名称</a>
					</th>
					<th>
						<a href="#" class="sort" name="isSystem" hidefocus="">系统内置</a>
					</th>
					<th>
						<a href="#" class="sort" name="description" hidefocus="">描述</a>
					</th>
					<th>
						<a href="#" class="sort desc" name="createDate" hidefocus="">创建日期</a>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
					<tr>
						<td>
							<input type="checkbox" disabled="" title="系统内置权限不允许删除!">
						</td>
						<td>
							超级管理员
						</td>
						<td>
							<span class="trueIcon">&nbsp;</span>
						</td>
						<td>
							拥有后台管理最高权限
						</td>
						<td>
							<span title="2011-01-01 00:00:00">
								2011-01-01
							</span>
						</td>
						<td>
							<a href="role!edit.action?id=0731dcsoft2010031200000000000016" title="编辑">[编辑]</a>
						</td>
					</tr>
			</tbody></table>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="role!delete.action" value="删 除" disabled="" hidefocus="">
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
<span id="pager"><ul class="pages"><li class="pgNext pgEmpty">首页</li><li class="pgNext pgEmpty">上一页</li><li class="page-number pgCurrent">1</li><li class="pgNext pgEmpty">下一页</li><li class="pgNext pgEmpty">末页</li></ul></span>
<input type="hidden" name="pager.pageNumber" id="pageNumber" value="1">
<input type="hidden" name="pager.orderBy" id="orderBy" value="createDate">
<input type="hidden" name="pager.order" id="order" value="desc">					</div>
				<div>
		
	</div>

</div></form></div></body></html>
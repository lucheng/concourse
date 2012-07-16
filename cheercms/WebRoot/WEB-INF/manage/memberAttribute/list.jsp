<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>会员列表 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<base href="<%=basePath%>">
<link href="/template/admin/css/base.css" rel="stylesheet" type="text/css">
<link href="/template/admin/css/admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/template/common/js/jquery.js"></script>
<script type="text/javascript" src="/template/common/js/jquery.pager.js"></script>
<script type="text/javascript" src="/template/admin/js/base.js"></script>
<script type="text/javascript" src="/template/admin/js/admin.js"></script>
</head>
<body class="list">
	<div class="bar">
		会员注册项管理&nbsp;总记录数: 8 (共1页)
	</div>
	<div class="body">
		<form id="listForm" action="memberAttribute/list" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='memberAttribute/add'" value="添加注册项" hidefocus="">
				&nbsp;&nbsp;
				<label>查找: </label>
				<select name="searchBy">
					<option value="username">
						名称
					</option>
					<option value="email">
						类型
					</option>
				</select>
				<input type="text" name="keyword" value="">
				<input type="button" id="searchButton" class="formButton" value="搜 索" hidefocus="">
				&nbsp;&nbsp;
				<label>每页显示: </label>
				<select name="pageSize" id="pageSize">
					<option value="10" <c:if test="${seachParam.pageSize == 10}">selected="selected"</c:if> >
						10
					</option>
					<option value="20" <c:if test="${seachParam.pageSize == 20}">selected="selected"</c:if>>
						20
					</option>
					<option value="50" <c:if test="${seachParam.pageSize == 50}">selected="selected"</c:if>>
						50
					</option>
					<option value="100" <c:if test="${seachParam.pageSize == 100}">selected="selected"</c:if>>
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
						<a href="#" class="sort" name="name" hidefocus="">名称</a>
					</th>
					<th>
						<a href="#" class="sort" name="attributeType" hidefocus="">类型</a>
					</th>
					<th>
						<a href="#" class="sort" name="isRequired" hidefocus="">是否必填</a>
					</th>
					<th>
						<a href="#" class="sort" name="isEnabled" hidefocus="">是否启用</a>
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
							${entry.attributeType}
						</td>
						<td>
							<c:if test="${entry.isRequired}"><span class="trueIcon">&nbsp;</span></c:if>
							<c:if test="0 == ${entry.isRequired}"><span class="falseIcon">&nbsp;</span></c:if>
						</td>
						<td>
							<c:if test="${entry.isEnabled}"><span class="trueIcon">&nbsp;</span></c:if>
							<c:if test="0 == ${entry.isEnabled}"><span class="falseIcon">&nbsp;</span></c:if>
						</td>
						<td>
							${entry.orderList}
						</td>
						<td>
							<a href="memberRank/edit/${entry.id}" title="编辑">[编辑]</a>
						</td>
					</tr>
					</c:forEach>
			</tbody></table>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="member_attribute!delete.action" value="删 除" disabled="" hidefocus="">
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
<input type="hidden" name="pager.orderBy" id="orderBy" value="orderList">
<input type="hidden" name="pager.order" id="order" value="asc">					</div>
				<div>
		
	</div>

</div></form></div></body>
</html>
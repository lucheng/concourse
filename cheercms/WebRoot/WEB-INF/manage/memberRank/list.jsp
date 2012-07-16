<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>会员等级列表 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<script type="text/javascript" src="js/jquery.pager.js"></script>
</head>
<body class="list">
	<div class="bar">
		会员等级管理&nbsp;总记录数: 4 (共1页)
	</div>
	<div class="body">
		<form id="listForm" action="memberRank/list" method="post">
			
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='memberRank/add'" value="添加等级" hidefocus="">
				&nbsp;&nbsp;
				<label>查找: </label>
				<select name="searchBy">
					<option value="username">
						用户名
					</option>
					<option value="email">
						E-mail
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
				<tbody>
					<tr>
						<th class="check">
							<input type="checkbox" class="allCheck">
						</th>
						<th>
							<a href="#" class="sort" name="name" hidefocus="">等級名称</a>
						</th>
						<th>
							<a href="#" class="sort" name="preferentialScale" hidefocus="">优惠百分比</a>
						</th>
						<th>
							<a href="#" class="sort" name="point" hidefocus="">所需积分</a>
						</th>
						<th>
							<a href="#" class="sort" name="isDefault" hidefocus="">是否默认</a>
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
							${entry.preferentialScale}%
						</td>
						<td>
							${entry.point}
						</td>
						<td>
							<%--<c:if test="${entry.isDefaulted}"><span class="trueIcon">&nbsp;</span></c:if>
							<c:if test="${entry.isDefaulted}"><span class="falseIcon">&nbsp;</span></c:if>
						--%>
						</td>
						<td>
							<a href="memberRank/edit/${entry.id}" title="编辑">[编辑]</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" onclick="location.href='memberRank/delete'" value="删 除" disabled="" hidefocus="">
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
						<input type="hidden" name="pager.order" id="order" value="desc">
					</div>
				<div>
			</div>
		</div>
	</form>
</div>
</body></html>
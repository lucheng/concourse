
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>商品规格管理 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<script type="text/javascript" src="<%=path %>/js/jquery.pager.js"></script>
</head>
<body class="list">
	<div class="bar">
		商品规格管理&nbsp;<span class="pageInfo">总记录数: 6 (共1页)
	</span></div>
	<div class="body">
		<form id="listForm" action="<%=path %>/feature/list" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='<%=path %>/feature/add'" value="添加规格" hidefocus="">
				&nbsp;&nbsp;
				<label>查找: </label>
				<select name="pager.searchBy">
					<option value="name">
						名称
					</option>
					<option value="memo">
						备注
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
						<a href="#" class="sort" name="name" hidefocus="">规格名称</a>
					</th>
					<th>
						<a href="#" class="sort" name="specificationType" hidefocus="">规格类型</a>
					</th>
					<th>
						<span>规格值</span>
					</th>
					<th>
						<span>排序</span>
					</th>
					<th>
						<span>操作</span>
					</th>
				</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="4028918130316046013031d3104a0039">
						</td>
						<td>
							颜色
								<span class="gray">[电脑办公]</span>
						</td>
						<td>
							图片类型
						</td>
						<td>
								白色
								橙色
								粉红色
								黑色
								红色
								黄色
								灰色
								蓝色
								绿色
								银色
								紫色
								混色
						</td>
						<td>
							1
						</td>
						<td>
							<a href="specification!edit.action?id=4028918130316046013031d3104a0039" title="编辑">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="4028918130316046013031d58e76003a">
						</td>
						<td>
							颜色
								<span class="gray">[手机数码]</span>
						</td>
						<td>
							图片类型
						</td>
						<td>
								白色
								橙色
								粉红色
								黑色
								红色
								黄色
								灰色
								蓝色
								绿色
								银色
								紫色
								混色
						</td>
						<td>
							2
						</td>
						<td>
							<a href="specification!edit.action?id=4028918130316046013031d58e76003a" title="编辑">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="4028918130316046013031d848fe003b">
						</td>
						<td>
							颜色
								<span class="gray">[家用电器]</span>
						</td>
						<td>
							图片类型
						</td>
						<td>
								白色
								橙色
								粉红色
								黑色
								红色
								黄色
								灰色
								蓝色
								绿色
								银色
								紫色
								混色
						</td>
						<td>
							3
						</td>
						<td>
							<a href="specification!edit.action?id=4028918130316046013031d848fe003b" title="编辑">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="4028918130316046013031db714a0043">
						</td>
						<td>
							颜色
								<span class="gray">[时尚影音]</span>
						</td>
						<td>
							图片类型
						</td>
						<td>
								白色
								橙色
								粉红色
								黑色
								红色
								黄色
								灰色
								蓝色
								绿色
								银色
								紫色
								混色
						</td>
						<td>
							4
						</td>
						<td>
							<a href="specification!edit.action?id=4028918130316046013031db714a0043" title="编辑">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="4028918130316046013031dfc3f6004f">
						</td>
						<td>
							版本
								<span class="gray">[IPAD内存大小]</span>
						</td>
						<td>
							文字类型
						</td>
						<td>
								16G
								32G
								64G
						</td>
						<td>
							5
						</td>
						<td>
							<a href="specification!edit.action?id=4028918130316046013031dfc3f6004f" title="编辑">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="4028918130316046013031e310ea0058">
						</td>
						<td>
							版本
								<span class="gray">[手机定制版本]</span>
						</td>
						<td>
							文字类型
						</td>
						<td>
								定制
								非定制
						</td>
						<td>
							6
						</td>
						<td>
							<a href="specification!edit.action?id=4028918130316046013031e310ea0058" title="编辑">[编辑]</a>
						</td>
					</tr>
			</tbody></table>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="specification!delete.action" value="删 除" disabled="" hidefocus="">
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

</div></form></div></body></html>
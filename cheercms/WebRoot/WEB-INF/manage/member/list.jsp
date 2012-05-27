<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>会员列表 - Powered By SHOP++</title>
<meta name="Author" content="SHOP++ Team">
<meta name="Copyright" content="SHOP++">
<script type="text/javascript" src="js/jquery.pager.js"></script>
</head>
<body class="list">
	<div class="bar">
		会员列表&nbsp;总记录数: 737 (共37页)
	</div>
	<div class="body">
		<form id="listForm" action="member/list" method="post">
			<div class="listBar">
				<input type="button" class="formButton" onclick="location.href='member/add'" value="添加会员" hidefocus="">
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
				<input type="text" name="pager.keyword" value="">
				<input type="button" id="searchButton" class="formButton" value="搜 索" hidefocus="">
				&nbsp;&nbsp;
				<label>每页显示: </label>
				<select name="pageSize" id="pageSize">
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
							<a href="#" class="sort" name="username" hidefocus="">用户名</a>
						</th>
						<th>
							<a href="#" class="sort" name="memberRank" hidefocus="">会员等级</a>
						</th>
						<th>
							<a href="#" class="sort" name="email" hidefocus="">E-mail</a>
						</th>
						<th>
							<a href="#" class="sort desc" name="createDate" hidefocus="">注册日期</a>
						</th>
						<th>
							<span>状态</span>
						</th>
						<th>
							<span>操作</span>
						</th>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb013786be5b6a02dc">
						</td>
						<td>
							test123123
						</td>
						<td>
							普通会员
						</td>
						<td>
							test@teest.test
						</td>
						<td>
							<span title="2012-05-26 09:24:11">2012-05-26</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb013786be5b6a02dc" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb013785ac964602d8">
						</td>
						<td>
							test124
						</td>
						<td>
							普通会员
						</td>
						<td>
							gxj35@qq.com
						</td>
						<td>
							<span title="2012-05-26 04:25:09">2012-05-26</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb013785ac964602d8" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb0137841e331702d6">
						</td>
						<td>
							zaabc
						</td>
						<td>
							普通会员
						</td>
						<td>
							z@a.com
						</td>
						<td>
							<span title="2012-05-25 21:10:00">2012-05-25</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb0137841e331702d6" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb0137835f3c9d02d3">
						</td>
						<td>
							test009
						</td>
						<td>
							普通会员
						</td>
						<td>
							test@126.com
						</td>
						<td>
							<span title="2012-05-25 17:41:25">2012-05-25</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb0137835f3c9d02d3" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb0137831d3e1502cc">
						</td>
						<td>
							minimice
						</td>
						<td>
							普通会员
						</td>
						<td>
							minimice@126.com
						</td>
						<td>
							<span title="2012-05-25 16:29:20">2012-05-25</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb0137831d3e1502cc" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb013781b7e51102be">
						</td>
						<td>
							xiaozhi
						</td>
						<td>
							普通会员
						</td>
						<td>
							admin@admin.com
						</td>
						<td>
							<span title="2012-05-25 09:59:01">2012-05-25</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb013781b7e51102be" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb0137817f5f2802b9">
						</td>
						<td>
							yyzhj2008
						</td>
						<td>
							普通会员
						</td>
						<td>
							dfg@qq.com
						</td>
						<td>
							<span title="2012-05-25 08:57:17">2012-05-25</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb0137817f5f2802b9" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb01377f47c11902b6">
						</td>
						<td>
							6666666
						</td>
						<td>
							普通会员
						</td>
						<td>
							sunnypig00@homail.com
						</td>
						<td>
							<span title="2012-05-24 22:37:17">2012-05-24</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb01377f47c11902b6" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb01377e2c53b902ab">
						</td>
						<td>
							bruce_wang521
						</td>
						<td>
							普通会员
						</td>
						<td>
							bruce_wang521@163.com
						</td>
						<td>
							<span title="2012-05-24 17:27:43">2012-05-24</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb01377e2c53b902ab" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb01377d801e5602a3">
						</td>
						<td>
							yy88637302
						</td>
						<td>
							普通会员
						</td>
						<td>
							f704027971@vip.qq.com
						</td>
						<td>
							<span title="2012-05-24 14:19:37">2012-05-24</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb01377d801e5602a3" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb01377d5934ba0297">
						</td>
						<td>
							huweida
						</td>
						<td>
							普通会员
						</td>
						<td>
							Mrhuweida@126.com
						</td>
						<td>
							<span title="2012-05-24 13:37:07">2012-05-24</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb01377d5934ba0297" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb01377d511a150294">
						</td>
						<td>
							jyook
						</td>
						<td>
							普通会员
						</td>
						<td>
							jyook@qq.com
						</td>
						<td>
							<span title="2012-05-24 13:28:16">2012-05-24</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb01377d511a150294" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb01377ce7daf70293">
						</td>
						<td>
							jinbujiuhao
						</td>
						<td>
							普通会员
						</td>
						<td>
							jinbujiuhao@qq.com
						</td>
						<td>
							<span title="2012-05-24 11:33:18">2012-05-24</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb01377ce7daf70293" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb01377cd74c510290">
						</td>
						<td>
							testuser
						</td>
						<td>
							普通会员
						</td>
						<td>
							testuser@qq.com
						</td>
						<td>
							<span title="2012-05-24 11:15:13">2012-05-24</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb01377cd74c510290" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb0137791e541d027d">
						</td>
						<td>
							mustardduck
						</td>
						<td>
							普通会员
						</td>
						<td>
							mustardduck@qq.com
						</td>
						<td>
							<span title="2012-05-23 17:54:19">2012-05-23</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb0137791e541d027d" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb013778ffac36027a">
						</td>
						<td>
							dik
						</td>
						<td>
							普通会员
						</td>
						<td>
							i_java@163.com
						</td>
						<td>
							<span title="2012-05-23 17:20:50">2012-05-23</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb013778ffac36027a" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb013778ed70bb0274">
						</td>
						<td>
							迷茫
						</td>
						<td>
							普通会员
						</td>
						<td>
							123@126.com
						</td>
						<td>
							<span title="2012-05-23 17:00:55">2012-05-23</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb013778ed70bb0274" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb013778e41af6026e">
						</td>
						<td>
							10086
						</td>
						<td>
							普通会员
						</td>
						<td>
							1@q.com
						</td>
						<td>
							<span title="2012-05-23 16:50:44">2012-05-23</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb013778e41af6026e" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb013778991c99026a">
						</td>
						<td>
							testaa
						</td>
						<td>
							普通会员
						</td>
						<td>
							feife@1.om
						</td>
						<td>
							<span title="2012-05-23 15:28:49">2012-05-23</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb013778991c99026a" title="[编辑]">[编辑]</a>
						</td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" name="ids" value="297e3f23374660fb013777bce4700260">
						</td>
						<td>
							sanxia20
						</td>
						<td>
							普通会员
						</td>
						<td>
							sanxia20@qq.com
						</td>
						<td>
							<span title="2012-05-23 11:28:17">2012-05-23</span>
						</td>
						<td>
								<span class="green">正常</span>
						</td>
						<td>
							<a href="member!edit.action?id=297e3f23374660fb013777bce4700260" title="[编辑]">[编辑]</a>
						</td>
					</tr>
			</tbody></table>
				<div class="pagerBar">
					<div class="delete">
						<input type="button" id="deleteButton" class="formButton" url="member!delete.action" value="删 除" disabled="" hidefocus="">
					</div>
					<div class="pager">
<script type="text/javascript">
$().ready( function() {
	
	var $pager = $("#pager");
	
	$pager.pager({
		pagenumber: 1,
		pagecount: 37,
		buttonClickCallback: $.gotoPage
	});

})
</script>
<span id="pager"><ul class="pages"><li class="pgNext pgEmpty">首页</li><li class="pgNext pgEmpty">上一页</li><li class="page-number pgCurrent">1</li><li class="page-number">2</li><li class="page-number">3</li><li class="page-number">4</li><li class="page-number">5</li><li class="page-number">6</li><li class="page-number">7</li><li class="page-number">8</li><li class="page-number">9</li><li class="pgNext">下一页</li><li class="pgNext">末页</li></ul></span>
<input type="hidden" name="pager.pageNumber" id="pageNumber" value="1">
<input type="hidden" name="pager.orderBy" id="orderBy" value="createDate">
<input type="hidden" name="pager.order" id="order" value="desc">					</div>
				<div>
		
	</div>

</div></form></div></body></html>
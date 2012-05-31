<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="pager">
	<script type="text/javascript">
	$().ready( function() {
		var $pager = $("#pager");
		$pager.pager({
			pagenumber: ${pageView.currentpage},
			pagecount: ${pageView.totalpage},
			buttonClickCallback: $.gotoPage
		});
	})
	</script>
	<span id="pager">
		<ul class="pages">
			<li class="pgNext <c:if test="${pageView.totalpage < 1}">pgEmpty</c:if>">首页</li>
			<li class="pgNext <c:if test="${pageView.totalpage < 1}">pgEmpty</c:if>">上一页</li>
			<c:forEach begin="${pageView.pageindex.startindex}" end="${pageView.pageindex.endindex}" var="wp">
			    <c:if test="${pageView.currentpage==wp}">
			    	<li class="page-number pgCurrent">${wp}</li>
			    </c:if>
			    <c:if test="${pageView.currentpage!=wp}">
					<li class="page-number">${wp}</li>			    	
			    </c:if>
			</c:forEach>
			<li class="pgNext <c:if test="${pageView.totalpage < 1}">pgEmpty</c:if>">下一页</li>
			<li class="pgNext <c:if test="${pageView.totalpage < 1}">pgEmpty</c:if>">末页</li>
		</ul>
	</span>
	<input type="hidden" name="pageNumber" id="pageNumber" value="1">
	<input type="hidden" name="orderBy" id="orderBy" value="createDate">
	<input type="hidden" name="order" id="order" value="desc">
</div>
<div></div>

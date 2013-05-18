<%@ page language="java" pageEncoding="UTF-8"%>
<script language="JavaScript">
	//到指定的分页页面
	function topage(page){
		var form = document.forms[0];
		form.page.value=page;
		form.submit();
	}
	</script>
<div class="view-title-bar" id="selectedpage_tailer" style="display: block;margin-bottom:12px;">
	<div class="view-title-bar-tool">
		<div class="selectedpage-page view-page-navigator">
			<c:forEach begin="${pageView.pageindex.startindex}" end="${pageView.pageindex.endindex}" var="wp">
			    <c:if test="${pageView.currentpage==wp}">
			    	<span class="current">${wp}</span>
			    </c:if>
			    <c:if test="${pageView.currentpage!=wp}">
			    	<a href="javascript:topage('${wp}')" onclick="javascript:void();">${wp}</a>
			    </c:if>
			</c:forEach>
		</div>
    </div>
</div>
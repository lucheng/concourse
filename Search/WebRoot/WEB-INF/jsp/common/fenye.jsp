<%@ page language="java" pageEncoding="UTF-8"%>
<%--<font color="#FFFFFF">
    当前页:第${pageView.currentpage}页 | 总记录数:${pageView.totalrecord}条 | 每页显示:${pageView.maxresult}条 | 总页数:${pageView.totalpage}页</font>　
<c:forEach begin="${pageView.pageindex.startindex}" end="${pageView.pageindex.endindex}" var="wp">
    <c:if test="${pageView.currentpage==wp}">
    	<b><font color="#FFFFFF">第${wp}页</font></b>
    </c:if>
    <c:if test="${pageView.currentpage!=wp}">
    	<a href="javascript:topage('${wp}')" class="a03">第${wp}页</a>
    </c:if>
</c:forEach>
--%>
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
			<%--<span class="current">1</span>
			<a href="#" onclick="">2</a>
			<a href="#" onclick="">3</a>
			<a href="#" onclick="">4</a>
			<a href="#" onclick="">5</a>
			<a href="#" onclick=""><span class="view-nextpage" style="width:6px;">&nbsp;</span></a>
		--%>
		</div>
    </div>
</div>
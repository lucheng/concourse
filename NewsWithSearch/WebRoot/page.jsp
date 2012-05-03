<%@ page language="java"  contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<script language="javascript">
		function jumping() {
			document.pageForm.submit();
			return true;
		}
		function gotoPage(pageNum) {
			document.pageForm.jumpPage.value = pageNum ;
			document.pageForm.submit();
			return true;
		}
	</script>
</head>
<body>
	<c:if test="${pageControl.maxPage != 1}">
		<form method="post" action="pageAction.action" name="pageForm">

		<table>
			<tr>
				<td>
					每页${pageControl.rowsPerPage}行
				</td>
				<td>
					共${pageControl.maxRowCount }行
				</td>
				<td>
					第${pageControl.curPage }页
				</td>
				<td>
					共${pageControl.maxPage }页
				</td>
				<td>
					<c:choose>
						<c:when test="${pageControl.curPage == 1}">
							首页 上一页
						</c:when>
						
						<c:otherwise>
							<A HREF="javascript:gotoPage(1)">首页</A>
							<A HREF="javascript:gotoPage(${pageControl.curPage - 1} )">上一页</A>	
						</c:otherwise>
					</c:choose>
					
					
					<c:choose>
						<c:when test="${pageControl.curPage == pageControl.maxPage}">
							下一页 尾页
						</c:when>
						
						<c:otherwise>
							<A HREF="javascript:gotoPage(${pageControl.curPage + 1})">下一页</A>
							<A HREF="javascript:gotoPage(${pageControl.maxPage })">尾页</A>
						</c:otherwise>
					</c:choose>
					转到第
					<SELECT name="jumpPage" onchange="jumping()">
								<c:forEach var="i" begin="1" end="${pageControl.maxPage}" step="1">
									<c:choose>
										<c:when test="${i == pageControl.curPage}">
											<OPTION selected value="${i}">${i }</OPTION>
										</c:when>
										<c:otherwise>
											<OPTION value="${i}">${i}</OPTION>					
										</c:otherwise>
									</c:choose>
								</c:forEach>
					</SELECT>
					页
				</td>
			</tr>
		</table>

	</form>
	</c:if>
	
</body>
</html>

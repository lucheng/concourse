<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html>
	<head>
	<base href="<%=basePath%>">
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<title>添加/编辑文章 - Powered By SHOP++</title>
	<script charset="utf-8" src="<%=path%>/kindeditor/kindeditor-min.js"></script>
	<script charset="utf-8" src="<%=path%>/kindeditor/zh_CN.js"></script>
	<script>
		KE.show({
	    	id : 'content',
	    	allowFileManager : true,  
	        imageUploadJson : '<%=path%>/kindeditor/jsp/upload_json.jsp',  
			fileManagerJson : '<%=path%>kindeditor/jsp/file_manager_json.jsp',  
	    	afterCreate : function(id) { 
		    	KE.event.ctrl(document, 13, function() {  
			        KE.util.setData(id);  
			        document.forms['example'].submit();  
			    });
		    	KE.event.ctrl(KE.g[id].iframeDoc, 13, function() {
			        KE.util.setData(id);
			        document.forms['example'].submit();  
		        });
	      	}  
	    }); 
	</script>
	</head>
	<body class="input">
	<div class="bar">
		添加文章
	</div>
	<div id="validateErrorContainer" class="validateErrorContainer">
		<div class="validateErrorTitle">以下信息填写有误,请重新填写</div>
		<ul></ul>
	</div>
	<div class="body">
		<form id="validateForm" action="article/save" method="post">
			<c:if test="${entry != null}">
					<input type="hidden" name="id" value="${entry.id}">
			</c:if>
			<input type="hidden" name="hits" value="${entry.hits}">
			<table class="inputTable">
				<tbody><tr>
					<th>
						文章标题: 
					</th>
					<td>
						<input type="text" name="title" class="formText" value="${entry.title}">
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						文章分类: 
					</th>
					<td>
						<select name="articleCategory_id">
							<option value="0">请选择...</option>
							<c:forEach items="${parentCategories}" var="parent" >
									<option value="${parent.id}" <c:if test="${entry.parent.id == parent.id}"> selected="selected"</c:if> >${parent.name}</option>
							</c:forEach>
						</select>
						<label class="requireField">*</label>
					</td>
				</tr>
				<tr>
					<th>
						作者: 
					</th>
					<td>
						<input type="text" class="formText" name="author" value="${entry.author}">
					</td>
				</tr>
				<tr>
					<th>
						设置: 
					</th>
					<td>
						<label>
							<input type="checkbox" name="isPublication" value="true" id="article_isPublication" <c:if test="${entry.isPublication==true}" >checked="checked" </c:if>>发布
						</label>
						<label>
							<input type="checkbox" name="isRecommend" value="true" id="article_isRecommend" <c:if test="${entry.isRecommend==true}" >checked="checked" </c:if>>推荐
						</label>
						<label>
							<input type="checkbox" name="isTop" value="true" id="article_isTop" <c:if test="${entry.isTop==true}" >checked="checked" </c:if>>置顶
						</label>
					</td>
				</tr>
				<tr>
					<th>
						内容: 
					</th>
					<td>
						<textarea name="content" id="content" style="width:800px;height:500px;_visibility:hidden;">${entry.content}</textarea>
					</td>
				</tr>
				<tr>
					<th>
						页面关键词: 
					</th>
					<td>
						<input type="text" class="formText" name="metaKeywords" value="${entry.metaKeywords}">
					</td>
				</tr>
				<tr>
					<th>
						页面描述: 
					</th>
					<td>
						<textarea name="metaDescription" class="formTextarea">${metaDescription}</textarea>
					</td>
				</tr>
				
			</tbody>
		</table>
			<div class="buttonArea">
				<input type="submit" class="formButton" value="确  定" hidefocus="">&nbsp;&nbsp;
				<input type="button" class="formButton" onclick="window.history.back(); return false;" value="返  回" hidefocus="">
			</div>
		</form>
	</div>

<div class="ke-reset" style="display: none; "></div><div class="ke-mask" style="opacity: 0.5; "></div></body>
</html>
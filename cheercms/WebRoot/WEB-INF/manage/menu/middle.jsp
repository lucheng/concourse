<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>管理中心 - Powered By SHOP++</title>
		<meta name="Author" content="SHOP++ Team">
		<meta name="Copyright" content="SHOP++">
		<script type="text/javascript">
		$().ready(function() {
		
			var $main = $("#main");
		
			$main.click( function() {
				var mainFrameset = window.parent.window.document.getElementById("mainFrameset");
				if(mainFrameset.cols == "130,6,*") {
					mainFrameset.cols = "0,6,*";
					$main.removeClass("leftArrow");
					$main.addClass("rightArrow");
				} else {
					mainFrameset.cols = "130,6,*";
					$main.removeClass("rightArrow");
					$main.addClass("leftArrow");
				}
			})
		
		})
		</script>
		<style type="text/css">
		<!--
		html, body {
			height: 100%;
			overflow:hidden;
		}
		-->
		</style>
	</head>
	<body class="middle">
		<div id="main" class="main leftArrow"></div>
	</body>
</html>
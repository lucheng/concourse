<%@ page language="java"  pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  <head>
    <title>最快新闻网</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
  </head>
  
  <body>
   		 <div id="mainlink">
				<span><a href="index.jsp">最快新闻网</a></span><br /><br />
				<a href="newsAction.action?category=china" target="_blank">国内</a> | <a href="newsAction.action?category=world" target="_blank">国际</a> | <a href="newsAction.action?category=society" target="_blank">社会</a> | <a href="newsAction.action?category=compatriot" target="_blank">港澳</a> | <a href="newsAction.action?category=taiwan" target="_blank">台湾</a> | <a href="newsAction.action?category=huaren" target="_blank">华人</a> | <a href="newsAction.action?category=economic" target="_blank">经济</a> | <a href="newsAction.action?category=wenhua" target="_blank">文化</a> | <a href="newsAction.action?category=entertainment" target="_blank">娱乐</a> | <a href="newsAction.action?category=sports" target="_blank">体育</a> | <a href="newsAction.action?category=jiaoyu" target="_blank">教育</a> | <a href="newsAction.action?category=jiankang" target="_blank">健康</a> | <a href="newsAction.action?category=life" target="_blank">生活</a> | <a href="newsAction.action?category=keji" target="_blank">IT</a><br />
				<form action="searchAction.action" method="post" target="_blank">
					本站搜索：
					<input type="text" name="searchParam" style="height:20px"/>
					<select name="searchWhich">
						<option value="title"/>标题
						<option value="content"/>内容
					</select>
					<input type="submit" value="搜索" style="height:23px"/>
				</form>   		 
   		 </div>
  </body>
</html>

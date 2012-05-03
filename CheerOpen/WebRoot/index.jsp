<%@ page language="java" contentType="text/html"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>Insert title here</title>
</head>
<body>
	<form action="registerAction.action" method="post">
		姓名：<input type="text" name="name" id="name">
		年龄：<input type="text" name="age" id="age">
		<input type="submit" value="提交">
	</form>
	
<script type="text/javascript"> 
function changeValidateCode(obj) { 
//获取当前的时间作为参数，无具体意义 
var timenow = new Date().getTime(); 
//每次请求需要一个不同的参数，否则可能会返回同样的验证码 
//这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。 
obj.src="rand.action?d="+timenow; 
} 
</script>

在表单中添加下面这句话：
<s:text name="random"></s:text>：<s:textfield name="rand" size="5"></s:textfield>

<img src="rand.action" title="点击图片刷新验证码"/>
</body>
</html>
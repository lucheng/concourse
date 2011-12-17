<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><?php echo (C("sitename")); ?> - <?php echo (C("description")); ?></title>
		<meta content="<?php echo (C("keywords")); ?>" name=keywords/>
		<meta content="<?php echo (C("description")); ?>" name=description/>
		<link rel="stylesheet" type="text/css" media="screen" href="../Public/css/index.css">
		<meta content=<?php echo ($seokeywords); ?> name=keywords/>
		<meta content=<?php echo ($seodescription); ?> name=description/>
		<link rel="shortcut icon" href="../Public/images/favicon.png">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	</head>
<body id="login">
<!--[if lte IE 6]>
<div id="ie6-warning" style="color:red;font-size:18px">你正在使用的浏览器版本太低，将不能正常浏览本站及使用你问我答的所有功能。请升级 <a href="http://windows.microsoft.com/zh-CN/internet-explorer/downloads/ie">Internet Explorer</a> 或使用 <a href="http://www.google.com/chrome/">Google Chrome</a> 浏览器。</div>
<![endif]-->
<div id="page">
<h1>你问我答 - 一个真实的网络问答社区，帮助你寻找答案，分享知识</h1>
<div id="login_form">
<form action="__APP__/Public/checkLogin" method="post">
<input type="hidden" name="_xsrf" value="cdecd0d3c32c4583a0ee76e3ddfeb0e2">
<ul class="clearfix">
<li>
<label for="email">邮箱</label>
<input type="email" id="email" class="text r5px" name="email" spellcheck="false" placeholder="yourname@example.com" autofocus="">
</li>
<li>
<label for="password">密码</label>
<input type="password" id="password" class="text r5px" name="password" value="8888">
</li>
<li class="last">
<label for="">&nbsp;</label>
<input type="submit" id="button_login" class="r5px button_blue" value="登 录">
</li>
<li>
<input id="remember_me" type="checkbox" name="rememberme">
<label for="remember_me" class="remember_me">记住我的登录状态</label>
</li>
<li>
<a href="__APP__/Index/resetpassword">忘记密码？</a>
</li>
</ul>
</form>
<div class="zu-index-link-apply-x2 r5px">

<a href="http://container.api.taobao.com/container?appkey=12402963&encode=utf-8" target="_self"><img src="../Public/images/connect_light_medium.png"/></a>

<a href="__APP__/Public/apply" class="zu-index-link-apply r5px"><span class="r5px zu-index-link-apply-x1">申请注册</span></a>
</div>
</div>
<div id="footer">
<p>© 2011 你问我答 · <a href="#" target="_blank">你问我答博客</a> · <a href="#" target="_blank" rel="nofollow">新浪微博</a>
<br>
<a href="http://www.miibeian.gov.cn/" target="_blank"></a></p>
</div>
</div>
<!--[if lt IE 7 ]>
<script src="http://static.zhihu.com/static/js/dd_fix.js"></script>
<script>DD_belatedPNG.fix('#login, #page, ##page h1');</script>
<![endif]-->

</body></html>
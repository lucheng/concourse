<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html>
<head>
<title>方维分享系统  -- 更新向导</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="__TMPL__Public/css/style.css" />
</head>
<body>
<div class="install block">
<form name="install" action="<?php echo u('Index/index');?>" method="POST" >
<div class="header">
	<h1></h1>
</div>
<div class="main">
	<h2 class="title">更新说明</h2>
	<table class="tb" style="margin:20px 0 20px 53px; width:550px;" cellspacing="1">
		<tr>
			<td style="background:#fff; line-height:1.5em;"><?php echo ($note); ?></td>
		</tr>
	</table>
	<div class="center" style="padding:0 0 20px 0;">
		<input type="button" value="下一步" onclick="location.href='<?php echo u('Index/update');?>'" class="formbutton" />
	</div>
	<div class="center footer">
		方维分享系统
	</div>
</div>
</form>
</div>
</body>
</html>
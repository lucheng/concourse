<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC '-//W3C//DTD XHTML 1.0 Transitional//EN' 'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd'>
<html>
<head>
<title><?php echo ($msgTitle); ?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv='Refresh' content='<?php echo ($waitSecond); ?>;URL=<?php echo ($jumpUrl); ?>'>
<style type="text/css">
BODY {
	BACKGROUND: #fff; MARGIN: 100px auto; FONT: 14px/150% Verdana, Georgia, Sans-Serif; COLOR: #000; TEXT-ALIGN: center
}
A:link {
	COLOR: #2c4c78; TEXT-DECORATION: none
}
A:visited {
	COLOR: #2c4c78; TEXT-DECORATION: none
}
A:hover {
	COLOR: #2c4c78; TEXT-DECORATION: none
}
A:active {
	COLOR: #2c4c78; TEXT-DECORATION: none
}
H1 {
	PADDING-RIGHT: 4px; PADDING-LEFT: 30px; FONT-SIZE: 14px; BACKGROUND: #eee; PADDING-BOTTOM: 4px; MARGIN: 0px; PADDING-TOP: 4px; BORDER-BOTTOM: #84b0c7 1px solid;text-align:left;
}
DIV {
	BORDER: #ccc 1px solid; MARGIN: 0px auto;  WIDTH: 500px; 
}
P {
	PADDING-RIGHT: 15px; PADDING-LEFT: 15px; PADDING-BOTTOM: 15px; MARGIN: 0px; PADDING-TOP: 15px;    text-align: left;
}
#content {
	background-repeat: no-repeat;
	background-position:35px 35px;
	padding-left:100px;
	width:398px;
	
}
</style>
</head>
<body>
<div>
<H1><?php echo ($msgTitle); ?></H1>
<div id="content" style="background-image:url(../Public/admin/<?php if(($status)  ==  "0"): ?>error.gif<?php else: ?>success.gif<?php endif; ?>);">
<p>
	<?php if(isset($message)): ?><font style="color:<?php if(($status)  ==  "1"): ?>blue<?php else: ?>red<?php endif; ?>"><?php echo ($message); ?></font>
	<br/>
<br /><?php endif; ?>
<?php if(isset($closeWin)): ?>系统将在 <span style="color:blue;font-weight:bold"><?php echo ($waitSecond); ?></span> 秒后自动关闭，如果不想等待,直接点击 <a href="<?php echo ($jumpUrl); ?>">这里</a> 关闭<?php endif; ?>
	<?php if(!isset($closeWin)): ?>系统将在 <span style="color:blue;font-weight:bold"><?php echo ($waitSecond); ?></span> 秒后自动跳转,如果不想等待,直接点击 <a href="<?php echo ($jumpUrl); ?>">这里</a> 跳转<?php endif; ?>

	<?php if(isset($error)): ?><font style="color:red"><?php echo ($error); ?></font><?php endif; ?>
	<?php if(isset($return)): ?>, 或
<br />
<br />

	<?php if(is_array($return)): $i = 0; $__LIST__ = $return;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): ++$i;$mod = ($i % 2 )?><a href="<?php echo ($vo["link"]); ?>"><?php echo ($vo['text']); ?></a><br /><?php endforeach; endif; else: echo "" ;endif; ?><?php endif; ?>
	
</p>
</div>
</div>
</body>
</html>
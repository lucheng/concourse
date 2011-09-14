<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo ($charset); ?>" />
<meta http-equiv='Refresh' content='<?php echo ($waitSecond); ?>;URL=<?php echo ($jumpUrl); ?>'>
<title>Shuguang CMS Control Panel</title>
<link rel="stylesheet" href="/Admin_App/Tpl/default/Public/images/main.css" type="text/css" media="all" />
</head>
<body><div id="append"></div>	<div class="container">
		<div class="ajax rtninfo">
			<div class="ajaxbg">
				<h4><?php echo ($msgTitle); ?></h4>
				<?php if(isset($message)): ?><p><?php echo ($message); ?></p><?php endif; ?>
	<?php if(isset($error)): ?><p><font color="red"><?php echo ($error); ?></font></p><?php endif; ?>
<p><span style="color:blue;font-weight:bold"><?php echo ($waitSecond); ?></span> 秒后自动跳转,如果不想等待,直接点击 <A HREF="<?php echo ($jumpUrl); ?>">这里跳转</A> </p>
					
							</div>
		</div>
	</div>

</body>
</html>
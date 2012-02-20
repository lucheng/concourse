<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="__TMPL__Static/Css/style.css" rel="stylesheet" />
<script type="text/javascript" src="__TMPL__Static/Js/jquery.js"></script>
</head>
<body style="background:#DEE4ED;padding:0; overflow:hidden; overflow-y:scroll;">
	<div>
		<div class="fanwe-menu" valign="top">
			<?php if(is_array($menus)): foreach($menus as $key=>$menu): ?><dl>
				<dt><div><strong><?php echo ($menu['name']); ?></strong></div></dt>
				<?php if(is_array($menu["nodes"])): foreach($menu["nodes"] as $key=>$node): ?><dd><p><a href="<?php echo U($node['module'].'/'.$node['action']);?>" target="mainFrame"><?php echo ($node['action_name']); ?></a></p></dd><?php endforeach; endif; ?>
			</dl><?php endforeach; endif; ?>
		</div>
	</div>
	<script>
		if($("a:first").attr("href"))
		{
			top.document.getElementById("mainFrame").src = $("a:first").attr("href");
			$("a:first").parent().parent().addClass("cur");
		};
		
		$("a").click(function(){
			$("a").each(function(){
				$(this).parent().parent().removeClass("cur");
			});
			$(this).parent().parent().addClass("cur");
			$(this).blur();
		});
	</script>
<div style="display:none">
<script language="javascript" type="text/javascript" src="http://js.users.51.la/3524004.js"></script>
<noscript><a href="http://www.51.la/?3524004" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/3524004.asp" style="border:none" /></a></noscript>
</div>
</body>
</html>
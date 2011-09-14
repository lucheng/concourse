<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>CMS</title>
<link href="/Admin_App/Tpl/default/Public/images/main.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/Admin_App/Tpl/default/Public/images/common.js"></script>
</head>

<body>

<div class="bodyTitle">
<div class="bodyTitleLeft"></div>
<div class="bodyTitleText">缓存管理</div>
</div>
<p class="i">修改模和内核设置后需要重新系统缓存</p>
<input name="checkbox" type="checkbox" class="checkbox" id="uid[]"
	onClick="selAll(this)" value="选择全部">
选择全部
<form method="POST" name="form1" action="/admin.php/Cache/submit">
<table class="datalist fixwidth">
	<?php if(is_array($cache)): ?><?php $i = 0;?><?php $__LIST__ = $cache?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$sub): ?><?php ++$i;?><?php $mod = (($i % 2 )==0)?><tr>
		<td class="option"><?php echo ($key); ?></td>
	</tr>

	<tr class="nobg">
		<td colspan="6"><?php if(is_array($sub)): ?><?php $i = 0;?><?php $__LIST__ = $sub?><?php if( count($__LIST__)==0 ) : echo "" ; ?><?php else: ?><?php foreach($__LIST__ as $key=>$dir): ?><?php ++$i;?><?php $mod = (($i % 2 )==0)?><input
			type="checkbox" name="id[]" value="<?php echo ($dir); ?>" class="checkbox">
		<?php echo ($key); ?><br><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?></td>
	</tr><?php endforeach; ?><?php endif; ?><?php else: echo "" ;?><?php endif; ?>
	<tr class="nobg">
		<td colspan="6"><br />
		<input type="submit" name="Submit2" value="提交更新" class="inputButton" /></td>
	</tr>

</table>
<?php if(C("TOKEN_ON")):?><input type="hidden" name="<?php echo C("TOKEN_NAME");?>" value="<?php echo Session::get(C("TOKEN_NAME")); ?>"/><?php endif;?></form>
</body>
</html>
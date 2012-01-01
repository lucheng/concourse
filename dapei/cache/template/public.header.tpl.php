<?php if($TS_SITE['base'][isgzip]==1) { ?><?php ob_start('ob_gzip');?><?php } ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="robots" content="all" />
<meta name="author" content="<?php echo $TS_SOFT['info'][email];?>" />
<meta name="Copyright" content="<?php echo $TS_SOFT['info'][name];?>" />
<title>
<?php if($ac=='index') { ?>
<?php echo $TS_SITE['base'][site_title];?> - <?php echo $title;?>
<?php } else { ?>
<?php echo $title;?> - <?php echo $TS_APP['options'][appname];?> - <?php echo $TS_SITE['base'][site_title];?>
<?php } ?>
</title>
<?php if($app=='home' && $ac=='index') { ?>
<meta name="keywords" content="<?php echo $TS_SITE['base'][site_key];?>" /> 
<meta name="description" content="<?php echo $TS_SITE['base'][site_desc];?>" /> 
<?php } ?>
<link rel="shortcut icon" href="<?php echo SITE_URL;?>public/images/favicon.png" />
<style>
@import url(<?php echo SITE_URL;?>theme/<?php echo $site_theme;?>/base.css);
@import url(<?php echo SITE_URL;?>app/<?php echo $app;?>/skins/<?php echo $skin;?>/style.css);
</style>
<script>var siteUrl = '<?php echo SITE_URL;?>';</script>
<script src="<?php echo SITE_URL;?>public/js/jquery.js" type="text/javascript"></script>
<script src="<?php echo SITE_URL;?>public/js/dialog/jquery.artDialog.js?skin=blue" type="text/javascript"></script>
<script src="<?php echo SITE_URL;?>public/js/dialog/artDialog.iframeTools.js" type="text/javascript"></script>
<script src="<?php echo SITE_URL;?>app/<?php echo $app;?>/js/extend.func.js" type="text/javascript"></script>

<?php doAction('pub_header_top')?>
</head>
<body <?php doAction('pub_body')?>>
<!--header-->
<!--[if lte IE 6]>
	<div id="xt">你正在使用的浏览器版本太低，将不能正常浏览本站及使用本站的所有功能。请升级 <a href="http://windows.microsoft.com/zh-CN/internet-explorer/downloads/ie">Internet Explorer</a> 或使用 <a href="http://www.google.com/chrome/">Google Chrome</a> 浏览器。</div>
<![endif]-->
<div class="header">
<div class="hc">
<div class="left"><a href="<?php echo SITE_URL;?>index.php"><img src="<?php echo SITE_URL;?>theme/<?php echo $site_theme;?>/logo.gif" alt="<?php echo $TS_SITE['base'][site_title];?>" /></a></div>
<div class="nav">
<ul>
<li><a href="<?php echo SITE_URL;?>index.php"><?php echo $TS_HL['pub'][1000];?></a></li>
<?php doAction('pub_header_nav')?>
<li><a href="<?php echo SITE_URL;?><?php echo tsurl('group','explore')?>"><?php echo $TS_HL['pub'][1001];?></a></li>
</ul>
</div>

<div class="right">
<?php if($TS_USER['user'] == '') { ?>
<a href="<?php echo SITE_URL;?><?php echo tsurl('user','register')?>"><img class="fimg" src="<?php echo SITE_URL;?>public/images/avatar_24.gif" width="24" align="absmiddle" /></a> <?php echo $TS_HL['pub'][1002];?>
<br />
<a href="<?php echo SITE_URL;?><?php echo tsurl('user','login')?>"><?php echo $TS_HL['pub'][1003];?></a> | <a href="<?php echo SITE_URL;?><?php echo tsurl('user','register')?>"><?php echo $TS_HL['pub'][1004];?></a>
<?php } else { ?>
<a href="<?php echo SITE_URL;?><?php echo tsurl('user','space',array(userid=>$TS_USER['user'][userid]))?>">
<img class="fimg" src="<?php if($TS_USER['user'][face]=="") { ?><?php echo SITE_URL;?>public/images/avatar_24.gif<?php } else { ?><?php echo SITE_URL;?><?php echo miniimg($TS_USER['user'][face],'user','24','24',$TS_USER['user'][path],'1')?><?php } ?>" width="24" align="absmiddle" /> 
</a>
<a href="<?php echo SITE_URL;?><?php echo tsurl('user','space',array(userid=>$TS_USER['user'][userid]))?>"><?php echo $TS_USER['user'][username];?></a>   |  <span id="newmsg"><a href="<?php echo SITE_URL;?><?php echo tsurl('message','my')?>"><?php echo $TS_HL['pub'][1005];?></a></span> <img src="<?php echo SITE_URL;?>public/images/score.gif" /> <?php echo $TS_USER['user'][count_score];?>
<br />
<a href="<?php echo SITE_URL;?><?php echo tsurl('user','set',array(ts=>base))?>"><?php echo $TS_HL['pub'][1006];?></a> | <a href="<?php echo SITE_URL;?><?php echo tsurl('user','invite')?>"><?php echo $TS_HL['pub'][1007];?></a>  | <a href="<?php echo SITE_URL;?><?php echo tsurl('user','login',array(ts=>out))?>"><?php echo $TS_HL['pub'][1008];?></a>
<?php } ?>

| <a href="<?php echo SITE_URL;?><?php echo tsurl('home','theme')?>"><?php echo $TS_HL['pub'][1009];?></a>

</div>
</div>
</div>

<!--APP NAV-->

<?php if(is_array($TS_SITE['appnav']) && $TS_SITE['appnav'][$app] !='') { ?>
<div class="appnav">
<ul>
<?php foreach((array)$TS_SITE['appnav'] as $key=>$item) {?>
<li <?php if($app==$key) { ?>class="select"<?php } ?>><a href="<?php echo SITE_URL;?><?php echo tsurl($key)?>"><?php echo $item;?></a></li>
<?php }?>

</ul>
</div>
<?php } ?>

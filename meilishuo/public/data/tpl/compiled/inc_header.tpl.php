<? if(!defined('IN_FANWE')) exit('Access Denied'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><? if(!empty($_FANWE['nav_title'])) { ?><?=$_FANWE['nav_title']?> - <? } if(empty($no_site_name)) { ?><?=$_FANWE['setting']['site_title']?><? } ?></title>
<meta name="keywords" content="<?=$_FANWE['seo_keywords']?><?=$_FANWE['setting']['site_keywords']?>" />
<meta name="description" content="<?=$_FANWE['seo_description']?><?=$_FANWE['setting']['site_description']?>" />
<link rel="icon" href="<?=$_FANWE['site_root']?>favicon.ico" type="image/x-icon" />
<script src="./public/js/jquery.js" type="text/javascript"></script>
<script src="./public/js/base.js" type="text/javascript"></script>
<?php 
$current_css[] = './tpl/css/reset.css';
$current_css[] = './tpl/css/base.css';
$current_css[] = './tpl/css/globe.css';
$current_css[] = './tpl/css/publishbox.css';
$current_css[] = './tpl/css/lightbox.css';
$current_css[] = './tpl/css/addfav.css';
 ?>
<link rel="stylesheet" type="text/css" href="<?php echo cssParse($current_css); ?>" media="all"/><? if(is_array($css_list)) { foreach($css_list as $css) { ?><link rel="stylesheet" type="text/css" href="<?php echo cssParse($css['url']); ?>"<? if(!empty($css['media'])) { ?> media="<?=$css['media']?>"<? } ?> />
<? } } ?>

<script type="text/javascript">
var SITE_PATH = '<?=$_FANWE['site_root']?>';
var SITE_URL = '<?=$_FANWE['site_url']?>';
var TPL_PATH = '<?=TPL_PATH?>';
var PUBLIC_PATH	 = '<?=PUBLIC_PATH?>';
var MODULE_NAME	 = '<?=MODULE_NAME?>';
var ACTION_NAME	 = '<?=ACTION_NAME?>';
var COOKIE_PRE = "<?=$_FANWE['config']['cookie']['cookie_pre']?>";
</script>
</head>
<body>
<div id="head">
<div id="info_bar">
<div class="fm960">
<div class="fl">
<a href="<?php echo FU('index',array()); ?>"><img class="logo fl" src="<?=$_FANWE['site_root']?><?=$_FANWE['setting']['site_logo']?>" /></a>
</div><!--dynamic getUserInfo--></div>
</div>
<div id="nav_bar">
<div class="fm960">
<ul class="fl">
<li class="f">
<a href="<?php echo FU('index',array()); ?>"<? if(MODULE_NAME == 'Index') { ?> class="c"<? } ?>>首页</a>
</li>
<li>
<?php 
$cate_active = '';
$g_r_cate = $_FANWE['cache']['goods_category']['root'];
$g_r_cate = &$_FANWE['cache']['goods_category']['all'][$g_r_cate];

if(MODULE_NAME == 'Book' && ACTION_NAME == 'shopping')
$cate_active = 'c';

$g_i_cates = &$_FANWE['cache']['goods_category']['index'];
 ?>
<a href="<?php echo FU('book/shopping',array()); ?>" class="<?=$cate_active?>"><?=$g_r_cate['cate_name']?></a><? if(is_array($g_i_cates)) { foreach($g_i_cates as $g_i_cate_id) { ?><?php 
$g_i_cate = &$_FANWE['cache']['goods_category']['all'][$g_i_cate_id];
$g_i_code = &$g_i_cate['cate_code'];
if(MODULE_NAME == 'Book' && $goods_cate_code == $g_i_code)
$cate_active = ' c';
else
$cate_active = '';
 ?>
<a class="cat<?=$cate_active?>" href="<?php echo FU('book/cate',array("cate"=>$g_i_code)); ?>"><?=$g_i_cate['cate_name']?></a> 
<? } } ?>
</li>
<li>
<a href="<?php echo FU('club/index',array()); ?>"<? if(MODULE_NAME == 'Club') { ?> class="c"<? } ?>>主题</a>
<a class="cat<? if(MODULE_NAME == 'Ask') { ?> c<? } ?>" href="<?php echo FU('ask/index',array()); ?>">问答</a>
</li>
<li>
<a href="<?php echo FU('daren/index',array()); ?>"<? if(MODULE_NAME == 'Daren') { ?> class="c"<? } ?>>达人</a>
</li>
</ul>

<div class="fr top_search r5">
<form action="<?php echo FU('book/search',array()); ?>" method="post">
<input type="text" name="tag" class="ts_txt" value="" tooltip="请输入关键字"/>
<input type="submit" value=" " class="ts_btn" />
<input type="hidden" name="action" value="search" />
<div class="ts_type fl" style="display:none;">
<input type="radio" name="t" value="8" id="s_h" checked="">
<label for="s_h">搜商品</label>
<input type="radio" value="2" name="t" id="s_p">
<label for="s_p">搜人</label>
</div>
</form>
</div>

</div>
</div>
</div>
<div id="body_wrap">